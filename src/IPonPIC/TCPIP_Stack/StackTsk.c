/*********************************************************************
 *
 *	TCP/IP Stack Manager
 *  Module for Microchip TCP/IP Stack
 *	 -Handles internal RX packet pre-processing prior to dispatching 
 *    to upper application layers.
 *	 -Reference: AN833
 *
 *********************************************************************
 * FileName:        StackTsk.c
 * Dependencies:    ARP, IP, Network layer interface (ENC28J60.c, 
 *					ETH97J60.c, ENCX24J600.c, or ZG2100.c)
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
 * Author               Date        Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Nilesh Rajbharti     8/14/01     Original (Rev. 1.0)
 * Nilesh Rajbharti     2/9/02      Cleanup
 * Nilesh Rajbharti     5/22/02     Rev 2.0 (See version.log for detail)
 * Nilesh Rajbharti     12/5/02     Modified UDPProcess() and TCPProcess()
 *                                  to include localIP as third param.
 *                                  This was done to allow these functions
 *                                  to calculate checksum correctly.
 * Nilesh Rajbharti     7/26/04     Added code in StackTask() to not
 *                                  clear statically IP address if link is
 *                                  removed and DHCP module is disabled
 *                                  at runtime.
 * Howard Schlunder		03/16/07	Rewrote stack manager to be linear
********************************************************************/
#define __STACKTSK_C
#define __18F97J60
#define __SDCC__
#include "../Include/HardwareProfile.h"

#include "../Include/TCPIP_Stack/TCPIP.h"


#if defined( ZG_CS_TRIS )
    #if defined(ZG_CONFIG_LINKMGRII) 
        #include "TCPIP Stack\ZGLinkMgrII.h"
    #endif
    #if defined( ZG_CONFIG_CONSOLE )
        #include "TCPIP Stack\ZGConsole.h"
    #endif
#endif

// Stack FSM states.
typedef enum
{
    SM_STACK_IDLE,
    SM_STACK_MAC,
    SM_STACK_IP,
    SM_STACK_ARP,
    SM_STACK_TCP,
    SM_STACK_UDP
} SM_STACK;
static SM_STACK smStack;

NODE_INFO remoteNode;



/*********************************************************************
 * Function:        void StackInit(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          Stack and its components are initialized
 *
 * Side Effects:    None
 *
 * Note:            This function must be called before any of the
 *                  stack or its component routines are used.
 *
 ********************************************************************/
void StackInit(void)
{
    smStack                     = SM_STACK_IDLE;

#if defined(STACK_USE_IP_GLEANING) || defined(STACK_USE_DHCP_CLIENT)
    /*
     * If DHCP or IP Gleaning is enabled,
     * startup in Config Mode.
     */
    AppConfig.Flags.bInConfigMode = TRUE;
#endif

	// Seed the rand() function
	srand(GenerateRandomDWORD());

    MACInit();
#if defined( ZG_CS_TRIS )
    #if defined(ZG_CONFIG_LINKMGRII) 
        ZGLibInitialize();
        ZGLinkMgrInit();
    #endif
#endif    


    ARPInit();

#if defined(STACK_USE_UDP)
    UDPInit();
#endif

#if defined(STACK_USE_TCP)
    TCPInit();
#endif

#if defined(STACK_USE_BERKELEY_API)
	BerkeleySocketInit();
#endif

#if defined(STACK_USE_HTTP_SERVER) || defined(STACK_USE_HTTP2_SERVER)
    HTTPInit();
#endif

#if defined(STACK_USE_RSA)
	RSAInit();
#endif

#if defined(STACK_USE_SSL)
    SSLInit();
#endif

#if defined(STACK_USE_FTP_SERVER) && defined(STACK_USE_MPFS)
    FTPInit();
#endif

#if defined(STACK_USE_SNMP_SERVER)
	SNMPInit();
#endif

#if defined(STACK_USE_DHCP_CLIENT)
	DHCPInit(0);

    if(!AppConfig.Flags.bIsDHCPEnabled)
    {
        DHCPDisable(0);  
    }
#endif

#if defined(STACK_USE_DYNAMICDNS_CLIENT)
		DDNSInit();
#endif


}


