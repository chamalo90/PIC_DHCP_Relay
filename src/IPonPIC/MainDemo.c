/*********************************************************************
 *
 *  Main Application Entry Point and TCP/IP Stack Demo
 *  Module for Microchip TCP/IP Stack
 *   -Demonstrates how to call and use the Microchip TCP/IP stack
 *	 -Reference: AN833
 *
 *********************************************************************
 * FileName:        MainDemo.c
 * Dependencies:    TCPIP.h
 * Processor:       PIC18, PIC24F, PIC24H, dsPIC30F, dsPIC33F, PIC32
 * Compiler:        Microchip C32 v1.05 or higher
 *					Microchip C30 v3.12 or higher
 *					Microchip C18 v3.30 or higher
 *					HI-TECH PICC-18 PRO 9.63PL2 or higher
 * Company:         Microchip Technology, Inc.
 *
 * Software License Agreement
 *
 * Copyright (C) 2002-2009 Microchip Technology Inc.  All rights
 * reserved.
 *
 * Microchip licenses to you the right to use, modify, copy, and
 * distribute:
 * (i)  the Software when embedded on a Microchip microcontroller or
 *      digital signal controller product ("Device") which is
 *      integrated into Licensee's product; or
 * (ii) ONLY the Software driver source files ENC28J60.c, ENC28J60.h,
 *		ENCX24J600.c and ENCX24J600.h ported to a non-Microchip device
 *		used in conjunction with a Microchip ethernet controller for
 *		the sole purpose of interfacing with the ethernet controller.
 *
 * You should refer to the license agreement accompanying this
 * Software for additional information regarding your rights and
 * obligations.
 *
 * THE SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT
 * WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT
 * LIMITATION, ANY WARRANTY OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT SHALL
 * MICROCHIP BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF
 * PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
 * BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE
 * THEREOF), ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER
 * SIMILAR COSTS, WHETHER ASSERTED ON THE BASIS OF CONTRACT, TORT
 * (INCLUDING NEGLIGENCE), BREACH OF WARRANTY, OR OTHERWISE.
 *
 *
 * Author              Date         Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Nilesh Rajbharti	4/19/01	Original (Rev. 1.0)
 * Nilesh Rajbharti	2/09/02	Cleanup
 * Nilesh Rajbharti	5/22/02	Rev 2.0 (See version.log for detail)
 * Nilesh Rajbharti	7/9/02	Rev 2.1 (See version.log for detail)
 * Nilesh Rajbharti	4/7/03	Rev 2.11.01 (See version log for detail)
 * Howard Schlunder	10/1/04	Beta Rev 0.9 (See version log for detail)
 * Howard Schlunder	10/8/04	Beta Rev 0.9.1 Announce support added
 * Howard Schlunder	11/29/04Beta Rev 0.9.2 (See version log for detail)
 * Howard Schlunder	2/10/05	Rev 2.5.0
 * Howard Schlunder	1/5/06	Rev 3.00
 * Howard Schlunder	1/18/06	Rev 3.01 ENC28J60 fixes to TCP, 
 *				UDP and ENC28J60 files
 * Howard Schlunder	3/01/06	Rev. 3.16 including 16-bit micro support
 * Howard Schlunder	4/12/06	Rev. 3.50 added LCD for Explorer 16
 * Howard Schlunder	6/19/06	Rev. 3.60 finished dsPIC30F support, 
 *                              added PICDEM.net 2 support
 * Howard Schlunder	8/02/06	Rev. 3.75 added beta DNS, NBNS, and HTTP client
 *                              (GenericTCPClient.c) services
 * Howard Schlunder	12/28/06Rev. 4.00RC added SMTP, Telnet, substantially 
 *                              modified TCP layer
 * Howard Schlunder	4/09/07 Rev. 4.02 added TCPPerformanceTest, 
 *                              UDPPerformanceTest, Reboot and fixed some bugs
 * Howard Schlunder	x/xx/07 Rev. 4.03
 * HSchlunder & EWood	8/27/07 Rev. 4.11
 * HSchlunder & EWood	10/08/07Rev. 4.13
 * HSchlunder & EWood	11/06/07Rev. 4.16
 * HSchlunder & EWood	11/08/07Rev. 4.17
 * HSchlunder & EWood	11/12/07Rev. 4.18
 * HSchlunder & EWood	2/11/08 Rev. 4.19
 * HSchlunder & EWood   4/26/08 Rev. 4.50 Moved most code to other files 
 *                                        for clarity
 * KHesky               7/07/08 Added ZG2100-specific support
 * HSchlunder & EWood   7/24/08 Rev. 4.51
 * Howard Schlunder	11/10/08Rev. 4.55
 * Howard Schlunder	04/14/09Rev. 5.00
 * Howard Schlunder	07/10/09Rev. 5.10
 * Marc Lobelle         03/15/10- adapted to support sdcc compiler
 *                              - removed some code not related to networking
 *                              - removed serial line support
 *                              - added a few debuging functions
 ********************************************************************/
