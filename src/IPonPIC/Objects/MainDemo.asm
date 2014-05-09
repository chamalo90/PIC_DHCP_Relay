;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (May 13 2013) (UNIX)
; This file was generated Fri May  9 05:30:11 2014
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _message
	global _seconds
	global _AN0String
	global _mac_cmp
	global _ip_cmp
	global _addMacFromServ
	global _UDPPutArrayInvert
	global _getMacFromServ
	global _setDhcpIp
	global _sendRequest
	global _rcvdFromServer
	global _transmitToClient
	global _rcvdFromClient
	global _buildHeader
	global _buildBootpHeader
	global _configureBootpHeader
	global _buildDiscoverMsg
	global _sendRelease
	global _sendRequestMsg
	global _extractBootProtHeader
	global _getLeaseFromAck
	global _initializeClientDB
	global _initializeItem
	global _addItem
	global _isPoolItemUsed
	global _findInPool
	global _leaseTimeCheck
	global _timeCheck
	global _doDhcpOperations
	global _DisplayWORD
	global _DisplayString
	global _DisplayIPValue
	global _strlcpy
	global _AppConfig
	global _MAC_ADDR_GATEWAY
	global _pool
	global _LowISR
	global _HighISR
	global _main

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrget1
	extern __gptrput1
	extern __gptrput4
	extern __gptrput2
	extern __gptrget2
	extern __gptrput3
	extern _EBSTCONbits
	extern _MISTATbits
	extern _EFLOCONbits
	extern _MACON1bits
	extern _MACON2bits
	extern _MACON3bits
	extern _MACON4bits
	extern _MACLCON1bits
	extern _MACLCON2bits
	extern _MICONbits
	extern _MICMDbits
	extern _EWOLIEbits
	extern _EWOLIRbits
	extern _ERXFCONbits
	extern _EIEbits
	extern _ESTATbits
	extern _ECON2bits
	extern _EIRbits
	extern _EDATAbits
	extern _SSP2CON2bits
	extern _SSP2CON1bits
	extern _SSP2STATbits
	extern _ECCP2DELbits
	extern _ECCP2ASbits
	extern _ECCP3DELbits
	extern _ECCP3ASbits
	extern _RCSTA2bits
	extern _TXSTA2bits
	extern _CCP5CONbits
	extern _CCP4CONbits
	extern _T4CONbits
	extern _ECCP1DELbits
	extern _BAUDCON2bits
	extern _BAUDCTL2bits
	extern _BAUDCONbits
	extern _BAUDCON1bits
	extern _BAUDCTLbits
	extern _BAUDCTL1bits
	extern _PORTAbits
	extern _PORTBbits
	extern _PORTCbits
	extern _PORTDbits
	extern _PORTEbits
	extern _PORTFbits
	extern _PORTGbits
	extern _PORTHbits
	extern _PORTJbits
	extern _LATAbits
	extern _LATBbits
	extern _LATCbits
	extern _LATDbits
	extern _LATEbits
	extern _LATFbits
	extern _LATGbits
	extern _LATHbits
	extern _LATJbits
	extern _DDRAbits
	extern _TRISAbits
	extern _DDRBbits
	extern _TRISBbits
	extern _DDRCbits
	extern _TRISCbits
	extern _DDRDbits
	extern _TRISDbits
	extern _DDREbits
	extern _TRISEbits
	extern _DDRFbits
	extern _TRISFbits
	extern _DDRGbits
	extern _TRISGbits
	extern _DDRHbits
	extern _TRISHbits
	extern _DDRJbits
	extern _TRISJbits
	extern _OSCTUNEbits
	extern _MEMCONbits
	extern _PIE1bits
	extern _PIR1bits
	extern _IPR1bits
	extern _PIE2bits
	extern _PIR2bits
	extern _IPR2bits
	extern _PIE3bits
	extern _PIR3bits
	extern _IPR3bits
	extern _EECON1bits
	extern _RCSTAbits
	extern _RCSTA1bits
	extern _TXSTAbits
	extern _TXSTA1bits
	extern _PSPCONbits
	extern _T3CONbits
	extern _CMCONbits
	extern _CVRCONbits
	extern _ECCP1ASbits
	extern _CCP3CONbits
	extern _ECCP3CONbits
	extern _CCP2CONbits
	extern _ECCP2CONbits
	extern _CCP1CONbits
	extern _ECCP1CONbits
	extern _ADCON2bits
	extern _ADCON1bits
	extern _ADCON0bits
	extern _SSP1CON2bits
	extern _SSPCON2bits
	extern _SSP1CON1bits
	extern _SSPCON1bits
	extern _SSP1STATbits
	extern _SSPSTATbits
	extern _T2CONbits
	extern _T1CONbits
	extern _RCONbits
	extern _WDTCONbits
	extern _ECON1bits
	extern _OSCCONbits
	extern _T0CONbits
	extern _STATUSbits
	extern _INTCON3bits
	extern _INTCON2bits
	extern _INTCONbits
	extern _STKPTRbits
	extern _stdin
	extern _stdout
	extern _activeUDPSocket
	extern _UDPSocketInfo
	extern _UDPTxCount
	extern _UDPRxCount
	extern _LCDText
	extern _MAADR5
	extern _MAADR6
	extern _MAADR3
	extern _MAADR4
	extern _MAADR1
	extern _MAADR2
	extern _EBSTSD
	extern _EBSTCON
	extern _EBSTCS
	extern _EBSTCSL
	extern _EBSTCSH
	extern _MISTAT
	extern _EFLOCON
	extern _EPAUS
	extern _EPAUSL
	extern _EPAUSH
	extern _MACON1
	extern _MACON2
	extern _MACON3
	extern _MACON4
	extern _MABBIPG
	extern _MAIPG
	extern _MAIPGL
	extern _MAIPGH
	extern _MACLCON1
	extern _MACLCON2
	extern _MAMXFL
	extern _MAMXFLL
	extern _MAMXFLH
	extern _MICON
	extern _MICMD
	extern _MIREGADR
	extern _MIWR
	extern _MIWRL
	extern _MIWRH
	extern _MIRD
	extern _MIRDL
	extern _MIRDH
	extern _EHT0
	extern _EHT1
	extern _EHT2
	extern _EHT3
	extern _EHT4
	extern _EHT5
	extern _EHT6
	extern _EHT7
	extern _EPMM0
	extern _EPMM1
	extern _EPMM2
	extern _EPMM3
	extern _EPMM4
	extern _EPMM5
	extern _EPMM6
	extern _EPMM7
	extern _EPMCS
	extern _EPMCSL
	extern _EPMCSH
	extern _EPMO
	extern _EPMOL
	extern _EPMOH
	extern _EWOLIE
	extern _EWOLIR
	extern _ERXFCON
	extern _EPKTCNT
	extern _EWRPT
	extern _EWRPTL
	extern _EWRPTH
	extern _ETXST
	extern _ETXSTL
	extern _ETXSTH
	extern _ETXND
	extern _ETXNDL
	extern _ETXNDH
	extern _ERXST
	extern _ERXSTL
	extern _ERXSTH
	extern _ERXND
	extern _ERXNDL
	extern _ERXNDH
	extern _ERXRDPT
	extern _ERXRDPTL
	extern _ERXRDPTH
	extern _ERXWRPT
	extern _ERXWRPTL
	extern _ERXWRPTH
	extern _EDMAST
	extern _EDMASTL
	extern _EDMASTH
	extern _EDMAND
	extern _EDMANDL
	extern _EDMANDH
	extern _EDMADST
	extern _EDMADSTL
	extern _EDMADSTH
	extern _EDMACS
	extern _EDMACSL
	extern _EDMACSH
	extern _EIE
	extern _ESTAT
	extern _ECON2
	extern _EIR
	extern _EDATA
	extern _SSP2CON2
	extern _SSP2CON1
	extern _SSP2STAT
	extern _SSP2ADD
	extern _SSP2BUF
	extern _ECCP2DEL
	extern _ECCP2AS
	extern _ECCP3DEL
	extern _ECCP3AS
	extern _RCSTA2
	extern _TXSTA2
	extern _TXREG2
	extern _RCREG2
	extern _SPBRG2
	extern _CCP5CON
	extern _CCPR5
	extern _CCPR5L
	extern _CCPR5H
	extern _CCP4CON
	extern _CCPR4
	extern _CCPR4L
	extern _CCPR4H
	extern _T4CON
	extern _PR4
	extern _TMR4
	extern _ECCP1DEL
	extern _ERDPT
	extern _ERDPTL
	extern _ERDPTH
	extern _BAUDCON2
	extern _BAUDCTL2
	extern _SPBRGH2
	extern _BAUDCON
	extern _BAUDCON1
	extern _BAUDCTL
	extern _BAUDCTL1
	extern _SPBRGH
	extern _SPBRGH1
	extern _PORTA
	extern _PORTB
	extern _PORTC
	extern _PORTD
	extern _PORTE
	extern _PORTF
	extern _PORTG
	extern _PORTH
	extern _PORTJ
	extern _LATA
	extern _LATB
	extern _LATC
	extern _LATD
	extern _LATE
	extern _LATF
	extern _LATG
	extern _LATH
	extern _LATJ
	extern _DDRA
	extern _TRISA
	extern _DDRB
	extern _TRISB
	extern _DDRC
	extern _TRISC
	extern _DDRD
	extern _TRISD
	extern _DDRE
	extern _TRISE
	extern _DDRF
	extern _TRISF
	extern _DDRG
	extern _TRISG
	extern _DDRH
	extern _TRISH
	extern _DDRJ
	extern _TRISJ
	extern _OSCTUNE
	extern _MEMCON
	extern _PIE1
	extern _PIR1
	extern _IPR1
	extern _PIE2
	extern _PIR2
	extern _IPR2
	extern _PIE3
	extern _PIR3
	extern _IPR3
	extern _EECON1
	extern _EECON2
	extern _RCSTA
	extern _RCSTA1
	extern _TXSTA
	extern _TXSTA1
	extern _TXREG
	extern _TXREG1
	extern _RCREG
	extern _RCREG1
	extern _SPBRG
	extern _SPBRG1
	extern _PSPCON
	extern _T3CON
	extern _TMR3L
	extern _TMR3H
	extern _CMCON
	extern _CVRCON
	extern _ECCP1AS
	extern _CCP3CON
	extern _ECCP3CON
	extern _CCPR3
	extern _CCPR3L
	extern _CCPR3H
	extern _CCP2CON
	extern _ECCP2CON
	extern _CCPR2
	extern _CCPR2L
	extern _CCPR2H
	extern _CCP1CON
	extern _ECCP1CON
	extern _CCPR1
	extern _CCPR1L
	extern _CCPR1H
	extern _ADCON2
	extern _ADCON1
	extern _ADCON0
	extern _ADRES
	extern _ADRESL
	extern _ADRESH
	extern _SSP1CON2
	extern _SSPCON2
	extern _SSP1CON1
	extern _SSPCON1
	extern _SSP1STAT
	extern _SSPSTAT
	extern _SSP1ADD
	extern _SSPADD
	extern _SSP1BUF
	extern _SSPBUF
	extern _T2CON
	extern _PR2
	extern _TMR2
	extern _T1CON
	extern _TMR1L
	extern _TMR1H
	extern _RCON
	extern _WDTCON
	extern _ECON1
	extern _OSCCON
	extern _T0CON
	extern _TMR0L
	extern _TMR0H
	extern _STATUS
	extern _FSR2L
	extern _FSR2H
	extern _PLUSW2
	extern _PREINC2
	extern _POSTDEC2
	extern _POSTINC2
	extern _INDF2
	extern _BSR
	extern _FSR1L
	extern _FSR1H
	extern _PLUSW1
	extern _PREINC1
	extern _POSTDEC1
	extern _POSTINC1
	extern _INDF1
	extern _WREG
	extern _FSR0L
	extern _FSR0H
	extern _PLUSW0
	extern _PREINC0
	extern _POSTDEC0
	extern _POSTINC0
	extern _INDF0
	extern _INTCON3
	extern _INTCON2
	extern _INTCON
	extern _PROD
	extern _PRODL
	extern _PRODH
	extern _TABLAT
	extern _TBLPTR
	extern _TBLPTRL
	extern _TBLPTRH
	extern _TBLPTRU
	extern _PC
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _STKPTR
	extern _TOS
	extern _TOSL
	extern _TOSH
	extern _TOSU
	extern _uitoa
	extern _ultoa
	extern _strlen
	extern _memcpy
	extern _memset
	extern _StackInit
	extern _StackTask
	extern _StackTaskModified
	extern _TickInit
	extern _TickGet
	extern _TickConvertToMilliseconds
	extern _TickUpdate
	extern _ARPResolve
	extern _ARPIsResolved
	extern _UDPOpen
	extern _UDPIsPutReady
	extern _UDPPut
	extern _UDPPutArray
	extern _UDPFlush
	extern _UDPIsGetReady
	extern _UDPGet
	extern _UDPGetArray
	extern _UDPDiscard
	extern _LCDInit
	extern _LCDUpdate
	extern __modulong
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
BSR	equ	0xfe0
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTINC0	equ	0xfee
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_seconds	db	0x00, 0x00
_MAGIC_COOKIE	db	0x63, 0x82, 0x53, 0x63
_timeCheck_previous_1_1	db	0x00, 0x00, 0x00, 0x00
_timeCheck_counter_1_1	db	0x00, 0x00, 0x00, 0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1
r0x10	res	1
r0x11	res	1
r0x12	res	1
r0x13	res	1
r0x14	res	1
r0x15	res	1
r0x16	res	1
r0x17	res	1
r0x18	res	1
r0x19	res	1
r0x1a	res	1

udata_MainDemo_0	udata
_AN0String	res	8

udata_MainDemo_1	udata
_message	res	3

udata_MainDemo_2	udata
_MAC_ADDR_GATEWAY	res	6

udata_MainDemo_3	udata
_AppConfig	res	51

udata_MainDemo_4	udata
_getMacFromServ_gw_mac_1_1	res	6

udata_MainDemo_5	udata
_sendRequest_dhcp_header_length_1_1	res	2

udata_MainDemo_6	udata
_sendRequest_bootp_header_1_1	res	34

udata_MainDemo_7	udata
_sendRequest_dhcp_header_1_1	res	200

udata_MainDemo_8	udata
_rcvdFromServer_pool_it_1_1	res	3

udata_MainDemo_9	udata
_rcvdFromServer_dhcp_type_1_1	res	1

udata_MainDemo_10	udata
_rcvdFromServer_bootp_header_1_1	res	34

udata_MainDemo_11	udata
_rcvdFromServer_dhcp_header_1_1	res	200

udata_MainDemo_12	udata
_rcvdFromServer_dhcp_header_length_1_1	res	2

udata_MainDemo_13	udata
_rcvdFromServer_lease_time_1_1	res	4

udata_MainDemo_14	udata
_transmitToClient_lease_time_1_1	res	2

udata_MainDemo_15	udata
_transmitToClient_broadcast_1_1	res	4

udata_MainDemo_16	udata
_rcvdFromClient_pool_it_1_1	res	3

udata_MainDemo_17	udata
_rcvdFromClient_dhcp_type_1_1	res	1

udata_MainDemo_18	udata
_rcvdFromClient_bootp_header_1_1	res	34

udata_MainDemo_19	udata
_rcvdFromClient_dhcp_header_1_1	res	200

udata_MainDemo_20	udata
_rcvdFromClient_dhcp_header_length_1_1	res	2

udata_MainDemo_21	udata
_sendRelease_bootp_header_1_1	res	34

udata_MainDemo_22	udata
_extractBootProtHeader_opt_1_1	res	1

udata_MainDemo_23	udata
_extractBootProtHeader_cookie_checker_1_1	res	4

udata_MainDemo_24	udata
_extractBootProtHeader_length_1_1	res	1

udata_MainDemo_25	udata
_pool	res	200

udata_MainDemo_26	udata
_doDhcpOperations_send_s_socket_1_1	res	1

udata_MainDemo_27	udata
_doDhcpOperations_send_c_socket_1_1	res	1

udata_MainDemo_28	udata
_doDhcpOperations_receiver_socket_1_1	res	1

udata_MainDemo_29	udata
_doDhcpOperations_server_ip_1_1	res	4

udata_MainDemo_30	udata
_doDhcpOperations_ip_last_pckt_1_1	res	4

udata_MainDemo_31	udata
_DisplayWORD_WDigit_1_1	res	6

udata_MainDemo_32	udata
_DisplayIPValue_IPDigit_1_1	res	4

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_MainDemo_ivec_0x2_LowISR	code	0X000018
ivec_0x2_LowISR:
	GOTO	_LowISR

; ; Starting pCode block for absolute section
; ;-----------------------------------------
S_MainDemo_ivec_0x1_HighISR	code	0X000008
ivec_0x1_HighISR:
	GOTO	_HighISR

; I code from now on!
; ; Starting pCode block
S_MainDemo__main	code
_main:
;	.line	895; MainDemo.c	InitializeBoard();
	CALL	_InitializeBoard
;	.line	898; MainDemo.c	LCDInit();
	CALL	_LCDInit
;	.line	899; MainDemo.c	DelayMs(100);
	MOVLW	0x10
	MOVWF	r0x00
	MOVLW	0x98
	MOVWF	r0x01
	MOVLW	0x02
	MOVWF	r0x02
	CLRF	r0x03
_00642_DS_:
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVLW	0xff
	ADDWF	r0x00, F
	MOVLW	0xff
	ADDWFC	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	BNZ	_00642_DS_
;	.line	902; MainDemo.c	TickInit();
	CALL	_TickInit
;	.line	905; MainDemo.c	InitAppConfig();
	CALL	_InitAppConfig
