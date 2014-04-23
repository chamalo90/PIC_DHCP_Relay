#define THIS_INCLUDES_THE_MAIN_FUNCTION
#define THIS_IS_STACK_APPLICATION

// define the processor we use
#define __18F97J60

// define the compiler we use
#define __SDCC__

// inlude all hardware and compiler dependent definitions
#include "Include/HardwareProfile.h"

// Include all headers for any enabled TCPIP Stack functions
#include "Include/TCPIP_Stack/TCPIP.h"

#include "Include/TCPIP_Stack/Delay.h"

// Include functions specific to this stack application
#include "Include/MainDemo.h"

// Declare AppConfig structure and some other supporting stack variables
APP_CONFIG AppConfig;
BYTE AN0String[8];
/*
typedef struct{
    IP_ADDR ip;
    MAC_ADDR mac;
    unsigned int client_deadline;
    unsigned int server_deadline;
} POOL_ELEMENT;
*/

// Private helper functions.
// These may or may not be present in all applications.
static void InitAppConfig(void);
static void InitializeBoard(void);
void DisplayWORD(BYTE pos, WORD w); //write WORDs on LCD for debugging
void handle_server_msg(UDP_SOCKET *my_socket_send, UDP_SOCKET *my_socket_recv);
void handle_client_msg(UDP_SOCKET *my_socket_send,
                       UDP_SOCKET *my_socket_recv,
                       MAC_ADDR *gateway_MAC,
                       IP_ADDR *last_ip);
void transfert_msg_to_client(BOOTP_HEADER *bootp_header, UDP_SOCKET *my_socket, BYTE type);
void discover_msg();
void build_bootp(BOOTP_HEADER *bootp_header, UDP_SOCKET *my_socket);
void end_dhcp();
void request_msg(BYTE *dhcp_header, int counter);
BOOL extract_bootp_header(BYTE *dhcp_type, BOOTP_HEADER *bootp_header, BYTE *dhcp_header, int *counter, UDP_SOCKET *socket);
void int_to_string(int value, char *r);
void set_to_dhcp_ip(IP_ADDR *ip);
BOOL ip_cmp(IP_ADDR *ip1, IP_ADDR *ip2);
BOOL mac_cmp(MAC_ADDR *m1, MAC_ADDR *m2);
BOOL get_pool_el_ip(IP_ADDR *ip, POOL_ELEMENT *pool_el);

//
// PIC18 Interrupt Service Routines
// 
// NOTE: Several PICs, including the PIC18F4620 revision A3 have a RETFIE 
// FAST/MOVFF bug
// The interruptlow keyword is used to work around the bug when using C18

//LowISR
#if defined(__18CXX)
    #if defined(HI_TECH_C)
        void interrupt low_priority LowISR(void)
    #elif defined(__SDCC__)
        void LowISR(void) __interrupt (2) //ML for sdcc
    #else
        #pragma interruptlow LowISR
        void LowISR(void)
    #endif
    {
	TickUpdate();
    }
    #if !defined(__SDCC__) && !defined(HI_TECH_C)
           //automatic with these compilers
        #pragma code lowVector=0x18
	void LowVector(void){_asm goto LowISR _endasm}
	#pragma code // Return to default code section
    #endif


//HighISR	
    #if defined(HI_TECH_C)
        void interrupt HighISR(void)
    #elif defined(__SDCC__)
        void HighISR(void) __interrupt(1) //ML for sdcc        
    #else
        #pragma interruptlow HighISR
        void HighISR(void)
    #endif
    {
      //insert here code for high level interrupt, if any
    }
    #if !defined(__SDCC__) && !defined(HI_TECH_C)
           //automatic with these compilers
	#pragma code highVector=0x8
	void HighVector(void){_asm goto HighISR _endasm}
	#pragma code // Return to default code section
    #endif

#endif

const char* message;  //pointer to message to display on LCD

//Modify DHCP server IP here
#define DHCP_BROADCAST (21u)

#define DHCP_IP8 192
#define DHCP_IP16 168
#define DHCP_IP24 88
#define DHCP_IP32 2

#define POOL_SIZE 1

//POOL_ELEMENT pool[POOL_SIZE];