/*
 * This symbol uniquely defines this file as the main entry point.
 * There should only be one such definition in the entire project,
 * and this file must define the AppConfig variable as described below.
 * The processor configuration will be included in HardwareProfile.h
 * if this symbol is defined.
 */
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

// Represents structure for a known client
typedef struct{
    IP_ADDR ip;
    MAC_ADDR mac;
    unsigned int terms_missed;
    DWORD client_leasetime;
    DWORD server_leasetime;
} POOL_ITEM;


#define DHCP_BROADCAST (28u)

//DHCP IP
#define DHCP_IP8 192
#define DHCP_IP16 168
#define DHCP_IP24 88
#define DHCP_IP32 2

//TIME ON NETWORKs
#define CLIENT_LEASE_TIME 300 //5 minutes of lease time in seconds
#define SERVER_LEASE_TIME 300 //5 minutes of lease time in seconds
#define OVERFLOW_TIME 61 // To activate leaseTimeCheck every minute
#define MAX_TERMS_MISSED 5 

BYTE MAC_ADDR_GATEWAY [6];


#define MAX_CLIENT 10
POOL_ITEM pool[MAX_CLIENT];
unsigned int seconds = 0;
static unsigned long MAGIC_COOKIE = 0x63538263;






// Private helper functions.
// These may or may not be present in all applications.
static void InitAppConfig(void);
static void InitializeBoard(void);
void DisplayWORD(BYTE pos, WORD w); //write WORDs on LCD for debugging
BOOL mac_cmp(MAC_ADDR *m1, MAC_ADDR *m2);
BOOL ip_cmp(IP_ADDR *ip1, IP_ADDR *ip2);
void UDPPutArrayInvert(BYTE *val, int len);
void addMacFromServ();
void getMacFromServ();
void setDhcpIp(IP_ADDR *ip);
void sendRequest(UDP_SOCKET *send_s_socket, POOL_ITEM *it);
void rcvdFromServer(UDP_SOCKET *send_c_socket, UDP_SOCKET *receiver_socket);
void transmitToClient(BOOTP_HEADER *bootp_header, UDP_SOCKET *send_c_socket, BYTE packet_type);
void rcvdFromClient(UDP_SOCKET *send_s_socket,UDP_SOCKET *send_c_socket, UDP_SOCKET *receiver_socket);
BOOL extractBootProtHeader(BYTE *dhcp_type, BOOTP_HEADER *bootp_header,BYTE *dhcp_header, int *dhcp_header_length, UDP_SOCKET *receiver_socket);
void buildHeader(BYTE *header, unsigned int *dhcp_header_length, POOL_ITEM *it);
void buildBootpHeader(BOOTP_HEADER *bootp_header, UDP_SOCKET *my_socket);
void configureBootpHeader(BOOTP_HEADER *bootp_header, DWORD transactionId, IP_ADDR *clientIP, IP_ADDR *yourIP, MAC_ADDR	*clientMAC, BYTE msg_type);
void buildDiscoverMsg();
void sendRelease(UDP_SOCKET *send_s_socket, POOL_ITEM *it);
void sendRequestMsg(BYTE *dhcp_header, int dhcp_header_length);
void initializeClientDB();
void initializeItem(POOL_ITEM *p);
BOOL addItem(IP_ADDR *ip, MAC_ADDR *mac, DWORD leasetime, unsigned int terms_missed_tmp);
BOOL isPoolItemUsed(POOL_ITEM *it);
BOOL findInPool(POOL_ITEM **it, MAC_ADDR *mac);
BOOL getLeaseFromAck(DWORD *lease_time, BYTE *dhcp_header, unsigned int dhcp_header_length);
void timeCheck(UDP_SOCKET *send_s_socket);
void leaseTimeCheck(UDP_SOCKET *send_s_socket);
void doDhcpOperations();







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
/*******************************************************************
**            Utility Functions 
********************************************************************/
// Compare MAC m1 & m2, return TRUE if they are equals
BOOL mac_cmp(MAC_ADDR *m1, MAC_ADDR *m2){
    int i;
    for(i=0; i<6; i++){
        if(m1->v[i] != m2->v[i]){
            return FALSE;
        }
    }
    return TRUE;
}