/*********************************************************************
 * Function:        void StackTask(void)
 *
 * PreCondition:    StackInit() is already called.
 *
 * Input:           None
 *
 * Output:          Stack FSM is executed.
 *
 * Side Effects:    None
 *
 * Note:            This FSM checks for new incoming packets,
 *                  and routes it to appropriate stack components.
 *                  It also performs timed operations.
 *
 *                  This function must be called periodically to
 *                  ensure timely responses.
 *
 ********************************************************************/
void StackTask(void){
	StackTaskModified(NULL);
}

void StackTaskModified(IP_ADDR *ip)
{
    WORD dataCount;
    IP_ADDR tempLocalIP;
	BYTE cFrameType;
	BYTE cIPFrameType;

    #if defined( ZG_CS_TRIS )
        // This task performs low-level MAC processing specific to the ZG2100
        MACProcess();
        #if defined(ZG_CONFIG_LINKMGRII) 
            ZGLinkMgr();
        #endif     
    #endif

    #if defined(STACK_USE_DHCP_CLIENT)
	// Normally, an application would not include  DHCP module
	// if it is not enabled. But in case some one wants to disable
	// DHCP module at run-time, remember to not clear our IP
	// address if link is removed.
	if(AppConfig.Flags.bIsDHCPEnabled)
	{
		static BOOL bLastLinkState = FALSE;
		BOOL bCurrentLinkState;
		
		bCurrentLinkState = MACIsLinked();
		if(bCurrentLinkState != bLastLinkState)
		{
			bLastLinkState = bCurrentLinkState;
			if(!bCurrentLinkState) //we lost the MAC link
			{
				AppConfig.MyIPAddr.Val = AppConfig.DefaultIPAddr.Val;
				AppConfig.MyMask.Val = AppConfig.DefaultMask.Val;
				AppConfig.Flags.bInConfigMode = TRUE;
				DHCPInit(0);
			}
		}
	
		// DHCP must be called all the time even after IP configuration is
		// discovered.
		// DHCP has to account lease expiration time and renew the
		// configuration time.
		DHCPTask();
		
		if(DHCPIsBound(0))
			AppConfig.Flags.bInConfigMode = FALSE;
	}
    #endif

    #if defined (STACK_USE_AUTO_IP)
        AutoIPTasks();
    #endif

    #if defined(STACK_USE_TCP)
    // Perform all TCP time related tasks (retransmit, send acknowledge,
    // close connection, etc)
	TCPTick();
    #endif


    #if defined(STACK_USE_UDP)
	UDPTask();
    #endif

	// Process as many incomming packets as we can
	while(1)
	{
		//if using the random module, generate entropy
		#if defined(STACK_USE_RANDOM)
			RandomAdd(remoteNode.MACAddr.v[5]);
		#endif

		// We are about to fetch a new packet, make sure that the 
		// UDP module knows that any old RX data it has laying 
		// around will now be gone.
		#if defined(STACK_USE_UDP)
			UDPDiscard();
		#endif

		// Fetch a packet (throws old one away, if not thrown away 
		// yet)
		if(!MACGetHeader(&remoteNode.MACAddr, &cFrameType))
			break;

		// Dispatch the packet to the appropriate handler
		switch(cFrameType)
		{
			case MAC_ARP:
//			  DisplayString(0,"gotARP");  //ML
				ARPProcess();
				break;
	
			case MAC_IP:
//			  DisplayString(0,"gotIP");  //ML
				if(!IPGetHeader(&tempLocalIP, &remoteNode, &cIPFrameType, &dataCount))
					break;

				#if defined(STACK_USE_ICMP_SERVER) || defined(STACK_USE_ICMP_CLIENT)
				if(cIPFrameType == IP_PROT_ICMP)
				{
//			  DisplayString(8,"gotICMP");  //ML
					#if defined(STACK_USE_IP_GLEANING)
					if(AppConfig.Flags.bInConfigMode && AppConfig.Flags.bIsDHCPEnabled)
					{
						// According to "IP Gleaning" procedure,
						// when we receive an ICMP packet with a valid
						// IP address while we are still in configuration
						// mode, accept that address as ours and conclude
						// configuration mode.
						if(tempLocalIP.Val != 0xffffffff)
						{
							AppConfig.Flags.bInConfigMode = FALSE;
							AppConfig.MyIPAddr = tempLocalIP;
						}
					}
					#endif

					// Process this ICMP packet if it the destination IP address matches 
					// our address or one of the broadcast IP addressees
					if( (tempLocalIP.Val == AppConfig.MyIPAddr.Val) ||
						(tempLocalIP.Val == 0xFFFFFFFF) ||
						(tempLocalIP.Val == ((AppConfig.MyIPAddr.Val & AppConfig.MyMask.Val) | ~AppConfig.MyMask.Val)))
					{
						ICMPProcess(&remoteNode, dataCount);
					}

					break;
				}
				#endif
				
				#if defined(STACK_USE_TCP)
				if(cIPFrameType == IP_PROT_TCP)
				{
//			  DisplayString(8,"gotTCP");  //ML
					TCPProcess(&remoteNode, &tempLocalIP, dataCount);
					break;
				}
				#endif
				
				#if defined(STACK_USE_UDP)
				if(cIPFrameType == IP_PROT_UDP)
				{
//			  DisplayString(8,"gotUDP");  //ML
					// Stop processing packets if we came upon a UDP frame with application data in it
					if(UDPProcess(&remoteNode, &tempLocalIP, dataCount)){
						  if(ip != NULL){
					        memcpy(ip, &remoteNode.IPAddr, sizeof(remoteNode.IPAddr));
					    }
						return;
					}
				}
				#endif

				break;
		}
	}
}