void init_pool_el(POOL_ELEMENT *pe){
    int j;
    for(j=0; j<4; j++){
        pe->ip.v[j] = 0;
    }
    for(j=0; j<6; j++){
        pe->mac.v[j] = 0;
    }
    pe->client_deadline = 0;
    pe->server_deadline = 0;
}

void init_pool(){
    int i;
    for(i=0; i<POOL_SIZE; i++){
        init_pool_el(&pool[i]);
    }
}

BOOL is_free(POOL_ELEMENT *el){
    int i;
    for(i=0; i<6; i++){
        if(el->mac.v[i] != 0){
            return FALSE;
        }
    }
    return TRUE;
}

BOOL add_to_pool(IP_ADDR *ip, MAC_ADDR *mac, unsigned int client_deadline, unsigned int server_deadline){
    int i;
    BOOL added = FALSE;
    for(i=0; i<POOL_SIZE && !added; i++){
        if(is_free(&pool[i])){
            memcpy(pool[i].ip.v, ip->v, sizeof(IP_ADDR));
            memcpy(pool[i].mac.v, mac->v, sizeof(MAC_ADDR));
            pool[i].client_deadline = client_deadline;
            pool[i].server_deadline = server_deadline;
            added = TRUE;
        }
    }
    return added;
}

BOOL remove_from_pool(IP_ADDR *ip){
    BOOL found;
    POOL_ELEMENT *pool_el;
    found = get_pool_el_ip(ip, pool_el);
    init_pool_el(pool_el);
    return found;
}

BOOL get_pool_el_ip(IP_ADDR *ip, POOL_ELEMENT *pool_el){
    int i;
    for(i=0; i<POOL_SIZE; i++){
        if(ip_cmp(&pool[i].ip, ip)){
            pool_el = &pool[i];
            return TRUE;    
        }
    }
    return FALSE;
}

BOOL get_pool_el_mac(MAC_ADDR *mac, MAC_ADDR *pool_el){
    int i;
    for(i=0; i<POOL_SIZE; i++){
        if(mac_cmp(mac, &pool[i].mac)){
            pool_el = &pool[i].mac;
            return TRUE;
        }
    }
    return FALSE;
}

void set_to_dhcp_ip(IP_ADDR *ip){
    ip->v[0] = DHCP_IP8;
    ip->v[1] = DHCP_IP16;
    ip->v[2] = DHCP_IP24;
    ip->v[3] = DHCP_IP32;
}

void set_to_MAC(MAC_ADDR *src, MAC_ADDR *dest){
    memcpy(dest->v, src->v, sizeof(src->v));
}

int number_of_char(int value){
    int i=0;
    while(value != 0){
        value = value/10;
        i++;
    }
    return i;
}

void int_to_string(int value, char *r){
    char *p = r+number_of_char(value);
    *p = '\0';
    p--;
    while(value != 0){
        *p = (value%10)+48;
        value = value/10;
        p--;
    }
}

void display_ip(unsigned int pos, IP_ADDR *ip){
    char a[10], b[10], c[10], d[10];
    int_to_string(ip->v[0], a);
    int_to_string(ip->v[1], b);
    int_to_string(ip->v[2], c);
    int_to_string(ip->v[3], d);
    
    DisplayString(pos, a);
    DisplayString(pos+4, b);
    DisplayString(pos+8, c);
    DisplayString(pos+12, d);
}

BOOL mac_cmp(MAC_ADDR *m1, MAC_ADDR *m2){
    int i;
    for(i=0; i<6; i++){
        if(m1->v[i] != m2->v[i]){
            return FALSE;
        }
    }
    return TRUE;
}

BOOL ip_cmp(IP_ADDR *ip1, IP_ADDR *ip2){
    int i;
    for(i=0; i<4; i++){
        if(ip1->v[i] != ip2->v[i]){
            return FALSE;
        }
    }   
    return TRUE;
}

void blink_led0(){
    // Blink LED0 (right most one) every second.
    static TICK t = 0;
    TICK nt = 0;  //TICK is DWORD, thus 32 bits
    nt =  TickGetDiv256();
    if((nt - t) >= (DWORD)(TICK_SECOND/1024ul)){
        t = nt;
        LED0_IO ^= 1;
        ClrWdt();  //Clear the watchdog
    }
}