// Compare IP ip1 & ip2, return TRUE if they are equals
BOOL ip_cmp(IP_ADDR *ip1, IP_ADDR *ip2){
    int i;
    for(i=0; i<4; i++){
        if(ip1->v[i] != ip2->v[i]){
            return FALSE;
        }
    }   
    return TRUE;
}

void addMacFromServ(){
	int i;
    MAC_ADDR *remote_node_MAC;
    UDP_SOCKET_INFO *info;
	
    info = &UDPSocketInfo[activeUDPSocket];
    remote_node_MAC = &info->remoteNode.MACAddr;

	for (i=0; i<sizeof(MAC_ADDR); i++)
		remote_node_MAC->v[i] = MAC_ADDR_GATEWAY[i];
}


void UDPPutArrayInvert(BYTE *val, int len)
{
    int i;
    for(i = 0; i < len; i++)
        UDPPut(val[len-i-1]);
}

/*******************************************************************
**            Server Functions 
********************************************************************/
// Get MAC from Server
void getMacFromServ(){
  MAC_ADDR gw_mac;
  int i,j;
  
  for (i=0; i<100; i++) {
    StackTask();
    ARPResolve(&AppConfig.MyGateway);
    for(j=0;j<5000; j++) {
      if(ARPIsResolved(&AppConfig.MyGateway, &gw_mac)) {
        memcpy(MAC_ADDR_GATEWAY, &gw_mac, 6);
        return;     
      }
    }
  }
  DisplayString(0, "No MAC : ARP    Request Failed");
}


void setDhcpIp(IP_ADDR *ip){
    ip->v[0] = DHCP_IP8;
    ip->v[1] = DHCP_IP16;
    ip->v[2] = DHCP_IP24;
    ip->v[3] = DHCP_IP32;
}


void sendRequest(UDP_SOCKET *send_s_socket, POOL_ITEM *it){
    BOOTP_HEADER bootp_header;
    BYTE dhcp_header[200];
    unsigned int dhcp_header_length;
    
    while(!UDPIsPutReady(*send_s_socket));
    addMacFromServ();
    configureBootpHeader(&bootp_header, 0, &it->ip, &it->ip, &it->mac, DHCP_REQUEST_MESSAGE);
    buildHeader(dhcp_header, &dhcp_header_length, it);
    buildBootpHeader(&bootp_header, send_s_socket);
    sendRequestMsg(dhcp_header, dhcp_header_length);
}

void rcvdFromServer(UDP_SOCKET *send_c_socket, UDP_SOCKET *receiver_socket){
	BYTE dhcp_type;
	BOOTP_HEADER bootp_header;
    unsigned int dhcp_header_length;
    BYTE dhcp_header[200];
    DWORD lease_time;
    POOL_ITEM *pool_it;
    
	extractBootProtHeader(&dhcp_type, &bootp_header, dhcp_header, &dhcp_header_length, receiver_socket);
	UDPDiscard();
	
	switch(dhcp_type){
        case DHCP_OFFER_MESSAGE:
            DisplayString(0, "DHCP OFFER");
			transmitToClient(&bootp_header, send_c_socket, dhcp_type);
            break;

        case DHCP_ACK_MESSAGE:
            DisplayString(0, "DHCP ACK");
            getLeaseFromAck(&lease_time, dhcp_header, dhcp_header_length);        
            if(findInPool(&pool_it, &bootp_header.ClientMAC)){
                memcpy(pool_it->ip.v, &bootp_header.YourIP, sizeof(IP_ADDR));
                pool_it->server_leasetime = lease_time;
            }else{
				addItem((IP_ADDR*)&bootp_header.YourIP, &bootp_header.ClientMAC, lease_time, 0);    
			}
			transmitToClient(&bootp_header, send_c_socket, dhcp_type);
            break;

        default:
            DisplayString(0, "DISCARDED packet from server");
			break;
    }
}