/*********************************************************************
 * Function:        void StackApplications(void)
 *
 * PreCondition:    StackInit() is already called.
 *
 * Input:           None
 *
 * Output:          Calls all loaded application modules.
 *
 * Side Effects:    None
 *
 * Note:            This function must be called periodically to
 *                  ensure timely responses.
 *
 ********************************************************************/
void StackApplications(void)
{
	#if defined(STACK_USE_HTTP_SERVER) || defined(STACK_USE_HTTP2_SERVER)
	HTTPServer();
	#endif
	
	#if defined(STACK_USE_FTP_SERVER) && defined(STACK_USE_MPFS)
	FTPServer();
	#endif
	
	#if defined(STACK_USE_SNMP_SERVER)
	SNMPTask();
	#endif
	
	#if defined(STACK_USE_ANNOUNCE)
	DiscoveryTask();
	#endif
	
	#if defined(STACK_USE_NBNS)
	NBNSTask();
	#endif
	
	#if defined(STACK_USE_DHCP_SERVER)
	DHCPServerTask();
	#endif
	
	#if defined (STACK_USE_DYNAMICDNS_CLIENT)
	DDNSTask();
	#endif
	
	#if defined(STACK_USE_TELNET_SERVER)
	TelnetTask();
	#endif
	
	#if defined(STACK_USE_REBOOT_SERVER)
	RebootTask();
	#endif
	
	#if defined(STACK_USE_SNTP_CLIENT)
	SNTPClient();
	#endif
	
	#if defined(STACK_USE_UDP_PERFORMANCE_TEST)
	UDPPerformanceTask();
	#endif
	
	#if defined(STACK_USE_TCP_PERFORMANCE_TEST)
	TCPPerformanceTask();
	#endif
	
	#if defined(STACK_USE_SMTP_CLIENT)
	SMTPTask();
	#endif
	
	#if defined(STACK_USE_UART2TCP_BRIDGE)
	UART2TCPBridgeTask();
	#endif
}
