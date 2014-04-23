;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (May 13 2013) (UNIX)
; This file was generated Sat May 18 21:43:28 2013
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _nbr_sec
	global _message
	global _AN0String
	global _get_pool_el_ip
	global _set_to_dhcp_ip
	global _int_to_string
	global _mac_cmp
	global _ip_cmp
	global _update_pool
	global _send_release
	global _extract_bootp_header
	global _handle_server_msg
	global _forgeBootpHeaderRequest
	global _forgeBootpHeaderAck
	global _transfer_msg_to_client
	global _set_mac_to_dhcp_server
	global _handle_client_msg
	global _build_bootp
	global _end_dhcp
	global _discover_msg
	global _request_msg
	global _DisplayWORD
	global _DisplayString
	global _DisplayIPValue
	global _strlcpy
	global _AppConfig
	global _GATEWAY_MACA
	global _pool
	global _LowISR
	global _HighISR
	global _init_pool_el
	global _init_pool
	global _is_free
	global _add_to_pool
	global _remove_from_pool
	global _get_pool_el_mac
	global _set_to_MAC
	global _number_of_char
	global _display_mac
	global _display_ip
	global _time_action
	global _build_dhcp_header
	global _send_request
	global _wait_network_data
	global _get_ack_lease_time
	global _forgeBootpHeader
	global _UDPPutArrayInvert
	global _get_gateway_MAC
	global _main

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern __gptrput1
	extern __gptrput4
	extern __gptrput2
	extern __gptrget1
	extern __gptrput3
	extern __gptrget2
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
	extern _StackTaskHelp
	extern _StackTask
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
	extern __divsint
	extern __modsint
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
_nbr_sec	db	0x00, 0x00
_time_action_prev_1_1	db	0x00, 0x00, 0x00, 0x00
_time_action_t_1_1	db	0x00, 0x00, 0x00, 0x00
_time_action_count_1_1	db	0x00, 0x00, 0x00, 0x00


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
_pool	res	200

udata_MainDemo_3	udata
_remove_from_pool_pool_el_1_1	res	3

udata_MainDemo_4	udata
_display_mac_a_1_1	res	10

udata_MainDemo_5	udata
_display_mac_b_1_1	res	10

udata_MainDemo_6	udata
_display_mac_c_1_1	res	10

udata_MainDemo_7	udata
_display_mac_d_1_1	res	10

udata_MainDemo_8	udata
_display_mac_e_1_1	res	10

udata_MainDemo_9	udata
_display_mac_f_1_1	res	10

udata_MainDemo_10	udata
_display_ip_a_1_1	res	10

udata_MainDemo_11	udata
_display_ip_b_1_1	res	10

udata_MainDemo_12	udata
_display_ip_c_1_1	res	10

udata_MainDemo_13	udata
_display_ip_d_1_1	res	10

udata_MainDemo_14	udata
_send_request_dhcp_header_length_1_1	res	2

udata_MainDemo_15	udata
_send_request_bootp_header_1_1	res	34

udata_MainDemo_16	udata
_send_request_dhcp_header_1_1	res	200

udata_MainDemo_17	udata
_send_release_bootp_header_1_1	res	34

udata_MainDemo_18	udata
_AppConfig	res	51

udata_MainDemo_19	udata
_wait_network_data_socket_sendto_server_1_1	res	1

udata_MainDemo_20	udata
_wait_network_data_socket_recv_1_1	res	1

udata_MainDemo_21	udata
_wait_network_data_socket_sendto_client_1_1	res	1

udata_MainDemo_22	udata
_wait_network_data_dhcp_server_ip_1_1	res	4

udata_MainDemo_23	udata
_wait_network_data_last_ip_1_1	res	4

udata_MainDemo_24	udata
_extract_bootp_header_opt_1_1	res	1

udata_MainDemo_25	udata
_extract_bootp_header_word_buf_1_1	res	4

udata_MainDemo_26	udata
_extract_bootp_header_length_1_1	res	1

udata_MainDemo_27	udata
_handle_server_msg_node_pool_state_1_1	res	3

udata_MainDemo_28	udata
_handle_server_msg_dhcp_type_1_1	res	1

udata_MainDemo_29	udata
_handle_server_msg_bootp_header_1_1	res	34

udata_MainDemo_30	udata
_handle_server_msg_dhcp_header_1_1	res	200

udata_MainDemo_31	udata
_handle_server_msg_dhcp_header_length_1_1	res	2

udata_MainDemo_32	udata
_handle_server_msg_lease_time_1_1	res	4

udata_MainDemo_33	udata
_transfer_msg_to_client_lease_time_1_1	res	2

udata_MainDemo_34	udata
_transfer_msg_to_client_broadcast_1_1	res	4

udata_MainDemo_35	udata
_GATEWAY_MACA	res	6

udata_MainDemo_36	udata
_handle_client_msg_node_pool_state_1_1	res	3

udata_MainDemo_37	udata
_handle_client_msg_dhcp_type_1_1	res	1

udata_MainDemo_38	udata
_handle_client_msg_bootp_header_1_1	res	34

udata_MainDemo_39	udata
_handle_client_msg_dhcp_header_1_1	res	200

udata_MainDemo_40	udata
_handle_client_msg_dhcp_header_length_1_1	res	2

udata_MainDemo_41	udata
_get_gateway_MAC_gateway_MAC2_1_1	res	6

udata_MainDemo_42	udata
_main_gateway_MAC_1_1	res	6

udata_MainDemo_43	udata
_DisplayWORD_WDigit_1_1	res	6

udata_MainDemo_44	udata
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
;	.line	811; MainDemo.c	InitializeBoard();
	CALL	_InitializeBoard
;	.line	813; MainDemo.c	LCDInit();
	CALL	_LCDInit
;	.line	814; MainDemo.c	DelayMs(100);
	MOVLW	0x10
	MOVWF	r0x00
	MOVLW	0x98
	MOVWF	r0x01
	MOVLW	0x02
	MOVWF	r0x02
	CLRF	r0x03
_00680_DS_:
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
	BNZ	_00680_DS_
;	.line	816; MainDemo.c	TickInit();
	CALL	_TickInit
;	.line	818; MainDemo.c	InitAppConfig();
	CALL	_InitAppConfig
;	.line	821; MainDemo.c	StackInit();    
	CALL	_StackInit
;	.line	823; MainDemo.c	DisplayString(0, "LINGI2315");
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
;	.line	824; MainDemo.c	get_gateway_MAC();
	CALL	_get_gateway_MAC
;	.line	825; MainDemo.c	init_pool();
	CALL	_init_pool