void transmitToClient(BOOTP_HEADER *bootp_header, UDP_SOCKET *send_c_socket, BYTE packet_type) {
	UDP_SOCKET_INFO *info;
	int i;
    int lease_time; 
    IP_ADDR broadcast;
    
    while(!UDPIsPutReady(*send_c_socket));
    
	info = &UDPSocketInfo[activeUDPSocket];
	for(i=0; i<4; i++){
	    info->remoteNode.IPAddr.v[i] = 255;
	}

    info->remotePort = DHCP_CLIENT_PORT;

	//Change MAC address in socket
	for (i=0; i<sizeof(IP_ADDR); i++) {
		info->remoteNode.MACAddr.v[i] = bootp_header->ClientMAC.v[i];
	}
	
	buildBootpHeader(bootp_header, send_c_socket);
	UDPPut(packet_type);	

	//Subnet
    UDPPut(DHCP_SUBNET_MASK);
    UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyMask, sizeof(IP_ADDR));
	
	//Broadcast
	UDPPut(DHCP_BROADCAST);
	UDPPut(sizeof(IP_ADDR));
	for(i=0; i<sizeof(IP_ADDR); i++){
	    broadcast.v[i] = (AppConfig.MyIPAddr.v[i] & AppConfig.MyMask.v[i]) | ~AppConfig.MyMask.v[i];
	}
	UDPPutArray((BYTE*)&broadcast, sizeof(IP_ADDR));
	
	//Gateway
    UDPPut(DHCP_ROUTER);
    UDPPut(sizeof(IP_ADDR));
	UDPPutArray((BYTE*)&AppConfig.MyGateway, sizeof(IP_ADDR));
	//Lease time
	lease_time = CLIENT_LEASE_TIME; // Corresponds to AdaptLeaseTime action in ASG
	UDPPut(DHCP_IP_LEASE_TIME);
	UDPPut(4);
	UDPPut(0);
	UDPPut(0);
	UDPPutArrayInvert((BYTE*)&lease_time, 2);
	
	//DHCP relay server
	UDPPut(DHCP_SERVER_IDENTIFIER);
    UDPPut(sizeof(IP_ADDR));
    
    // Finalize packet
	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	    UDPPut(DHCP_END_OPTION);
    while(UDPTxCount < 300){
        UDPPut(0);
    }
    
    // Send packet
	UDPFlush();
}


/*******************************************************************
**            Client Functions 
********************************************************************/
void rcvdFromClient(UDP_SOCKET *send_s_socket,
                       UDP_SOCKET *send_c_socket,
                       UDP_SOCKET *receiver_socket){
    
    BYTE dhcp_type;
    BOOTP_HEADER bootp_header;
    BYTE dhcp_header[200];
    int dhcp_header_length;
    UDP_SOCKET_INFO *info;
    POOL_ITEM *pool_it;
    MAC_ADDR *remote_node_MAC; 
    
    info = &UDPSocketInfo[activeUDPSocket];   
    remote_node_MAC = &info->remoteNode.MACAddr;
    
    extractBootProtHeader(&dhcp_type, &bootp_header, dhcp_header, &dhcp_header_length, receiver_socket);
    UDPDiscard();
    
    switch(dhcp_type){
        case DHCP_DISCOVER_MESSAGE:
            while(!UDPIsPutReady(*send_s_socket));
            addMacFromServ();
            info = &UDPSocketInfo[activeUDPSocket];
            setDhcpIp(&info->remoteNode.IPAddr);
            
            DisplayString(0, "DHCP DISCOVERY");
            buildBootpHeader(&bootp_header, send_s_socket);
            buildDiscoverMsg();
            break;
        case DHCP_REQUEST_MESSAGE:
            DisplayString(0, "DHCP REQUEST");
                        
            if(findInPool(&pool_it,remote_node_MAC)){                
                while(!UDPIsPutReady(*send_c_socket));
                info = &UDPSocketInfo[activeUDPSocket]; 
                setDhcpIp(&info->remoteNode.IPAddr);
                pool_it->client_leasetime = CLIENT_LEASE_TIME;
                pool_it->terms_missed = 0;
                configureBootpHeader(&bootp_header, bootp_header.TransactionID, &bootp_header.ClientIP, &pool_it->ip, &pool_it->mac, BOOT_REPLY);
                transmitToClient(&bootp_header, send_c_socket, DHCP_ACK_MESSAGE);
            }
            else{
                
                while(!UDPIsPutReady(*send_s_socket));
                addMacFromServ();
                info = &UDPSocketInfo[activeUDPSocket];             
                setDhcpIp(&info->remoteNode.IPAddr);
                buildBootpHeader(&bootp_header, send_s_socket);
                sendRequestMsg(dhcp_header, dhcp_header_length);
            }
            break;
        default:
            DisplayString(0, "Wrong DHCP type");
			break;
    }
}