void wait_network_data(MAC_ADDR *gateway_MAC){
    UDP_SOCKET socket_sendto_server;
    UDP_SOCKET socket_recv;
    UDP_SOCKET socket_sendto_client;
    WORD count;
    
    IP_ADDR last_ip;
    IP_ADDR dhcp_server_ip;
    set_to_dhcp_ip(&dhcp_server_ip);
    
    socket_sendto_server = UDPOpen(0, NULL, 67);
    socket_recv = UDPOpen(67, NULL, 0);
    socket_sendto_client = UDPOpen(0, NULL, 68);
    
    if(socket_sendto_server == INVALID_UDP_SOCKET ||
       socket_recv == INVALID_UDP_SOCKET ||
       socket_sendto_client == INVALID_UDP_SOCKET){
       
        DisplayString (0,"invalid socket");
        return;
    }
    
    while(1){
    
        blink_led0();
        StackTaskHelp(&last_ip);
        
        if(count = UDPIsGetReady(socket_recv)){
			if(ip_cmp(&last_ip, &dhcp_server_ip)){
                handle_server_msg(&socket_sendto_client, &socket_recv);
            }
            else{
                handle_client_msg(&socket_sendto_server, &socket_recv, gateway_MAC, &last_ip);
            }
        }    
    }   
}

BOOL extract_bootp_header(BYTE *dhcp_type, BOOTP_HEADER *bootp_header,
    BYTE *dhcp_header, int *dhcp_header_size, UDP_SOCKET *my_socket_recv){
    
    unsigned int i;
    unsigned int zero_to_skip;
    BYTE opt, length;
    DWORD word_buf;
    unsigned long magic_cookie;
    BOOL wrong_packet;
 
    magic_cookie = 0x63538263;
    
    while(!UDPIsGetReady(*my_socket_recv));
    
    UDPGetArray((BYTE*)bootp_header, sizeof(BOOTP_HEADER)); //Read 34bytes
                  
    if(bootp_header->HardwareType != 1 || bootp_header->HardwareLen != 6){
        return FALSE;
    }

    zero_to_skip = 208-sizeof(MAC_ADDR);
    for(i=0; i<zero_to_skip; i++){ // On skip 202 bytes -> 192 + 10
        UDPGet(&opt);
    }
    
    UDPGetArray((BYTE*)&word_buf, sizeof(DWORD));
    if(word_buf != magic_cookie){
        return FALSE;
    }
    
    *dhcp_header_size = 0;
    wrong_packet = TRUE;
    while(UDPGet(&opt) && opt != DHCP_END_OPTION){
        UDPGet(&length);
        if(opt == DHCP_MESSAGE_TYPE){
            UDPGet(dhcp_type);
            wrong_packet = FALSE;
        }
        else if(dhcp_header != NULL){
            dhcp_header[*dhcp_header_size] = opt;
            dhcp_header[*dhcp_header_size+1] = length;
            UDPGetArray(&dhcp_header[*dhcp_header_size+2], length);
            *dhcp_header_size += 2+length;
        }
    }
    return !wrong_packet;
}

void handle_server_msg(UDP_SOCKET *socket_sendto_client, UDP_SOCKET *socket_recv){
	BYTE dhcp_type;
	BOOTP_HEADER bootp_header;
    MAC_ADDR *remote_node_MAC;
    UDP_SOCKET_INFO *info;
    
	extract_bootp_header(&dhcp_type, &bootp_header, NULL, NULL, socket_recv);
	UDPDiscard();
	
	info = &UDPSocketInfo[activeUDPSocket];
	remote_node_MAC = &info->remoteNode.MACAddr;
	
	switch(dhcp_type){
        case DHCP_OFFER_MESSAGE:
            DisplayString(16, "DHCP OFFER");
			transfert_msg_to_client(&bootp_header, socket_sendto_client, dhcp_type);
            break;

        case DHCP_ACK_MESSAGE:
            DisplayString(16, "DHCP ACK");
            //add_to_pool(IP_ADDR *ip, remote_node_MAC, unsigned int client_deadline, unsigned int server_deadline)
			transfert_msg_to_client(&bootp_header, socket_sendto_client, dhcp_type);
            break;

        default:
            DisplayString(16, "DISCARDED handle server");
			break;
    }
	
}