;	.line	909; MainDemo.c	StackInit();
	CALL	_StackInit
;	.line	912; MainDemo.c	DisplayString(0,"INGI2315 Init");
	MOVLW	UPPER(__str_9)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_9)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_9)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	913; MainDemo.c	getMacFromServ();
	CALL	_getMacFromServ
;	.line	914; MainDemo.c	initializeClientDB();
	CALL	_initializeClientDB
;	.line	916; MainDemo.c	doDhcpOperations();
	CALL	_doDhcpOperations
	RETURN	

; ; Starting pCode block
S_MainDemo__strlcpy	code
_strlcpy:
;	.line	1152; MainDemo.c	strlcpy(char *dst, const char *src, size_t siz)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVFF	r0x15, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
;	.line	1154; MainDemo.c	char       *d = dst;
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
;	.line	1155; MainDemo.c	const char *s = src;
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
;	.line	1156; MainDemo.c	size_t      n = siz;
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
;	.line	1159; MainDemo.c	if (n != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00736_DS_
;	.line	1161; MainDemo.c	while (--n != 0)
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
	MOVFF	r0x06, r0x13
	MOVFF	r0x07, r0x14
_00732_DS_:
	MOVLW	0xff
	ADDWF	r0x13, F
	BTFSS	STATUS, 0
	DECF	r0x14, F
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00751_DS_
;	.line	1163; MainDemo.c	if ((*d++ = *s++) == '\0')
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrget1
	MOVWF	r0x15
	INCF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x15, W
	BNZ	_00732_DS_
_00751_DS_:
;	.line	1164; MainDemo.c	break;
	MOVFF	r0x10, r0x0b
	MOVFF	r0x11, r0x0c
	MOVFF	r0x12, r0x0d
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x13, r0x0e
	MOVFF	r0x14, r0x0f
_00736_DS_:
;	.line	1169; MainDemo.c	if (n == 0)
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	BNZ	_00743_DS_
;	.line	1171; MainDemo.c	if (siz != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00750_DS_
;	.line	1172; MainDemo.c	*d = '\0';          /* NUL-terminate dst */
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
_00750_DS_:
;	.line	1173; MainDemo.c	while (*s++)
	MOVFF	r0x0b, r0x00
	MOVFF	r0x0c, r0x01
	MOVFF	r0x0d, r0x02
_00739_DS_:
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	MOVF	r0x06, W
	BNZ	_00739_DS_
	MOVFF	r0x00, r0x0b
	MOVFF	r0x01, r0x0c
	MOVFF	r0x02, r0x0d
_00743_DS_:
;	.line	1177; MainDemo.c	return (s - src - 1);       /* count does not include NUL */
	MOVF	r0x03, W
	SUBWF	r0x0b, W
	MOVWF	r0x03
	MOVF	r0x04, W
	SUBWFB	r0x0c, W
	MOVWF	r0x04
	MOVLW	0xff
	ADDWF	r0x03, F
	BTFSS	STATUS, 0
	DECF	r0x04, F
	MOVFF	r0x04, PRODL
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x15
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__InitAppConfig	code
_InitAppConfig:
;	.line	1081; MainDemo.c	static void InitAppConfig(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	BANKSEL	(_AppConfig + 44)
;	.line	1083; MainDemo.c	AppConfig.Flags.bIsDHCPEnabled = TRUE;
	BSF	(_AppConfig + 44), 6, B
	BANKSEL	(_AppConfig + 44)
;	.line	1084; MainDemo.c	AppConfig.Flags.bInConfigMode = TRUE;
	BSF	(_AppConfig + 44), 7, B
	BANKSEL	(_AppConfig + 45)
;	.line	1088; MainDemo.c	AppConfig.MyMACAddr.v[0] = 0;
	CLRF	(_AppConfig + 45), B
;	.line	1089; MainDemo.c	AppConfig.MyMACAddr.v[1] = 0x04;
	MOVLW	0x04
	BANKSEL	(_AppConfig + 46)
	MOVWF	(_AppConfig + 46), B
;	.line	1090; MainDemo.c	AppConfig.MyMACAddr.v[2] = 0xA3;
	MOVLW	0xa3
	BANKSEL	(_AppConfig + 47)
	MOVWF	(_AppConfig + 47), B
;	.line	1091; MainDemo.c	AppConfig.MyMACAddr.v[3] = 0x01;
	MOVLW	0x01
	BANKSEL	(_AppConfig + 48)
	MOVWF	(_AppConfig + 48), B
;	.line	1092; MainDemo.c	AppConfig.MyMACAddr.v[4] = 0x02;
	MOVLW	0x02
	BANKSEL	(_AppConfig + 49)
	MOVWF	(_AppConfig + 49), B
;	.line	1093; MainDemo.c	AppConfig.MyMACAddr.v[5] = 0x03;
	MOVLW	0x03
	BANKSEL	(_AppConfig + 50)
	MOVWF	(_AppConfig + 50), B
;	.line	1096; MainDemo.c	AppConfig.MyIPAddr.Val = MY_DEFAULT_IP_ADDR_BYTE1 | 
	MOVLW	0xc0
	BANKSEL	_AppConfig
	MOVWF	_AppConfig, B
	MOVLW	0xa8
	BANKSEL	(_AppConfig + 1)
	MOVWF	(_AppConfig + 1), B
	MOVLW	0x61
	BANKSEL	(_AppConfig + 2)
	MOVWF	(_AppConfig + 2), B
	MOVLW	0x3c
	BANKSEL	(_AppConfig + 3)
	MOVWF	(_AppConfig + 3), B
;	.line	1099; MainDemo.c	AppConfig.DefaultIPAddr.Val = AppConfig.MyIPAddr.Val;
	MOVFF	_AppConfig, r0x00
	MOVFF	(_AppConfig + 1), r0x01
	MOVFF	(_AppConfig + 2), r0x02
	MOVFF	(_AppConfig + 3), r0x03
	MOVF	r0x00, W
	BANKSEL	(_AppConfig + 20)
	MOVWF	(_AppConfig + 20), B
	MOVF	r0x01, W
	BANKSEL	(_AppConfig + 21)
	MOVWF	(_AppConfig + 21), B
	MOVF	r0x02, W
	BANKSEL	(_AppConfig + 22)
	MOVWF	(_AppConfig + 22), B
	MOVF	r0x03, W
	BANKSEL	(_AppConfig + 23)
	MOVWF	(_AppConfig + 23), B
	BANKSEL	(_AppConfig + 4)
;	.line	1100; MainDemo.c	AppConfig.MyMask.Val = MY_DEFAULT_MASK_BYTE1 | 
	SETF	(_AppConfig + 4), B
	BANKSEL	(_AppConfig + 5)
	SETF	(_AppConfig + 5), B
	BANKSEL	(_AppConfig + 6)
	SETF	(_AppConfig + 6), B
	BANKSEL	(_AppConfig + 7)
	CLRF	(_AppConfig + 7), B
;	.line	1103; MainDemo.c	AppConfig.DefaultMask.Val = AppConfig.MyMask.Val;
	MOVFF	(_AppConfig + 4), r0x00
	MOVFF	(_AppConfig + 5), r0x01
	MOVFF	(_AppConfig + 6), r0x02
	MOVFF	(_AppConfig + 7), r0x03
	MOVF	r0x00, W
	BANKSEL	(_AppConfig + 24)
	MOVWF	(_AppConfig + 24), B
	MOVF	r0x01, W
	BANKSEL	(_AppConfig + 25)
	MOVWF	(_AppConfig + 25), B
	MOVF	r0x02, W
	BANKSEL	(_AppConfig + 26)
	MOVWF	(_AppConfig + 26), B
	MOVF	r0x03, W
	BANKSEL	(_AppConfig + 27)
	MOVWF	(_AppConfig + 27), B
;	.line	1104; MainDemo.c	AppConfig.MyGateway.Val = MY_DEFAULT_GATE_BYTE1 | 
	MOVLW	0xc0
	BANKSEL	(_AppConfig + 8)
	MOVWF	(_AppConfig + 8), B
	MOVLW	0xa8
	BANKSEL	(_AppConfig + 9)
	MOVWF	(_AppConfig + 9), B
	MOVLW	0x61
	BANKSEL	(_AppConfig + 10)
	MOVWF	(_AppConfig + 10), B
	MOVLW	0x01
	BANKSEL	(_AppConfig + 11)
	MOVWF	(_AppConfig + 11), B
;	.line	1107; MainDemo.c	AppConfig.PrimaryDNSServer.Val = MY_DEFAULT_PRIMARY_DNS_BYTE1 | 
	MOVLW	0xc0
	BANKSEL	(_AppConfig + 12)
	MOVWF	(_AppConfig + 12), B
	MOVLW	0xa8
	BANKSEL	(_AppConfig + 13)
	MOVWF	(_AppConfig + 13), B
	MOVLW	0x61
	BANKSEL	(_AppConfig + 14)
	MOVWF	(_AppConfig + 14), B
	MOVLW	0x01
	BANKSEL	(_AppConfig + 15)
	MOVWF	(_AppConfig + 15), B
	BANKSEL	(_AppConfig + 16)
;	.line	1111; MainDemo.c	AppConfig.SecondaryDNSServer.Val = MY_DEFAULT_SECONDARY_DNS_BYTE1 | 
	CLRF	(_AppConfig + 16), B
	BANKSEL	(_AppConfig + 17)
	CLRF	(_AppConfig + 17), B
	BANKSEL	(_AppConfig + 18)
	CLRF	(_AppConfig + 18), B
	BANKSEL	(_AppConfig + 19)
	CLRF	(_AppConfig + 19), B
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__InitializeBoard	code
_InitializeBoard:
;	.line	1025; MainDemo.c	static void InitializeBoard(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	1028; MainDemo.c	LED0_TRIS = 0;  //LED0
	BCF	_TRISJbits, 0
;	.line	1029; MainDemo.c	LED1_TRIS = 0;  //LED1
	BCF	_TRISJbits, 1
;	.line	1030; MainDemo.c	LED2_TRIS = 0;  //LED2
	BCF	_TRISJbits, 2
;	.line	1031; MainDemo.c	LED3_TRIS = 0;  //LED_LCD1
	BCF	_TRISGbits, 5
;	.line	1032; MainDemo.c	LED4_TRIS = 0;  //LED_LCD2
	BCF	_TRISGbits, 5
;	.line	1033; MainDemo.c	LED5_TRIS = 0;  //LED5=RELAY1
	BCF	_TRISGbits, 7
;	.line	1034; MainDemo.c	LED6_TRIS = 0;  //LED7=RELAY2
	BCF	_TRISGbits, 6
;	.line	1039; MainDemo.c	LED_PUT(0x00);  //turn off LED0 - LED2
	MOVLW	0xf8
	ANDWF	_LATJ, F
;	.line	1040; MainDemo.c	RELAY_PUT(0x00); //turn relays off to save power
	MOVLW	0x3f
	ANDWF	_LATG, F
;	.line	1046; MainDemo.c	OSCTUNE = 0x40;
	MOVLW	0x40
	MOVWF	_OSCTUNE
;	.line	1053; MainDemo.c	if(OSCCONbits.IDLEN) //IDLEN = 0x80; 0x02 selects the primary clock
	BTFSS	_OSCCONbits, 7
	BRA	_00718_DS_
;	.line	1054; MainDemo.c	OSCCON = 0x82;
	MOVLW	0x82
	MOVWF	_OSCCON
	BRA	_00719_DS_
_00718_DS_:
;	.line	1056; MainDemo.c	OSCCON = 0x02;
	MOVLW	0x02
	MOVWF	_OSCCON
_00719_DS_:
;	.line	1059; MainDemo.c	RCONbits.IPEN = 1;		// Enable interrupt priorities
	BSF	_RCONbits, 7
;	.line	1060; MainDemo.c	INTCONbits.GIEH = 1;
	BSF	_INTCONbits, 7
;	.line	1061; MainDemo.c	INTCONbits.GIEL = 1;
	BSF	_INTCONbits, 6
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__DisplayIPValue	code
_DisplayIPValue:
;	.line	967; MainDemo.c	void DisplayIPValue(DWORD IPdw) // 32 bits
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	975; MainDemo.c	BYTE LCDPos=16;  //write on second line of LCD
	MOVLW	0x10
	MOVWF	r0x04
;	.line	980; MainDemo.c	for(i = 0; i < sizeof(IP_ADDR); i++) //sizeof(IP_ADDR) is 4
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
_00683_DS_:
	MOVLW	0x04
	SUBWF	r0x05, W
	BTFSC	STATUS, 0
	BRA	_00686_DS_
;	.line	983; MainDemo.c	IP_field =(WORD)(IPdw>>(i*8))&0xff;      //ML
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x03, r0x0b
	MOVF	r0x06, W
	BZ	_00704_DS_
	BN	_00707_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00705_DS_:
	RRCF	r0x0b, F
	RRCF	r0x0a, F
	RRCF	r0x09, F
	RRCF	r0x08, F
	ADDLW	0x01
	BNC	_00705_DS_
	BRA	_00704_DS_
_00707_DS_:
	BCF	STATUS, 0
_00706_DS_:
	RLCF	r0x08, F
	RLCF	r0x09, F
	RLCF	r0x0a, F
	RLCF	r0x0b, F
	ADDLW	0x01
	BNC	_00706_DS_
_00704_DS_:
	CLRF	r0x09
;	.line	984; MainDemo.c	uitoa(IP_field, IPDigit, radix);      //ML
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVLW	HIGH(_DisplayIPValue_IPDigit_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_DisplayIPValue_IPDigit_1_1)
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	CALL	_uitoa
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	989; MainDemo.c	for(j = 0; j < strlen((char*)IPDigit); j++)
	MOVFF	r0x04, r0x08
	CLRF	r0x09
_00689_DS_:
	MOVLW	HIGH(_DisplayIPValue_IPDigit_1_1)
	MOVWF	r0x0b
	MOVLW	LOW(_DisplayIPValue_IPDigit_1_1)
	MOVWF	r0x0a
	MOVLW	0x80
	MOVWF	r0x0c
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	r0x09, r0x0c
	CLRF	r0x0d
	MOVF	r0x0d, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x0b, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00709_DS_
	MOVF	r0x0a, W
	SUBWF	r0x0c, W
_00709_DS_:
	BC	_00701_DS_
;	.line	991; MainDemo.c	LCDText[LCDPos++] = IPDigit[j];
	MOVFF	r0x08, r0x0a
	INCF	r0x08, F
	CLRF	r0x0b
	MOVLW	LOW(_LCDText)
	ADDWF	r0x0a, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x0b, F
	MOVLW	LOW(_DisplayIPValue_IPDigit_1_1)
	ADDWF	r0x09, W
	MOVWF	r0x0c
	CLRF	r0x0d
	MOVLW	HIGH(_DisplayIPValue_IPDigit_1_1)
	ADDWFC	r0x0d, F
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, FSR0H
	MOVFF	INDF0, r0x0c
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, FSR0H
	MOVFF	r0x0c, INDF0
;	.line	989; MainDemo.c	for(j = 0; j < strlen((char*)IPDigit); j++)
	INCF	r0x09, F
	BRA	_00689_DS_
_00701_DS_:
	MOVFF	r0x08, r0x04
;	.line	993; MainDemo.c	if(i == sizeof(IP_ADDR)-1)
	MOVF	r0x05, W
	XORLW	0x03
	BZ	_00686_DS_
;	.line	995; MainDemo.c	LCDText[LCDPos++] = '.';
	INCF	r0x08, W
	MOVWF	r0x04
	CLRF	r0x09
	MOVLW	LOW(_LCDText)
	ADDWF	r0x08, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x09, F
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, FSR0H
	MOVLW	0x2e
	MOVWF	INDF0
;	.line	980; MainDemo.c	for(i = 0; i < sizeof(IP_ADDR); i++) //sizeof(IP_ADDR) is 4
	MOVLW	0x08
	ADDWF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	INCF	r0x05, F
	BRA	_00683_DS_
_00686_DS_:
;	.line	998; MainDemo.c	if(LCDPos < 32u)
	MOVFF	r0x04, r0x00
	CLRF	r0x01
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00712_DS_
	MOVLW	0x20
	SUBWF	r0x00, W
_00712_DS_:
	BC	_00688_DS_
;	.line	999; MainDemo.c	LCDText[LCDPos] = 0;
	CLRF	r0x00
	MOVLW	LOW(_LCDText)
	ADDWF	r0x04, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x00, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x00, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00688_DS_:
;	.line	1000; MainDemo.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__DisplayString	code
_DisplayString:
;	.line	951; MainDemo.c	void DisplayString(BYTE pos, char* text)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
;	.line	953; MainDemo.c	BYTE l= strlen(text)+1;
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVLW	0x03
	ADDWF	FSR1L, F
	INCF	r0x04, F
;	.line	954; MainDemo.c	BYTE max= 32-pos;
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	955; MainDemo.c	strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
	CLRF	r0x06
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x06, F
	MOVF	r0x06, W
	MOVWF	r0x06
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x07
	MOVF	r0x05, W
	SUBWF	r0x04, W
	BNC	_00674_DS_
	MOVFF	r0x05, r0x04
_00674_DS_:
	CLRF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_strlcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	956; MainDemo.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__DisplayWORD	code
_DisplayWORD:
;	.line	929; MainDemo.c	void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	937; MainDemo.c	ultoa(w, WDigit, radix);      
	CLRF	r0x03
	CLRF	r0x04
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_ultoa
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	938; MainDemo.c	for(j = 0; j < strlen((char*)WDigit); j++)
	CLRF	r0x01
_00655_DS_:
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_strlen
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	r0x01, r0x04
	CLRF	r0x05
	MOVF	r0x05, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x03, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00665_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00665_DS_:
	BC	_00658_DS_
;	.line	940; MainDemo.c	LCDText[LCDPos++] = WDigit[j];
	MOVFF	r0x00, r0x02
	INCF	r0x00, F
	CLRF	r0x03
	MOVLW	LOW(_LCDText)
	ADDWF	r0x02, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x03, F
	MOVLW	LOW(_DisplayWORD_WDigit_1_1)
	ADDWF	r0x01, W
	MOVWF	r0x04
	CLRF	r0x05
	MOVLW	HIGH(_DisplayWORD_WDigit_1_1)
	ADDWFC	r0x05, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, r0x04
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, INDF0
;	.line	938; MainDemo.c	for(j = 0; j < strlen((char*)WDigit); j++)
	INCF	r0x01, F
	BRA	_00655_DS_
_00658_DS_:
;	.line	942; MainDemo.c	if(LCDPos < 32u)
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00666_DS_
	MOVLW	0x20
	SUBWF	r0x01, W
_00666_DS_:
	BC	_00654_DS_
;	.line	943; MainDemo.c	LCDText[LCDPos] = 0;
	CLRF	r0x01
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00654_DS_:
;	.line	944; MainDemo.c	LCDUpdate();
	CALL	_LCDUpdate
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__doDhcpOperations	code
_doDhcpOperations:
;	.line	841; MainDemo.c	void doDhcpOperations(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
;	.line	850; MainDemo.c	setDhcpIp(&server_ip);
	MOVLW	HIGH(_doDhcpOperations_server_ip_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_doDhcpOperations_server_ip_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_setDhcpIp
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	854; MainDemo.c	send_s_socket = UDPOpen(0, NULL, 67);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x43
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPOpen
	MOVWF	r0x00
	MOVLW	0x07
	ADDWF	FSR1L, F
	MOVFF	r0x00, _doDhcpOperations_send_s_socket_1_1
;	.line	855; MainDemo.c	send_c_socket = UDPOpen(0, NULL, 68);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x44
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPOpen
	MOVWF	r0x01
	MOVLW	0x07
	ADDWF	FSR1L, F
	MOVFF	r0x01, _doDhcpOperations_send_c_socket_1_1
;	.line	856; MainDemo.c	receiver_socket = UDPOpen(67, NULL, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x43
	MOVWF	POSTDEC1
	CALL	_UDPOpen
	MOVWF	r0x02
	MOVLW	0x07
	ADDWF	FSR1L, F
	MOVFF	r0x02, _doDhcpOperations_receiver_socket_1_1
;	.line	858; MainDemo.c	if(send_s_socket == INVALID_UDP_SOCKET ||
	CLRF	r0x03
	MOVF	r0x00, W
	XORLW	0xff
	BNZ	_00633_DS_
	MOVF	r0x03, W
	BZ	_00602_DS_
_00633_DS_:
;	.line	859; MainDemo.c	receiver_socket == INVALID_UDP_SOCKET ||
	CLRF	r0x00
	MOVF	r0x02, W
	XORLW	0xff
	BNZ	_00635_DS_
	MOVF	r0x00, W
	BZ	_00602_DS_
_00635_DS_:
;	.line	860; MainDemo.c	send_c_socket == INVALID_UDP_SOCKET){
	CLRF	r0x00
	MOVF	r0x01, W
	XORLW	0xff
	BNZ	_00636_DS_
	MOVF	r0x00, W
	BZ	_00602_DS_
_00636_DS_:
	BRA	_00603_DS_
_00602_DS_:
;	.line	861; MainDemo.c	DisplayString (0,"Fail to create  socket");
	MOVLW	UPPER(__str_7)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_7)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_7)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	862; MainDemo.c	DelayMs(900);
	MOVLW	0x90
	MOVWF	r0x00
	MOVLW	0x58
	MOVWF	r0x01
	MOVLW	0x06
	MOVWF	r0x02
	CLRF	r0x03
_00596_DS_:
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVLW	0xff
	ADDWF	r0x00, F
	MOVLW	0xff
	ADDWFC	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	BNZ	_00596_DS_
;	.line	863; MainDemo.c	return;
	BRA	_00620_DS_
_00603_DS_:
;	.line	866; MainDemo.c	DisplayString (0,"Entering Task Cycle"); // debugging
	MOVLW	UPPER(__str_8)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_8)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_8)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	867; MainDemo.c	DelayMs(900);
	MOVLW	0x90
	MOVWF	r0x00
	MOVLW	0x58
	MOVWF	r0x01
	MOVLW	0x06
	MOVWF	r0x02
	CLRF	r0x03
_00606_DS_:
	MOVFF	r0x00, r0x04
	MOVFF	r0x01, r0x05
	MOVFF	r0x02, r0x06
	MOVFF	r0x03, r0x07
	MOVLW	0xff
	ADDWF	r0x00, F
	MOVLW	0xff
	ADDWFC	r0x01, F
	MOVLW	0xff
	ADDWFC	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	IORWF	r0x07, W
	BNZ	_00606_DS_
_00618_DS_:
;	.line	869; MainDemo.c	StackTaskModified(&ip_last_pckt);       
	MOVLW	HIGH(_doDhcpOperations_ip_last_pckt_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_doDhcpOperations_ip_last_pckt_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_StackTaskModified
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	870; MainDemo.c	timeCheck(&send_s_socket);
	MOVLW	HIGH(_doDhcpOperations_send_s_socket_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_doDhcpOperations_send_s_socket_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_timeCheck
	MOVLW	0x03
	ADDWF	FSR1L, F
	BANKSEL	_doDhcpOperations_receiver_socket_1_1
;	.line	872; MainDemo.c	if(counter = UDPIsGetReady(receiver_socket)){
	MOVF	_doDhcpOperations_receiver_socket_1_1, W, B
	MOVWF	POSTDEC1
	CALL	_UDPIsGetReady
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	INCF	FSR1L, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_00618_DS_
;	.line	873; MainDemo.c	if(ip_cmp(&ip_last_pckt, &server_ip)){ // Check si on peut pas voir avec l'OP code
	MOVLW	HIGH(_doDhcpOperations_ip_last_pckt_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_doDhcpOperations_ip_last_pckt_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_doDhcpOperations_server_ip_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_doDhcpOperations_server_ip_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_ip_cmp
	MOVWF	r0x00
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BZ	_00613_DS_
;	.line	874; MainDemo.c	rcvdFromServer(&send_c_socket, &receiver_socket);
	MOVLW	HIGH(_doDhcpOperations_send_c_socket_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_doDhcpOperations_send_c_socket_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_doDhcpOperations_receiver_socket_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_doDhcpOperations_receiver_socket_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_rcvdFromServer
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_00618_DS_
_00613_DS_:
;	.line	877; MainDemo.c	rcvdFromClient(&send_s_socket, &send_c_socket, &receiver_socket);
	MOVLW	HIGH(_doDhcpOperations_send_s_socket_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_doDhcpOperations_send_s_socket_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_doDhcpOperations_send_c_socket_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_doDhcpOperations_send_c_socket_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_doDhcpOperations_receiver_socket_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_doDhcpOperations_receiver_socket_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_rcvdFromClient
	MOVLW	0x09
	ADDWF	FSR1L, F
	BRA	_00618_DS_
_00620_DS_:
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__timeCheck	code
_timeCheck:
;	.line	819; MainDemo.c	void timeCheck(UDP_SOCKET *send_s_socket){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	823; MainDemo.c	current = TickConvertToMilliseconds(TickGet());
	CALL	_TickGet
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
	MOVFF	FSR0L, r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_TickConvertToMilliseconds
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
	MOVFF	FSR0L, r0x06
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	_timeCheck_previous_1_1
;	.line	825; MainDemo.c	if (current-previous >= 1000 || current < previous) {
	MOVF	_timeCheck_previous_1_1, W, B
	SUBWF	r0x03, W
	MOVWF	r0x07
	BANKSEL	(_timeCheck_previous_1_1 + 1)
	MOVF	(_timeCheck_previous_1_1 + 1), W, B
	SUBWFB	r0x04, W
	MOVWF	r0x08
	BANKSEL	(_timeCheck_previous_1_1 + 2)
	MOVF	(_timeCheck_previous_1_1 + 2), W, B
	SUBWFB	r0x05, W
	MOVWF	r0x09
	BANKSEL	(_timeCheck_previous_1_1 + 3)
	MOVF	(_timeCheck_previous_1_1 + 3), W, B
	SUBWFB	r0x06, W
	MOVWF	r0x0a
	MOVLW	0x00
	SUBWF	r0x0a, W
	BNZ	_00590_DS_
	MOVLW	0x00
	SUBWF	r0x09, W
	BNZ	_00590_DS_
	MOVLW	0x03
	SUBWF	r0x08, W
	BNZ	_00590_DS_
	MOVLW	0xe8
	SUBWF	r0x07, W
_00590_DS_:
	BC	_00583_DS_
	BANKSEL	(_timeCheck_previous_1_1 + 3)
	MOVF	(_timeCheck_previous_1_1 + 3), W, B
	SUBWF	r0x06, W
	BNZ	_00591_DS_
	BANKSEL	(_timeCheck_previous_1_1 + 2)
	MOVF	(_timeCheck_previous_1_1 + 2), W, B
	SUBWF	r0x05, W
	BNZ	_00591_DS_
	BANKSEL	(_timeCheck_previous_1_1 + 1)
	MOVF	(_timeCheck_previous_1_1 + 1), W, B
	SUBWF	r0x04, W
	BNZ	_00591_DS_
	BANKSEL	_timeCheck_previous_1_1
	MOVF	_timeCheck_previous_1_1, W, B
	SUBWF	r0x03, W
_00591_DS_:
	BTFSC	STATUS, 0
	BRA	_00586_DS_
_00583_DS_:
;	.line	826; MainDemo.c	previous += 1000;
	MOVLW	0xe8
	BANKSEL	_timeCheck_previous_1_1
	ADDWF	_timeCheck_previous_1_1, F, B
	MOVLW	0x03
	BANKSEL	(_timeCheck_previous_1_1 + 1)
	ADDWFC	(_timeCheck_previous_1_1 + 1), F, B
	MOVLW	0x00
	BANKSEL	(_timeCheck_previous_1_1 + 2)
	ADDWFC	(_timeCheck_previous_1_1 + 2), F, B
	MOVLW	0x00
	BANKSEL	(_timeCheck_previous_1_1 + 3)
	ADDWFC	(_timeCheck_previous_1_1 + 3), F, B
	BANKSEL	_timeCheck_counter_1_1
;	.line	827; MainDemo.c	counter++;
	INCF	_timeCheck_counter_1_1, F, B
	BNC	_10730_DS_
	BANKSEL	(_timeCheck_counter_1_1 + 1)
	INCF	(_timeCheck_counter_1_1 + 1), F, B
_10730_DS_:
	BNC	_20731_DS_
	BANKSEL	(_timeCheck_counter_1_1 + 2)
	INCF	(_timeCheck_counter_1_1 + 2), F, B
_20731_DS_:
	BNC	_30732_DS_
	BANKSEL	(_timeCheck_counter_1_1 + 3)
	INCF	(_timeCheck_counter_1_1 + 3), F, B
_30732_DS_:
;	.line	828; MainDemo.c	if(counter%OVERFLOW_TIME == 0){
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x3d
	MOVWF	POSTDEC1
	BANKSEL	(_timeCheck_counter_1_1 + 3)
	MOVF	(_timeCheck_counter_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_timeCheck_counter_1_1 + 2)
	MOVF	(_timeCheck_counter_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_timeCheck_counter_1_1 + 1)
	MOVF	(_timeCheck_counter_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_timeCheck_counter_1_1
	MOVF	_timeCheck_counter_1_1, W, B
	MOVWF	POSTDEC1
	CALL	__modulong
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
	MOVFF	FSR0L, r0x06
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x03, W
	IORWF	r0x04, W
	IORWF	r0x05, W
	IORWF	r0x06, W
	BNZ	_00586_DS_
;	.line	829; MainDemo.c	leaseTimeCheck(send_s_socket);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_leaseTimeCheck
	MOVLW	0x03
	ADDWF	FSR1L, F
	BANKSEL	_timeCheck_counter_1_1
;	.line	830; MainDemo.c	counter = 0;
	CLRF	_timeCheck_counter_1_1, B
	BANKSEL	(_timeCheck_counter_1_1 + 1)
	CLRF	(_timeCheck_counter_1_1 + 1), B
	BANKSEL	(_timeCheck_counter_1_1 + 2)
	CLRF	(_timeCheck_counter_1_1 + 2), B
	BANKSEL	(_timeCheck_counter_1_1 + 3)
	CLRF	(_timeCheck_counter_1_1 + 3), B
_00586_DS_:
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__leaseTimeCheck	code
_leaseTimeCheck:
;	.line	786; MainDemo.c	void leaseTimeCheck(UDP_SOCKET *send_s_socket){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	788; MainDemo.c	for(i=0; i<MAX_CLIENT; i++){
	CLRF	r0x03
	CLRF	r0x04
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
	CLRF	r0x08
_00558_DS_:
	MOVF	r0x04, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00572_DS_
	MOVLW	0x0a
	SUBWF	r0x03, W
_00572_DS_:
	BTFSC	STATUS, 0
	BRA	_00562_DS_
;	.line	789; MainDemo.c	if(!isPoolItemUsed(&pool[i])){
	MOVLW	LOW(_pool)
	ADDWF	r0x07, W
	MOVWF	r0x09
	MOVLW	HIGH(_pool)
	ADDWFC	r0x08, W
	MOVWF	r0x0a
	MOVF	r0x0a, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_isPoolItemUsed
	MOVWF	r0x09
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x09, W
	BTFSS	STATUS, 2
	BRA	_00560_DS_
;	.line	791; MainDemo.c	if(pool[i].server_leasetime < 60)
	MOVLW	LOW(_pool)
	ADDWF	r0x07, W
	MOVWF	r0x09
	MOVLW	HIGH(_pool)
	ADDWFC	r0x08, W
	MOVWF	r0x0a
	MOVLW	0x10
	ADDWF	r0x09, F
	BTFSC	STATUS, 0
	INCF	r0x0a, F
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, FSR0H
	MOVFF	POSTINC0, r0x0b
	MOVFF	POSTINC0, r0x0c
	MOVFF	POSTINC0, r0x0d
	MOVFF	INDF0, r0x0e
	MOVLW	0x00
	SUBWF	r0x0e, W
	BNZ	_00573_DS_
	MOVLW	0x00
	SUBWF	r0x0d, W
	BNZ	_00573_DS_
	MOVLW	0x00
	SUBWF	r0x0c, W
	BNZ	_00573_DS_
	MOVLW	0x3c
	SUBWF	r0x0b, W
_00573_DS_:
	BC	_00547_DS_
;	.line	792; MainDemo.c	pool[i].server_leasetime = 0;
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
	BRA	_00548_DS_
_00547_DS_:
;	.line	793; MainDemo.c	else pool[i].server_leasetime -= 60;
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, FSR0H
	MOVFF	POSTINC0, r0x0b
	MOVFF	POSTINC0, r0x0c
	MOVFF	POSTINC0, r0x0d
	MOVFF	INDF0, r0x0e
	MOVLW	0xc4
	ADDWF	r0x0b, F
	MOVLW	0xff
	ADDWFC	r0x0c, F
	MOVLW	0xff
	ADDWFC	r0x0d, F
	MOVLW	0xff
	ADDWFC	r0x0e, F
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, FSR0H
	MOVFF	r0x0b, POSTINC0
	MOVFF	r0x0c, POSTINC0
	MOVFF	r0x0d, POSTINC0
	MOVFF	r0x0e, INDF0
_00548_DS_:
;	.line	795; MainDemo.c	if(pool[i].client_leasetime <= 60){
	MOVLW	LOW(_pool)
	ADDWF	r0x05, W
	MOVWF	r0x09
	MOVLW	HIGH(_pool)
	ADDWFC	r0x06, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	ADDLW	0x0c
	MOVWF	r0x0b
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x0c
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, FSR0H
	MOVFF	POSTINC0, r0x0d
	MOVFF	POSTINC0, r0x0e
	MOVFF	POSTINC0, r0x0f
	MOVFF	INDF0, r0x10
	MOVLW	0x00
	SUBWF	r0x10, W
	BNZ	_00574_DS_
	MOVLW	0x00
	SUBWF	r0x0f, W
	BNZ	_00574_DS_
	MOVLW	0x00
	SUBWF	r0x0e, W
	BNZ	_00574_DS_
	MOVLW	0x3d
	SUBWF	r0x0d, W
_00574_DS_:
	BTFSC	STATUS, 0
	BRA	_00552_DS_
;	.line	796; MainDemo.c	pool[i].terms_missed++;
	MOVF	r0x09, W
	ADDLW	0x0a
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x0e
	MOVFF	r0x0d, FSR0L
	MOVFF	r0x0e, FSR0H
	MOVFF	POSTINC0, r0x0f
	MOVFF	INDF0, r0x10
	INCF	r0x0f, F
	BTFSC	STATUS, 0
	INCF	r0x10, F
	MOVFF	r0x0d, FSR0L
	MOVFF	r0x0e, FSR0H
	MOVFF	r0x0f, POSTINC0
	MOVFF	r0x10, INDF0
;	.line	797; MainDemo.c	pool[i].client_leasetime = CLIENT_LEASE_TIME;
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, FSR0H
	MOVLW	0x2c
	MOVWF	POSTINC0
	MOVLW	0x01
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	799; MainDemo.c	if(pool[i].terms_missed >= 5){
	MOVLW	0x00
	SUBWF	r0x10, W
	BNZ	_00575_DS_
	MOVLW	0x05
	SUBWF	r0x0f, W
_00575_DS_:
	BNC	_00553_DS_
;	.line	801; MainDemo.c	sendRelease(send_s_socket, &pool[i]); // TODO
	MOVF	r0x0a, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0d
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sendRelease
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	802; MainDemo.c	continue; 
	BRA	_00560_DS_
_00552_DS_:
;	.line	805; MainDemo.c	else pool[i].client_leasetime -= 60;            
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, FSR0H
	MOVFF	POSTINC0, r0x09
	MOVFF	POSTINC0, r0x0a
	MOVFF	POSTINC0, r0x0d
	MOVFF	INDF0, r0x0e
	MOVLW	0xc4
	ADDWF	r0x09, F
	MOVLW	0xff
	ADDWFC	r0x0a, F
	MOVLW	0xff
	ADDWFC	r0x0d, F
	MOVLW	0xff
	ADDWFC	r0x0e, F
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, FSR0H
	MOVFF	r0x09, POSTINC0
	MOVFF	r0x0a, POSTINC0
	MOVFF	r0x0d, POSTINC0
	MOVFF	r0x0e, INDF0
_00553_DS_:
;	.line	806; MainDemo.c	if(pool[i].server_leasetime <= SERVER_LEASE_TIME){
	MOVLW	LOW(_pool)
	ADDWF	r0x05, W
	MOVWF	r0x09
	MOVLW	HIGH(_pool)
	ADDWFC	r0x06, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	ADDLW	0x10
	MOVWF	r0x0b
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x0c
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, FSR0H
	MOVFF	POSTINC0, r0x0b
	MOVFF	POSTINC0, r0x0c
	MOVFF	POSTINC0, r0x0d
	MOVFF	INDF0, r0x0e
	MOVLW	0x00
	SUBWF	r0x0e, W
	BNZ	_00576_DS_
	MOVLW	0x00
	SUBWF	r0x0d, W
	BNZ	_00576_DS_
	MOVLW	0x01
	SUBWF	r0x0c, W
	BNZ	_00576_DS_
	MOVLW	0x2d
	SUBWF	r0x0b, W
_00576_DS_:
	BC	_00560_DS_
;	.line	807; MainDemo.c	sendRequest(send_s_socket, &pool[i]);       // TODO
	MOVF	r0x0a, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sendRequest
	MOVLW	0x06
	ADDWF	FSR1L, F
_00560_DS_:
;	.line	788; MainDemo.c	for(i=0; i<MAX_CLIENT; i++){
	MOVLW	0x14
	ADDWF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	MOVLW	0x14
	ADDWF	r0x07, F
	BTFSC	STATUS, 0
	INCF	r0x08, F
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BRA	_00558_DS_
_00562_DS_:
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__findInPool	code
_findInPool:
;	.line	774; MainDemo.c	BOOL findInPool(POOL_ITEM **it, MAC_ADDR *mac){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
;	.line	776; MainDemo.c	for(i=0; i<MAX_CLIENT; i++){
	CLRF	r0x06
	CLRF	r0x07
	CLRF	r0x08
	CLRF	r0x09
_00532_DS_:
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00541_DS_
	MOVLW	0x0a
	SUBWF	r0x06, W
_00541_DS_:
	BTFSC	STATUS, 0
	BRA	_00535_DS_
;	.line	777; MainDemo.c	if(mac_cmp(mac, &pool[i].mac)){
	MOVLW	LOW(_pool)
	ADDWF	r0x08, W
	MOVWF	r0x0a
	MOVLW	HIGH(_pool)
	ADDWFC	r0x09, W
	MOVWF	r0x0b
	MOVLW	0x04
	ADDWF	r0x0a, F
	BTFSC	STATUS, 0
	INCF	r0x0b, F
	MOVF	r0x0b, W
	MOVWF	r0x0b
	MOVF	r0x0a, W
	MOVWF	r0x0a
	MOVLW	0x80
	MOVWF	r0x0c
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_mac_cmp
	MOVWF	r0x0a
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x0a, W
	BZ	_00534_DS_
;	.line	778; MainDemo.c	*it = &pool[i];
	MOVLW	LOW(_pool)
	ADDWF	r0x08, W
	MOVWF	r0x0a
	MOVLW	HIGH(_pool)
	ADDWFC	r0x09, W
	MOVWF	r0x0b
	MOVF	r0x0b, W
	MOVWF	r0x0b
	MOVF	r0x0a, W
	MOVWF	r0x0a
	MOVLW	0x80
	MOVWF	r0x0c
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, PRODH
	MOVFF	r0x0c, TBLPTRL
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput3
;	.line	779; MainDemo.c	return TRUE;
	MOVLW	0x01
	BRA	_00536_DS_
_00534_DS_:
;	.line	776; MainDemo.c	for(i=0; i<MAX_CLIENT; i++){
	MOVLW	0x14
	ADDWF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00532_DS_
_00535_DS_:
;	.line	782; MainDemo.c	return FALSE;
	CLRF	WREG
_00536_DS_:
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__isPoolItemUsed	code
_isPoolItemUsed:
;	.line	764; MainDemo.c	BOOL isPoolItemUsed(POOL_ITEM *it){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	766; MainDemo.c	for(i=0; i<6; i++){
	MOVLW	0x04
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	CLRF	r0x03
	CLRF	r0x04
_00516_DS_:
	MOVF	r0x04, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00525_DS_
	MOVLW	0x06
	SUBWF	r0x03, W
_00525_DS_:
	BC	_00519_DS_
;	.line	767; MainDemo.c	if(it->mac.v[i] != 0){
	MOVF	r0x03, W
	ADDWF	r0x00, W
	MOVWF	r0x05
	MOVF	r0x04, W
	ADDWFC	r0x01, W
	MOVWF	r0x06
	CLRF	WREG
	BTFSC	r0x04, 7
	SETF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x05
	MOVF	r0x05, W
	BZ	_00518_DS_
;	.line	768; MainDemo.c	return FALSE;
	CLRF	WREG
	BRA	_00520_DS_
_00518_DS_:
;	.line	766; MainDemo.c	for(i=0; i<6; i++){
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BRA	_00516_DS_
_00519_DS_:
;	.line	771; MainDemo.c	return TRUE;
	MOVLW	0x01
_00520_DS_:
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__addItem	code
_addItem:
;	.line	747; MainDemo.c	BOOL addItem(IP_ADDR *ip, MAC_ADDR *mac, DWORD leasetime, unsigned int terms_missed_tmp){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x09
	MOVLW	0x0c
	MOVFF	PLUSW2, r0x0a
	MOVLW	0x0d
	MOVFF	PLUSW2, r0x0b
;	.line	749; MainDemo.c	for(i=0; i<MAX_CLIENT; i++){
	CLRF	r0x0c
	CLRF	r0x0d
	CLRF	r0x0e
	CLRF	r0x0f
_00500_DS_:
	MOVF	r0x0d, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00509_DS_
	MOVLW	0x0a
	SUBWF	r0x0c, W
_00509_DS_:
	BTFSC	STATUS, 0
	BRA	_00503_DS_
;	.line	750; MainDemo.c	if(isPoolItemUsed(&pool[i])){
	MOVLW	LOW(_pool)
	ADDWF	r0x0e, W
	MOVWF	r0x10
	MOVLW	HIGH(_pool)
	ADDWFC	r0x0f, W
	MOVWF	r0x11
	MOVF	r0x11, W
	MOVWF	r0x11
	MOVF	r0x10, W
	MOVWF	r0x10
	MOVLW	0x80
	MOVWF	r0x12
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	CALL	_isPoolItemUsed
	MOVWF	r0x10
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x10, W
	BTFSC	STATUS, 2
	BRA	_00502_DS_
;	.line	751; MainDemo.c	memcpy(pool[i].ip.v, ip->v, sizeof(IP_ADDR));
	MOVLW	LOW(_pool)
	ADDWF	r0x0e, W
	MOVWF	r0x10
	MOVLW	HIGH(_pool)
	ADDWFC	r0x0f, W
	MOVWF	r0x11
	MOVF	r0x11, W
	MOVWF	r0x11
	MOVF	r0x10, W
	MOVWF	r0x10
	MOVLW	0x80
	MOVWF	r0x12
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	752; MainDemo.c	memcpy(pool[i].mac.v, mac->v, sizeof(MAC_ADDR));
	MOVLW	LOW(_pool)
	ADDWF	r0x0e, W
	MOVWF	r0x10
	MOVLW	HIGH(_pool)
	ADDWFC	r0x0f, W
	MOVWF	r0x11
	MOVLW	0x04
	ADDWF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	MOVF	r0x11, W
	MOVWF	r0x11
	MOVF	r0x10, W
	MOVWF	r0x10
	MOVLW	0x80
	MOVWF	r0x12
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	753; MainDemo.c	pool[i].client_leasetime = CLIENT_LEASE_TIME;
	MOVLW	LOW(_pool)
	ADDWF	r0x0e, W
	MOVWF	r0x10
	MOVLW	HIGH(_pool)
	ADDWFC	r0x0f, W
	MOVWF	r0x11
	MOVF	r0x10, W
	ADDLW	0x0c
	MOVWF	r0x12
	MOVLW	0x00
	ADDWFC	r0x11, W
	MOVWF	r0x13
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, FSR0H
	MOVLW	0x2c
	MOVWF	POSTINC0
	MOVLW	0x01
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	754; MainDemo.c	pool[i].server_leasetime = leasetime;
	MOVF	r0x10, W
	ADDLW	0x10
	MOVWF	r0x12
	MOVLW	0x00
	ADDWFC	r0x11, W
	MOVWF	r0x13
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, FSR0H
	MOVFF	r0x06, POSTINC0
	MOVFF	r0x07, POSTINC0
	MOVFF	r0x08, POSTINC0
	MOVFF	r0x09, INDF0
;	.line	755; MainDemo.c	pool[i].terms_missed = terms_missed_tmp;
	MOVLW	0x0a
	ADDWF	r0x10, F
	BTFSC	STATUS, 0
	INCF	r0x11, F
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, FSR0H
	MOVFF	r0x0a, POSTINC0
	MOVFF	r0x0b, INDF0
;	.line	756; MainDemo.c	return TRUE;
	MOVLW	0x01
	BRA	_00504_DS_
_00502_DS_:
;	.line	749; MainDemo.c	for(i=0; i<MAX_CLIENT; i++){
	MOVLW	0x14
	ADDWF	r0x0e, F
	BTFSC	STATUS, 0
	INCF	r0x0f, F
	INCF	r0x0c, F
	BTFSC	STATUS, 0
	INCF	r0x0d, F
	BRA	_00500_DS_
_00503_DS_:
;	.line	759; MainDemo.c	return FALSE;
	CLRF	WREG
_00504_DS_:
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__initializeItem	code
_initializeItem:
;	.line	732; MainDemo.c	void initializeItem(POOL_ITEM *p){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	734; MainDemo.c	for(j=0; j<4; j++){
	CLRF	r0x03
	CLRF	r0x04
_00476_DS_:
	MOVF	r0x04, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00492_DS_
	MOVLW	0x04
	SUBWF	r0x03, W
_00492_DS_:
	BC	_00479_DS_
;	.line	735; MainDemo.c	p->ip.v[j] = 0;
	MOVF	r0x03, W
	ADDWF	r0x00, W
	MOVWF	r0x05
	MOVF	r0x04, W
	ADDWFC	r0x01, W
	MOVWF	r0x06
	CLRF	WREG
	BTFSC	r0x04, 7
	SETF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
;	.line	734; MainDemo.c	for(j=0; j<4; j++){
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BRA	_00476_DS_
_00479_DS_:
;	.line	739; MainDemo.c	for(j=0; j<6; j++){
	MOVF	r0x00, W
	ADDLW	0x04
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	CLRF	r0x06
	CLRF	r0x07
_00480_DS_:
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00493_DS_
	MOVLW	0x06
	SUBWF	r0x06, W
_00493_DS_:
	BC	_00483_DS_
;	.line	740; MainDemo.c	p->mac.v[j] = 0;
	MOVF	r0x06, W
	ADDWF	r0x03, W
	MOVWF	r0x08
	MOVF	r0x07, W
	ADDWFC	r0x04, W
	MOVWF	r0x09
	CLRF	WREG
	BTFSC	r0x07, 7
	SETF	WREG
	ADDWFC	r0x05, W
	MOVWF	r0x0a
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
;	.line	739; MainDemo.c	for(j=0; j<6; j++){
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00480_DS_
_00483_DS_:
;	.line	742; MainDemo.c	p->terms_missed = 0;
	MOVF	r0x00, W
	ADDLW	0x0a
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	743; MainDemo.c	p->client_leasetime = 0;
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVLW	0x00
	MOVWF	TBLPTRH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput4
;	.line	744; MainDemo.c	p->server_leasetime = 0;
	MOVLW	0x10
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVLW	0x00
	MOVWF	TBLPTRH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput4
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__initializeClientDB	code
_initializeClientDB:
;	.line	724; MainDemo.c	void initializeClientDB(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
;	.line	726; MainDemo.c	for(i=0; i<MAX_CLIENT; i++){
	CLRF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00462_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00471_DS_
	MOVLW	0x0a
	SUBWF	r0x00, W
_00471_DS_:
	BC	_00466_DS_
;	.line	727; MainDemo.c	initializeItem(&pool[i]);
	MOVLW	LOW(_pool)
	ADDWF	r0x02, W
	MOVWF	r0x04
	MOVLW	HIGH(_pool)
	ADDWFC	r0x03, W
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	r0x05
	MOVF	r0x04, W
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_initializeItem
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	726; MainDemo.c	for(i=0; i<MAX_CLIENT; i++){
	MOVLW	0x14
	ADDWF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00462_DS_
_00466_DS_:
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__getLeaseFromAck	code
_getLeaseFromAck:
;	.line	698; MainDemo.c	BOOL getLeaseFromAck(DWORD *lease_time, BYTE *dhcp_header, unsigned int dhcp_header_length){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
;	.line	701; MainDemo.c	i=0;
	CLRF	r0x08
	CLRF	r0x09
_00447_DS_:
;	.line	703; MainDemo.c	while(i<dhcp_header_length){
	MOVFF	r0x08, r0x0a
	MOVFF	r0x09, r0x0b
	MOVF	r0x07, W
	SUBWF	r0x0b, W
	BNZ	_00455_DS_
	MOVF	r0x06, W
	SUBWF	r0x0a, W
_00455_DS_:
	BTFSC	STATUS, 0
	BRA	_00449_DS_
;	.line	704; MainDemo.c	opt = dhcp_header[i];
	MOVF	r0x08, W
	ADDWF	r0x03, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	ADDWFC	r0x04, W
	MOVWF	r0x0b
	CLRF	WREG
	BTFSC	r0x09, 7
	SETF	WREG
	ADDWFC	r0x05, W
	MOVWF	r0x0c
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrget1
	MOVWF	r0x0a
;	.line	705; MainDemo.c	i++;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	706; MainDemo.c	length = dhcp_header[i];
	MOVF	r0x08, W
	ADDWF	r0x03, W
	MOVWF	r0x0b
	MOVF	r0x09, W
	ADDWFC	r0x04, W
	MOVWF	r0x0c
	CLRF	WREG
	BTFSC	r0x09, 7
	SETF	WREG
	ADDWFC	r0x05, W
	MOVWF	r0x0d
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget1
	MOVWF	r0x0b
;	.line	707; MainDemo.c	i++;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	709; MainDemo.c	if(opt == DHCP_IP_LEASE_TIME){
	CLRF	r0x0c
	MOVF	r0x0a, W
	XORLW	0x33
	BNZ	_00456_DS_
	MOVF	r0x0c, W
	BZ	_00457_DS_
_00456_DS_:
	BRA	_00446_DS_
_00457_DS_:
;	.line	710; MainDemo.c	*lease_time = dhcp_header[i+3]|dhcp_header[i+2]<<8|dhcp_header[i+1]<<16|dhcp_header[i]<<24;
	MOVF	r0x08, W
	ADDLW	0x03
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x0c
	CLRF	r0x0d
	BTFSC	r0x0c, 7
	SETF	r0x0d
	MOVF	r0x03, W
	ADDWF	r0x0a, F
	MOVF	r0x04, W
	ADDWFC	r0x0c, F
	MOVF	r0x05, W
	ADDWFC	r0x0d, F
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget1
	MOVWF	r0x0a
	MOVF	r0x08, W
	ADDLW	0x02
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x0d
	CLRF	r0x0e
	BTFSC	r0x0d, 7
	SETF	r0x0e
	MOVF	r0x03, W
	ADDWF	r0x0c, F
	MOVF	r0x04, W
	ADDWFC	r0x0d, F
	MOVF	r0x05, W
	ADDWFC	r0x0e, F
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrget1
	MOVWF	r0x0c
	CLRF	r0x0d
	MOVF	r0x0c, W
	MOVWF	r0x0f
	CLRF	r0x0e
	CLRF	r0x10
	MOVF	r0x0a, W
	IORWF	r0x0e, F
	MOVF	r0x10, W
	IORWF	r0x0f, F
	CLRF	WREG
	BTFSC	r0x0f, 7
	MOVLW	0xff
	MOVWF	r0x0a
	MOVWF	r0x0c
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, PRODH
	MOVFF	r0x0a, TBLPTRL
	MOVFF	r0x0c, TBLPTRH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput4
;	.line	711; MainDemo.c	return TRUE;
	MOVLW	0x01
	BRA	_00450_DS_
_00446_DS_:
;	.line	713; MainDemo.c	i+=length;
	CLRF	r0x0a
	MOVF	r0x0b, W
	ADDWF	r0x08, F
	MOVF	r0x0a, W
	ADDWFC	r0x09, F
	BRA	_00447_DS_
_00449_DS_:
;	.line	715; MainDemo.c	return FALSE;    
	CLRF	WREG
_00450_DS_:
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__extractBootProtHeader	code
_extractBootProtHeader:
;	.line	650; MainDemo.c	BOOL extractBootProtHeader(BYTE *dhcp_type, BOOTP_HEADER *bootp_header,
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x09
	MOVLW	0x0c
	MOVFF	PLUSW2, r0x0a
	MOVLW	0x0d
	MOVFF	PLUSW2, r0x0b
	MOVLW	0x0e
	MOVFF	PLUSW2, r0x0c
	MOVLW	0x0f
	MOVFF	PLUSW2, r0x0d
	MOVLW	0x10
	MOVFF	PLUSW2, r0x0e
_00395_DS_:
;	.line	662; MainDemo.c	while(!UDPIsGetReady(*receiver_socket));
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrget1
	MOVWF	r0x0f
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	CALL	_UDPIsGetReady
	MOVWF	r0x0f
	MOVFF	PRODL, r0x10
	INCF	FSR1L, F
	MOVF	r0x0f, W
	IORWF	r0x10, W
	BZ	_00395_DS_
;	.line	664; MainDemo.c	UDPGetArray((BYTE*)bootp_header, sizeof(BOOTP_HEADER)); //Read 34bytes
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x22
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPGetArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	666; MainDemo.c	if(bootp_header->HardwareType != 1 || bootp_header->HardwareLen != 6){
	MOVF	r0x03, W
	ADDLW	0x01
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x0e
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrget1
	MOVWF	r0x0c
	MOVF	r0x0c, W
	XORLW	0x01
	BNZ	_00398_DS_
	MOVLW	0x02
	ADDWF	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVF	r0x03, W
	XORLW	0x06
	BZ	_00422_DS_
_00398_DS_:
;	.line	667; MainDemo.c	return FALSE;
	CLRF	WREG
	BRA	_00416_DS_
_00422_DS_:
;	.line	671; MainDemo.c	for(i=0; i<skip_length; i++){
	CLRF	r0x03
	CLRF	r0x04
_00412_DS_:
	MOVLW	0x00
	SUBWF	r0x04, W
	BNZ	_00434_DS_
	MOVLW	0xca
	SUBWF	r0x03, W
_00434_DS_:
	BC	_00415_DS_
;	.line	672; MainDemo.c	UDPGet(&opt);
	MOVLW	HIGH(_extractBootProtHeader_opt_1_1)
	MOVWF	r0x0c
	MOVLW	LOW(_extractBootProtHeader_opt_1_1)
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x0d
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_UDPGet
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	671; MainDemo.c	for(i=0; i<skip_length; i++){
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BRA	_00412_DS_
_00415_DS_:
;	.line	675; MainDemo.c	UDPGetArray((BYTE*)&cookie_checker, sizeof(DWORD));
	MOVLW	HIGH(_extractBootProtHeader_cookie_checker_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_extractBootProtHeader_cookie_checker_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPGetArray
	MOVLW	0x05
	ADDWF	FSR1L, F
	BANKSEL	_extractBootProtHeader_cookie_checker_1_1
;	.line	676; MainDemo.c	if(cookie_checker != MAGIC_COOKIE){
	MOVF	_extractBootProtHeader_cookie_checker_1_1, W, B
	BANKSEL	_MAGIC_COOKIE
	XORWF	_MAGIC_COOKIE, W, B
	BNZ	_00436_DS_
	BANKSEL	(_extractBootProtHeader_cookie_checker_1_1 + 1)
	MOVF	(_extractBootProtHeader_cookie_checker_1_1 + 1), W, B
	BANKSEL	(_MAGIC_COOKIE + 1)
	XORWF	(_MAGIC_COOKIE + 1), W, B
	BNZ	_00436_DS_
	BANKSEL	(_extractBootProtHeader_cookie_checker_1_1 + 2)
	MOVF	(_extractBootProtHeader_cookie_checker_1_1 + 2), W, B
	BANKSEL	(_MAGIC_COOKIE + 2)
	XORWF	(_MAGIC_COOKIE + 2), W, B
	BNZ	_00436_DS_
	BANKSEL	(_extractBootProtHeader_cookie_checker_1_1 + 3)
	MOVF	(_extractBootProtHeader_cookie_checker_1_1 + 3), W, B
	BANKSEL	(_MAGIC_COOKIE + 3)
	XORWF	(_MAGIC_COOKIE + 3), W, B
	BZ	_00402_DS_
_00436_DS_:
;	.line	677; MainDemo.c	return FALSE;
	CLRF	WREG
	BRA	_00416_DS_
_00402_DS_:
;	.line	680; MainDemo.c	*dhcp_header_length = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput2
;	.line	681; MainDemo.c	wrong_packet = TRUE;
	MOVLW	0x01
	MOVWF	r0x03
_00409_DS_:
;	.line	682; MainDemo.c	while(UDPGet(&opt) && opt != DHCP_END_OPTION){
	MOVLW	HIGH(_extractBootProtHeader_opt_1_1)
	MOVWF	r0x05
	MOVLW	LOW(_extractBootProtHeader_opt_1_1)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x0c
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_UDPGet
	MOVWF	r0x04
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x04, W
	BTFSC	STATUS, 2
	BRA	_00411_DS_
	MOVFF	_extractBootProtHeader_opt_1_1, r0x04
	CLRF	r0x05
	MOVF	r0x04, W
	XORLW	0xff
	BNZ	_00438_DS_
	MOVF	r0x05, W
	BNZ	_00438_DS_
	BRA	_00411_DS_
_00438_DS_:
;	.line	683; MainDemo.c	UDPGet(&length);
	MOVLW	HIGH(_extractBootProtHeader_length_1_1)
	MOVWF	r0x05
	MOVLW	LOW(_extractBootProtHeader_length_1_1)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x0c
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_UDPGet
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	684; MainDemo.c	if(opt == DHCP_MESSAGE_TYPE){
	MOVFF	_extractBootProtHeader_opt_1_1, r0x04
	CLRF	r0x05
	MOVF	r0x04, W
	XORLW	0x35
	BNZ	_00439_DS_
	MOVF	r0x05, W
	BZ	_00440_DS_
_00439_DS_:
	BRA	_00406_DS_
_00440_DS_:
;	.line	685; MainDemo.c	UDPGet(dhcp_type);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPGet
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	686; MainDemo.c	wrong_packet = FALSE;
	CLRF	r0x03
	BRA	_00409_DS_
_00406_DS_:
;	.line	688; MainDemo.c	else if(dhcp_header != NULL){
	MOVF	r0x06, W
	IORWF	r0x07, W
	IORWF	r0x08, W
	BTFSC	STATUS, 2
	BRA	_00409_DS_
;	.line	689; MainDemo.c	dhcp_header[*dhcp_header_length] = opt;
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget2
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVF	r0x04, W
	ADDWF	r0x06, W
	MOVWF	r0x0c
	MOVF	r0x05, W
	ADDWFC	r0x07, W
	MOVWF	r0x0d
	CLRF	WREG
	BTFSC	r0x05, 7
	SETF	WREG
	ADDWFC	r0x08, W
	MOVWF	r0x0e
	MOVFF	_extractBootProtHeader_opt_1_1, POSTDEC1
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput1
;	.line	690; MainDemo.c	dhcp_header[*dhcp_header_length+1] = length;
	MOVF	r0x04, W
	ADDLW	0x01
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x0d
	CLRF	r0x0e
	BTFSC	r0x0d, 7
	SETF	r0x0e
	MOVF	r0x06, W
	ADDWF	r0x0c, F
	MOVF	r0x07, W
	ADDWFC	r0x0d, F
	MOVF	r0x08, W
	ADDWFC	r0x0e, F
	MOVFF	_extractBootProtHeader_length_1_1, POSTDEC1
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput1
;	.line	691; MainDemo.c	UDPGetArray(&dhcp_header[*dhcp_header_length+2], length);
	MOVLW	0x02
	ADDWF	r0x04, F
	BTFSC	STATUS, 0
	INCF	r0x05, F
	CLRF	r0x0c
	BTFSC	r0x05, 7
	SETF	r0x0c
	MOVF	r0x06, W
	ADDWF	r0x04, F
	MOVF	r0x07, W
	ADDWFC	r0x05, F
	MOVF	r0x08, W
	ADDWFC	r0x0c, F
	MOVFF	_extractBootProtHeader_length_1_1, r0x0d
	CLRF	r0x0e
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_UDPGetArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	692; MainDemo.c	*dhcp_header_length += 2+length;
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget2
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	_extractBootProtHeader_length_1_1, r0x0c
	CLRF	r0x0d
	MOVLW	0x02
	ADDWF	r0x0c, F
	BTFSC	STATUS, 0
	INCF	r0x0d, F
	MOVF	r0x0c, W
	ADDWF	r0x04, F
	MOVF	r0x0d, W
	ADDWFC	r0x05, F
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, PRODH
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput2
	BRA	_00409_DS_
_00411_DS_:
;	.line	695; MainDemo.c	return !wrong_packet;
	MOVF	r0x03, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x03
	RLCF	r0x03, F
	MOVF	r0x03, W
_00416_DS_:
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__sendRequestMsg	code
_sendRequestMsg:
;	.line	612; MainDemo.c	void sendRequestMsg(BYTE *dhcp_header, int dhcp_header_length){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	616; MainDemo.c	UDPPut(DHCP_REQUEST_MESSAGE);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	618; MainDemo.c	i=0;
	CLRF	r0x05
	CLRF	r0x06
_00374_DS_:
;	.line	619; MainDemo.c	while(i<dhcp_header_length){
	MOVF	r0x06, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x04, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00387_DS_
	MOVF	r0x03, W
	SUBWF	r0x05, W
_00387_DS_:
	BTFSC	STATUS, 0
	BRA	_00376_DS_
;	.line	620; MainDemo.c	opt = dhcp_header[i];
	MOVF	r0x05, W
	ADDWF	r0x00, W
	MOVWF	r0x07
	MOVF	r0x06, W
	ADDWFC	r0x01, W
	MOVWF	r0x08
	CLRF	WREG
	BTFSC	r0x06, 7
	SETF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x09
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	MOVWF	r0x07
;	.line	621; MainDemo.c	UDPPut(opt);
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	622; MainDemo.c	i++;
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
;	.line	623; MainDemo.c	length = dhcp_header[i];
	MOVF	r0x05, W
	ADDWF	r0x00, W
	MOVWF	r0x08
	MOVF	r0x06, W
	ADDWFC	r0x01, W
	MOVWF	r0x09
	CLRF	WREG
	BTFSC	r0x06, 7
	SETF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x0a
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrget1
	MOVWF	r0x08
;	.line	624; MainDemo.c	UDPPut(length);
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	625; MainDemo.c	i++;
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
;	.line	626; MainDemo.c	switch(opt){
	CLRF	r0x09
	MOVF	r0x07, W
	XORLW	0x36
	BNZ	_00388_DS_
	MOVF	r0x09, W
	BZ	_00389_DS_
_00388_DS_:
	BRA	_00372_DS_
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x07
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00389_DS_:
	BANKSEL	_activeUDPSocket
;	.line	628; MainDemo.c	UDPPutArray((BYTE*)&UDPSocketInfo[activeUDPSocket].remoteNode.IPAddr, length);
	MOVF	_activeUDPSocket, W, B
	MULLW	0x0e
	MOVFF	PRODL, r0x07
	CLRF	r0x09
	MOVLW	LOW(_UDPSocketInfo)
	ADDWF	r0x07, F
	MOVLW	HIGH(_UDPSocketInfo)
	ADDWFC	r0x09, F
	MOVF	r0x09, W
	MOVWF	r0x09
	MOVF	r0x07, W
	MOVWF	r0x07
	MOVLW	0x80
	MOVWF	r0x0a
	MOVFF	r0x08, r0x0b
	CLRF	r0x0c
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	629; MainDemo.c	break;
	BRA	_00373_DS_
_00372_DS_:
;	.line	631; MainDemo.c	UDPPutArray((BYTE*)&dhcp_header[i], length);   
	MOVF	r0x05, W
	ADDWF	r0x00, W
	MOVWF	r0x07
	MOVF	r0x06, W
	ADDWFC	r0x01, W
	MOVWF	r0x09
	CLRF	WREG
	BTFSC	r0x06, 7
	SETF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x0a
	MOVFF	r0x08, r0x0b
	CLRF	r0x0c
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
_00373_DS_:
;	.line	634; MainDemo.c	i+=length;
	CLRF	r0x07
	MOVF	r0x08, W
	ADDWF	r0x05, F
	MOVF	r0x07, W
	ADDWFC	r0x06, F
	BRA	_00374_DS_
_00376_DS_:
;	.line	637; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	MOVLW	HIGH(_AppConfig)
	MOVWF	r0x01
	MOVLW	LOW(_AppConfig)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	638; MainDemo.c	UDPPut(DHCP_END_OPTION);
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
_00377_DS_:
;	.line	639; MainDemo.c	while(UDPTxCount < 300){
	MOVLW	0x01
	BANKSEL	(_UDPTxCount + 1)
	SUBWF	(_UDPTxCount + 1), W, B
	BNZ	_00390_DS_
	MOVLW	0x2c
	BANKSEL	_UDPTxCount
	SUBWF	_UDPTxCount, W, B
_00390_DS_:
	BC	_00379_DS_
;	.line	640; MainDemo.c	UDPPut(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
	BRA	_00377_DS_
_00379_DS_:
;	.line	643; MainDemo.c	UDPFlush();
	CALL	_UDPFlush
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__sendRelease	code
_sendRelease:
;	.line	588; MainDemo.c	void sendRelease(UDP_SOCKET *send_s_socket, POOL_ITEM *it){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
_00354_DS_:
;	.line	590; MainDemo.c	while(!UDPIsPutReady(*send_s_socket));
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_UDPIsPutReady
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	INCF	FSR1L, F
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00354_DS_
;	.line	591; MainDemo.c	addMacFromServ();
	CALL	_addMacFromServ
;	.line	592; MainDemo.c	configureBootpHeader(&bootp_header, 0, &it->ip, &it->ip, &it->mac, DHCP_ACK_MESSAGE);
	MOVLW	HIGH(_sendRelease_bootp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_sendRelease_bootp_header_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVF	r0x03, W
	ADDLW	0x04
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x0b
	MOVLW	0x05
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_configureBootpHeader
	MOVLW	0x11
	ADDWF	FSR1L, F
;	.line	593; MainDemo.c	buildBootpHeader(&bootp_header, send_s_socket);
	MOVLW	HIGH(_sendRelease_bootp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_sendRelease_bootp_header_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_buildBootpHeader
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	594; MainDemo.c	UDPPut(DHCP_RELEASE_MESSAGE);
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	596; MainDemo.c	UDPPut(DHCP_SERVER_IDENTIFIER);
	MOVLW	0x36
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	597; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	598; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	MOVLW	HIGH(_AppConfig)
	MOVWF	r0x01
	MOVLW	LOW(_AppConfig)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	600; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	MOVLW	HIGH(_AppConfig)
	MOVWF	r0x01
	MOVLW	LOW(_AppConfig)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	601; MainDemo.c	UDPPut(DHCP_END_OPTION);
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
_00357_DS_:
;	.line	602; MainDemo.c	while(UDPTxCount < 300){
	MOVLW	0x01
	BANKSEL	(_UDPTxCount + 1)
	SUBWF	(_UDPTxCount + 1), W, B
	BNZ	_00366_DS_
	MOVLW	0x2c
	BANKSEL	_UDPTxCount
	SUBWF	_UDPTxCount, W, B
_00366_DS_:
	BC	_00359_DS_
;	.line	603; MainDemo.c	UDPPut(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
	BRA	_00357_DS_
_00359_DS_:
;	.line	606; MainDemo.c	UDPFlush();
	CALL	_UDPFlush
;	.line	608; MainDemo.c	initializeItem(it); // Corresponds to RemoveFromPool action in ASG
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_initializeItem
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__buildDiscoverMsg	code
_buildDiscoverMsg:
;	.line	566; MainDemo.c	void buildDiscoverMsg(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	568; MainDemo.c	UDPPut(DHCP_DISCOVER_MESSAGE);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	570; MainDemo.c	UDPPut(DHCP_SERVER_IDENTIFIER);
	MOVLW	0x36
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	571; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	572; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	MOVLW	HIGH(_AppConfig)
	MOVWF	r0x01
	MOVLW	LOW(_AppConfig)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	574; MainDemo.c	UDPPut(DHCP_ROUTER);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	575; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	576; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	MOVLW	HIGH(_AppConfig)
	MOVWF	r0x01
	MOVLW	LOW(_AppConfig)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	578; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	MOVLW	HIGH(_AppConfig)
	MOVWF	r0x01
	MOVLW	LOW(_AppConfig)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	579; MainDemo.c	UDPPut(DHCP_END_OPTION);
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
_00342_DS_:
;	.line	580; MainDemo.c	while(UDPTxCount < 300){
	MOVLW	0x01
	BANKSEL	(_UDPTxCount + 1)
	SUBWF	(_UDPTxCount + 1), W, B
	BNZ	_00349_DS_
	MOVLW	0x2c
	BANKSEL	_UDPTxCount
	SUBWF	_UDPTxCount, W, B
_00349_DS_:
	BC	_00344_DS_
;	.line	581; MainDemo.c	UDPPut(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
	BRA	_00342_DS_
_00344_DS_:
;	.line	584; MainDemo.c	UDPFlush();
	CALL	_UDPFlush
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__configureBootpHeader	code
_configureBootpHeader:
;	.line	547; MainDemo.c	void configureBootpHeader(BOOTP_HEADER *bootp_header, DWORD transactionId, IP_ADDR *clientIP, IP_ADDR *yourIP, MAC_ADDR	*clientMAC, BYTE msg_type)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
	MOVLW	0x0b
	MOVFF	PLUSW2, r0x09
	MOVLW	0x0c
	MOVFF	PLUSW2, r0x0a
	MOVLW	0x0d
	MOVFF	PLUSW2, r0x0b
	MOVLW	0x0e
	MOVFF	PLUSW2, r0x0c
	MOVLW	0x0f
	MOVFF	PLUSW2, r0x0d
	MOVLW	0x10
	MOVFF	PLUSW2, r0x0e
	MOVLW	0x11
	MOVFF	PLUSW2, r0x0f
	MOVLW	0x12
	MOVFF	PLUSW2, r0x10
;	.line	550; MainDemo.c	bootp_header->MessageType = msg_type;
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	551; MainDemo.c	bootp_header->HardwareType = BOOT_HW_TYPE;
	MOVF	r0x00, W
	ADDLW	0x01
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x12
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrput1
;	.line	552; MainDemo.c	bootp_header->HardwareLen = BOOT_LEN_OF_HW_TYPE;
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x12
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrput1
;	.line	553; MainDemo.c	bootp_header->Hops = 1;
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x12
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrput1
;	.line	554; MainDemo.c	bootp_header->TransactionID = transactionId;
	MOVF	r0x00, W
	ADDLW	0x04
	MOVWF	r0x10
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x11
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x12
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, PRODH
	MOVFF	r0x05, TBLPTRL
	MOVFF	r0x06, TBLPTRH
	MOVFF	r0x10, FSR0L
	MOVFF	r0x11, PRODL
	MOVF	r0x12, W
	CALL	__gptrput4
;	.line	555; MainDemo.c	bootp_header->SecondsElapsed = 0;
	MOVF	r0x00, W
	ADDLW	0x08
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	556; MainDemo.c	bootp_header->BootpFlags = 0;
	MOVF	r0x00, W
	ADDLW	0x0a
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
;	.line	557; MainDemo.c	memcpy(&bootp_header->ClientIP, clientIP, sizeof(IP_ADDR));
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	558; MainDemo.c	memcpy(&bootp_header->YourIP, yourIP, sizeof(IP_ADDR));
	MOVF	r0x00, W
	ADDLW	0x10
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	559; MainDemo.c	memset((void*)&bootp_header->NextServerIP, 0, sizeof(IP_ADDR));
	MOVF	r0x00, W
	ADDLW	0x14
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_memset
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	560; MainDemo.c	memset((void*)&bootp_header->RelayAgentIP, 42, sizeof(IP_ADDR));
	MOVF	r0x00, W
	ADDLW	0x18
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVLW	0x2a
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_memset
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	561; MainDemo.c	memcpy(&bootp_header->ClientMAC, clientMAC->v, sizeof(MAC_ADDR));
	MOVLW	0x1c
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__buildBootpHeader	code
_buildBootpHeader:
;	.line	517; MainDemo.c	void buildBootpHeader(BOOTP_HEADER *bootp_header, UDP_SOCKET *my_socket){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
_00326_DS_:
;	.line	520; MainDemo.c	while(!UDPIsPutReady(*my_socket));
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_UDPIsPutReady
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	INCF	FSR1L, F
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00326_DS_
;	.line	522; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->MessageType, sizeof(BYTE));
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	523; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->HardwareType, sizeof(BYTE));
	MOVF	r0x00, W
	ADDLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	524; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->HardwareLen, sizeof(BYTE));
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	525; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->Hops, sizeof(BYTE));
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	526; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->TransactionID, sizeof(DWORD));
	MOVF	r0x00, W
	ADDLW	0x04
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	527; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->SecondsElapsed, sizeof(WORD));
	MOVF	r0x00, W
	ADDLW	0x08
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	528; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->BootpFlags, sizeof(WORD));
	MOVF	r0x00, W
	ADDLW	0x0a
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	529; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->ClientIP, sizeof(IP_ADDR));
	MOVF	r0x00, W
	ADDLW	0x0c
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	530; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->YourIP, sizeof(IP_ADDR));
	MOVF	r0x00, W
	ADDLW	0x10
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	531; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->NextServerIP, sizeof(IP_ADDR));
	MOVF	r0x00, W
	ADDLW	0x14
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	532; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	MOVLW	HIGH(_AppConfig)
	MOVWF	r0x04
	MOVLW	LOW(_AppConfig)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	533; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->ClientMAC, sizeof(MAC_ADDR));
	MOVLW	0x1c
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	535; MainDemo.c	for(i=0; i<202; i++){
	MOVLW	0xca
	MOVWF	r0x00
	CLRF	r0x01
_00331_DS_:
;	.line	536; MainDemo.c	UDPPut(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
	MOVLW	0xff
	ADDWF	r0x00, F
	BTFSS	STATUS, 0
	DECF	r0x01, F
;	.line	535; MainDemo.c	for(i=0; i<202; i++){
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_00331_DS_
;	.line	539; MainDemo.c	UDPPut(99);
	MOVLW	0x63
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	540; MainDemo.c	UDPPut(130);
	MOVLW	0x82
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	541; MainDemo.c	UDPPut(83);
	MOVLW	0x53
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	542; MainDemo.c	UDPPut(99);
	MOVLW	0x63
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	543; MainDemo.c	UDPPut(DHCP_MESSAGE_TYPE);
	MOVLW	0x35
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	544; MainDemo.c	UDPPut(DHCP_MESSAGE_TYPE_LEN);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__buildHeader	code
_buildHeader:
;	.line	501; MainDemo.c	void buildHeader(BYTE *header, unsigned int *dhcp_header_length, POOL_ITEM *it){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
;	.line	504; MainDemo.c	header[0] = DHCP_MESSAGE_TYPE;
	MOVLW	0x35
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	505; MainDemo.c	header[1] = DHCP_MESSAGE_TYPE_LEN;
	MOVF	r0x00, W
	ADDLW	0x01
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput1
;	.line	506; MainDemo.c	header[2] = DHCP_REQUEST_MESSAGE;
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput1
;	.line	507; MainDemo.c	header[3] = DHCP_PARAM_REQUEST_IP_ADDRESS;
	MOVF	r0x00, W
	ADDLW	0x03
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x32
	MOVWF	POSTDEC1
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput1
;	.line	508; MainDemo.c	header[4] = DHCP_PARAM_REQUEST_IP_ADDRESS_LEN;
	MOVF	r0x00, W
	ADDLW	0x04
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0b
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput1
;	.line	509; MainDemo.c	for(i=5; i<9; i++){
	MOVLW	0x05
	MOVWF	r0x09
	CLRF	r0x0a
_00312_DS_:
	MOVF	r0x0a, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00321_DS_
	MOVLW	0x09
	SUBWF	r0x09, W
_00321_DS_:
	BC	_00315_DS_
;	.line	510; MainDemo.c	header[i] = it->ip.v[i-5];
	MOVF	r0x09, W
	ADDWF	r0x00, W
	MOVWF	r0x0b
	MOVF	r0x0a, W
	ADDWFC	r0x01, W
	MOVWF	r0x0c
	CLRF	WREG
	BTFSC	r0x0a, 7
	SETF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x0d
	MOVF	r0x09, W
	MOVWF	r0x0e
	MOVLW	0xfb
	ADDWF	r0x0e, F
	MOVLW	0x00
	BTFSC	r0x0e, 7
	MOVLW	0xff
	MOVWF	r0x10
	MOVWF	r0x0f
	MOVF	r0x06, W
	ADDWF	r0x0e, F
	MOVF	r0x07, W
	ADDWFC	r0x0f, F
	MOVF	r0x08, W
	ADDWFC	r0x10, F
	MOVFF	r0x0e, FSR0L
	MOVFF	r0x0f, PRODL
	MOVF	r0x10, W
	CALL	__gptrget1
	MOVWF	r0x0e
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrput1
;	.line	509; MainDemo.c	for(i=5; i<9; i++){
	INCF	r0x09, F
	BTFSC	STATUS, 0
	INCF	r0x0a, F
	BRA	_00312_DS_
_00315_DS_:
;	.line	512; MainDemo.c	header[9] = DHCP_SERVER_IDENTIFIER;
	MOVF	r0x00, W
	ADDLW	0x09
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x08
	MOVLW	0x36
	MOVWF	POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput1
;	.line	513; MainDemo.c	header[10] = sizeof(IP_ADDR);
	MOVLW	0x0a
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	514; MainDemo.c	*dhcp_header_length = 15;
	MOVLW	0x0f
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput2
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__rcvdFromClient	code
_rcvdFromClient:
;	.line	440; MainDemo.c	void rcvdFromClient(UDP_SOCKET *send_s_socket,
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVFF	r0x15, POSTDEC1
	MOVFF	r0x16, POSTDEC1
	MOVFF	r0x17, POSTDEC1
	MOVFF	r0x18, POSTDEC1
	MOVFF	r0x19, POSTDEC1
	MOVFF	r0x1a, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x09
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_activeUDPSocket
;	.line	452; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket];   
	MOVF	_activeUDPSocket, W, B
	MULLW	0x0e
	MOVFF	PRODL, r0x09
	CLRF	r0x0a
	MOVLW	LOW(_UDPSocketInfo)
	ADDWF	r0x09, F
	MOVLW	HIGH(_UDPSocketInfo)
	ADDWFC	r0x0a, F
	MOVF	r0x0a, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
;	.line	453; MainDemo.c	remote_node_MAC = &info->remoteNode.MACAddr;
	MOVF	r0x09, W
	ADDLW	0x04
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x0b, W
	MOVWF	r0x0e
;	.line	455; MainDemo.c	extractBootProtHeader(&dhcp_type, &bootp_header, dhcp_header, &dhcp_header_length, receiver_socket);
	MOVLW	HIGH(_rcvdFromClient_dhcp_type_1_1)
	MOVWF	r0x10
	MOVLW	LOW(_rcvdFromClient_dhcp_type_1_1)
	MOVWF	r0x0f
	MOVLW	0x80
	MOVWF	r0x11
	MOVLW	HIGH(_rcvdFromClient_bootp_header_1_1)
	MOVWF	r0x13
	MOVLW	LOW(_rcvdFromClient_bootp_header_1_1)
	MOVWF	r0x12
	MOVLW	0x80
	MOVWF	r0x14
	MOVLW	HIGH(_rcvdFromClient_dhcp_header_1_1)
	MOVWF	r0x16
	MOVLW	LOW(_rcvdFromClient_dhcp_header_1_1)
	MOVWF	r0x15
	MOVLW	0x80
	MOVWF	r0x17
	MOVLW	HIGH(_rcvdFromClient_dhcp_header_length_1_1)
	MOVWF	r0x19
	MOVLW	LOW(_rcvdFromClient_dhcp_header_length_1_1)
	MOVWF	r0x18
	MOVLW	0x80
	MOVWF	r0x1a
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x1a, W
	MOVWF	POSTDEC1
	MOVF	r0x19, W
	MOVWF	POSTDEC1
	MOVF	r0x18, W
	MOVWF	POSTDEC1
	MOVF	r0x17, W
	MOVWF	POSTDEC1
	MOVF	r0x16, W
	MOVWF	POSTDEC1
	MOVF	r0x15, W
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	CALL	_extractBootProtHeader
	MOVLW	0x0f
	ADDWF	FSR1L, F
;	.line	456; MainDemo.c	UDPDiscard();
	CALL	_UDPDiscard
;	.line	458; MainDemo.c	switch(dhcp_type){
	MOVFF	_rcvdFromClient_dhcp_type_1_1, r0x06
	CLRF	r0x07
	MOVF	r0x06, W
	XORLW	0x01
	BNZ	_00305_DS_
	MOVF	r0x07, W
	BZ	_00279_DS_
_00305_DS_:
	MOVF	r0x06, W
	XORLW	0x03
	BNZ	_00307_DS_
	MOVF	r0x07, W
	BNZ	_00307_DS_
	BRA	_00282_DS_
_00307_DS_:
	BRA	_00292_DS_
_00279_DS_:
;	.line	460; MainDemo.c	while(!UDPIsPutReady(*send_s_socket));
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_UDPIsPutReady
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	INCF	FSR1L, F
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00279_DS_
;	.line	461; MainDemo.c	addMacFromServ();
	CALL	_addMacFromServ
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_activeUDPSocket
;	.line	462; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket];
	MOVF	_activeUDPSocket, W, B
	MULLW	0x0e
	MOVFF	PRODL, r0x06
	CLRF	r0x07
	MOVLW	LOW(_UDPSocketInfo)
	ADDWF	r0x06, F
	MOVLW	HIGH(_UDPSocketInfo)
	ADDWFC	r0x07, F
	MOVF	r0x07, W
	MOVWF	r0x0a
	MOVF	r0x06, W
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
;	.line	463; MainDemo.c	setDhcpIp(&info->remoteNode.IPAddr);
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_setDhcpIp
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	465; MainDemo.c	DisplayString(0, "DHCP DISCOVERY");
	MOVLW	UPPER(__str_4)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_4)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_4)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	466; MainDemo.c	buildBootpHeader(&bootp_header, send_s_socket);
	MOVLW	HIGH(_rcvdFromClient_bootp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_rcvdFromClient_bootp_header_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_buildBootpHeader
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	467; MainDemo.c	buildDiscoverMsg();
	CALL	_buildDiscoverMsg
;	.line	468; MainDemo.c	break;
	BRA	_00294_DS_
_00282_DS_:
;	.line	470; MainDemo.c	DisplayString(0, "DHCP REQUEST");
	MOVLW	UPPER(__str_5)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_5)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_5)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	472; MainDemo.c	if(findInPool(&pool_it,remote_node_MAC)){                
	MOVLW	HIGH(_rcvdFromClient_pool_it_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_rcvdFromClient_pool_it_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_findInPool
	MOVWF	r0x06
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x06, W
	BTFSC	STATUS, 2
	BRA	_00286_DS_
_00283_DS_:
;	.line	473; MainDemo.c	while(!UDPIsPutReady(*send_c_socket));
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_UDPIsPutReady
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	INCF	FSR1L, F
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00283_DS_
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_activeUDPSocket
;	.line	474; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket]; 
	MOVF	_activeUDPSocket, W, B
	MULLW	0x0e
	MOVFF	PRODL, r0x06
	CLRF	r0x07
	MOVLW	LOW(_UDPSocketInfo)
	ADDWF	r0x06, F
	MOVLW	HIGH(_UDPSocketInfo)
	ADDWFC	r0x07, F
	MOVF	r0x07, W
	MOVWF	r0x0a
	MOVF	r0x06, W
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
;	.line	475; MainDemo.c	setDhcpIp(&info->remoteNode.IPAddr);
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_setDhcpIp
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	476; MainDemo.c	pool_it->client_leasetime = CLIENT_LEASE_TIME;
	MOVFF	_rcvdFromClient_pool_it_1_1, r0x06
	MOVFF	(_rcvdFromClient_pool_it_1_1 + 1), r0x07
	MOVFF	(_rcvdFromClient_pool_it_1_1 + 2), r0x08
	MOVF	r0x06, W
	ADDLW	0x0c
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x0e
	MOVLW	0x2c
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	PRODH
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVLW	0x00
	MOVWF	TBLPTRH
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput4
;	.line	477; MainDemo.c	pool_it->terms_missed = 0;
	MOVF	r0x06, W
	ADDLW	0x0a
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x0e
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput2
;	.line	478; MainDemo.c	configureBootpHeader(&bootp_header, bootp_header.TransactionID, &bootp_header.ClientIP, &pool_it->ip, &pool_it->mac, BOOT_REPLY);
	MOVLW	HIGH(_rcvdFromClient_bootp_header_1_1)
	MOVWF	r0x0d
	MOVLW	LOW(_rcvdFromClient_bootp_header_1_1)
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
	MOVLW	HIGH(_rcvdFromClient_bootp_header_1_1 + 12)
	MOVWF	r0x10
	MOVLW	LOW(_rcvdFromClient_bootp_header_1_1 + 12)
	MOVWF	r0x0f
	MOVLW	0x80
	MOVWF	r0x11
	MOVF	r0x06, W
	ADDLW	0x04
	MOVWF	r0x12
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x14
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x14, W
	MOVWF	POSTDEC1
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	BANKSEL	(_rcvdFromClient_bootp_header_1_1 + 7)
	MOVF	(_rcvdFromClient_bootp_header_1_1 + 7), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rcvdFromClient_bootp_header_1_1 + 6)
	MOVF	(_rcvdFromClient_bootp_header_1_1 + 6), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rcvdFromClient_bootp_header_1_1 + 5)
	MOVF	(_rcvdFromClient_bootp_header_1_1 + 5), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rcvdFromClient_bootp_header_1_1 + 4)
	MOVF	(_rcvdFromClient_bootp_header_1_1 + 4), W, B
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	CALL	_configureBootpHeader
	MOVLW	0x11
	ADDWF	FSR1L, F
;	.line	479; MainDemo.c	transmitToClient(&bootp_header, send_c_socket, DHCP_ACK_MESSAGE);
	MOVLW	HIGH(_rcvdFromClient_bootp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_rcvdFromClient_bootp_header_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	0x05
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_transmitToClient
	MOVLW	0x07
	ADDWF	FSR1L, F
	BRA	_00294_DS_
_00286_DS_:
;	.line	483; MainDemo.c	while(!UDPIsPutReady(*send_s_socket));
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_UDPIsPutReady
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	INCF	FSR1L, F
	MOVF	r0x03, W
	IORWF	r0x04, W
	BZ	_00286_DS_
;	.line	484; MainDemo.c	addMacFromServ();
	CALL	_addMacFromServ
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x03
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_activeUDPSocket
;	.line	485; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket];             
	MOVF	_activeUDPSocket, W, B
	MULLW	0x0e
	MOVFF	PRODL, r0x03
	CLRF	r0x04
	MOVLW	LOW(_UDPSocketInfo)
	ADDWF	r0x03, F
	MOVLW	HIGH(_UDPSocketInfo)
	ADDWFC	r0x04, F
	MOVF	r0x04, W
	MOVWF	r0x0a
	MOVF	r0x03, W
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
;	.line	486; MainDemo.c	setDhcpIp(&info->remoteNode.IPAddr);
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_setDhcpIp
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	487; MainDemo.c	buildBootpHeader(&bootp_header, send_s_socket);
	MOVLW	HIGH(_rcvdFromClient_bootp_header_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_rcvdFromClient_bootp_header_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_buildBootpHeader
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	488; MainDemo.c	sendRequestMsg(dhcp_header, dhcp_header_length);
	MOVLW	HIGH(_rcvdFromClient_dhcp_header_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_rcvdFromClient_dhcp_header_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	BANKSEL	(_rcvdFromClient_dhcp_header_length_1_1 + 1)
	MOVF	(_rcvdFromClient_dhcp_header_length_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_rcvdFromClient_dhcp_header_length_1_1
	MOVF	_rcvdFromClient_dhcp_header_length_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sendRequestMsg
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	490; MainDemo.c	break;
	BRA	_00294_DS_
_00292_DS_:
;	.line	492; MainDemo.c	DisplayString(0, "Wrong DHCP type");
	MOVLW	UPPER(__str_6)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_6)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_6)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
_00294_DS_:
;	.line	494; MainDemo.c	}
	MOVFF	PREINC1, r0x1a
	MOVFF	PREINC1, r0x19
	MOVFF	PREINC1, r0x18
	MOVFF	PREINC1, r0x17
	MOVFF	PREINC1, r0x16
	MOVFF	PREINC1, r0x15
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__transmitToClient	code
_transmitToClient:
;	.line	373; MainDemo.c	void transmitToClient(BOOTP_HEADER *bootp_header, UDP_SOCKET *send_c_socket, BYTE packet_type) {
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
_00235_DS_:
;	.line	379; MainDemo.c	while(!UDPIsPutReady(*send_c_socket));
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget1
	MOVWF	r0x07
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_UDPIsPutReady
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	INCF	FSR1L, F
	MOVF	r0x07, W
	IORWF	r0x08, W
	BZ	_00235_DS_
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x07
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_activeUDPSocket
;	.line	381; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket];
	MOVF	_activeUDPSocket, W, B
	MULLW	0x0e
	MOVFF	PRODL, r0x07
	CLRF	r0x08
	MOVLW	LOW(_UDPSocketInfo)
	ADDWF	r0x07, F
	MOVLW	HIGH(_UDPSocketInfo)
	ADDWFC	r0x08, F
	MOVF	r0x08, W
	MOVWF	r0x08
	MOVF	r0x07, W
	MOVWF	r0x07
	MOVLW	0x80
	MOVWF	r0x09
;	.line	382; MainDemo.c	for(i=0; i<4; i++){
	CLRF	r0x0a
	CLRF	r0x0b
_00241_DS_:
	MOVF	r0x0b, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00268_DS_
	MOVLW	0x04
	SUBWF	r0x0a, W
_00268_DS_:
	BC	_00244_DS_
;	.line	383; MainDemo.c	info->remoteNode.IPAddr.v[i] = 255;
	MOVF	r0x0a, W
	ADDWF	r0x07, W
	MOVWF	r0x0c
	MOVF	r0x0b, W
	ADDWFC	r0x08, W
	MOVWF	r0x0d
	CLRF	WREG
	BTFSC	r0x0b, 7
	SETF	WREG
	ADDWFC	r0x09, W
	MOVWF	r0x0e
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput1
;	.line	382; MainDemo.c	for(i=0; i<4; i++){
	INCF	r0x0a, F
	BTFSC	STATUS, 0
	INCF	r0x0b, F
	BRA	_00241_DS_
_00244_DS_:
;	.line	386; MainDemo.c	info->remotePort = DHCP_CLIENT_PORT;
	MOVF	r0x07, W
	ADDLW	0x0a
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x08, W
	MOVWF	r0x0b
	MOVLW	0x00
	ADDWFC	r0x09, W
	MOVWF	r0x0c
	MOVLW	0x44
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x0a, FSR0L
	MOVFF	r0x0b, PRODL
	MOVF	r0x0c, W
	CALL	__gptrput2
;	.line	389; MainDemo.c	for (i=0; i<sizeof(IP_ADDR); i++) {
	MOVLW	0x04
	ADDWF	r0x07, F
	MOVLW	0x00
	ADDWFC	r0x08, F
	MOVLW	0x00
	ADDWFC	r0x09, F
	MOVF	r0x00, W
	ADDLW	0x1c
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x0b
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x0c
	CLRF	r0x0d
	CLRF	r0x0e
_00245_DS_:
	MOVF	r0x0e, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00269_DS_
	MOVLW	0x04
	SUBWF	r0x0d, W
_00269_DS_:
	BC	_00248_DS_
;	.line	390; MainDemo.c	info->remoteNode.MACAddr.v[i] = bootp_header->ClientMAC.v[i];
	MOVF	r0x0d, W
	ADDWF	r0x07, W
	MOVWF	r0x0f
	MOVF	r0x0e, W
	ADDWFC	r0x08, W
	MOVWF	r0x10
	CLRF	WREG
	BTFSC	r0x0e, 7
	SETF	WREG
	ADDWFC	r0x09, W
	MOVWF	r0x11
	MOVF	r0x0d, W
	ADDWF	r0x0a, W
	MOVWF	r0x12
	MOVF	r0x0e, W
	ADDWFC	r0x0b, W
	MOVWF	r0x13
	CLRF	WREG
	BTFSC	r0x0e, 7
	SETF	WREG
	ADDWFC	r0x0c, W
	MOVWF	r0x14
	MOVFF	r0x12, FSR0L
	MOVFF	r0x13, PRODL
	MOVF	r0x14, W
	CALL	__gptrget1
	MOVWF	r0x12
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x0f, FSR0L
	MOVFF	r0x10, PRODL
	MOVF	r0x11, W
	CALL	__gptrput1
;	.line	389; MainDemo.c	for (i=0; i<sizeof(IP_ADDR); i++) {
	INCF	r0x0d, F
	BTFSC	STATUS, 0
	INCF	r0x0e, F
	BRA	_00245_DS_
_00248_DS_:
;	.line	393; MainDemo.c	buildBootpHeader(bootp_header, send_c_socket);
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_buildBootpHeader
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	394; MainDemo.c	UDPPut(packet_type);	
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	397; MainDemo.c	UDPPut(DHCP_SUBNET_MASK);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	398; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	399; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyMask, sizeof(IP_ADDR));
	MOVLW	HIGH(_AppConfig + 4)
	MOVWF	r0x01
	MOVLW	LOW(_AppConfig + 4)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	402; MainDemo.c	UDPPut(DHCP_BROADCAST);
	MOVLW	0x1c
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	403; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	404; MainDemo.c	for(i=0; i<sizeof(IP_ADDR); i++){
	CLRF	r0x00
	CLRF	r0x01
_00249_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00270_DS_
	MOVLW	0x04
	SUBWF	r0x00, W
_00270_DS_:
	BC	_00252_DS_
;	.line	405; MainDemo.c	broadcast.v[i] = (AppConfig.MyIPAddr.v[i] & AppConfig.MyMask.v[i]) | ~AppConfig.MyMask.v[i];
	MOVLW	LOW(_transmitToClient_broadcast_1_1)
	ADDWF	r0x00, W
	MOVWF	r0x02
	MOVLW	HIGH(_transmitToClient_broadcast_1_1)
	ADDWFC	r0x01, W
	MOVWF	r0x03
	MOVLW	LOW(_AppConfig)
	ADDWF	r0x00, W
	MOVWF	r0x04
	MOVLW	HIGH(_AppConfig)
	ADDWFC	r0x01, W
	MOVWF	r0x05
	MOVLW	LOW(_AppConfig + 4)
	ADDWF	r0x00, W
	MOVWF	r0x06
	MOVLW	HIGH(_AppConfig + 4)
	ADDWFC	r0x01, W
	MOVWF	r0x07
	MOVFF	r0x04, FSR0L
	MOVFF	r0x05, FSR0H
	MOVFF	INDF0, r0x04
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, FSR0H
	MOVFF	INDF0, r0x06
	MOVF	r0x06, W
	ANDWF	r0x04, F
	COMF	r0x06, F
	MOVF	r0x06, W
	IORWF	r0x04, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x04, INDF0
;	.line	404; MainDemo.c	for(i=0; i<sizeof(IP_ADDR); i++){
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00249_DS_
_00252_DS_:
;	.line	407; MainDemo.c	UDPPutArray((BYTE*)&broadcast, sizeof(IP_ADDR));
	MOVLW	HIGH(_transmitToClient_broadcast_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_transmitToClient_broadcast_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	410; MainDemo.c	UDPPut(DHCP_ROUTER);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	411; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	412; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyGateway, sizeof(IP_ADDR));
	MOVLW	HIGH(_AppConfig + 8)
	MOVWF	r0x01
	MOVLW	LOW(_AppConfig + 8)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	414; MainDemo.c	lease_time = CLIENT_LEASE_TIME; // Corresponds to AdaptLeaseTime action in ASG
	MOVLW	0x2c
	BANKSEL	_transmitToClient_lease_time_1_1
	MOVWF	_transmitToClient_lease_time_1_1, B
	MOVLW	0x01
	BANKSEL	(_transmitToClient_lease_time_1_1 + 1)
	MOVWF	(_transmitToClient_lease_time_1_1 + 1), B
;	.line	415; MainDemo.c	UDPPut(DHCP_IP_LEASE_TIME);
	MOVLW	0x33
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	416; MainDemo.c	UDPPut(4);
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	417; MainDemo.c	UDPPut(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	418; MainDemo.c	UDPPut(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	419; MainDemo.c	UDPPutArrayInvert((BYTE*)&lease_time, 2);
	MOVLW	HIGH(_transmitToClient_lease_time_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_transmitToClient_lease_time_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArrayInvert
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	422; MainDemo.c	UDPPut(DHCP_SERVER_IDENTIFIER);
	MOVLW	0x36
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	423; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	426; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
	MOVLW	HIGH(_AppConfig)
	MOVWF	r0x01
	MOVLW	LOW(_AppConfig)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPPutArray
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	427; MainDemo.c	UDPPut(DHCP_END_OPTION);
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
_00238_DS_:
;	.line	428; MainDemo.c	while(UDPTxCount < 300){
	MOVLW	0x01
	BANKSEL	(_UDPTxCount + 1)
	SUBWF	(_UDPTxCount + 1), W, B
	BNZ	_00273_DS_
	MOVLW	0x2c
	BANKSEL	_UDPTxCount
	SUBWF	_UDPTxCount, W, B
_00273_DS_:
	BC	_00240_DS_
;	.line	429; MainDemo.c	UDPPut(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
	BRA	_00238_DS_
_00240_DS_:
;	.line	433; MainDemo.c	UDPFlush();
	CALL	_UDPFlush
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__rcvdFromServer	code
_rcvdFromServer:
;	.line	338; MainDemo.c	void rcvdFromServer(UDP_SOCKET *send_c_socket, UDP_SOCKET *receiver_socket){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
;	.line	346; MainDemo.c	extractBootProtHeader(&dhcp_type, &bootp_header, dhcp_header, &dhcp_header_length, receiver_socket);
	MOVLW	HIGH(_rcvdFromServer_dhcp_type_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_rcvdFromServer_dhcp_type_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_rcvdFromServer_bootp_header_1_1)
	MOVWF	r0x0a
	MOVLW	LOW(_rcvdFromServer_bootp_header_1_1)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVLW	HIGH(_rcvdFromServer_dhcp_header_1_1)
	MOVWF	r0x0d
	MOVLW	LOW(_rcvdFromServer_dhcp_header_1_1)
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
	MOVLW	HIGH(_rcvdFromServer_dhcp_header_length_1_1)
	MOVWF	r0x10
	MOVLW	LOW(_rcvdFromServer_dhcp_header_length_1_1)
	MOVWF	r0x0f
	MOVLW	0x80
	MOVWF	r0x11
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0f, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_extractBootProtHeader
	MOVLW	0x0f
	ADDWF	FSR1L, F
;	.line	347; MainDemo.c	UDPDiscard();
	CALL	_UDPDiscard
;	.line	349; MainDemo.c	switch(dhcp_type){
	MOVFF	_rcvdFromServer_dhcp_type_1_1, r0x03
	CLRF	r0x04
	MOVF	r0x03, W
	XORLW	0x02
	BNZ	_00228_DS_
	MOVF	r0x04, W
	BZ	_00215_DS_
_00228_DS_:
	MOVF	r0x03, W
	XORLW	0x05
	BNZ	_00230_DS_
	MOVF	r0x04, W
	BZ	_00216_DS_
_00230_DS_:
	BRA	_00220_DS_
_00215_DS_:
;	.line	351; MainDemo.c	DisplayString(0, "DHCP OFFER");
	MOVLW	UPPER(__str_1)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_1)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_1)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	352; MainDemo.c	transmitToClient(&bootp_header, send_c_socket, dhcp_type);
	MOVLW	HIGH(_rcvdFromServer_bootp_header_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_rcvdFromServer_bootp_header_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	BANKSEL	_rcvdFromServer_dhcp_type_1_1
	MOVF	_rcvdFromServer_dhcp_type_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_transmitToClient
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	353; MainDemo.c	break;
	BRA	_00222_DS_
_00216_DS_:
;	.line	356; MainDemo.c	DisplayString(0, "DHCP ACK");
	MOVLW	UPPER(__str_2)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_2)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_2)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	357; MainDemo.c	getLeaseFromAck(&lease_time, dhcp_header, dhcp_header_length);        
	MOVLW	HIGH(_rcvdFromServer_lease_time_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_rcvdFromServer_lease_time_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_rcvdFromServer_dhcp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_rcvdFromServer_dhcp_header_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	BANKSEL	(_rcvdFromServer_dhcp_header_length_1_1 + 1)
	MOVF	(_rcvdFromServer_dhcp_header_length_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_rcvdFromServer_dhcp_header_length_1_1
	MOVF	_rcvdFromServer_dhcp_header_length_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_getLeaseFromAck
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	358; MainDemo.c	if(findInPool(&pool_it, &bootp_header.ClientMAC)){
	MOVLW	HIGH(_rcvdFromServer_pool_it_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_rcvdFromServer_pool_it_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_rcvdFromServer_bootp_header_1_1 + 28)
	MOVWF	r0x07
	MOVLW	LOW(_rcvdFromServer_bootp_header_1_1 + 28)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_findInPool
	MOVWF	r0x03
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x03, W
	BTFSC	STATUS, 2
	BRA	_00218_DS_
;	.line	359; MainDemo.c	memcpy(pool_it->ip.v, &bootp_header.YourIP, sizeof(IP_ADDR));
	MOVFF	_rcvdFromServer_pool_it_1_1, r0x03
	MOVFF	(_rcvdFromServer_pool_it_1_1 + 1), r0x04
	MOVFF	(_rcvdFromServer_pool_it_1_1 + 2), r0x05
	MOVLW	HIGH(_rcvdFromServer_bootp_header_1_1 + 16)
	MOVWF	r0x07
	MOVLW	LOW(_rcvdFromServer_bootp_header_1_1 + 16)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	360; MainDemo.c	pool_it->server_leasetime = lease_time;
	MOVFF	_rcvdFromServer_pool_it_1_1, r0x03
	MOVFF	(_rcvdFromServer_pool_it_1_1 + 1), r0x04
	MOVFF	(_rcvdFromServer_pool_it_1_1 + 2), r0x05
	MOVLW	0x10
	ADDWF	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	MOVFF	_rcvdFromServer_lease_time_1_1, POSTDEC1
	MOVFF	(_rcvdFromServer_lease_time_1_1 + 1), PRODH
	MOVFF	(_rcvdFromServer_lease_time_1_1 + 2), TBLPTRL
	MOVFF	(_rcvdFromServer_lease_time_1_1 + 3), TBLPTRH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput4
	BRA	_00219_DS_
_00218_DS_:
;	.line	362; MainDemo.c	addItem((IP_ADDR*)&bootp_header.YourIP, &bootp_header.ClientMAC, lease_time, 0);    
	MOVLW	HIGH(_rcvdFromServer_bootp_header_1_1 + 16)
	MOVWF	r0x04
	MOVLW	LOW(_rcvdFromServer_bootp_header_1_1 + 16)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_rcvdFromServer_bootp_header_1_1 + 28)
	MOVWF	r0x07
	MOVLW	LOW(_rcvdFromServer_bootp_header_1_1 + 28)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	BANKSEL	(_rcvdFromServer_lease_time_1_1 + 3)
	MOVF	(_rcvdFromServer_lease_time_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rcvdFromServer_lease_time_1_1 + 2)
	MOVF	(_rcvdFromServer_lease_time_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_rcvdFromServer_lease_time_1_1 + 1)
	MOVF	(_rcvdFromServer_lease_time_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_rcvdFromServer_lease_time_1_1
	MOVF	_rcvdFromServer_lease_time_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_addItem
	MOVLW	0x0c
	ADDWF	FSR1L, F
_00219_DS_:
;	.line	364; MainDemo.c	transmitToClient(&bootp_header, send_c_socket, dhcp_type);
	MOVLW	HIGH(_rcvdFromServer_bootp_header_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_rcvdFromServer_bootp_header_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	BANKSEL	_rcvdFromServer_dhcp_type_1_1
	MOVF	_rcvdFromServer_dhcp_type_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_transmitToClient
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	365; MainDemo.c	break;
	BRA	_00222_DS_
_00220_DS_:
;	.line	368; MainDemo.c	DisplayString(0, "DISCARDED packet from server");
	MOVLW	UPPER(__str_3)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_3)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_3)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
_00222_DS_:
;	.line	370; MainDemo.c	}
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__sendRequest	code
_sendRequest:
;	.line	325; MainDemo.c	void sendRequest(UDP_SOCKET *send_s_socket, POOL_ITEM *it){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
_00207_DS_:
;	.line	330; MainDemo.c	while(!UDPIsPutReady(*send_s_socket));
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x06
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_UDPIsPutReady
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	INCF	FSR1L, F
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00207_DS_
;	.line	331; MainDemo.c	addMacFromServ();
	CALL	_addMacFromServ
;	.line	332; MainDemo.c	configureBootpHeader(&bootp_header, 0, &it->ip, &it->ip, &it->mac, DHCP_REQUEST_MESSAGE);
	MOVLW	HIGH(_sendRequest_bootp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_sendRequest_bootp_header_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVF	r0x03, W
	ADDLW	0x04
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x0a
	MOVLW	0x00
	ADDWFC	r0x05, W
	MOVWF	r0x0b
	MOVLW	0x03
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_configureBootpHeader
	MOVLW	0x11
	ADDWF	FSR1L, F
;	.line	333; MainDemo.c	buildHeader(dhcp_header, &dhcp_header_length, it);
	MOVLW	HIGH(_sendRequest_dhcp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_sendRequest_dhcp_header_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_sendRequest_dhcp_header_length_1_1)
	MOVWF	r0x0a
	MOVLW	LOW(_sendRequest_dhcp_header_length_1_1)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_buildHeader
	MOVLW	0x09
	ADDWF	FSR1L, F
;	.line	334; MainDemo.c	buildBootpHeader(&bootp_header, send_s_socket);
	MOVLW	HIGH(_sendRequest_bootp_header_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_sendRequest_bootp_header_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_buildBootpHeader
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	335; MainDemo.c	sendRequestMsg(dhcp_header, dhcp_header_length);
	MOVLW	HIGH(_sendRequest_dhcp_header_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_sendRequest_dhcp_header_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	_sendRequest_dhcp_header_length_1_1, r0x03
	MOVFF	(_sendRequest_dhcp_header_length_1_1 + 1), r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_sendRequestMsg
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__setDhcpIp	code
_setDhcpIp:
;	.line	317; MainDemo.c	void setDhcpIp(IP_ADDR *ip){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	318; MainDemo.c	ip->v[0] = DHCP_IP8;
	MOVLW	0xc0
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	319; MainDemo.c	ip->v[1] = DHCP_IP16;
	MOVF	r0x00, W
	ADDLW	0x01
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0xa8
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	320; MainDemo.c	ip->v[2] = DHCP_IP24;
	MOVF	r0x00, W
	ADDLW	0x02
	MOVWF	r0x03
	MOVLW	0x00
	ADDWFC	r0x01, W
	MOVWF	r0x04
	MOVLW	0x00
	ADDWFC	r0x02, W
	MOVWF	r0x05
	MOVLW	0x58
	MOVWF	POSTDEC1
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput1
;	.line	321; MainDemo.c	ip->v[3] = DHCP_IP32;
	MOVLW	0x03
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__getMacFromServ	code
_getMacFromServ:
;	.line	299; MainDemo.c	void getMacFromServ(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
;	.line	303; MainDemo.c	for (i=0; i<100; i++) {
	CLRF	r0x00
	CLRF	r0x01
_00185_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00196_DS_
	MOVLW	0x64
	SUBWF	r0x00, W
_00196_DS_:
	BTFSC	STATUS, 0
	BRA	_00188_DS_
;	.line	304; MainDemo.c	StackTask();
	CALL	_StackTask
;	.line	305; MainDemo.c	ARPResolve(&AppConfig.MyGateway);
	MOVLW	HIGH(_AppConfig + 8)
	MOVWF	r0x03
	MOVLW	LOW(_AppConfig + 8)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_ARPResolve
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	306; MainDemo.c	for(j=0;j<5000; j++) {
	CLRF	r0x02
	CLRF	r0x03
_00181_DS_:
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x6d
	BNZ	_00197_DS_
	MOVLW	0x88
	SUBWF	r0x02, W
_00197_DS_:
	BTFSC	STATUS, 0
	BRA	_00187_DS_
;	.line	307; MainDemo.c	if(ARPIsResolved(&AppConfig.MyGateway, &gw_mac)) {
	MOVLW	HIGH(_AppConfig + 8)
	MOVWF	r0x05
	MOVLW	LOW(_AppConfig + 8)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVLW	HIGH(_getMacFromServ_gw_mac_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_getMacFromServ_gw_mac_1_1)
	MOVWF	r0x07
	MOVLW	0x80
	MOVWF	r0x09
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_ARPIsResolved
	MOVWF	r0x04
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x04, W
	BZ	_00183_DS_
;	.line	308; MainDemo.c	memcpy(MAC_ADDR_GATEWAY, &gw_mac, 6);
	MOVLW	HIGH(_MAC_ADDR_GATEWAY)
	MOVWF	r0x05
	MOVLW	LOW(_MAC_ADDR_GATEWAY)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVLW	HIGH(_getMacFromServ_gw_mac_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_getMacFromServ_gw_mac_1_1)
	MOVWF	r0x07
	MOVLW	0x80
	MOVWF	r0x09
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	309; MainDemo.c	return;     
	BRA	_00189_DS_
_00183_DS_:
;	.line	306; MainDemo.c	for(j=0;j<5000; j++) {
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00181_DS_
_00187_DS_:
;	.line	303; MainDemo.c	for (i=0; i<100; i++) {
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00185_DS_
_00188_DS_:
;	.line	313; MainDemo.c	DisplayString(0, "No MAC : ARP    Request Failed");
	MOVLW	UPPER(__str_0)
	MOVWF	POSTDEC1
	MOVLW	HIGH(__str_0)
	MOVWF	POSTDEC1
	MOVLW	LOW(__str_0)
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
_00189_DS_:
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__UDPPutArrayInvert	code
_UDPPutArrayInvert:
;	.line	288; MainDemo.c	void UDPPutArrayInvert(BYTE *val, int len)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
;	.line	291; MainDemo.c	for(i = 0; i < len; i++)
	CLRF	r0x05
	CLRF	r0x06
_00165_DS_:
	MOVF	r0x06, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x04, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00174_DS_
	MOVF	r0x03, W
	SUBWF	r0x05, W
_00174_DS_:
	BC	_00169_DS_
;	.line	292; MainDemo.c	UDPPut(val[len-i-1]);
	MOVF	r0x05, W
	SUBWF	r0x03, W
	MOVWF	r0x07
	MOVF	r0x06, W
	SUBWFB	r0x04, W
	MOVWF	r0x08
	MOVLW	0xff
	ADDWF	r0x07, F
	BTFSS	STATUS, 0
	DECF	r0x08, F
	CLRF	r0x09
	BTFSC	r0x08, 7
	SETF	r0x09
	MOVF	r0x00, W
	ADDWF	r0x07, F
	MOVF	r0x01, W
	ADDWFC	r0x08, F
	MOVF	r0x02, W
	ADDWFC	r0x09, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget1
	MOVWF	r0x07
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	291; MainDemo.c	for(i = 0; i < len; i++)
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BRA	_00165_DS_
_00169_DS_:
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__addMacFromServ	code
_addMacFromServ:
;	.line	275; MainDemo.c	void addMacFromServ(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_activeUDPSocket
;	.line	280; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket];
	MOVF	_activeUDPSocket, W, B
	MULLW	0x0e
	MOVFF	PRODL, r0x00
	CLRF	r0x01
	MOVLW	LOW(_UDPSocketInfo)
	ADDWF	r0x00, F
	MOVLW	HIGH(_UDPSocketInfo)
	ADDWFC	r0x01, F
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
;	.line	281; MainDemo.c	remote_node_MAC = &info->remoteNode.MACAddr;
	MOVLW	0x04
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
;	.line	283; MainDemo.c	for (i=0; i<sizeof(MAC_ADDR); i++)
	CLRF	r0x03
	CLRF	r0x04
_00151_DS_:
	MOVF	r0x04, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00160_DS_
	MOVLW	0x06
	SUBWF	r0x03, W
_00160_DS_:
	BC	_00155_DS_
;	.line	284; MainDemo.c	remote_node_MAC->v[i] = MAC_ADDR_GATEWAY[i];
	MOVF	r0x03, W
	ADDWF	r0x00, W
	MOVWF	r0x05
	MOVF	r0x04, W
	ADDWFC	r0x01, W
	MOVWF	r0x06
	CLRF	WREG
	BTFSC	r0x04, 7
	SETF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x07
	MOVLW	LOW(_MAC_ADDR_GATEWAY)
	ADDWF	r0x03, W
	MOVWF	r0x08
	MOVLW	HIGH(_MAC_ADDR_GATEWAY)
	ADDWFC	r0x04, W
	MOVWF	r0x09
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, FSR0H
	MOVFF	INDF0, r0x08
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput1
;	.line	283; MainDemo.c	for (i=0; i<sizeof(MAC_ADDR); i++)
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BRA	_00151_DS_
_00155_DS_:
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__ip_cmp	code
_ip_cmp:
;	.line	265; MainDemo.c	BOOL ip_cmp(IP_ADDR *ip1, IP_ADDR *ip2){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
;	.line	267; MainDemo.c	for(i=0; i<4; i++){
	CLRF	r0x06
	CLRF	r0x07
_00135_DS_:
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00144_DS_
	MOVLW	0x04
	SUBWF	r0x06, W
_00144_DS_:
	BC	_00138_DS_
;	.line	268; MainDemo.c	if(ip1->v[i] != ip2->v[i]){
	MOVF	r0x06, W
	ADDWF	r0x00, W
	MOVWF	r0x08
	MOVF	r0x07, W
	ADDWFC	r0x01, W
	MOVWF	r0x09
	CLRF	WREG
	BTFSC	r0x07, 7
	SETF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x0a
	MOVF	r0x06, W
	ADDWF	r0x03, W
	MOVWF	r0x0b
	MOVF	r0x07, W
	ADDWFC	r0x04, W
	MOVWF	r0x0c
	CLRF	WREG
	BTFSC	r0x07, 7
	SETF	WREG
	ADDWFC	r0x05, W
	MOVWF	r0x0d
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrget1
	MOVWF	r0x08
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget1
	MOVWF	r0x0b
	MOVF	r0x08, W
	XORWF	r0x0b, W
	BZ	_00137_DS_
;	.line	269; MainDemo.c	return FALSE;
	CLRF	WREG
	BRA	_00139_DS_
_00137_DS_:
;	.line	267; MainDemo.c	for(i=0; i<4; i++){
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00135_DS_
_00138_DS_:
;	.line	272; MainDemo.c	return TRUE;
	MOVLW	0x01
_00139_DS_:
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__mac_cmp	code
_mac_cmp:
;	.line	254; MainDemo.c	BOOL mac_cmp(MAC_ADDR *m1, MAC_ADDR *m2){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	MOVLW	0x05
	MOVFF	PLUSW2, r0x03
	MOVLW	0x06
	MOVFF	PLUSW2, r0x04
	MOVLW	0x07
	MOVFF	PLUSW2, r0x05
;	.line	256; MainDemo.c	for(i=0; i<6; i++){
	CLRF	r0x06
	CLRF	r0x07
_00117_DS_:
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00126_DS_
	MOVLW	0x06
	SUBWF	r0x06, W
_00126_DS_:
	BC	_00120_DS_
;	.line	257; MainDemo.c	if(m1->v[i] != m2->v[i]){
	MOVF	r0x06, W
	ADDWF	r0x00, W
	MOVWF	r0x08
	MOVF	r0x07, W
	ADDWFC	r0x01, W
	MOVWF	r0x09
	CLRF	WREG
	BTFSC	r0x07, 7
	SETF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x0a
	MOVF	r0x06, W
	ADDWF	r0x03, W
	MOVWF	r0x0b
	MOVF	r0x07, W
	ADDWFC	r0x04, W
	MOVWF	r0x0c
	CLRF	WREG
	BTFSC	r0x07, 7
	SETF	WREG
	ADDWFC	r0x05, W
	MOVWF	r0x0d
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrget1
	MOVWF	r0x08
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget1
	MOVWF	r0x0b
	MOVF	r0x08, W
	XORWF	r0x0b, W
	BZ	_00119_DS_
;	.line	258; MainDemo.c	return FALSE;
	CLRF	WREG
	BRA	_00121_DS_
_00119_DS_:
;	.line	256; MainDemo.c	for(i=0; i<6; i++){
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00117_DS_
_00120_DS_:
;	.line	261; MainDemo.c	return TRUE;
	MOVLW	0x01
_00121_DS_:
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__HighISR	code
_HighISR:
;	.line	232; MainDemo.c	void HighISR(void) __interrupt(1) //ML for sdcc        
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	239; MainDemo.c	}
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	MOVFF	PREINC1, WREG
	RETFIE	

; ; Starting pCode block
S_MainDemo__LowISR	code
_LowISR:
;	.line	211; MainDemo.c	void LowISR(void) __interrupt (2) //ML for sdcc
	MOVFF	WREG, POSTDEC1
	MOVFF	STATUS, POSTDEC1
	MOVFF	BSR, POSTDEC1
	MOVFF	PRODL, POSTDEC1
	MOVFF	PRODH, POSTDEC1
	MOVFF	FSR0L, POSTDEC1
	MOVFF	FSR0H, POSTDEC1
	MOVFF	PCLATH, POSTDEC1
	MOVFF	PCLATU, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	217; MainDemo.c	TickUpdate();
	CALL	_TickUpdate
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, PCLATU
	MOVFF	PREINC1, PCLATH
	MOVFF	PREINC1, FSR0H
	MOVFF	PREINC1, FSR0L
	MOVFF	PREINC1, PRODH
	MOVFF	PREINC1, PRODL
	MOVFF	PREINC1, BSR
	MOVFF	PREINC1, STATUS
	MOVFF	PREINC1, WREG
	RETFIE	

; ; Starting pCode block
__str_0:
	DB	0x4e, 0x6f, 0x20, 0x4d, 0x41, 0x43, 0x20, 0x3a, 0x20, 0x41, 0x52, 0x50
	DB	0x20, 0x20, 0x20, 0x20, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x20
	DB	0x46, 0x61, 0x69, 0x6c, 0x65, 0x64, 0x00
; ; Starting pCode block
__str_1:
	DB	0x44, 0x48, 0x43, 0x50, 0x20, 0x4f, 0x46, 0x46, 0x45, 0x52, 0x00
; ; Starting pCode block
__str_2:
	DB	0x44, 0x48, 0x43, 0x50, 0x20, 0x41, 0x43, 0x4b, 0x00
; ; Starting pCode block
__str_3:
	DB	0x44, 0x49, 0x53, 0x43, 0x41, 0x52, 0x44, 0x45, 0x44, 0x20, 0x70, 0x61
	DB	0x63, 0x6b, 0x65, 0x74, 0x20, 0x66, 0x72, 0x6f, 0x6d, 0x20, 0x73, 0x65
	DB	0x72, 0x76, 0x65, 0x72, 0x00
; ; Starting pCode block
__str_4:
	DB	0x44, 0x48, 0x43, 0x50, 0x20, 0x44, 0x49, 0x53, 0x43, 0x4f, 0x56, 0x45
	DB	0x52, 0x59, 0x00
; ; Starting pCode block
__str_5:
	DB	0x44, 0x48, 0x43, 0x50, 0x20, 0x52, 0x45, 0x51, 0x55, 0x45, 0x53, 0x54
	DB	0x00
; ; Starting pCode block
__str_6:
	DB	0x57, 0x72, 0x6f, 0x6e, 0x67, 0x20, 0x44, 0x48, 0x43, 0x50, 0x20, 0x74
	DB	0x79, 0x70, 0x65, 0x00
; ; Starting pCode block
__str_7:
	DB	0x46, 0x61, 0x69, 0x6c, 0x20, 0x74, 0x6f, 0x20, 0x63, 0x72, 0x65, 0x61
	DB	0x74, 0x65, 0x20, 0x20, 0x73, 0x6f, 0x63, 0x6b, 0x65, 0x74, 0x00
; ; Starting pCode block
__str_8:
	DB	0x45, 0x6e, 0x74, 0x65, 0x72, 0x69, 0x6e, 0x67, 0x20, 0x54, 0x61, 0x73
	DB	0x6b, 0x20, 0x43, 0x79, 0x63, 0x6c, 0x65, 0x00
; ; Starting pCode block
__str_9:
	DB	0x49, 0x4e, 0x47, 0x49, 0x32, 0x33, 0x31, 0x35, 0x20, 0x49, 0x6e, 0x69
	DB	0x74, 0x00


; Statistics:
; code size:	15802 (0x3dba) bytes (12.06%)
;           	 7901 (0x1edd) words
; udata size:	 1061 (0x0425) bytes (27.63%)
; access size:	   27 (0x001b) bytes


	end