/*******************************************************************
**            Packets builder Functions 
********************************************************************/

void buildHeader(BYTE *header, unsigned int *dhcp_header_length, POOL_ITEM *it){
    int i;
    
    header[0] = DHCP_MESSAGE_TYPE;
    header[1] = DHCP_MESSAGE_TYPE_LEN;
    header[2] = DHCP_REQUEST_MESSAGE;
    header[3] = DHCP_PARAM_REQUEST_IP_ADDRESS;
    header[4] = DHCP_PARAM_REQUEST_IP_ADDRESS_LEN;
    for(i=5; i<9; i++){
        header[i] = it->ip.v[i-5];
    }
    header[9] = DHCP_SERVER_IDENTIFIER;
    header[10] = sizeof(IP_ADDR);
    *dhcp_header_length = 15;
}

void buildBootpHeader(BOOTP_HEADER *bootp_header, UDP_SOCKET *my_socket){
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
    // Put magic cookie (RFC 1533).
    UDPPut(99);
    UDPPut(130);
    UDPPut(83);
    UDPPut(99);
    UDPPut(DHCP_MESSAGE_TYPE);
    UDPPut(DHCP_MESSAGE_TYPE_LEN);
}

void configureBootpHeader(BOOTP_HEADER *bootp_header, DWORD transactionId, IP_ADDR *clientIP, IP_ADDR *yourIP, MAC_ADDR	*clientMAC, BYTE msg_type)
{
    
    bootp_header->MessageType = msg_type;
    bootp_header->HardwareType = BOOT_HW_TYPE;
    bootp_header->HardwareLen = BOOT_LEN_OF_HW_TYPE;
    bootp_header->Hops = 1;
    bootp_header->TransactionID = transactionId;
    bootp_header->SecondsElapsed = 0;
    bootp_header->BootpFlags = 0;
    memcpy(&bootp_header->ClientIP, clientIP, sizeof(IP_ADDR));
    memcpy(&bootp_header->YourIP, yourIP, sizeof(IP_ADDR));
    memset((void*)&bootp_header->NextServerIP, 0, sizeof(IP_ADDR));
    memset((void*)&bootp_header->RelayAgentIP, 42, sizeof(IP_ADDR));
    memcpy(&bootp_header->ClientMAC, clientMAC->v, sizeof(MAC_ADDR));
    
}


void buildDiscoverMsg(){
    
    UDPPut(DHCP_DISCOVER_MESSAGE);
    
    UDPPut(DHCP_SERVER_IDENTIFIER);
    UDPPut(sizeof(IP_ADDR));
    UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
    
    UDPPut(DHCP_ROUTER);
    UDPPut(sizeof(IP_ADDR));
    UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));

    UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	    UDPPut(DHCP_END_OPTION);
    while(UDPTxCount < 300){
        UDPPut(0);
    }
    
    UDPFlush();
}