void transfert_msg_to_client(BOOTP_HEADER *bootp_header, UDP_SOCKET *my_socket, BYTE type) {
	UDP_SOCKET_INFO *info;
	int i;
	unsigned int lease_time; 
    IP_ADDR broadcast;
    
    while(!UDPIsPutReady(*my_socket));
    
	info = &UDPSocketInfo[activeUDPSocket];
	for(i=0; i<4; i++){
	    info->remoteNode.IPAddr.v[i] = 255;
	}

    info->remotePort = DHCP_CLIENT_PORT;

	//Change MAC address in socket
	for (i=0; i<sizeof(IP_ADDR); i++) {
		info->remoteNode.MACAddr.v[i] = bootp_header->ClientMAC.v[i];
	}
	
	build_bootp(bootp_header, my_socket);
	UDPPut(type);	

	//Subnet
    UDPPut(DHCP_SUBNET_MASK);
    UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyMask, sizeof(IP_ADDR));
	
	//Broadcast
	/*UDPPut(DHCP_BROADCAST);
	UDPPut(sizeof(IP_ADDR));
	for(i=0; i<sizeof(IP_ADDR); i++){
	    //broadcast.v[i] = (AppConfig.MyIPAddr.v[i] & AppConfig.MyMask.v[i]) | ~AppConfig.MyMask.v[i];
	}
	UDPPutArray((BYTE*)&broadcast, sizeof(IP_ADDR));	
	*/
	//Gateway
    UDPPut(DHCP_ROUTER);
    UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyGateway, sizeof(IP_ADDR));
	//Lease time
	//TODO
	lease_time = 86400;
	UDPPut(DHCP_IP_LEASE_TIME);
	UDPPut(4);
	UDPPutArray((BYTE*)&lease_time, 0x04);
	//DHCP relay server
	UDPPut(DHCP_SERVER_IDENTIFIER);
    UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	end_dhcp();
    display_ip(0,&info->remoteNode.IPAddr);
	UDPFlush();
}

void handle_client_msg(UDP_SOCKET *socket_sendto_server,
                       UDP_SOCKET *socket_recv,
                       MAC_ADDR *gateway_MAC,
                       IP_ADDR *source_ip){
    
    BYTE dhcp_type;
    BOOTP_HEADER bootp_header;
    BYTE dhcp_header[200];
    int dhcp_header_length;
    UDP_SOCKET_INFO *info;
    MAC_ADDR *remote_node_MAC;
    POOL_ELEMENT *node_pool_state;
    
    char debug[10];
    
    extract_bootp_header(&dhcp_type, &bootp_header, dhcp_header, &dhcp_header_length, socket_recv);
    UDPDiscard();
    
    while(!UDPIsPutReady(*socket_sendto_server));
    
	info = &UDPSocketInfo[activeUDPSocket];
	set_to_dhcp_ip(&info->remoteNode.IPAddr);
	set_to_MAC(gateway_MAC, &info->remoteNode.MACAddr);
    
    remote_node_MAC = &info->remoteNode.MACAddr;
    
    switch(dhcp_type){
        case DHCP_DISCOVER_MESSAGE:
            DisplayString(0, "DHCP DISCOVERY");
            build_bootp(&bootp_header, socket_sendto_server);
            discover_msg();
            break;
        case DHCP_REQUEST_MESSAGE:
            DisplayString(0, "DHCP REQUEST");
            if(get_pool_el_mac(remote_node_MAC, &node_pool_state->mac)){
                //TODO
            }
            else{
                build_bootp(&bootp_header, socket_sendto_server);
                request_msg(dhcp_header, dhcp_header_length);
            }
            break;
        default:
            DisplayString(0, "H client Unkt");
            int_to_string(dhcp_type, debug);
            DisplayString(31, debug);
			break;
    }
}