;	.line	826; MainDemo.c	wait_network_data(gateway_MAC);
	MOVLW	HIGH(_main_gateway_MAC_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_main_gateway_MAC_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_wait_network_data
	MOVLW	0x03
	ADDWF	FSR1L, F
	RETURN	

; ; Starting pCode block
S_MainDemo__strlcpy	code
_strlcpy:
;	.line	1061; MainDemo.c	strlcpy(char *dst, const char *src, size_t siz)
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
;	.line	1063; MainDemo.c	char       *d = dst;
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
;	.line	1064; MainDemo.c	const char *s = src;
	MOVFF	r0x03, r0x0b
	MOVFF	r0x04, r0x0c
	MOVFF	r0x05, r0x0d
;	.line	1065; MainDemo.c	size_t      n = siz;
	MOVFF	r0x06, r0x0e
	MOVFF	r0x07, r0x0f
;	.line	1068; MainDemo.c	if (n != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00774_DS_
;	.line	1070; MainDemo.c	while (--n != 0)
	MOVFF	r0x03, r0x10
	MOVFF	r0x04, r0x11
	MOVFF	r0x05, r0x12
	MOVFF	r0x06, r0x13
	MOVFF	r0x07, r0x14
_00770_DS_:
	MOVLW	0xff
	ADDWF	r0x13, F
	BTFSS	STATUS, 0
	DECF	r0x14, F
	MOVF	r0x13, W
	IORWF	r0x14, W
	BZ	_00789_DS_
;	.line	1072; MainDemo.c	if ((*d++ = *s++) == '\0')
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
	BNZ	_00770_DS_
_00789_DS_:
;	.line	1073; MainDemo.c	break;
	MOVFF	r0x10, r0x0b
	MOVFF	r0x11, r0x0c
	MOVFF	r0x12, r0x0d
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x13, r0x0e
	MOVFF	r0x14, r0x0f
_00774_DS_:
;	.line	1078; MainDemo.c	if (n == 0)
	MOVF	r0x0e, W
	IORWF	r0x0f, W
	BNZ	_00781_DS_
;	.line	1080; MainDemo.c	if (siz != 0)
	MOVF	r0x06, W
	IORWF	r0x07, W
	BZ	_00788_DS_
;	.line	1081; MainDemo.c	*d = '\0';          /* NUL-terminate dst */
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
_00788_DS_:
;	.line	1082; MainDemo.c	while (*s++)
	MOVFF	r0x0b, r0x00
	MOVFF	r0x0c, r0x01
	MOVFF	r0x0d, r0x02
_00777_DS_:
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
	BNZ	_00777_DS_
	MOVFF	r0x00, r0x0b
	MOVFF	r0x01, r0x0c
	MOVFF	r0x02, r0x0d
_00781_DS_:
;	.line	1086; MainDemo.c	return (s - src - 1);       /* count does not include NUL */
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
;	.line	990; MainDemo.c	static void InitAppConfig(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	BANKSEL	(_AppConfig + 44)
;	.line	992; MainDemo.c	AppConfig.Flags.bIsDHCPEnabled = FALSE;
	BCF	(_AppConfig + 44), 6, B
	BANKSEL	(_AppConfig + 44)
;	.line	993; MainDemo.c	AppConfig.Flags.bInConfigMode = TRUE;
	BSF	(_AppConfig + 44), 7, B
	BANKSEL	(_AppConfig + 45)
;	.line	997; MainDemo.c	AppConfig.MyMACAddr.v[0] = 0;
	CLRF	(_AppConfig + 45), B
;	.line	998; MainDemo.c	AppConfig.MyMACAddr.v[1] = 0x04;
	MOVLW	0x04
	BANKSEL	(_AppConfig + 46)
	MOVWF	(_AppConfig + 46), B
;	.line	999; MainDemo.c	AppConfig.MyMACAddr.v[2] = 0xA3;
	MOVLW	0xa3
	BANKSEL	(_AppConfig + 47)
	MOVWF	(_AppConfig + 47), B
;	.line	1000; MainDemo.c	AppConfig.MyMACAddr.v[3] = 0x01;
	MOVLW	0x01
	BANKSEL	(_AppConfig + 48)
	MOVWF	(_AppConfig + 48), B
;	.line	1001; MainDemo.c	AppConfig.MyMACAddr.v[4] = 0x02;
	MOVLW	0x02
	BANKSEL	(_AppConfig + 49)
	MOVWF	(_AppConfig + 49), B
;	.line	1002; MainDemo.c	AppConfig.MyMACAddr.v[5] = 0x03;
	MOVLW	0x03
	BANKSEL	(_AppConfig + 50)
	MOVWF	(_AppConfig + 50), B
;	.line	1005; MainDemo.c	AppConfig.MyIPAddr.Val = MY_DEFAULT_IP_ADDR_BYTE1 | 
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
;	.line	1008; MainDemo.c	AppConfig.DefaultIPAddr.Val = AppConfig.MyIPAddr.Val;
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
;	.line	1009; MainDemo.c	AppConfig.MyMask.Val = MY_DEFAULT_MASK_BYTE1 | 
	SETF	(_AppConfig + 4), B
	BANKSEL	(_AppConfig + 5)
	SETF	(_AppConfig + 5), B
	BANKSEL	(_AppConfig + 6)
	SETF	(_AppConfig + 6), B
	BANKSEL	(_AppConfig + 7)
	CLRF	(_AppConfig + 7), B
;	.line	1012; MainDemo.c	AppConfig.DefaultMask.Val = AppConfig.MyMask.Val;
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
;	.line	1013; MainDemo.c	AppConfig.MyGateway.Val = MY_DEFAULT_GATE_BYTE1 | 
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
;	.line	1016; MainDemo.c	AppConfig.PrimaryDNSServer.Val = MY_DEFAULT_PRIMARY_DNS_BYTE1 | 
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
;	.line	1020; MainDemo.c	AppConfig.SecondaryDNSServer.Val = MY_DEFAULT_SECONDARY_DNS_BYTE1 | 
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
;	.line	934; MainDemo.c	static void InitializeBoard(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	937; MainDemo.c	LED0_TRIS = 0;  //LED0
	BCF	_TRISJbits, 0
;	.line	938; MainDemo.c	LED1_TRIS = 0;  //LED1
	BCF	_TRISJbits, 1
;	.line	939; MainDemo.c	LED2_TRIS = 0;  //LED2
	BCF	_TRISJbits, 2
;	.line	940; MainDemo.c	LED3_TRIS = 0;  //LED_LCD1
	BCF	_TRISGbits, 5
;	.line	941; MainDemo.c	LED4_TRIS = 0;  //LED_LCD2
	BCF	_TRISGbits, 5
;	.line	942; MainDemo.c	LED5_TRIS = 0;  //LED5=RELAY1
	BCF	_TRISGbits, 7
;	.line	943; MainDemo.c	LED6_TRIS = 0;  //LED7=RELAY2
	BCF	_TRISGbits, 6
;	.line	948; MainDemo.c	LED_PUT(0x00);  //turn off LED0 - LED2
	MOVLW	0xf8
	ANDWF	_LATJ, F
;	.line	949; MainDemo.c	RELAY_PUT(0x00); //turn relays off to save power
	MOVLW	0x3f
	ANDWF	_LATG, F
;	.line	955; MainDemo.c	OSCTUNE = 0x40;
	MOVLW	0x40
	MOVWF	_OSCTUNE
;	.line	962; MainDemo.c	if(OSCCONbits.IDLEN) //IDLEN = 0x80; 0x02 selects the primary clock
	BTFSS	_OSCCONbits, 7
	BRA	_00756_DS_
;	.line	963; MainDemo.c	OSCCON = 0x82;
	MOVLW	0x82
	MOVWF	_OSCCON
	BRA	_00757_DS_
_00756_DS_:
;	.line	965; MainDemo.c	OSCCON = 0x02;
	MOVLW	0x02
	MOVWF	_OSCCON
_00757_DS_:
;	.line	968; MainDemo.c	RCONbits.IPEN = 1;		// Enable interrupt priorities
	BSF	_RCONbits, 7
;	.line	969; MainDemo.c	INTCONbits.GIEH = 1;
	BSF	_INTCONbits, 7
;	.line	970; MainDemo.c	INTCONbits.GIEL = 1;
	BSF	_INTCONbits, 6
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__DisplayIPValue	code
_DisplayIPValue:
;	.line	876; MainDemo.c	void DisplayIPValue(DWORD IPdw) // 32 bits
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
;	.line	884; MainDemo.c	BYTE LCDPos=16;  //write on second line of LCD
	MOVLW	0x10
	MOVWF	r0x04
;	.line	889; MainDemo.c	for(i = 0; i < sizeof(IP_ADDR); i++) //sizeof(IP_ADDR) is 4
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
_00721_DS_:
	MOVLW	0x04
	SUBWF	r0x05, W
	BTFSC	STATUS, 0
	BRA	_00724_DS_
;	.line	892; MainDemo.c	IP_field =(WORD)(IPdw>>(i*8))&0xff;      //ML
	MOVFF	r0x00, r0x08
	MOVFF	r0x01, r0x09
	MOVFF	r0x02, r0x0a
	MOVFF	r0x03, r0x0b
	MOVF	r0x06, W
	BZ	_00742_DS_
	BN	_00745_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00743_DS_:
	RRCF	r0x0b, F
	RRCF	r0x0a, F
	RRCF	r0x09, F
	RRCF	r0x08, F
	ADDLW	0x01
	BNC	_00743_DS_
	BRA	_00742_DS_
_00745_DS_:
	BCF	STATUS, 0
_00744_DS_:
	RLCF	r0x08, F
	RLCF	r0x09, F
	RLCF	r0x0a, F
	RLCF	r0x0b, F
	ADDLW	0x01
	BNC	_00744_DS_
_00742_DS_:
	CLRF	r0x09
;	.line	893; MainDemo.c	uitoa(IP_field, IPDigit, radix);      //ML
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
;	.line	898; MainDemo.c	for(j = 0; j < strlen((char*)IPDigit); j++)
	MOVFF	r0x04, r0x08
	CLRF	r0x09
_00727_DS_:
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
	BNZ	_00747_DS_
	MOVF	r0x0a, W
	SUBWF	r0x0c, W
_00747_DS_:
	BC	_00739_DS_
;	.line	900; MainDemo.c	LCDText[LCDPos++] = IPDigit[j];
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
;	.line	898; MainDemo.c	for(j = 0; j < strlen((char*)IPDigit); j++)
	INCF	r0x09, F
	BRA	_00727_DS_
_00739_DS_:
	MOVFF	r0x08, r0x04
;	.line	902; MainDemo.c	if(i == sizeof(IP_ADDR)-1)
	MOVF	r0x05, W
	XORLW	0x03
	BZ	_00724_DS_
;	.line	904; MainDemo.c	LCDText[LCDPos++] = '.';
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
;	.line	889; MainDemo.c	for(i = 0; i < sizeof(IP_ADDR); i++) //sizeof(IP_ADDR) is 4
	MOVLW	0x08
	ADDWF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	INCF	r0x05, F
	BRA	_00721_DS_
_00724_DS_:
;	.line	907; MainDemo.c	if(LCDPos < 32u)
	MOVFF	r0x04, r0x00
	CLRF	r0x01
	MOVLW	0x00
	SUBWF	r0x01, W
	BNZ	_00750_DS_
	MOVLW	0x20
	SUBWF	r0x00, W
_00750_DS_:
	BC	_00726_DS_
;	.line	908; MainDemo.c	LCDText[LCDPos] = 0;
	CLRF	r0x00
	MOVLW	LOW(_LCDText)
	ADDWF	r0x04, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x00, F
	MOVFF	r0x04, FSR0L
	MOVFF	r0x00, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00726_DS_:
;	.line	909; MainDemo.c	LCDUpdate();
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
;	.line	861; MainDemo.c	void DisplayString(BYTE pos, char* text)
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
;	.line	863; MainDemo.c	BYTE l= strlen(text)+1;
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
;	.line	864; MainDemo.c	BYTE max= 32-pos;
	MOVF	r0x00, W
	SUBLW	0x20
	MOVWF	r0x05
;	.line	865; MainDemo.c	strlcpy((char*)&LCDText[pos], text,(l<max)?l:max );
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
	BNC	_00712_DS_
	MOVFF	r0x05, r0x04
_00712_DS_:
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
;	.line	866; MainDemo.c	LCDUpdate();
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
;	.line	839; MainDemo.c	void DisplayWORD(BYTE pos, WORD w) //WORD is a 16 bits unsigned
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
;	.line	847; MainDemo.c	ultoa(w, WDigit, radix);      
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
;	.line	848; MainDemo.c	for(j = 0; j < strlen((char*)WDigit); j++)
	CLRF	r0x01
_00693_DS_:
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
	BNZ	_00703_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00703_DS_:
	BC	_00696_DS_
;	.line	850; MainDemo.c	LCDText[LCDPos++] = WDigit[j];
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
;	.line	848; MainDemo.c	for(j = 0; j < strlen((char*)WDigit); j++)
	INCF	r0x01, F
	BRA	_00693_DS_
_00696_DS_:
;	.line	852; MainDemo.c	if(LCDPos < 32u)
	MOVFF	r0x00, r0x01
	CLRF	r0x02
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00704_DS_
	MOVLW	0x20
	SUBWF	r0x01, W
_00704_DS_:
	BC	_00692_DS_
;	.line	853; MainDemo.c	LCDText[LCDPos] = 0;
	CLRF	r0x01
	MOVLW	LOW(_LCDText)
	ADDWF	r0x00, F
	MOVLW	HIGH(_LCDText)
	ADDWFC	r0x01, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
_00692_DS_:
;	.line	854; MainDemo.c	LCDUpdate();
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
S_MainDemo__get_gateway_MAC	code
_get_gateway_MAC:
;	.line	785; MainDemo.c	void get_gateway_MAC(){
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
;	.line	790; MainDemo.c	for (i=0; i<100; i++) {
	CLRF	r0x00
	CLRF	r0x01
_00663_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00674_DS_
	MOVLW	0x64
	SUBWF	r0x00, W
_00674_DS_:
	BTFSC	STATUS, 0
	BRA	_00666_DS_
;	.line	791; MainDemo.c	StackTask();
	CALL	_StackTask
;	.line	792; MainDemo.c	ARPResolve(&AppConfig.MyGateway);
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
;	.line	793; MainDemo.c	for(j=0;j<5000; j++) {
	CLRF	r0x02
	CLRF	r0x03
_00659_DS_:
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x6d
	BNZ	_00675_DS_
	MOVLW	0x88
	SUBWF	r0x02, W
_00675_DS_:
	BTFSC	STATUS, 0
	BRA	_00665_DS_
;	.line	794; MainDemo.c	if(ARPIsResolved(&AppConfig.MyGateway, &gateway_MAC2)) {
	MOVLW	HIGH(_AppConfig + 8)
	MOVWF	r0x05
	MOVLW	LOW(_AppConfig + 8)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVLW	HIGH(_get_gateway_MAC_gateway_MAC2_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_get_gateway_MAC_gateway_MAC2_1_1)
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
	BZ	_00661_DS_
;	.line	795; MainDemo.c	memcpy(GATEWAY_MACA, &gateway_MAC2, 6);
	MOVLW	HIGH(_GATEWAY_MACA)
	MOVWF	r0x05
	MOVLW	LOW(_GATEWAY_MACA)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVLW	HIGH(_get_gateway_MAC_gateway_MAC2_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_get_gateway_MAC_gateway_MAC2_1_1)
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
;	.line	796; MainDemo.c	return;			
	BRA	_00667_DS_
_00661_DS_:
;	.line	793; MainDemo.c	for(j=0;j<5000; j++) {
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00659_DS_
_00665_DS_:
;	.line	790; MainDemo.c	for (i=0; i<100; i++) {
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00663_DS_
_00666_DS_:
;	.line	800; MainDemo.c	DisplayString(0, "GATEW ARP fail :'(");
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
_00667_DS_:
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
S_MainDemo__request_msg	code
_request_msg:
;	.line	755; MainDemo.c	void request_msg(BYTE *dhcp_header, int dhcp_header_length){
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
;	.line	760; MainDemo.c	UDPPut(DHCP_REQUEST_MESSAGE);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	762; MainDemo.c	i=0;
	CLRF	r0x05
	CLRF	r0x06
_00642_DS_:
;	.line	763; MainDemo.c	while(i<dhcp_header_length){
	MOVF	r0x06, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x04, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00650_DS_
	MOVF	r0x03, W
	SUBWF	r0x05, W
_00650_DS_:
	BTFSC	STATUS, 0
	BRA	_00644_DS_
;	.line	764; MainDemo.c	opt = dhcp_header[i];
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
;	.line	765; MainDemo.c	UDPPut(opt);
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	766; MainDemo.c	i++;
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
;	.line	767; MainDemo.c	length = dhcp_header[i];
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
;	.line	768; MainDemo.c	UDPPut(length);
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	769; MainDemo.c	i++;
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
;	.line	770; MainDemo.c	switch(opt){
	CLRF	r0x09
	MOVF	r0x07, W
	XORLW	0x36
	BNZ	_00651_DS_
	MOVF	r0x09, W
	BZ	_00652_DS_
_00651_DS_:
	BRA	_00640_DS_
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x07
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00652_DS_:
	BANKSEL	_activeUDPSocket
;	.line	772; MainDemo.c	UDPPutArray((BYTE*)&UDPSocketInfo[activeUDPSocket].remoteNode.IPAddr, length);
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
;	.line	773; MainDemo.c	break;
	BRA	_00641_DS_
_00640_DS_:
;	.line	775; MainDemo.c	UDPPutArray((BYTE*)&dhcp_header[i], length);   
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
_00641_DS_:
;	.line	778; MainDemo.c	i+=length;
	CLRF	r0x07
	MOVF	r0x08, W
	ADDWF	r0x05, F
	MOVF	r0x07, W
	ADDWFC	r0x06, F
	BRA	_00642_DS_
_00644_DS_:
;	.line	781; MainDemo.c	end_dhcp();
	CALL	_end_dhcp
;	.line	782; MainDemo.c	UDPFlush();
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
S_MainDemo__discover_msg	code
_discover_msg:
;	.line	738; MainDemo.c	void discover_msg(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	740; MainDemo.c	UDPPut(DHCP_DISCOVER_MESSAGE);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	742; MainDemo.c	UDPPut(DHCP_SERVER_IDENTIFIER);
	MOVLW	0x36
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	743; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	744; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
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
;	.line	746; MainDemo.c	UDPPut(DHCP_ROUTER);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	747; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	748; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
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
;	.line	750; MainDemo.c	end_dhcp();
	CALL	_end_dhcp
;	.line	752; MainDemo.c	UDPFlush();
	CALL	_UDPFlush
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__end_dhcp	code
_end_dhcp:
;	.line	730; MainDemo.c	void end_dhcp(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	731; MainDemo.c	UDPPut(DHCP_END_OPTION);
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
_00622_DS_:
;	.line	732; MainDemo.c	while(UDPTxCount < 300){
	MOVLW	0x01
	BANKSEL	(_UDPTxCount + 1)
	SUBWF	(_UDPTxCount + 1), W, B
	BNZ	_00629_DS_
	MOVLW	0x2c
	BANKSEL	_UDPTxCount
	SUBWF	_UDPTxCount, W, B
_00629_DS_:
	BC	_00624_DS_
;	.line	733; MainDemo.c	UDPPut(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
	BRA	_00622_DS_
_00624_DS_:
;	.line	735; MainDemo.c	LED6_IO = 0;
	BCF	_PORTGbits, 6
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__build_bootp	code
_build_bootp:
;	.line	700; MainDemo.c	void build_bootp(BOOTP_HEADER *bootp_header, UDP_SOCKET *my_socket){
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
_00611_DS_:
;	.line	703; MainDemo.c	while(!UDPIsPutReady(*my_socket));
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
	BZ	_00611_DS_
;	.line	705; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->MessageType, sizeof(BYTE));
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
;	.line	706; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->HardwareType, sizeof(BYTE));
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
;	.line	707; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->HardwareLen, sizeof(BYTE));
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
;	.line	708; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->Hops, sizeof(BYTE));
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
;	.line	709; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->TransactionID, sizeof(DWORD));
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
;	.line	710; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->SecondsElapsed, sizeof(WORD));
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
;	.line	711; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->BootpFlags, sizeof(WORD));
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
;	.line	712; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->ClientIP, sizeof(IP_ADDR));
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
;	.line	713; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->YourIP, sizeof(IP_ADDR));
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
;	.line	714; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->NextServerIP, sizeof(IP_ADDR));
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
;	.line	715; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
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
;	.line	716; MainDemo.c	UDPPutArray((BYTE*)&bootp_header->ClientMAC, sizeof(MAC_ADDR));
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
;	.line	718; MainDemo.c	for(i=0; i<202; i++){
	MOVLW	0xca
	MOVWF	r0x00
	CLRF	r0x01
_00616_DS_:
;	.line	719; MainDemo.c	UDPPut(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
	MOVLW	0xff
	ADDWF	r0x00, F
	BTFSS	STATUS, 0
	DECF	r0x01, F
;	.line	718; MainDemo.c	for(i=0; i<202; i++){
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_00616_DS_
;	.line	722; MainDemo.c	UDPPut(99);
	MOVLW	0x63
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	723; MainDemo.c	UDPPut(130);
	MOVLW	0x82
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	724; MainDemo.c	UDPPut(83);
	MOVLW	0x53
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	725; MainDemo.c	UDPPut(99);
	MOVLW	0x63
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	726; MainDemo.c	UDPPut(DHCP_MESSAGE_TYPE);
	MOVLW	0x35
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	727; MainDemo.c	UDPPut(DHCP_MESSAGE_TYPE_LEN);
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
S_MainDemo__handle_client_msg	code
_handle_client_msg:
;	.line	639; MainDemo.c	void handle_client_msg(UDP_SOCKET *socket_sendto_server,
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
;	.line	655; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket];   
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
;	.line	656; MainDemo.c	remote_node_MAC = &info->remoteNode.MACAddr;
	MOVF	r0x09, W
	ADDLW	0x04
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x0b, W
	MOVWF	r0x0e
;	.line	658; MainDemo.c	extract_bootp_header(&dhcp_type, &bootp_header, dhcp_header, &dhcp_header_length, socket_recv);
	MOVLW	HIGH(_handle_client_msg_dhcp_type_1_1)
	MOVWF	r0x10
	MOVLW	LOW(_handle_client_msg_dhcp_type_1_1)
	MOVWF	r0x0f
	MOVLW	0x80
	MOVWF	r0x11
	MOVLW	HIGH(_handle_client_msg_bootp_header_1_1)
	MOVWF	r0x13
	MOVLW	LOW(_handle_client_msg_bootp_header_1_1)
	MOVWF	r0x12
	MOVLW	0x80
	MOVWF	r0x14
	MOVLW	HIGH(_handle_client_msg_dhcp_header_1_1)
	MOVWF	r0x16
	MOVLW	LOW(_handle_client_msg_dhcp_header_1_1)
	MOVWF	r0x15
	MOVLW	0x80
	MOVWF	r0x17
	MOVLW	HIGH(_handle_client_msg_dhcp_header_length_1_1)
	MOVWF	r0x19
	MOVLW	LOW(_handle_client_msg_dhcp_header_length_1_1)
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
	CALL	_extract_bootp_header
	MOVLW	0x0f
	ADDWF	FSR1L, F
;	.line	659; MainDemo.c	UDPDiscard();
	CALL	_UDPDiscard
;	.line	661; MainDemo.c	switch(dhcp_type){
	MOVFF	_handle_client_msg_dhcp_type_1_1, r0x06
	CLRF	r0x07
	MOVF	r0x06, W
	XORLW	0x01
	BNZ	_00604_DS_
	MOVF	r0x07, W
	BZ	_00578_DS_
_00604_DS_:
	MOVF	r0x06, W
	XORLW	0x03
	BNZ	_00606_DS_
	MOVF	r0x07, W
	BNZ	_00606_DS_
	BRA	_00581_DS_
_00606_DS_:
	BRA	_00591_DS_
_00578_DS_:
;	.line	663; MainDemo.c	while(!UDPIsPutReady(*socket_sendto_server));
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
	BZ	_00578_DS_
;	.line	664; MainDemo.c	set_mac_to_dhcp_server();
	CALL	_set_mac_to_dhcp_server
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_activeUDPSocket
;	.line	665; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket];
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
;	.line	666; MainDemo.c	set_to_dhcp_ip(&info->remoteNode.IPAddr);
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_set_to_dhcp_ip
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	668; MainDemo.c	DisplayString(0, "DHCP DISCOVERY");
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
;	.line	669; MainDemo.c	build_bootp(&bootp_header, socket_sendto_server);
	MOVLW	HIGH(_handle_client_msg_bootp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_handle_client_msg_bootp_header_1_1)
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
	CALL	_build_bootp
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	670; MainDemo.c	discover_msg();
	CALL	_discover_msg
;	.line	671; MainDemo.c	break;
	BRA	_00593_DS_
_00581_DS_:
;	.line	673; MainDemo.c	DisplayString(0, "DHCP REQUEST");
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
;	.line	675; MainDemo.c	if(get_pool_el_mac(remote_node_MAC, &node_pool_state)){                
	MOVLW	HIGH(_handle_client_msg_node_pool_state_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_handle_client_msg_node_pool_state_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	CALL	_get_pool_el_mac
	MOVWF	r0x06
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x06, W
	BTFSC	STATUS, 2
	BRA	_00585_DS_
_00582_DS_:
;	.line	676; MainDemo.c	while(!UDPIsPutReady(*socket_sendto_client));
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
	BZ	_00582_DS_
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x06
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_activeUDPSocket
;	.line	677; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket]; 
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
;	.line	678; MainDemo.c	set_to_dhcp_ip(&info->remoteNode.IPAddr);
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_set_to_dhcp_ip
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	679; MainDemo.c	node_pool_state->client_deadline = RELAY_LEASE_TIME;
	MOVFF	_handle_client_msg_node_pool_state_1_1, r0x06
	MOVFF	(_handle_client_msg_node_pool_state_1_1 + 1), r0x07
	MOVFF	(_handle_client_msg_node_pool_state_1_1 + 2), r0x08
	MOVF	r0x06, W
	ADDLW	0x0a
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
;	.line	680; MainDemo.c	node_pool_state->miss_counter = 0;
	MOVF	r0x06, W
	ADDLW	0x12
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
;	.line	681; MainDemo.c	forgeBootpHeaderAck(&bootp_header, bootp_header.TransactionID, &bootp_header.ClientIP, &node_pool_state->ip, &node_pool_state->mac);
	MOVLW	HIGH(_handle_client_msg_bootp_header_1_1)
	MOVWF	r0x0d
	MOVLW	LOW(_handle_client_msg_bootp_header_1_1)
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
	MOVLW	HIGH(_handle_client_msg_bootp_header_1_1 + 12)
	MOVWF	r0x10
	MOVLW	LOW(_handle_client_msg_bootp_header_1_1 + 12)
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
	BANKSEL	(_handle_client_msg_bootp_header_1_1 + 7)
	MOVF	(_handle_client_msg_bootp_header_1_1 + 7), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_handle_client_msg_bootp_header_1_1 + 6)
	MOVF	(_handle_client_msg_bootp_header_1_1 + 6), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_handle_client_msg_bootp_header_1_1 + 5)
	MOVF	(_handle_client_msg_bootp_header_1_1 + 5), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_handle_client_msg_bootp_header_1_1 + 4)
	MOVF	(_handle_client_msg_bootp_header_1_1 + 4), W, B
	MOVWF	POSTDEC1
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	CALL	_forgeBootpHeaderAck
	MOVLW	0x10
	ADDWF	FSR1L, F
;	.line	682; MainDemo.c	transfer_msg_to_client(&bootp_header, socket_sendto_client, DHCP_ACK_MESSAGE);
	MOVLW	HIGH(_handle_client_msg_bootp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_handle_client_msg_bootp_header_1_1)
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
	CALL	_transfer_msg_to_client
	MOVLW	0x07
	ADDWF	FSR1L, F
	BRA	_00593_DS_
_00585_DS_:
;	.line	686; MainDemo.c	while(!UDPIsPutReady(*socket_sendto_server));
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
	BZ	_00585_DS_
;	.line	687; MainDemo.c	set_mac_to_dhcp_server();
	CALL	_set_mac_to_dhcp_server
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x03
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_activeUDPSocket
;	.line	688; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket];             
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
;	.line	689; MainDemo.c	set_to_dhcp_ip(&info->remoteNode.IPAddr);
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_set_to_dhcp_ip
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	690; MainDemo.c	build_bootp(&bootp_header, socket_sendto_server);
	MOVLW	HIGH(_handle_client_msg_bootp_header_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_handle_client_msg_bootp_header_1_1)
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
	CALL	_build_bootp
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	691; MainDemo.c	request_msg(dhcp_header, dhcp_header_length);
	MOVLW	HIGH(_handle_client_msg_dhcp_header_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_handle_client_msg_dhcp_header_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	BANKSEL	(_handle_client_msg_dhcp_header_length_1_1 + 1)
	MOVF	(_handle_client_msg_dhcp_header_length_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_handle_client_msg_dhcp_header_length_1_1
	MOVF	_handle_client_msg_dhcp_header_length_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_request_msg
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	693; MainDemo.c	break;
	BRA	_00593_DS_
_00591_DS_:
;	.line	695; MainDemo.c	DisplayString(0, "Unknw DHCP type");
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
_00593_DS_:
;	.line	697; MainDemo.c	}
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
S_MainDemo__set_mac_to_dhcp_server	code
_set_mac_to_dhcp_server:
;	.line	627; MainDemo.c	void set_mac_to_dhcp_server(){
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
;	.line	631; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket];
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
;	.line	633; MainDemo.c	remote_node_MAC = &info->remoteNode.MACAddr;
	MOVLW	0x04
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
;	.line	635; MainDemo.c	for (i=0; i<sizeof(MAC_ADDR); i++)
	CLRF	r0x03
	CLRF	r0x04
_00563_DS_:
	MOVF	r0x04, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00572_DS_
	MOVLW	0x06
	SUBWF	r0x03, W
_00572_DS_:
	BC	_00567_DS_
;	.line	636; MainDemo.c	remote_node_MAC->v[i] = GATEWAY_MACA[i];
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
	MOVLW	LOW(_GATEWAY_MACA)
	ADDWF	r0x03, W
	MOVWF	r0x08
	MOVLW	HIGH(_GATEWAY_MACA)
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
;	.line	635; MainDemo.c	for (i=0; i<sizeof(MAC_ADDR); i++)
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BRA	_00563_DS_
_00567_DS_:
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
S_MainDemo__transfer_msg_to_client	code
_transfer_msg_to_client:
;	.line	570; MainDemo.c	void transfer_msg_to_client(BOOTP_HEADER *bootp_header, UDP_SOCKET *my_socket, BYTE type) {
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
_00528_DS_:
;	.line	576; MainDemo.c	while(!UDPIsPutReady(*my_socket));
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
	BZ	_00528_DS_
; ;multiply lit val:0x0e by variable _activeUDPSocket and store in r0x07
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	BANKSEL	_activeUDPSocket
;	.line	578; MainDemo.c	info = &UDPSocketInfo[activeUDPSocket];
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
;	.line	579; MainDemo.c	for(i=0; i<4; i++){
	CLRF	r0x0a
	CLRF	r0x0b
_00531_DS_:
	MOVF	r0x0b, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00556_DS_
	MOVLW	0x04
	SUBWF	r0x0a, W
_00556_DS_:
	BC	_00534_DS_
;	.line	580; MainDemo.c	info->remoteNode.IPAddr.v[i] = 255;
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
;	.line	579; MainDemo.c	for(i=0; i<4; i++){
	INCF	r0x0a, F
	BTFSC	STATUS, 0
	INCF	r0x0b, F
	BRA	_00531_DS_
_00534_DS_:
;	.line	583; MainDemo.c	info->remotePort = DHCP_CLIENT_PORT;
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
;	.line	586; MainDemo.c	for (i=0; i<sizeof(IP_ADDR); i++) {
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
_00535_DS_:
	MOVF	r0x0e, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00557_DS_
	MOVLW	0x04
	SUBWF	r0x0d, W
_00557_DS_:
	BC	_00538_DS_
;	.line	587; MainDemo.c	info->remoteNode.MACAddr.v[i] = bootp_header->ClientMAC.v[i];
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
;	.line	586; MainDemo.c	for (i=0; i<sizeof(IP_ADDR); i++) {
	INCF	r0x0d, F
	BTFSC	STATUS, 0
	INCF	r0x0e, F
	BRA	_00535_DS_
_00538_DS_:
;	.line	590; MainDemo.c	build_bootp(bootp_header, my_socket);
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
	CALL	_build_bootp
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	591; MainDemo.c	UDPPut(type);	
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	594; MainDemo.c	UDPPut(DHCP_SUBNET_MASK);
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	595; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	596; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyMask, sizeof(IP_ADDR));
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
;	.line	599; MainDemo.c	UDPPut(DHCP_BROADCAST);
	MOVLW	0x1c
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	600; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	601; MainDemo.c	for(i=0; i<sizeof(IP_ADDR); i++){
	CLRF	r0x00
	CLRF	r0x01
_00539_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00558_DS_
	MOVLW	0x04
	SUBWF	r0x00, W
_00558_DS_:
	BC	_00542_DS_
;	.line	602; MainDemo.c	broadcast.v[i] = (AppConfig.MyIPAddr.v[i] & AppConfig.MyMask.v[i]) | ~AppConfig.MyMask.v[i];
	MOVLW	LOW(_transfer_msg_to_client_broadcast_1_1)
	ADDWF	r0x00, W
	MOVWF	r0x02
	MOVLW	HIGH(_transfer_msg_to_client_broadcast_1_1)
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
;	.line	601; MainDemo.c	for(i=0; i<sizeof(IP_ADDR); i++){
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00539_DS_
_00542_DS_:
;	.line	604; MainDemo.c	UDPPutArray((BYTE*)&broadcast, sizeof(IP_ADDR));
	MOVLW	HIGH(_transfer_msg_to_client_broadcast_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_transfer_msg_to_client_broadcast_1_1)
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
;	.line	607; MainDemo.c	UDPPut(DHCP_ROUTER);
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	608; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	609; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyGateway, sizeof(IP_ADDR));
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
;	.line	611; MainDemo.c	lease_time = RELAY_LEASE_TIME;
	MOVLW	0x2c
	BANKSEL	_transfer_msg_to_client_lease_time_1_1
	MOVWF	_transfer_msg_to_client_lease_time_1_1, B
	MOVLW	0x01
	BANKSEL	(_transfer_msg_to_client_lease_time_1_1 + 1)
	MOVWF	(_transfer_msg_to_client_lease_time_1_1 + 1), B
;	.line	612; MainDemo.c	UDPPut(DHCP_IP_LEASE_TIME);
	MOVLW	0x33
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	613; MainDemo.c	UDPPut(4);
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	614; MainDemo.c	UDPPut(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	615; MainDemo.c	UDPPut(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	616; MainDemo.c	UDPPutArrayInvert((BYTE*)&lease_time, 2);
	MOVLW	HIGH(_transfer_msg_to_client_lease_time_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_transfer_msg_to_client_lease_time_1_1)
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
;	.line	619; MainDemo.c	UDPPut(DHCP_SERVER_IDENTIFIER);
	MOVLW	0x36
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	620; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	621; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
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
;	.line	622; MainDemo.c	end_dhcp();
	CALL	_end_dhcp
;	.line	623; MainDemo.c	UDPFlush();
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
S_MainDemo__UDPPutArrayInvert	code
_UDPPutArrayInvert:
;	.line	562; MainDemo.c	void UDPPutArrayInvert(BYTE *val, int len)
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
;	.line	565; MainDemo.c	for(i = 0; i < len; i++)
	CLRF	r0x05
	CLRF	r0x06
_00514_DS_:
	MOVF	r0x06, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x04, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00523_DS_
	MOVF	r0x03, W
	SUBWF	r0x05, W
_00523_DS_:
	BC	_00518_DS_
;	.line	566; MainDemo.c	UDPPut(val[len-i-1]);
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
;	.line	565; MainDemo.c	for(i = 0; i < len; i++)
	INCF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	BRA	_00514_DS_
_00518_DS_:
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
S_MainDemo__forgeBootpHeaderAck	code
_forgeBootpHeaderAck:
;	.line	556; MainDemo.c	void forgeBootpHeaderAck(BOOTP_HEADER *bootp_header, DWORD transactionId, IP_ADDR *clientIP, IP_ADDR *yourIP, MAC_ADDR	*clientMAC)
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
;	.line	558; MainDemo.c	bootp_header->MessageType = BOOT_REPLY;
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	559; MainDemo.c	forgeBootpHeader(bootp_header, transactionId, clientIP, yourIP, clientMAC);
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
	CALL	_forgeBootpHeader
	MOVLW	0x10
	ADDWF	FSR1L, F
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
S_MainDemo__forgeBootpHeaderRequest	code
_forgeBootpHeaderRequest:
;	.line	550; MainDemo.c	void forgeBootpHeaderRequest(BOOTP_HEADER *bootp_header, DWORD transactionId, IP_ADDR *clientIP, IP_ADDR *yourIP, MAC_ADDR	*clientMAC)
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
;	.line	552; MainDemo.c	bootp_header->MessageType = BOOT_REQUEST;
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	553; MainDemo.c	forgeBootpHeader(bootp_header, transactionId, clientIP, yourIP, clientMAC);
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
	CALL	_forgeBootpHeader
	MOVLW	0x10
	ADDWF	FSR1L, F
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
S_MainDemo__forgeBootpHeader	code
_forgeBootpHeader:
;	.line	535; MainDemo.c	void forgeBootpHeader(BOOTP_HEADER *bootp_header, DWORD transactionId, IP_ADDR *clientIP, IP_ADDR *yourIP, MAC_ADDR	*clientMAC){
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
;	.line	537; MainDemo.c	bootp_header->HardwareType = BOOT_HW_TYPE;
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
;	.line	538; MainDemo.c	bootp_header->HardwareLen = BOOT_LEN_OF_HW_TYPE;
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
;	.line	539; MainDemo.c	bootp_header->Hops = 1;
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
;	.line	540; MainDemo.c	bootp_header->TransactionID = transactionId;
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
;	.line	541; MainDemo.c	bootp_header->SecondsElapsed = 0;
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
;	.line	542; MainDemo.c	bootp_header->BootpFlags = 0;
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
;	.line	543; MainDemo.c	memcpy(&bootp_header->ClientIP, clientIP, sizeof(IP_ADDR));
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
;	.line	544; MainDemo.c	memcpy(&bootp_header->YourIP, yourIP, sizeof(IP_ADDR));
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
;	.line	545; MainDemo.c	memset((void*)&bootp_header->NextServerIP, 0, sizeof(IP_ADDR));
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
;	.line	546; MainDemo.c	memset((void*)&bootp_header->RelayAgentIP, 42, sizeof(IP_ADDR));
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
;	.line	547; MainDemo.c	memcpy(&bootp_header->ClientMAC, clientMAC->v, sizeof(MAC_ADDR));
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
S_MainDemo__handle_server_msg	code
_handle_server_msg:
;	.line	499; MainDemo.c	void handle_server_msg(UDP_SOCKET *socket_sendto_client, UDP_SOCKET *socket_recv){
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
;	.line	508; MainDemo.c	extract_bootp_header(&dhcp_type, &bootp_header, dhcp_header, &dhcp_header_length, socket_recv);
	MOVLW	HIGH(_handle_server_msg_dhcp_type_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_handle_server_msg_dhcp_type_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_handle_server_msg_bootp_header_1_1)
	MOVWF	r0x0a
	MOVLW	LOW(_handle_server_msg_bootp_header_1_1)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVLW	HIGH(_handle_server_msg_dhcp_header_1_1)
	MOVWF	r0x0d
	MOVLW	LOW(_handle_server_msg_dhcp_header_1_1)
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
	MOVLW	HIGH(_handle_server_msg_dhcp_header_length_1_1)
	MOVWF	r0x10
	MOVLW	LOW(_handle_server_msg_dhcp_header_length_1_1)
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
	CALL	_extract_bootp_header
	MOVLW	0x0f
	ADDWF	FSR1L, F
;	.line	509; MainDemo.c	UDPDiscard();
	CALL	_UDPDiscard
;	.line	511; MainDemo.c	switch(dhcp_type){
	MOVFF	_handle_server_msg_dhcp_type_1_1, r0x03
	CLRF	r0x04
	MOVF	r0x03, W
	XORLW	0x02
	BNZ	_00492_DS_
	MOVF	r0x04, W
	BZ	_00480_DS_
_00492_DS_:
	MOVF	r0x03, W
	XORLW	0x05
	BNZ	_00494_DS_
	MOVF	r0x04, W
	BZ	_00481_DS_
_00494_DS_:
	BRA	_00484_DS_
_00480_DS_:
;	.line	513; MainDemo.c	DisplayString(0, "DHCP OFFER");
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
;	.line	514; MainDemo.c	transfer_msg_to_client(&bootp_header, socket_sendto_client, dhcp_type);
	MOVLW	HIGH(_handle_server_msg_bootp_header_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_handle_server_msg_bootp_header_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	BANKSEL	_handle_server_msg_dhcp_type_1_1
	MOVF	_handle_server_msg_dhcp_type_1_1, W, B
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
	CALL	_transfer_msg_to_client
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	515; MainDemo.c	break;
	BRA	_00486_DS_
_00481_DS_:
;	.line	518; MainDemo.c	DisplayString(0, "DHCP ACK");
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
;	.line	519; MainDemo.c	get_ack_lease_time(&lease_time, dhcp_header, dhcp_header_length);
	MOVLW	HIGH(_handle_server_msg_lease_time_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_handle_server_msg_lease_time_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_handle_server_msg_dhcp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_handle_server_msg_dhcp_header_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	BANKSEL	(_handle_server_msg_dhcp_header_length_1_1 + 1)
	MOVF	(_handle_server_msg_dhcp_header_length_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_handle_server_msg_dhcp_header_length_1_1
	MOVF	_handle_server_msg_dhcp_header_length_1_1, W, B
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
	CALL	_get_ack_lease_time
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	520; MainDemo.c	nb_miss = 0;
	CLRF	r0x03
	CLRF	r0x04
;	.line	521; MainDemo.c	if(get_pool_el_mac(&bootp_header.ClientMAC, &node_pool_state)){
	MOVLW	HIGH(_handle_server_msg_bootp_header_1_1 + 28)
	MOVWF	r0x06
	MOVLW	LOW(_handle_server_msg_bootp_header_1_1 + 28)
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
	MOVLW	HIGH(_handle_server_msg_node_pool_state_1_1)
	MOVWF	r0x09
	MOVLW	LOW(_handle_server_msg_node_pool_state_1_1)
	MOVWF	r0x08
	MOVLW	0x80
	MOVWF	r0x0a
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
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_get_pool_el_mac
	MOVWF	r0x05
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x05, W
	BZ	_00483_DS_
;	.line	522; MainDemo.c	nb_miss = node_pool_state->miss_counter;
	MOVFF	_handle_server_msg_node_pool_state_1_1, r0x05
	MOVFF	(_handle_server_msg_node_pool_state_1_1 + 1), r0x06
	MOVFF	(_handle_server_msg_node_pool_state_1_1 + 2), r0x07
	MOVF	r0x05, W
	ADDLW	0x12
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0a
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrget2
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
;	.line	523; MainDemo.c	remove_from_pool(&node_pool_state->ip);
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_remove_from_pool
	MOVLW	0x03
	ADDWF	FSR1L, F
_00483_DS_:
;	.line	525; MainDemo.c	add_to_pool((IP_ADDR*)&bootp_header.YourIP, &bootp_header.ClientMAC, lease_time, nb_miss);    
	MOVLW	HIGH(_handle_server_msg_bootp_header_1_1 + 16)
	MOVWF	r0x06
	MOVLW	LOW(_handle_server_msg_bootp_header_1_1 + 16)
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
	MOVLW	HIGH(_handle_server_msg_bootp_header_1_1 + 28)
	MOVWF	r0x09
	MOVLW	LOW(_handle_server_msg_bootp_header_1_1 + 28)
	MOVWF	r0x08
	MOVLW	0x80
	MOVWF	r0x0a
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	BANKSEL	(_handle_server_msg_lease_time_1_1 + 3)
	MOVF	(_handle_server_msg_lease_time_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_handle_server_msg_lease_time_1_1 + 2)
	MOVF	(_handle_server_msg_lease_time_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_handle_server_msg_lease_time_1_1 + 1)
	MOVF	(_handle_server_msg_lease_time_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_handle_server_msg_lease_time_1_1
	MOVF	_handle_server_msg_lease_time_1_1, W, B
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
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_add_to_pool
	MOVLW	0x0c
	ADDWF	FSR1L, F
;	.line	526; MainDemo.c	transfer_msg_to_client(&bootp_header, socket_sendto_client, dhcp_type);
	MOVLW	HIGH(_handle_server_msg_bootp_header_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_handle_server_msg_bootp_header_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	BANKSEL	_handle_server_msg_dhcp_type_1_1
	MOVF	_handle_server_msg_dhcp_type_1_1, W, B
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
	CALL	_transfer_msg_to_client
	MOVLW	0x07
	ADDWF	FSR1L, F
;	.line	527; MainDemo.c	break;
	BRA	_00486_DS_
_00484_DS_:
;	.line	530; MainDemo.c	DisplayString(0, "DISCARDED handle server");
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
_00486_DS_:
;	.line	532; MainDemo.c	}
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
S_MainDemo__get_ack_lease_time	code
_get_ack_lease_time:
;	.line	478; MainDemo.c	BOOL get_ack_lease_time(DWORD *lease_time, BYTE *dhcp_header, unsigned int dhcp_header_length){
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
;	.line	482; MainDemo.c	i=0;
	CLRF	r0x08
	CLRF	r0x09
_00465_DS_:
;	.line	484; MainDemo.c	while(i<dhcp_header_length){
	MOVFF	r0x08, r0x0a
	MOVFF	r0x09, r0x0b
	MOVF	r0x07, W
	SUBWF	r0x0b, W
	BNZ	_00473_DS_
	MOVF	r0x06, W
	SUBWF	r0x0a, W
_00473_DS_:
	BTFSC	STATUS, 0
	BRA	_00467_DS_
;	.line	485; MainDemo.c	opt = dhcp_header[i];
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
;	.line	486; MainDemo.c	i++;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	487; MainDemo.c	length = dhcp_header[i];
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
;	.line	488; MainDemo.c	i++;
	INCF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
;	.line	490; MainDemo.c	if(opt == DHCP_IP_LEASE_TIME){
	CLRF	r0x0c
	MOVF	r0x0a, W
	XORLW	0x33
	BNZ	_00474_DS_
	MOVF	r0x0c, W
	BZ	_00475_DS_
_00474_DS_:
	BRA	_00464_DS_
_00475_DS_:
;	.line	491; MainDemo.c	*lease_time = dhcp_header[i+3]|dhcp_header[i+2]<<8|dhcp_header[i+1]<<16|dhcp_header[i]<<24;
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
;	.line	492; MainDemo.c	return TRUE;
	MOVLW	0x01
	BRA	_00468_DS_
_00464_DS_:
;	.line	494; MainDemo.c	i+=length;
	CLRF	r0x0a
	MOVF	r0x0b, W
	ADDWF	r0x08, F
	MOVF	r0x0a, W
	ADDWFC	r0x09, F
	BRA	_00465_DS_
_00467_DS_:
;	.line	496; MainDemo.c	return FALSE;    
	CLRF	WREG
_00468_DS_:
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
S_MainDemo__extract_bootp_header	code
_extract_bootp_header:
;	.line	430; MainDemo.c	BOOL extract_bootp_header(BYTE *dhcp_type, BOOTP_HEADER *bootp_header,
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
_00413_DS_:
;	.line	442; MainDemo.c	while(!UDPIsGetReady(*my_socket_recv));
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
	BZ	_00413_DS_
;	.line	444; MainDemo.c	UDPGetArray((BYTE*)bootp_header, sizeof(BOOTP_HEADER)); //Read 34bytes
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
;	.line	446; MainDemo.c	if(bootp_header->HardwareType != 1 || bootp_header->HardwareLen != 6){
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
	BNZ	_00416_DS_
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
	BZ	_00440_DS_
_00416_DS_:
;	.line	447; MainDemo.c	return FALSE;
	CLRF	WREG
	BRA	_00434_DS_
_00440_DS_:
;	.line	451; MainDemo.c	for(i=0; i<zero_to_skip; i++){ // On skip 202 bytes -> 192 + 10
	CLRF	r0x03
	CLRF	r0x04
_00430_DS_:
	MOVLW	0x00
	SUBWF	r0x04, W
	BNZ	_00452_DS_
	MOVLW	0xca
	SUBWF	r0x03, W
_00452_DS_:
	BC	_00433_DS_
;	.line	452; MainDemo.c	UDPGet(&opt);
	MOVLW	HIGH(_extract_bootp_header_opt_1_1)
	MOVWF	r0x0c
	MOVLW	LOW(_extract_bootp_header_opt_1_1)
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
;	.line	451; MainDemo.c	for(i=0; i<zero_to_skip; i++){ // On skip 202 bytes -> 192 + 10
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BRA	_00430_DS_
_00433_DS_:
;	.line	455; MainDemo.c	UDPGetArray((BYTE*)&word_buf, sizeof(DWORD));
	MOVLW	HIGH(_extract_bootp_header_word_buf_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_extract_bootp_header_word_buf_1_1)
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
	BANKSEL	_extract_bootp_header_word_buf_1_1
;	.line	456; MainDemo.c	if(word_buf != magic_cookie){
	MOVF	_extract_bootp_header_word_buf_1_1, W, B
	XORLW	0x63
	BNZ	_00454_DS_
	BANKSEL	(_extract_bootp_header_word_buf_1_1 + 1)
	MOVF	(_extract_bootp_header_word_buf_1_1 + 1), W, B
	XORLW	0x82
	BNZ	_00454_DS_
	BANKSEL	(_extract_bootp_header_word_buf_1_1 + 2)
	MOVF	(_extract_bootp_header_word_buf_1_1 + 2), W, B
	XORLW	0x53
	BNZ	_00454_DS_
	BANKSEL	(_extract_bootp_header_word_buf_1_1 + 3)
	MOVF	(_extract_bootp_header_word_buf_1_1 + 3), W, B
	XORLW	0x63
	BZ	_00420_DS_
_00454_DS_:
;	.line	457; MainDemo.c	return FALSE;
	CLRF	WREG
	BRA	_00434_DS_
_00420_DS_:
;	.line	460; MainDemo.c	*dhcp_header_size = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrput2
;	.line	461; MainDemo.c	wrong_packet = TRUE;
	MOVLW	0x01
	MOVWF	r0x03
_00427_DS_:
;	.line	462; MainDemo.c	while(UDPGet(&opt) && opt != DHCP_END_OPTION){
	MOVLW	HIGH(_extract_bootp_header_opt_1_1)
	MOVWF	r0x05
	MOVLW	LOW(_extract_bootp_header_opt_1_1)
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
	BRA	_00429_DS_
	MOVFF	_extract_bootp_header_opt_1_1, r0x04
	CLRF	r0x05
	MOVF	r0x04, W
	XORLW	0xff
	BNZ	_00456_DS_
	MOVF	r0x05, W
	BNZ	_00456_DS_
	BRA	_00429_DS_
_00456_DS_:
;	.line	463; MainDemo.c	UDPGet(&length);
	MOVLW	HIGH(_extract_bootp_header_length_1_1)
	MOVWF	r0x05
	MOVLW	LOW(_extract_bootp_header_length_1_1)
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
;	.line	464; MainDemo.c	if(opt == DHCP_MESSAGE_TYPE){
	MOVFF	_extract_bootp_header_opt_1_1, r0x04
	CLRF	r0x05
	MOVF	r0x04, W
	XORLW	0x35
	BNZ	_00457_DS_
	MOVF	r0x05, W
	BZ	_00458_DS_
_00457_DS_:
	BRA	_00424_DS_
_00458_DS_:
;	.line	465; MainDemo.c	UDPGet(dhcp_type);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_UDPGet
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	466; MainDemo.c	wrong_packet = FALSE;
	CLRF	r0x03
	BRA	_00427_DS_
_00424_DS_:
;	.line	468; MainDemo.c	else if(dhcp_header != NULL){
	MOVF	r0x06, W
	IORWF	r0x07, W
	IORWF	r0x08, W
	BTFSC	STATUS, 2
	BRA	_00427_DS_
;	.line	469; MainDemo.c	dhcp_header[*dhcp_header_size] = opt;
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
	MOVFF	_extract_bootp_header_opt_1_1, POSTDEC1
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput1
;	.line	470; MainDemo.c	dhcp_header[*dhcp_header_size+1] = length;
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
	MOVFF	_extract_bootp_header_length_1_1, POSTDEC1
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrput1
;	.line	471; MainDemo.c	UDPGetArray(&dhcp_header[*dhcp_header_size+2], length);
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
	MOVFF	_extract_bootp_header_length_1_1, r0x0d
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
;	.line	472; MainDemo.c	*dhcp_header_size += 2+length;
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget2
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	_extract_bootp_header_length_1_1, r0x0c
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
	BRA	_00427_DS_
_00429_DS_:
;	.line	475; MainDemo.c	return !wrong_packet;
	MOVF	r0x03, W
	BSF	STATUS, 0
	TSTFSZ	WREG
	BCF	STATUS, 0
	CLRF	r0x03
	RLCF	r0x03, F
	MOVF	r0x03, W
_00434_DS_:
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
S_MainDemo__wait_network_data	code
_wait_network_data:
;	.line	392; MainDemo.c	void wait_network_data(BYTE *gateway_MAC){
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
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
;	.line	400; MainDemo.c	set_to_dhcp_ip(&dhcp_server_ip);
	MOVLW	HIGH(_wait_network_data_dhcp_server_ip_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_wait_network_data_dhcp_server_ip_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_set_to_dhcp_ip
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	402; MainDemo.c	socket_sendto_server = UDPOpen(0, NULL, 67);
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
	MOVWF	r0x03
	MOVLW	0x07
	ADDWF	FSR1L, F
	MOVFF	r0x03, _wait_network_data_socket_sendto_server_1_1
;	.line	403; MainDemo.c	socket_recv = UDPOpen(67, NULL, 0);
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
	MOVWF	r0x04
	MOVLW	0x07
	ADDWF	FSR1L, F
	MOVFF	r0x04, _wait_network_data_socket_recv_1_1
;	.line	404; MainDemo.c	socket_sendto_client = UDPOpen(0, NULL, 68);
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
	MOVWF	r0x05
	MOVLW	0x07
	ADDWF	FSR1L, F
	MOVFF	r0x05, _wait_network_data_socket_sendto_client_1_1
;	.line	406; MainDemo.c	if(socket_sendto_server == INVALID_UDP_SOCKET ||
	CLRF	r0x06
	MOVF	r0x03, W
	XORLW	0xff
	BNZ	_00404_DS_
	MOVF	r0x06, W
	BZ	_00384_DS_
_00404_DS_:
;	.line	407; MainDemo.c	socket_recv == INVALID_UDP_SOCKET ||
	CLRF	r0x03
	MOVF	r0x04, W
	XORLW	0xff
	BNZ	_00406_DS_
	MOVF	r0x03, W
	BZ	_00384_DS_
_00406_DS_:
;	.line	408; MainDemo.c	socket_sendto_client == INVALID_UDP_SOCKET){
	CLRF	r0x03
	MOVF	r0x05, W
	XORLW	0xff
	BNZ	_00407_DS_
	MOVF	r0x03, W
	BZ	_00384_DS_
_00407_DS_:
	BRA	_00385_DS_
_00384_DS_:
;	.line	410; MainDemo.c	DisplayString (0,"invalid socket");
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
;	.line	411; MainDemo.c	return;
	BRA	_00396_DS_
_00385_DS_:
;	.line	413; MainDemo.c	LED0_IO = 1; //DEBUG
	BSF	_LATJbits, 0
_00394_DS_:
;	.line	416; MainDemo.c	time_action(&socket_sendto_server);
	MOVLW	HIGH(_wait_network_data_socket_sendto_server_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_wait_network_data_socket_sendto_server_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_time_action
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	417; MainDemo.c	StackTaskHelp(&last_ip);
	MOVLW	HIGH(_wait_network_data_last_ip_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_wait_network_data_last_ip_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_StackTaskHelp
	MOVLW	0x03
	ADDWF	FSR1L, F
	BANKSEL	_wait_network_data_socket_recv_1_1
;	.line	419; MainDemo.c	if(count = UDPIsGetReady(socket_recv)){
	MOVF	_wait_network_data_socket_recv_1_1, W, B
	MOVWF	POSTDEC1
	CALL	_UDPIsGetReady
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	INCF	FSR1L, F
	MOVF	r0x03, W
	IORWF	r0x04, W
	BZ	_00394_DS_
;	.line	420; MainDemo.c	if(ip_cmp(&last_ip, &dhcp_server_ip)){
	MOVLW	HIGH(_wait_network_data_last_ip_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_wait_network_data_last_ip_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_wait_network_data_dhcp_server_ip_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_wait_network_data_dhcp_server_ip_1_1)
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
	CALL	_ip_cmp
	MOVWF	r0x03
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x03, W
	BZ	_00389_DS_
;	.line	421; MainDemo.c	handle_server_msg(&socket_sendto_client, &socket_recv);
	MOVLW	HIGH(_wait_network_data_socket_sendto_client_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_wait_network_data_socket_sendto_client_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_wait_network_data_socket_recv_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_wait_network_data_socket_recv_1_1)
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
	CALL	_handle_server_msg
	MOVLW	0x06
	ADDWF	FSR1L, F
	BRA	_00394_DS_
_00389_DS_:
;	.line	424; MainDemo.c	handle_client_msg(&socket_sendto_server, &socket_sendto_client, &socket_recv, gateway_MAC, &last_ip);
	MOVLW	HIGH(_wait_network_data_socket_sendto_server_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_wait_network_data_socket_sendto_server_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_wait_network_data_socket_sendto_client_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_wait_network_data_socket_sendto_client_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_wait_network_data_socket_recv_1_1)
	MOVWF	r0x0a
	MOVLW	LOW(_wait_network_data_socket_recv_1_1)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVLW	HIGH(_wait_network_data_last_ip_1_1)
	MOVWF	r0x0d
	MOVLW	LOW(_wait_network_data_last_ip_1_1)
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
	MOVF	r0x0e, W
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
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
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	CALL	_handle_client_msg
	MOVLW	0x0f
	ADDWF	FSR1L, F
	BRA	_00394_DS_
_00396_DS_:
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
S_MainDemo__send_release	code
_send_release:
;	.line	375; MainDemo.c	void send_release(UDP_SOCKET *socket_sendto_server, IP_ADDR *ip, MAC_ADDR *mac){
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
	MOVLW	0x08
	MOVFF	PLUSW2, r0x06
	MOVLW	0x09
	MOVFF	PLUSW2, r0x07
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x08
_00376_DS_:
;	.line	377; MainDemo.c	while(!UDPIsPutReady(*socket_sendto_server));
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x09
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_UDPIsPutReady
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	INCF	FSR1L, F
	MOVF	r0x09, W
	IORWF	r0x0a, W
	BZ	_00376_DS_
;	.line	378; MainDemo.c	set_mac_to_dhcp_server();
	CALL	_set_mac_to_dhcp_server
;	.line	379; MainDemo.c	forgeBootpHeaderAck(&bootp_header, 0, ip, ip, mac);
	MOVLW	HIGH(_send_release_bootp_header_1_1)
	MOVWF	r0x0a
	MOVLW	LOW(_send_release_bootp_header_1_1)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
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
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_forgeBootpHeaderAck
	MOVLW	0x10
	ADDWF	FSR1L, F
;	.line	380; MainDemo.c	build_bootp(&bootp_header, socket_sendto_server);
	MOVLW	HIGH(_send_release_bootp_header_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_send_release_bootp_header_1_1)
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
	CALL	_build_bootp
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	381; MainDemo.c	UDPPut(DHCP_RELEASE_MESSAGE);
	MOVLW	0x07
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	383; MainDemo.c	UDPPut(DHCP_SERVER_IDENTIFIER);
	MOVLW	0x36
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	384; MainDemo.c	UDPPut(sizeof(IP_ADDR));
	MOVLW	0x04
	MOVWF	POSTDEC1
	CALL	_UDPPut
	INCF	FSR1L, F
;	.line	385; MainDemo.c	UDPPutArray((BYTE*)&AppConfig.MyIPAddr, sizeof(IP_ADDR));
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
;	.line	387; MainDemo.c	end_dhcp();
	CALL	_end_dhcp
;	.line	389; MainDemo.c	UDPFlush();
	CALL	_UDPFlush
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
S_MainDemo__update_pool	code
_update_pool:
;	.line	346; MainDemo.c	void update_pool(UDP_SOCKET *socket_sendto_server){
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
;	.line	348; MainDemo.c	for(i=0; i<POOL_SIZE; i++){
	CLRF	r0x03
	CLRF	r0x04
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
	CLRF	r0x08
_00353_DS_:
	MOVF	r0x04, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00367_DS_
	MOVLW	0x0a
	SUBWF	r0x03, W
_00367_DS_:
	BTFSC	STATUS, 0
	BRA	_00357_DS_
;	.line	349; MainDemo.c	if(!is_free(&pool[i])){
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
	CALL	_is_free
	MOVWF	r0x09
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x09, W
	BTFSS	STATUS, 2
	BRA	_00355_DS_
;	.line	351; MainDemo.c	if(pool[i].server_deadline < 60)
	MOVLW	LOW(_pool)
	ADDWF	r0x07, W
	MOVWF	r0x09
	MOVLW	HIGH(_pool)
	ADDWFC	r0x08, W
	MOVWF	r0x0a
	MOVLW	0x0e
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
	BNZ	_00368_DS_
	MOVLW	0x00
	SUBWF	r0x0d, W
	BNZ	_00368_DS_
	MOVLW	0x00
	SUBWF	r0x0c, W
	BNZ	_00368_DS_
	MOVLW	0x3c
	SUBWF	r0x0b, W
_00368_DS_:
	BC	_00342_DS_
;	.line	352; MainDemo.c	pool[i].server_deadline = 0;
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
	BRA	_00343_DS_
_00342_DS_:
;	.line	353; MainDemo.c	else pool[i].server_deadline -= 60;
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
_00343_DS_:
;	.line	355; MainDemo.c	if(pool[i].client_deadline <= 60){
	MOVLW	LOW(_pool)
	ADDWF	r0x05, W
	MOVWF	r0x09
	MOVLW	HIGH(_pool)
	ADDWFC	r0x06, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	ADDLW	0x0a
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
	BNZ	_00369_DS_
	MOVLW	0x00
	SUBWF	r0x0f, W
	BNZ	_00369_DS_
	MOVLW	0x00
	SUBWF	r0x0e, W
	BNZ	_00369_DS_
	MOVLW	0x3d
	SUBWF	r0x0d, W
_00369_DS_:
	BTFSC	STATUS, 0
	BRA	_00347_DS_
;	.line	357; MainDemo.c	pool[i].miss_counter++;
	MOVF	r0x09, W
	ADDLW	0x12
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
;	.line	358; MainDemo.c	pool[i].client_deadline = RELAY_LEASE_TIME;
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
;	.line	360; MainDemo.c	if(pool[i].miss_counter >= 5){
	MOVLW	0x00
	SUBWF	r0x10, W
	BNZ	_00370_DS_
	MOVLW	0x05
	SUBWF	r0x0f, W
_00370_DS_:
	BTFSS	STATUS, 0
	BRA	_00348_DS_
;	.line	362; MainDemo.c	send_release(socket_sendto_server, &pool[i].ip, &pool[i].mac);
	MOVFF	r0x09, r0x0d
	MOVFF	r0x0a, r0x0e
	MOVF	r0x0e, W
	MOVWF	r0x0e
	MOVF	r0x0d, W
	MOVWF	r0x0d
	MOVLW	0x80
	MOVWF	r0x0f
	MOVLW	0x04
	ADDWF	r0x09, F
	BTFSC	STATUS, 0
	INCF	r0x0a, F
	MOVF	r0x0a, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x10
	MOVF	r0x10, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
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
	CALL	_send_release
	MOVLW	0x09
	ADDWF	FSR1L, F
;	.line	363; MainDemo.c	remove_from_pool(&pool[i].ip);
	MOVLW	LOW(_pool)
	ADDWF	r0x05, W
	MOVWF	r0x09
	MOVLW	HIGH(_pool)
	ADDWFC	r0x06, W
	MOVWF	r0x0a
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
	CALL	_remove_from_pool
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	364; MainDemo.c	continue; 
	BRA	_00355_DS_
_00347_DS_:
;	.line	367; MainDemo.c	else pool[i].client_deadline -= 60;            
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
_00348_DS_:
;	.line	368; MainDemo.c	if(pool[i].server_deadline <= RELAY_LEASE_TIME){
	MOVLW	LOW(_pool)
	ADDWF	r0x05, W
	MOVWF	r0x09
	MOVLW	HIGH(_pool)
	ADDWFC	r0x06, W
	MOVWF	r0x0a
	MOVF	r0x09, W
	ADDLW	0x0e
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
	BNZ	_00371_DS_
	MOVLW	0x00
	SUBWF	r0x0d, W
	BNZ	_00371_DS_
	MOVLW	0x01
	SUBWF	r0x0c, W
	BNZ	_00371_DS_
	MOVLW	0x2d
	SUBWF	r0x0b, W
_00371_DS_:
	BC	_00355_DS_
;	.line	369; MainDemo.c	send_request(socket_sendto_server, &pool[i]);       
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
	CALL	_send_request
	MOVLW	0x06
	ADDWF	FSR1L, F
_00355_DS_:
;	.line	348; MainDemo.c	for(i=0; i<POOL_SIZE; i++){
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
	BRA	_00353_DS_
_00357_DS_:
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
S_MainDemo__send_request	code
_send_request:
;	.line	332; MainDemo.c	void send_request(UDP_SOCKET *socket_sendto_server, POOL_ELEMENT *pool_el){
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
_00333_DS_:
;	.line	337; MainDemo.c	while(!UDPIsPutReady(*socket_sendto_server));
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
	BZ	_00333_DS_
;	.line	338; MainDemo.c	set_mac_to_dhcp_server();
	CALL	_set_mac_to_dhcp_server
;	.line	340; MainDemo.c	forgeBootpHeaderRequest(&bootp_header, 0, &pool_el->ip, &pool_el->ip, &pool_el->mac);
	MOVLW	HIGH(_send_request_bootp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_send_request_bootp_header_1_1)
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
	CALL	_forgeBootpHeaderRequest
	MOVLW	0x10
	ADDWF	FSR1L, F
;	.line	341; MainDemo.c	build_dhcp_header(dhcp_header, &dhcp_header_length, pool_el);
	MOVLW	HIGH(_send_request_dhcp_header_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_send_request_dhcp_header_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_send_request_dhcp_header_length_1_1)
	MOVWF	r0x0a
	MOVLW	LOW(_send_request_dhcp_header_length_1_1)
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
	CALL	_build_dhcp_header
	MOVLW	0x09
	ADDWF	FSR1L, F
;	.line	342; MainDemo.c	build_bootp(&bootp_header, socket_sendto_server);
	MOVLW	HIGH(_send_request_bootp_header_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_send_request_bootp_header_1_1)
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
	CALL	_build_bootp
	MOVLW	0x06
	ADDWF	FSR1L, F
;	.line	343; MainDemo.c	request_msg(dhcp_header, dhcp_header_length);
	MOVLW	HIGH(_send_request_dhcp_header_1_1)
	MOVWF	r0x01
	MOVLW	LOW(_send_request_dhcp_header_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVFF	_send_request_dhcp_header_length_1_1, r0x03
	MOVFF	(_send_request_dhcp_header_length_1_1 + 1), r0x04
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
	CALL	_request_msg
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
S_MainDemo__build_dhcp_header	code
_build_dhcp_header:
;	.line	314; MainDemo.c	void build_dhcp_header(BYTE *dhcp_header, unsigned int *dhcp_header_length, POOL_ELEMENT *pool_el){
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
;	.line	317; MainDemo.c	dhcp_header[0] = DHCP_MESSAGE_TYPE;
	MOVLW	0x35
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	318; MainDemo.c	dhcp_header[1] = DHCP_MESSAGE_TYPE_LEN;
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
;	.line	319; MainDemo.c	dhcp_header[2] = DHCP_REQUEST_MESSAGE;
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
;	.line	321; MainDemo.c	dhcp_header[3] = DHCP_PARAM_REQUEST_IP_ADDRESS;
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
;	.line	322; MainDemo.c	dhcp_header[4] = DHCP_PARAM_REQUEST_IP_ADDRESS_LEN;
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
;	.line	323; MainDemo.c	for(i=5; i<9; i++){
	MOVLW	0x05
	MOVWF	r0x09
	CLRF	r0x0a
_00319_DS_:
	MOVF	r0x0a, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00328_DS_
	MOVLW	0x09
	SUBWF	r0x09, W
_00328_DS_:
	BC	_00322_DS_
;	.line	324; MainDemo.c	dhcp_header[i] = pool_el->ip.v[i-5];
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
;	.line	323; MainDemo.c	for(i=5; i<9; i++){
	INCF	r0x09, F
	BTFSC	STATUS, 0
	INCF	r0x0a, F
	BRA	_00319_DS_
_00322_DS_:
;	.line	327; MainDemo.c	dhcp_header[9] = DHCP_SERVER_IDENTIFIER;
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
;	.line	328; MainDemo.c	dhcp_header[10] = sizeof(IP_ADDR);
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
;	.line	329; MainDemo.c	*dhcp_header_length = 15;
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
S_MainDemo__time_action	code
_time_action:
;	.line	295; MainDemo.c	void time_action(UDP_SOCKET *socket_sendto_server){
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
;	.line	301; MainDemo.c	m = TickConvertToMilliseconds(TickGet());
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
	BANKSEL	_time_action_prev_1_1
;	.line	303; MainDemo.c	if (m-prev >= 1000 || m < prev) {
	MOVF	_time_action_prev_1_1, W, B
	SUBWF	r0x03, W
	MOVWF	r0x07
	BANKSEL	(_time_action_prev_1_1 + 1)
	MOVF	(_time_action_prev_1_1 + 1), W, B
	SUBWFB	r0x04, W
	MOVWF	r0x08
	BANKSEL	(_time_action_prev_1_1 + 2)
	MOVF	(_time_action_prev_1_1 + 2), W, B
	SUBWFB	r0x05, W
	MOVWF	r0x09
	BANKSEL	(_time_action_prev_1_1 + 3)
	MOVF	(_time_action_prev_1_1 + 3), W, B
	SUBWFB	r0x06, W
	MOVWF	r0x0a
	MOVLW	0x00
	SUBWF	r0x0a, W
	BNZ	_00313_DS_
	MOVLW	0x00
	SUBWF	r0x09, W
	BNZ	_00313_DS_
	MOVLW	0x03
	SUBWF	r0x08, W
	BNZ	_00313_DS_
	MOVLW	0xe8
	SUBWF	r0x07, W
_00313_DS_:
	BC	_00306_DS_
	BANKSEL	(_time_action_prev_1_1 + 3)
	MOVF	(_time_action_prev_1_1 + 3), W, B
	SUBWF	r0x06, W
	BNZ	_00314_DS_
	BANKSEL	(_time_action_prev_1_1 + 2)
	MOVF	(_time_action_prev_1_1 + 2), W, B
	SUBWF	r0x05, W
	BNZ	_00314_DS_
	BANKSEL	(_time_action_prev_1_1 + 1)
	MOVF	(_time_action_prev_1_1 + 1), W, B
	SUBWF	r0x04, W
	BNZ	_00314_DS_
	BANKSEL	_time_action_prev_1_1
	MOVF	_time_action_prev_1_1, W, B
	SUBWF	r0x03, W
_00314_DS_:
	BTFSC	STATUS, 0
	BRA	_00309_DS_
_00306_DS_:
;	.line	304; MainDemo.c	prev += 1000;
	MOVLW	0xe8
	BANKSEL	_time_action_prev_1_1
	ADDWF	_time_action_prev_1_1, F, B
	MOVLW	0x03
	BANKSEL	(_time_action_prev_1_1 + 1)
	ADDWFC	(_time_action_prev_1_1 + 1), F, B
	MOVLW	0x00
	BANKSEL	(_time_action_prev_1_1 + 2)
	ADDWFC	(_time_action_prev_1_1 + 2), F, B
	MOVLW	0x00
	BANKSEL	(_time_action_prev_1_1 + 3)
	ADDWFC	(_time_action_prev_1_1 + 3), F, B
;	.line	305; MainDemo.c	LED0_IO ^= 1;
	CLRF	r0x03
	BTFSC	_LATJbits, 0
	INCF	r0x03, F
	MOVLW	0x01
	XORWF	r0x03, F
	MOVF	r0x03, W
	ANDLW	0x01
	MOVWF	PRODH
	MOVF	_LATJbits, W
	ANDLW	0xfe
	IORWF	PRODH, W
	MOVWF	_LATJbits
	BANKSEL	_time_action_count_1_1
;	.line	306; MainDemo.c	count++;
	INCF	_time_action_count_1_1, F, B
	BNC	_10768_DS_
	BANKSEL	(_time_action_count_1_1 + 1)
	INCF	(_time_action_count_1_1 + 1), F, B
_10768_DS_:
	BNC	_20769_DS_
	BANKSEL	(_time_action_count_1_1 + 2)
	INCF	(_time_action_count_1_1 + 2), F, B
_20769_DS_:
	BNC	_30770_DS_
	BANKSEL	(_time_action_count_1_1 + 3)
	INCF	(_time_action_count_1_1 + 3), F, B
_30770_DS_:
;	.line	307; MainDemo.c	if(count%OVERFLOW_TIME == 0){
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x3d
	MOVWF	POSTDEC1
	BANKSEL	(_time_action_count_1_1 + 3)
	MOVF	(_time_action_count_1_1 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_time_action_count_1_1 + 2)
	MOVF	(_time_action_count_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_time_action_count_1_1 + 1)
	MOVF	(_time_action_count_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_time_action_count_1_1
	MOVF	_time_action_count_1_1, W, B
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
	BNZ	_00309_DS_
;	.line	308; MainDemo.c	update_pool(socket_sendto_server);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_update_pool
	MOVLW	0x03
	ADDWF	FSR1L, F
	BANKSEL	_time_action_count_1_1
;	.line	309; MainDemo.c	count = 0;
	CLRF	_time_action_count_1_1, B
	BANKSEL	(_time_action_count_1_1 + 1)
	CLRF	(_time_action_count_1_1 + 1), B
	BANKSEL	(_time_action_count_1_1 + 2)
	CLRF	(_time_action_count_1_1 + 2), B
	BANKSEL	(_time_action_count_1_1 + 3)
	CLRF	(_time_action_count_1_1 + 3), B
_00309_DS_:
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
S_MainDemo__ip_cmp	code
_ip_cmp:
;	.line	285; MainDemo.c	BOOL ip_cmp(IP_ADDR *ip1, IP_ADDR *ip2){
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
;	.line	287; MainDemo.c	for(i=0; i<4; i++){
	CLRF	r0x06
	CLRF	r0x07
_00288_DS_:
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00297_DS_
	MOVLW	0x04
	SUBWF	r0x06, W
_00297_DS_:
	BC	_00291_DS_
;	.line	288; MainDemo.c	if(ip1->v[i] != ip2->v[i]){
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
	BZ	_00290_DS_
;	.line	289; MainDemo.c	return FALSE;
	CLRF	WREG
	BRA	_00292_DS_
_00290_DS_:
;	.line	287; MainDemo.c	for(i=0; i<4; i++){
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00288_DS_
_00291_DS_:
;	.line	292; MainDemo.c	return TRUE;
	MOVLW	0x01
_00292_DS_:
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
;	.line	275; MainDemo.c	BOOL mac_cmp(MAC_ADDR *m1, MAC_ADDR *m2){
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
;	.line	277; MainDemo.c	for(i=0; i<6; i++){
	CLRF	r0x06
	CLRF	r0x07
_00270_DS_:
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00279_DS_
	MOVLW	0x06
	SUBWF	r0x06, W
_00279_DS_:
	BC	_00273_DS_
;	.line	278; MainDemo.c	if(m1->v[i] != m2->v[i]){
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
	BZ	_00272_DS_
;	.line	279; MainDemo.c	return FALSE;
	CLRF	WREG
	BRA	_00274_DS_
_00272_DS_:
;	.line	277; MainDemo.c	for(i=0; i<6; i++){
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00270_DS_
_00273_DS_:
;	.line	282; MainDemo.c	return TRUE;
	MOVLW	0x01
_00274_DS_:
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
S_MainDemo__display_ip	code
_display_ip:
;	.line	262; MainDemo.c	void display_ip(unsigned int pos, IP_ADDR *ip){
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
;	.line	264; MainDemo.c	int_to_string(ip->v[0], a);
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget1
	MOVWF	r0x05
	CLRF	r0x06
	MOVLW	HIGH(_display_ip_a_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_display_ip_a_1_1)
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
	CALL	_int_to_string
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	265; MainDemo.c	int_to_string(ip->v[1], b);
	MOVF	r0x02, W
	ADDLW	0x01
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x05
	CLRF	r0x06
	MOVLW	HIGH(_display_ip_b_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_display_ip_b_1_1)
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
	CALL	_int_to_string
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	266; MainDemo.c	int_to_string(ip->v[2], c);
	MOVF	r0x02, W
	ADDLW	0x02
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x05
	CLRF	r0x06
	MOVLW	HIGH(_display_ip_c_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_display_ip_c_1_1)
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
	CALL	_int_to_string
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	267; MainDemo.c	int_to_string(ip->v[3], d);
	MOVLW	0x03
	ADDWF	r0x02, F
	MOVLW	0x00
	ADDWFC	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget1
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_display_ip_d_1_1)
	MOVWF	r0x05
	MOVLW	LOW(_display_ip_d_1_1)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
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
	CALL	_int_to_string
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	269; MainDemo.c	DisplayString(pos, a);
	MOVLW	HIGH(_display_ip_a_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_display_ip_a_1_1)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	270; MainDemo.c	DisplayString(pos+4, b);
	MOVLW	0x04
	ADDWF	r0x00, W
	MOVWF	r0x01
	MOVLW	HIGH(_display_ip_b_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_display_ip_b_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	271; MainDemo.c	DisplayString(pos+8, c);
	MOVLW	0x08
	ADDWF	r0x00, W
	MOVWF	r0x01
	MOVLW	HIGH(_display_ip_c_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_display_ip_c_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	272; MainDemo.c	DisplayString(pos+12, d);
	MOVLW	0x0c
	ADDWF	r0x00, F
	MOVLW	HIGH(_display_ip_d_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_display_ip_d_1_1)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
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
S_MainDemo__display_mac	code
_display_mac:
;	.line	245; MainDemo.c	void display_mac(unsigned int pos, MAC_ADDR *mac){
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
;	.line	247; MainDemo.c	int_to_string(mac->v[0], a);
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget1
	MOVWF	r0x05
	CLRF	r0x06
	MOVLW	HIGH(_display_mac_a_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_display_mac_a_1_1)
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
	CALL	_int_to_string
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	248; MainDemo.c	int_to_string(mac->v[1], b);
	MOVF	r0x02, W
	ADDLW	0x01
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x05
	CLRF	r0x06
	MOVLW	HIGH(_display_mac_b_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_display_mac_b_1_1)
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
	CALL	_int_to_string
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	249; MainDemo.c	int_to_string(mac->v[2], c);
	MOVF	r0x02, W
	ADDLW	0x02
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x05
	CLRF	r0x06
	MOVLW	HIGH(_display_mac_c_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_display_mac_c_1_1)
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
	CALL	_int_to_string
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	250; MainDemo.c	int_to_string(mac->v[3], d);
	MOVF	r0x02, W
	ADDLW	0x03
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x05
	CLRF	r0x06
	MOVLW	HIGH(_display_mac_d_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_display_mac_d_1_1)
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
	CALL	_int_to_string
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	251; MainDemo.c	int_to_string(mac->v[4], e);
	MOVF	r0x02, W
	ADDLW	0x04
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x05
	CLRF	r0x06
	MOVLW	HIGH(_display_mac_e_1_1)
	MOVWF	r0x08
	MOVLW	LOW(_display_mac_e_1_1)
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
	CALL	_int_to_string
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	252; MainDemo.c	int_to_string(mac->v[5], f);
	MOVLW	0x05
	ADDWF	r0x02, F
	MOVLW	0x00
	ADDWFC	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget1
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_display_mac_f_1_1)
	MOVWF	r0x05
	MOVLW	LOW(_display_mac_f_1_1)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
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
	CALL	_int_to_string
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	254; MainDemo.c	DisplayString(pos, a);
	MOVLW	HIGH(_display_mac_a_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_display_mac_a_1_1)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	255; MainDemo.c	DisplayString(pos+4, b);
	MOVLW	0x04
	ADDWF	r0x00, W
	MOVWF	r0x01
	MOVLW	HIGH(_display_mac_b_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_display_mac_b_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	256; MainDemo.c	DisplayString(pos+8, c);
	MOVLW	0x08
	ADDWF	r0x00, W
	MOVWF	r0x01
	MOVLW	HIGH(_display_mac_c_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_display_mac_c_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	257; MainDemo.c	DisplayString(pos+12, d);
	MOVLW	0x0c
	ADDWF	r0x00, W
	MOVWF	r0x01
	MOVLW	HIGH(_display_mac_d_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_display_mac_d_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	258; MainDemo.c	DisplayString(pos+16, e);
	MOVLW	0x10
	ADDWF	r0x00, W
	MOVWF	r0x01
	MOVLW	HIGH(_display_mac_e_1_1)
	MOVWF	r0x03
	MOVLW	LOW(_display_mac_e_1_1)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	259; MainDemo.c	DisplayString(pos+20, f);
	MOVLW	0x14
	ADDWF	r0x00, F
	MOVLW	HIGH(_display_mac_f_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_display_mac_f_1_1)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_DisplayString
	MOVLW	0x04
	ADDWF	FSR1L, F
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
S_MainDemo__int_to_string	code
_int_to_string:
;	.line	234; MainDemo.c	void int_to_string(int value, char *r){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
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
;	.line	235; MainDemo.c	char *p = r+number_of_char(value);
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_number_of_char
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVLW	0x02
	ADDWF	FSR1L, F
	MOVF	r0x05, W
	ADDWF	r0x02, F
	MOVF	r0x06, W
	ADDWFC	r0x03, F
	CLRF	WREG
	BTFSC	r0x06, 7
	SETF	WREG
	ADDWFC	r0x04, F
;	.line	236; MainDemo.c	*p = '\0';
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrput1
;	.line	237; MainDemo.c	p--;
	MOVLW	0xff
	ADDWF	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVLW	0xff
	ADDWFC	r0x04, F
_00250_DS_:
;	.line	238; MainDemo.c	while(value != 0){
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_00253_DS_
;	.line	239; MainDemo.c	*p = (value%10)+48;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__modsint
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVLW	0x04
	ADDWF	FSR1L, F
	MOVLW	0x30
	ADDWF	r0x05, F
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrput1
;	.line	240; MainDemo.c	value = value/10;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	241; MainDemo.c	p--;
	MOVLW	0xff
	ADDWF	r0x02, F
	MOVLW	0xff
	ADDWFC	r0x03, F
	MOVLW	0xff
	ADDWFC	r0x04, F
	BRA	_00250_DS_
_00253_DS_:
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
S_MainDemo__number_of_char	code
_number_of_char:
;	.line	225; MainDemo.c	int number_of_char(int value){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
;	.line	227; MainDemo.c	while(value != 0){
	CLRF	r0x02
	CLRF	r0x03
_00242_DS_:
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_00244_DS_
;	.line	228; MainDemo.c	value = value/10;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	__divsint
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	229; MainDemo.c	i++;
	INCF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	BRA	_00242_DS_
_00244_DS_:
;	.line	231; MainDemo.c	return i;
	MOVFF	r0x03, PRODL
	MOVF	r0x02, W
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__set_to_MAC	code
_set_to_MAC:
;	.line	218; MainDemo.c	void set_to_MAC(BYTE *src, MAC_ADDR *dest){
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
;	.line	220; MainDemo.c	for(i=0; i<6; i++){
	CLRF	r0x06
	CLRF	r0x07
_00228_DS_:
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00237_DS_
	MOVLW	0x06
	SUBWF	r0x06, W
_00237_DS_:
	BC	_00232_DS_
;	.line	221; MainDemo.c	dest->v[i] = src[i];
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
	MOVF	r0x06, W
	ADDWF	r0x00, W
	MOVWF	r0x0b
	MOVF	r0x07, W
	ADDWFC	r0x01, W
	MOVWF	r0x0c
	CLRF	WREG
	BTFSC	r0x07, 7
	SETF	WREG
	ADDWFC	r0x02, W
	MOVWF	r0x0d
	MOVFF	r0x0b, FSR0L
	MOVFF	r0x0c, PRODL
	MOVF	r0x0d, W
	CALL	__gptrget1
	MOVWF	r0x0b
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrput1
;	.line	220; MainDemo.c	for(i=0; i<6; i++){
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00228_DS_
_00232_DS_:
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
S_MainDemo__set_to_dhcp_ip	code
_set_to_dhcp_ip:
;	.line	211; MainDemo.c	void set_to_dhcp_ip(IP_ADDR *ip){
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
;	.line	212; MainDemo.c	ip->v[0] = DHCP_IP8;
	MOVLW	0xc0
	MOVWF	POSTDEC1
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput1
;	.line	213; MainDemo.c	ip->v[1] = DHCP_IP16;
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
;	.line	214; MainDemo.c	ip->v[2] = DHCP_IP24;
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
;	.line	215; MainDemo.c	ip->v[3] = DHCP_IP32;
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
S_MainDemo__get_pool_el_mac	code
_get_pool_el_mac:
;	.line	200; MainDemo.c	BOOL get_pool_el_mac(MAC_ADDR *mac, POOL_ELEMENT **pool_el){
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
;	.line	202; MainDemo.c	for(i=0; i<POOL_SIZE; i++){
	CLRF	r0x06
	CLRF	r0x07
	CLRF	r0x08
	CLRF	r0x09
_00209_DS_:
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00218_DS_
	MOVLW	0x0a
	SUBWF	r0x06, W
_00218_DS_:
	BTFSC	STATUS, 0
	BRA	_00212_DS_
;	.line	203; MainDemo.c	if(mac_cmp(mac, &pool[i].mac)){
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
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_mac_cmp
	MOVWF	r0x0a
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x0a, W
	BZ	_00211_DS_
;	.line	204; MainDemo.c	*pool_el = &pool[i];
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
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput3
;	.line	205; MainDemo.c	return TRUE;
	MOVLW	0x01
	BRA	_00213_DS_
_00211_DS_:
;	.line	202; MainDemo.c	for(i=0; i<POOL_SIZE; i++){
	MOVLW	0x14
	ADDWF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00209_DS_
_00212_DS_:
;	.line	208; MainDemo.c	return FALSE;
	CLRF	WREG
_00213_DS_:
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
S_MainDemo__get_pool_el_ip	code
_get_pool_el_ip:
;	.line	189; MainDemo.c	BOOL get_pool_el_ip(IP_ADDR *ip, POOL_ELEMENT **pool_el){
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
;	.line	191; MainDemo.c	for(i=0; i<POOL_SIZE; i++){
	CLRF	r0x06
	CLRF	r0x07
	CLRF	r0x08
	CLRF	r0x09
_00193_DS_:
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00202_DS_
	MOVLW	0x0a
	SUBWF	r0x06, W
_00202_DS_:
	BTFSC	STATUS, 0
	BRA	_00196_DS_
;	.line	192; MainDemo.c	if(ip_cmp(&pool[i].ip, ip)){
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
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	_ip_cmp
	MOVWF	r0x0a
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x0a, W
	BZ	_00195_DS_
;	.line	193; MainDemo.c	*pool_el = &pool[i];
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
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput3
;	.line	194; MainDemo.c	return TRUE;    
	MOVLW	0x01
	BRA	_00197_DS_
_00195_DS_:
;	.line	191; MainDemo.c	for(i=0; i<POOL_SIZE; i++){
	MOVLW	0x14
	ADDWF	r0x08, F
	BTFSC	STATUS, 0
	INCF	r0x09, F
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00193_DS_
_00196_DS_:
;	.line	197; MainDemo.c	return FALSE;
	CLRF	WREG
_00197_DS_:
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
S_MainDemo__remove_from_pool	code
_remove_from_pool:
;	.line	181; MainDemo.c	BOOL remove_from_pool(IP_ADDR *ip){
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
;	.line	184; MainDemo.c	found = get_pool_el_ip(ip, &pool_el);
	MOVLW	HIGH(_remove_from_pool_pool_el_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_remove_from_pool_pool_el_1_1)
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
	CALL	_get_pool_el_ip
	MOVWF	r0x00
	MOVLW	0x06
	ADDWF	FSR1L, F
	BANKSEL	(_remove_from_pool_pool_el_1_1 + 2)
;	.line	185; MainDemo.c	init_pool_el(pool_el);
	MOVF	(_remove_from_pool_pool_el_1_1 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_remove_from_pool_pool_el_1_1 + 1)
	MOVF	(_remove_from_pool_pool_el_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_remove_from_pool_pool_el_1_1
	MOVF	_remove_from_pool_pool_el_1_1, W, B
	MOVWF	POSTDEC1
	CALL	_init_pool_el
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	186; MainDemo.c	return found;
	MOVF	r0x00, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_MainDemo__add_to_pool	code
_add_to_pool:
;	.line	165; MainDemo.c	BOOL add_to_pool(IP_ADDR *ip, MAC_ADDR *mac, DWORD server_deadline, unsigned int miss_counter){
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
;	.line	167; MainDemo.c	BOOL added = FALSE;
	CLRF	r0x0c
;	.line	168; MainDemo.c	for(i=0; i<POOL_SIZE && !added; i++){
	CLRF	r0x0d
	CLRF	r0x0e
	CLRF	r0x0f
	CLRF	r0x10
_00170_DS_:
	MOVF	r0x0e, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00181_DS_
	MOVLW	0x0a
	SUBWF	r0x0d, W
_00181_DS_:
	BTFSC	STATUS, 0
	BRA	_00173_DS_
	MOVF	r0x0c, W
	BTFSS	STATUS, 2
	BRA	_00173_DS_
;	.line	169; MainDemo.c	if(is_free(&pool[i])){
	MOVLW	LOW(_pool)
	ADDWF	r0x0f, W
	MOVWF	r0x11
	MOVLW	HIGH(_pool)
	ADDWFC	r0x10, W
	MOVWF	r0x12
	MOVF	r0x12, W
	MOVWF	r0x12
	MOVF	r0x11, W
	MOVWF	r0x11
	MOVLW	0x80
	MOVWF	r0x13
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	CALL	_is_free
	MOVWF	r0x11
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVF	r0x11, W
	BTFSC	STATUS, 2
	BRA	_00172_DS_
;	.line	170; MainDemo.c	memcpy(pool[i].ip.v, ip->v, sizeof(IP_ADDR));
	MOVLW	LOW(_pool)
	ADDWF	r0x0f, W
	MOVWF	r0x11
	MOVLW	HIGH(_pool)
	ADDWFC	r0x10, W
	MOVWF	r0x12
	MOVF	r0x12, W
	MOVWF	r0x12
	MOVF	r0x11, W
	MOVWF	r0x11
	MOVLW	0x80
	MOVWF	r0x13
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
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	171; MainDemo.c	memcpy(pool[i].mac.v, mac->v, sizeof(MAC_ADDR));
	MOVLW	LOW(_pool)
	ADDWF	r0x0f, W
	MOVWF	r0x11
	MOVLW	HIGH(_pool)
	ADDWFC	r0x10, W
	MOVWF	r0x12
	MOVLW	0x04
	ADDWF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	MOVF	r0x12, W
	MOVWF	r0x12
	MOVF	r0x11, W
	MOVWF	r0x11
	MOVLW	0x80
	MOVWF	r0x13
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
	MOVF	r0x13, W
	MOVWF	POSTDEC1
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
;	.line	172; MainDemo.c	pool[i].client_deadline = RELAY_LEASE_TIME;
	MOVLW	LOW(_pool)
	ADDWF	r0x0f, W
	MOVWF	r0x11
	MOVLW	HIGH(_pool)
	ADDWFC	r0x10, W
	MOVWF	r0x12
	MOVF	r0x11, W
	ADDLW	0x0a
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x12, W
	MOVWF	r0x14
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, FSR0H
	MOVLW	0x2c
	MOVWF	POSTINC0
	MOVLW	0x01
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
;	.line	173; MainDemo.c	pool[i].server_deadline = server_deadline;
	MOVF	r0x11, W
	ADDLW	0x0e
	MOVWF	r0x13
	MOVLW	0x00
	ADDWFC	r0x12, W
	MOVWF	r0x14
	MOVFF	r0x13, FSR0L
	MOVFF	r0x14, FSR0H
	MOVFF	r0x06, POSTINC0
	MOVFF	r0x07, POSTINC0
	MOVFF	r0x08, POSTINC0
	MOVFF	r0x09, INDF0
;	.line	174; MainDemo.c	pool[i].miss_counter = miss_counter;
	MOVLW	0x12
	ADDWF	r0x11, F
	BTFSC	STATUS, 0
	INCF	r0x12, F
	MOVFF	r0x11, FSR0L
	MOVFF	r0x12, FSR0H
	MOVFF	r0x0a, POSTINC0
	MOVFF	r0x0b, INDF0
;	.line	175; MainDemo.c	added = TRUE;
	MOVLW	0x01
	MOVWF	r0x0c
_00172_DS_:
;	.line	168; MainDemo.c	for(i=0; i<POOL_SIZE && !added; i++){
	MOVLW	0x14
	ADDWF	r0x0f, F
	BTFSC	STATUS, 0
	INCF	r0x10, F
	INCF	r0x0d, F
	BTFSC	STATUS, 0
	INCF	r0x0e, F
	BRA	_00170_DS_
_00173_DS_:
;	.line	178; MainDemo.c	return added;
	MOVF	r0x0c, W
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
S_MainDemo__is_free	code
_is_free:
;	.line	155; MainDemo.c	BOOL is_free(POOL_ELEMENT *el){
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
;	.line	157; MainDemo.c	for(i=0; i<6; i++){
	MOVLW	0x04
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	CLRF	r0x03
	CLRF	r0x04
_00153_DS_:
	MOVF	r0x04, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00162_DS_
	MOVLW	0x06
	SUBWF	r0x03, W
_00162_DS_:
	BC	_00156_DS_
;	.line	158; MainDemo.c	if(el->mac.v[i] != 0){
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
	BZ	_00155_DS_
;	.line	159; MainDemo.c	return FALSE;
	CLRF	WREG
	BRA	_00157_DS_
_00155_DS_:
;	.line	157; MainDemo.c	for(i=0; i<6; i++){
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BRA	_00153_DS_
_00156_DS_:
;	.line	162; MainDemo.c	return TRUE;
	MOVLW	0x01
_00157_DS_:
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
S_MainDemo__init_pool	code
_init_pool:
;	.line	148; MainDemo.c	void init_pool(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
;	.line	150; MainDemo.c	for(i=0; i<POOL_SIZE; i++){
	CLRF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	CLRF	r0x03
_00137_DS_:
	MOVF	r0x01, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00146_DS_
	MOVLW	0x0a
	SUBWF	r0x00, W
_00146_DS_:
	BC	_00141_DS_
;	.line	151; MainDemo.c	init_pool_el(&pool[i]);
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
	CALL	_init_pool_el
	MOVLW	0x03
	ADDWF	FSR1L, F
;	.line	150; MainDemo.c	for(i=0; i<POOL_SIZE; i++){
	MOVLW	0x14
	ADDWF	r0x02, F
	BTFSC	STATUS, 0
	INCF	r0x03, F
	INCF	r0x00, F
	BTFSC	STATUS, 0
	INCF	r0x01, F
	BRA	_00137_DS_
_00141_DS_:
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
S_MainDemo__init_pool_el	code
_init_pool_el:
;	.line	135; MainDemo.c	void init_pool_el(POOL_ELEMENT *pe){
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
;	.line	137; MainDemo.c	for(j=0; j<4; j++){
	CLRF	r0x03
	CLRF	r0x04
_00115_DS_:
	MOVF	r0x04, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00131_DS_
	MOVLW	0x04
	SUBWF	r0x03, W
_00131_DS_:
	BC	_00118_DS_
;	.line	138; MainDemo.c	pe->ip.v[j] = 0;
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
;	.line	137; MainDemo.c	for(j=0; j<4; j++){
	INCF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	BRA	_00115_DS_
_00118_DS_:
;	.line	140; MainDemo.c	for(j=0; j<6; j++){
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
_00119_DS_:
	MOVF	r0x07, W
	ADDLW	0x80
	ADDLW	0x80
	BNZ	_00132_DS_
	MOVLW	0x06
	SUBWF	r0x06, W
_00132_DS_:
	BC	_00122_DS_
;	.line	141; MainDemo.c	pe->mac.v[j] = 0;
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
;	.line	140; MainDemo.c	for(j=0; j<6; j++){
	INCF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	BRA	_00119_DS_
_00122_DS_:
;	.line	143; MainDemo.c	pe->client_deadline = 0;
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
	MOVLW	0x00
	MOVWF	TBLPTRL
	MOVLW	0x00
	MOVWF	TBLPTRH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrput4
;	.line	144; MainDemo.c	pe->server_deadline = 0;
	MOVF	r0x00, W
	ADDLW	0x0e
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
;	.line	145; MainDemo.c	pe->miss_counter = 0;
	MOVLW	0x12
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x02, F
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrput2
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
;	.line	93; MainDemo.c	void HighISR(void) __interrupt(1) //ML for sdcc        
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
;	.line	100; MainDemo.c	}
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
;	.line	74; MainDemo.c	void LowISR(void) __interrupt (2) //ML for sdcc
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
;	.line	80; MainDemo.c	TickUpdate();
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
	DB	0x69, 0x6e, 0x76, 0x61, 0x6c, 0x69, 0x64, 0x20, 0x73, 0x6f, 0x63, 0x6b
	DB	0x65, 0x74, 0x00
; ; Starting pCode block
__str_1:
	DB	0x44, 0x48, 0x43, 0x50, 0x20, 0x4f, 0x46, 0x46, 0x45, 0x52, 0x00
; ; Starting pCode block
__str_2:
	DB	0x44, 0x48, 0x43, 0x50, 0x20, 0x41, 0x43, 0x4b, 0x00
; ; Starting pCode block
__str_3:
	DB	0x44, 0x49, 0x53, 0x43, 0x41, 0x52, 0x44, 0x45, 0x44, 0x20, 0x68, 0x61
	DB	0x6e, 0x64, 0x6c, 0x65, 0x20, 0x73, 0x65, 0x72, 0x76, 0x65, 0x72, 0x00
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
	DB	0x55, 0x6e, 0x6b, 0x6e, 0x77, 0x20, 0x44, 0x48, 0x43, 0x50, 0x20, 0x74
	DB	0x79, 0x70, 0x65, 0x00
; ; Starting pCode block
__str_7:
	DB	0x47, 0x41, 0x54, 0x45, 0x57, 0x20, 0x41, 0x52, 0x50, 0x20, 0x66, 0x61
	DB	0x69, 0x6c, 0x20, 0x3a, 0x27, 0x28, 0x00
; ; Starting pCode block
__str_8:
	DB	0x4c, 0x49, 0x4e, 0x47, 0x49, 0x32, 0x33, 0x31, 0x35, 0x00


; Statistics:
; code size:	18734 (0x492e) bytes (14.29%)
;           	 9367 (0x2497) words
; udata size:	 1170 (0x0492) bytes (30.47%)
; access size:	   27 (0x001b) bytes


	end