// Send a release msg to the server and remove the specified pool_item 
void sendRelease(UDP_SOCKET *send_s_socket, POOL_ITEM *it){
	BOOTP_HEADER bootp_header;
    while(!UDPIsPutReady(*send_s_socket));
	addMacFromServ();
    configureBootpHeader(&bootp_header, 0, &it->ip, &it->ip, &it->mac, DHCP_ACK_MESSAGE);
    buildBootpHeader(&bootp_header, send_s_socket);
    UDPPut(DHCP_RELEASE_MESSAGE);

    UDPPut(DHCP_SERVER_IDENTIFIER);
    UDPPut(sizeof(IP_ADDR));
    UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));

    UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	UDPPut(DHCP_END_OPTION);
    while(UDPTxCount < 300){
        UDPPut(0);
    }

    UDPFlush();

    initializeItem(it); // Corresponds to RemoveFromPool action in ASG
}


void sendRequestMsg(BYTE *dhcp_header, int dhcp_header_length){
	int i;    
    BYTE opt, length;
    
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
    
    UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	UDPPut(DHCP_END_OPTION);
    while(UDPTxCount < 300){
        UDPPut(0);
    }
    
    UDPFlush();
}

/*******************************************************************
**            Packets reader Functions 
********************************************************************/

BOOL extractBootProtHeader(BYTE *dhcp_type, BOOTP_HEADER *bootp_header,
    BYTE *dhcp_header, int *dhcp_header_length, UDP_SOCKET *receiver_socket){
    
    unsigned int i;
    unsigned int skip_length;
    BYTE opt, length;
    DWORD cookie_checker;
    
    BOOL wrong_packet;
 
    
    
    while(!UDPIsGetReady(*receiver_socket));
    
    UDPGetArray((BYTE*)bootp_header, sizeof(BOOTP_HEADER)); //Read 34bytes
                  
    if(bootp_header->HardwareType != 1 || bootp_header->HardwareLen != 6){
        return FALSE;
    }

    skip_length = 208-sizeof(MAC_ADDR); // Skipping sname (64) + file (128) + 16 - MACSIZE
    for(i=0; i<skip_length; i++){
        UDPGet(&opt);
    }
    
    UDPGetArray((BYTE*)&cookie_checker, sizeof(DWORD));
    if(cookie_checker != MAGIC_COOKIE){
        return FALSE;
    }
    
    *dhcp_header_length = 0;
    wrong_packet = TRUE;
    while(UDPGet(&opt) && opt != DHCP_END_OPTION){
        UDPGet(&length);
        if(opt == DHCP_MESSAGE_TYPE){
            UDPGet(dhcp_type);
            wrong_packet = FALSE;
        }
        else if(dhcp_header != NULL){
            dhcp_header[*dhcp_header_length] = opt;
            dhcp_header[*dhcp_header_length+1] = length;
            UDPGetArray(&dhcp_header[*dhcp_header_length+2], length);
            *dhcp_header_length += 2+length;
        }
    }
    return !wrong_packet;
}

BOOL getLeaseFromAck(DWORD *lease_time, BYTE *dhcp_header, unsigned int dhcp_header_length){
    BYTE opt, length;
    int i;    
    i=0;
    
    while(i<dhcp_header_length){
        opt = dhcp_header[i];
        i++;
        length = dhcp_header[i];
        i++;
        
        if(opt == DHCP_IP_LEASE_TIME){
            *lease_time = dhcp_header[i+3]|dhcp_header[i+2]<<8|dhcp_header[i+1]<<16|dhcp_header[i]<<24;
            return TRUE;
        }
        i+=length;
    }
    return FALSE;    
}


/*******************************************************************
**            Relay Functions 
********************************************************************/

// Initialize pool - Empty data for future clients
void initializeClientDB(){
    int i;
    for(i=0; i<MAX_CLIENT; i++){
        initializeItem(&pool[i]);
    }
}

// Initialize item from the pool - Put all data to 0
void initializeItem(POOL_ITEM *p){
    int j;
    for(j=0; j<4; j++){
        p->ip.v[j] = 0;
    }


    for(j=0; j<6; j++){
        p->mac.v[j] = 0;
    }
    p->terms_missed = 0;
    p->client_leasetime = 0;
    p->server_leasetime = 0;
}

BOOL addItem(IP_ADDR *ip, MAC_ADDR *mac, DWORD leasetime, unsigned int terms_missed_tmp){
    int i;
    for(i=0; i<MAX_CLIENT; i++){
        if(isPoolItemUsed(&pool[i])){
            memcpy(pool[i].ip.v, ip->v, sizeof(IP_ADDR));
            memcpy(pool[i].mac.v, mac->v, sizeof(MAC_ADDR));
            pool[i].client_leasetime = CLIENT_LEASE_TIME;
            pool[i].server_leasetime = leasetime;
            pool[i].terms_missed = terms_missed_tmp;
            return TRUE;
        }
    }
	return FALSE;
}