void build_bootp(BOOTP_HEADER *bootp_header, UDP_SOCKET *my_socket){
    int i;

    while(!UDPIsPutReady(*my_socket));
        
    UDPPutArray((BYTE*)&bootp_header->MessageType, sizeof(BYTE));
    UDPPutArray((BYTE*)&bootp_header->HardwareType, sizeof(BYTE));
    UDPPutArray((BYTE*)&bootp_header->HardwareLen, sizeof(BYTE));
    UDPPutArray((BYTE*)&bootp_header->Hops, sizeof(BYTE));
    UDPPutArray((BYTE*)&bootp_header->TransactionID, sizeof(DWORD));
    UDPPutArray((BYTE*)&bootp_header->SecondsElapsed, sizeof(WORD));
    UDPPutArray((BYTE*)&bootp_header->BootpFlags, sizeof(WORD));
    UDPPutArray((BYTE*)&bootp_header->ClientIP, sizeof(IP_ADDR));
    UDPPutArray((BYTE*)&bootp_header->YourIP, sizeof(IP_ADDR));
    UDPPutArray((BYTE*)&bootp_header->NextServerIP, sizeof(IP_ADDR));
    UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
    UDPPutArray((BYTE*)&bootp_header->ClientMAC, sizeof(MAC_ADDR));
    
    for(i=0; i<202; i++){
        UDPPut(0);
    }
    
    UDPPut(99);
    UDPPut(130);
    UDPPut(83);
    UDPPut(99);
    UDPPut(DHCP_MESSAGE_TYPE);
    UDPPut(DHCP_MESSAGE_TYPE_LEN);
}

void end_dhcp(){
    UDPPut(DHCP_END_OPTION);
    while(UDPTxCount < 300){
        UDPPut(0);
    }
	LED6_IO = 0;
}

void discover_msg(){
    
    UDPPut(DHCP_DISCOVER_MESSAGE);
    
    UDPPut(DHCP_SERVER_IDENTIFIER);
    UDPPut(sizeof(IP_ADDR));
    UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
    
    UDPPut(DHCP_ROUTER);
    UDPPut(sizeof(IP_ADDR));
    UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));

    end_dhcp();
    
    UDPFlush();
    //DisplayString(0, "DISCOVER forwarded");
}

void request_msg(BYTE *dhcp_header, int dhcp_header_length){
    
    BYTE opt, length;
    int i;    
    
    UDPPut(DHCP_REQUEST_MESSAGE);
    
    i=0;
    while(i<dhcp_header_length){
        opt = dhcp_header[i];
        UDPPut(opt);
        i++;
        length = dhcp_header[i];
        UDPPut(length);
        i++;
        switch(opt){
            case DHCP_SERVER_IDENTIFIER:
                UDPPutArray((BYTE*)&UDPSocketInfo[activeUDPSocket].remoteNode.IPAddr, length);
                break;
            default:
                UDPPutArray((BYTE*)&dhcp_header[i], length);   
				break;
        }
        i+=length;
    }    
    
    end_dhcp();
    UDPFlush();
}

void get_gateway_MAC(MAC_ADDR *gateway_MAC){
    ARPResolve(&AppConfig.MyGateway);
    while(!ARPIsResolved(&AppConfig.MyGateway, gateway_MAC));
}

#if defined(__18CXX) || defined(__SDCC__)
void main(void)
#else
int main(void)
#endif
{
    MAC_ADDR gateway_MAC;
    // Initialize interrupts and application specific hardware
    InitializeBoard();
    // Initialize and display message on the LCD
    LCDInit();
    DelayMs(100);
    // Initialize Timer0, and low priority interrupts, used as clock.
    TickInit();
    // Initialize Stack and application related variables in AppConfig.
    InitAppConfig();
    // Initialize core stack layers (MAC, ARP, TCP, UDP) and
    // application modules (HTTP, SNMP, etc.)
    StackInit();    
    //Initialize dhcp server info
    DisplayString(0, "KIKOO");
    get_gateway_MAC(&gateway_MAC);
    init_pool();
    wait_network_data(&gateway_MAC);
}