// Check if a pool item is currently used
BOOL isPoolItemUsed(POOL_ITEM *it){
    int i;
    for(i=0; i<6; i++){
        if(it->mac.v[i] != 0){
            return FALSE;
        }
    }
    return TRUE;
}

BOOL findInPool(POOL_ITEM **it, MAC_ADDR *mac){
	int i;
    for(i=0; i<MAX_CLIENT; i++){
        if(mac_cmp(mac, &pool[i].mac)){
            *it = &pool[i];
            return TRUE;
        }
    }
    return FALSE;
}

// Update lease times
void leaseTimeCheck(UDP_SOCKET *send_s_socket){
    int i;
    for(i=0; i<MAX_CLIENT; i++){
        if(!isPoolItemUsed(&pool[i])){
        
            if(pool[i].server_leasetime < 60)
                pool[i].server_leasetime = 0;
            else pool[i].server_leasetime -= 60;
            
            if(pool[i].client_leasetime <= 60){
                pool[i].terms_missed++;
                pool[i].client_leasetime = CLIENT_LEASE_TIME;
                
                if(pool[i].terms_missed >= 5){
                
                    sendRelease(send_s_socket, &pool[i]); // TODO
                    continue; 
                }
            }
            else pool[i].client_leasetime -= 60;            
            if(pool[i].server_leasetime <= SERVER_LEASE_TIME){
                sendRequest(send_s_socket, &pool[i]);       // TODO
            }
        }
    }
}


/*******************************************************************
**            Time Functions 
********************************************************************/

//Task that will activate the lease time check every minute
void timeCheck(UDP_SOCKET *send_s_socket){
    TICK current;
    static TICK previous = 0;
    static TICK counter = 0;
    current = TickConvertToMilliseconds(TickGet());
    
    if (current-previous >= 1000 || current < previous) {
        previous += 1000;
        counter++;
        if(counter%OVERFLOW_TIME == 0){
            leaseTimeCheck(send_s_socket);
            counter = 0;
        }
    }
}


/*******************************************************************
**            Mains Functions 
********************************************************************/

// Cycle of all tasks that have to be done by a DHCP Relay
void doDhcpOperations(){
    UDP_SOCKET send_s_socket;
    UDP_SOCKET send_c_socket;
    UDP_SOCKET receiver_socket;
    
    
    IP_ADDR ip_last_pckt;
    IP_ADDR server_ip;
    WORD counter;
    setDhcpIp(&server_ip);

	
    
    send_s_socket = UDPOpen(0, NULL, 67);
    send_c_socket = UDPOpen(0, NULL, 68);
    receiver_socket = UDPOpen(67, NULL, 0);
    
    if(send_s_socket == INVALID_UDP_SOCKET ||
       receiver_socket == INVALID_UDP_SOCKET ||
       send_c_socket == INVALID_UDP_SOCKET){
        DisplayString (0,"Fail to create  socket");
        DelayMs(900);
        return;
    }

    DisplayString (0,"Entering Task Cycle"); // debugging
    DelayMs(900);
    while(1){
        StackTaskModified(&ip_last_pckt);       
        timeCheck(&send_s_socket);
        
    if(counter = UDPIsGetReady(receiver_socket)){
      if(ip_cmp(&ip_last_pckt, &server_ip)){ // Check si on peut pas voir avec l'OP code
                rcvdFromServer(&send_c_socket, &receiver_socket);
            }
            else{
                rcvdFromClient(&send_s_socket, &send_c_socket, &receiver_socket);
            }
        }    
    }   
}

//
// Main application entry point.
//


#if defined(__18CXX) || defined(__SDCC__)
void main(void)
#else
int main(void)
#endif
{	
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

    //Iniatize pool and DHCP informations
    DisplayString(0,"INGI2315 Init");
    getMacFromServ();
    initializeClientDB();

    doDhcpOperations();
}//end of main()

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
 Function DisplayString: 
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
	AppConfig.Flags.bIsDHCPEnabled = TRUE;
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