/*************************************************
 Function DisplayWORD:
 writes a WORD in hexa on the position indicated by
 pos. 
 - pos=0 -> 1st line of the LCD
 - pos=16 -> 2nd line of the LCD

 __SDCC__ only: for debugging
*************************************************/
#if defined(__SDCC__)
void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
{
    BYTE WDigit[6]; //enough for a  number < 65636: 5 digits + \0
    BYTE j;
    BYTE LCDPos=0;  //write on first line of LCD
    unsigned radix=10; //type expected by sdcc's ultoa()

    LCDPos=pos;
    ultoa(w, WDigit, radix);      
    for(j = 0; j < strlen((char*)WDigit); j++)
    {
       LCDText[LCDPos++] = WDigit[j];
    }
    if(LCDPos < 32u)
       LCDText[LCDPos] = 0;
    LCDUpdate();
}
/*************************************************
 Function //DisplayString: 
 Writes an IP address to string to the LCD display
 starting at pos
*************************************************/
void DisplayString(BYTE pos, char* text)
{
   BYTE l= strlen(text)+1;
   BYTE max= 32-pos;
   strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
   LCDUpdate();
}
#endif

/*************************************************
 Function DisplayIPValue: 
 Writes an IP address to the LCD display
*************************************************/

#if defined(__SDCC__)
void DisplayIPValue(DWORD IPdw) // 32 bits
#else
void DisplayIPValue(IP_ADDR IPVal) 
#endif
{
    BYTE IPDigit[4]; //enough for a number <256: 3 digits + \0
    BYTE i;
    BYTE j;
    BYTE LCDPos=16;  //write on second line of LCD
#if defined(__SDCC__)
    unsigned int IP_field, radix=10; //type expected by sdcc's uitoa()
#endif

    for(i = 0; i < sizeof(IP_ADDR); i++) //sizeof(IP_ADDR) is 4
    {
#if defined(__SDCC__)
       IP_field =(WORD)(IPdw>>(i*8))&0xff;      //ML
       uitoa(IP_field, IPDigit, radix);      //ML
#else
       uitoa((WORD)IPVal.v[i], IPDigit);
#endif

       for(j = 0; j < strlen((char*)IPDigit); j++)
       {
	   LCDText[LCDPos++] = IPDigit[j];
       }
       if(i == sizeof(IP_ADDR)-1)
	    break;
       LCDText[LCDPos++] = '.';

    }
    if(LCDPos < 32u)
       LCDText[LCDPos] = 0;
    LCDUpdate();
}


/****************************************************************************
  Function:
    static void InitializeBoard(void)

  Description:
    This routine initializes the hardware.  It is a generic initialization
    routine for many of the Microchip development boards, using definitions
    in HardwareProfile.h to determine specific initialization.

  Precondition:
    None

  Parameters:
    None - None

  Returns:
    None

  Remarks:
    None
  ***************************************************************************/
static void InitializeBoard(void)
{	
	// LEDs
        LED0_TRIS = 0;  //LED0
	LED1_TRIS = 0;  //LED1
	LED2_TRIS = 0;  //LED2
	LED3_TRIS = 0;  //LED_LCD1
	LED4_TRIS = 0;  //LED_LCD2
	LED5_TRIS = 0;  //LED5=RELAY1
	LED6_TRIS = 0;  //LED7=RELAY2
#if (!defined(EXPLORER_16) &&!defined(OLIMEX_MAXI))    // Pin multiplexed with 
	// a button on EXPLORER_16 and not used on OLIMEX_MAXI
	LED7_TRIS = 0;
#endif
        LED_PUT(0x00);  //turn off LED0 - LED2
	RELAY_PUT(0x00); //turn relays off to save power

	//set clock to 25 MHz

	// Enable PLL but disable pre and postscalers: the primary oscillator
        // runs at the speed of the 25MHz external quartz
	OSCTUNE = 0x40;

	// Switch to primary oscillator mode, 
        // regardless of if the config fuses tell us to start operating using 
        // the the internal RC
	// The external clock must be running and must be 25MHz for the 
	// Ethernet module and thus this Ethernet bootloader to operate.
        if(OSCCONbits.IDLEN) //IDLEN = 0x80; 0x02 selects the primary clock
		OSCCON = 0x82;
	else
		OSCCON = 0x02;

	// Enable Interrupts
	RCONbits.IPEN = 1;		// Enable interrupt priorities
        INTCONbits.GIEH = 1;
        INTCONbits.GIEL = 1;

}

/*********************************************************************
 * Function:        void InitAppConfig(void)
 *
 * PreCondition:    MPFSInit() is already called.
 *
 * Input:           None
 *
 * Output:          Write/Read non-volatile config variables.
 *
 * Side Effects:    None
 *
 * Overview:        None
 *
 * Note:            None
 ********************************************************************/

static void InitAppConfig(void)
{
	AppConfig.Flags.bIsDHCPEnabled = FALSE;
	AppConfig.Flags.bInConfigMode = TRUE;

//ML using sdcc (MPLAB has a trick to generate serial numbers)
// first 3 bytes indicate manufacturer; last 3 bytes are serial number
	AppConfig.MyMACAddr.v[0] = 0;
	AppConfig.MyMACAddr.v[1] = 0x04;
	AppConfig.MyMACAddr.v[2] = 0xA3;
	AppConfig.MyMACAddr.v[3] = 0x01;
	AppConfig.MyMACAddr.v[4] = 0x02;
	AppConfig.MyMACAddr.v[5] = 0x03;

//ML if you want to change, see TCPIPConfig.h
	AppConfig.MyIPAddr.Val = MY_DEFAULT_IP_ADDR_BYTE1 | 
            MY_DEFAULT_IP_ADDR_BYTE2<<8ul | MY_DEFAULT_IP_ADDR_BYTE3<<16ul | 
            MY_DEFAULT_IP_ADDR_BYTE4<<24ul;
	AppConfig.DefaultIPAddr.Val = AppConfig.MyIPAddr.Val;
	AppConfig.MyMask.Val = MY_DEFAULT_MASK_BYTE1 | 
            MY_DEFAULT_MASK_BYTE2<<8ul | MY_DEFAULT_MASK_BYTE3<<16ul | 
            MY_DEFAULT_MASK_BYTE4<<24ul;
	AppConfig.DefaultMask.Val = AppConfig.MyMask.Val;
	AppConfig.MyGateway.Val = MY_DEFAULT_GATE_BYTE1 | 
            MY_DEFAULT_GATE_BYTE2<<8ul | MY_DEFAULT_GATE_BYTE3<<16ul | 
            MY_DEFAULT_GATE_BYTE4<<24ul;
	AppConfig.PrimaryDNSServer.Val = MY_DEFAULT_PRIMARY_DNS_BYTE1 | 
            MY_DEFAULT_PRIMARY_DNS_BYTE2<<8ul  | 
            MY_DEFAULT_PRIMARY_DNS_BYTE3<<16ul  | 
            MY_DEFAULT_PRIMARY_DNS_BYTE4<<24ul;
	AppConfig.SecondaryDNSServer.Val = MY_DEFAULT_SECONDARY_DNS_BYTE1 | 
            MY_DEFAULT_SECONDARY_DNS_BYTE2<<8ul  | 
            MY_DEFAULT_SECONDARY_DNS_BYTE3<<16ul  | 
            MY_DEFAULT_SECONDARY_DNS_BYTE4<<24ul;
}

/*-------------------------------------------------------------------------
 *
 * strlcpy.c
 *    strncpy done right
 *
 * This file was taken from OpenBSD and is used on platforms that don't
 * provide strlcpy().  The OpenBSD copyright terms follow.
 *-------------------------------------------------------------------------
 */

/*  $OpenBSD: strlcpy.c,v 1.11 2006/05/05 15:27:38 millert Exp $    */

/*
 * Copyright (c) 1998 Todd C. Miller <Todd.Miller@courtesan.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */
 
/*
 * Copy src to string dst of size siz.  At most siz-1 characters
 * will be copied.  Always NUL terminates (unless siz == 0).
 * Returns strlen(src); if retval >= siz, truncation occurred.
 * Function creation history:  http://www.gratisoft.us/todd/papers/strlcpy.html
 */
size_t
strlcpy(char *dst, const char *src, size_t siz)
{
    char       *d = dst;
    const char *s = src;
    size_t      n = siz;

    /* Copy as many bytes as will fit */
    if (n != 0)
    {
        while (--n != 0)
        {
            if ((*d++ = *s++) == '\0')
                break;
        }
    }

    /* Not enough room in dst, add NUL and traverse rest of src */
    if (n == 0)
    {
        if (siz != 0)
            *d = '\0';          /* NUL-terminate dst */
        while (*s++)
            ;
    }

    return (s - src - 1);       /* count does not include NUL */
}
