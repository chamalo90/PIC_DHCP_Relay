;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.4 #5595 (May 13 2013) (UNIX)
; This file was generated Sat May 18 21:24:46 2013
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f97j60

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _StackInit
	global _StackTask
	global _StackTaskHelp
	global _StackApplications
	global _remoteNode

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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
	extern _AN0String
	extern _AppConfig
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
	extern _srand
	extern _memcpy
	extern _GenerateRandomDWORD
	extern _MACInit
	extern _MACIsLinked
	extern _MACGetHeader
	extern _IPGetHeader
	extern _ARPInit
	extern _ARPProcess
	extern _UDPInit
	extern _UDPTask
	extern _UDPProcess
	extern _UDPDiscard
	extern _DHCPInit
	extern _DHCPTask
	extern _DHCPDisable
	extern _DHCPIsBound
	extern _ICMPProcess
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
FSR0L	equ	0xfe9
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_StackTaskHelp_bLastLinkState_2_2	db	0x00


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

udata_StackTsk_0	udata
_smStack	res	1

udata_StackTsk_1	udata
_StackTaskHelp_tempLocalIP_1_1	res	4

udata_StackTsk_2	udata
_remoteNode	res	10

udata_StackTsk_3	udata
_StackTaskHelp_cFrameType_1_1	res	1

udata_StackTsk_4	udata
_StackTaskHelp_cIPFrameType_1_1	res	1

udata_StackTsk_5	udata
_StackTaskHelp_dataCount_1_1	res	2

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_StackTsk__StackApplications	code
_StackApplications:
;	.line	386; TCPIP_Stack/StackTsk.c	void StackApplications(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	443; TCPIP_Stack/StackTsk.c	}
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_StackTsk__StackTaskHelp	code
_StackTaskHelp:
;	.line	214; TCPIP_Stack/StackTsk.c	void StackTaskHelp(IP_ADDR *last_remote_ip)
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
	BANKSEL	(_AppConfig + 44)
;	.line	234; TCPIP_Stack/StackTsk.c	if(AppConfig.Flags.bIsDHCPEnabled)
	BTFSS	(_AppConfig + 44), 6, B
	BRA	_00124_DS_
;	.line	239; TCPIP_Stack/StackTsk.c	bCurrentLinkState = MACIsLinked();
	CALL	_MACIsLinked
	MOVWF	r0x03
;	.line	240; TCPIP_Stack/StackTsk.c	if(bCurrentLinkState != bLastLinkState)
	MOVF	r0x03, W
	BANKSEL	_StackTaskHelp_bLastLinkState_2_2
	XORWF	_StackTaskHelp_bLastLinkState_2_2, W, B
	BNZ	_00165_DS_
	BRA	_00120_DS_
_00165_DS_:
;	.line	242; TCPIP_Stack/StackTsk.c	bLastLinkState = bCurrentLinkState;
	MOVFF	r0x03, _StackTaskHelp_bLastLinkState_2_2
;	.line	243; TCPIP_Stack/StackTsk.c	if(!bCurrentLinkState) //we lost the MAC link
	MOVF	r0x03, W
	BNZ	_00120_DS_
;	.line	245; TCPIP_Stack/StackTsk.c	AppConfig.MyIPAddr.Val = AppConfig.DefaultIPAddr.Val;
	MOVFF	(_AppConfig + 20), r0x03
	MOVFF	(_AppConfig + 21), r0x04
	MOVFF	(_AppConfig + 22), r0x05
	MOVFF	(_AppConfig + 23), r0x06
	MOVF	r0x03, W
	BANKSEL	_AppConfig
	MOVWF	_AppConfig, B
	MOVF	r0x04, W
	BANKSEL	(_AppConfig + 1)
	MOVWF	(_AppConfig + 1), B
	MOVF	r0x05, W
	BANKSEL	(_AppConfig + 2)
	MOVWF	(_AppConfig + 2), B
	MOVF	r0x06, W
	BANKSEL	(_AppConfig + 3)
	MOVWF	(_AppConfig + 3), B
;	.line	246; TCPIP_Stack/StackTsk.c	AppConfig.MyMask.Val = AppConfig.DefaultMask.Val;
	MOVFF	(_AppConfig + 24), r0x03
	MOVFF	(_AppConfig + 25), r0x04
	MOVFF	(_AppConfig + 26), r0x05
	MOVFF	(_AppConfig + 27), r0x06
	MOVF	r0x03, W
	BANKSEL	(_AppConfig + 4)
	MOVWF	(_AppConfig + 4), B
	MOVF	r0x04, W
	BANKSEL	(_AppConfig + 5)
	MOVWF	(_AppConfig + 5), B
	MOVF	r0x05, W
	BANKSEL	(_AppConfig + 6)
	MOVWF	(_AppConfig + 6), B
	MOVF	r0x06, W
	BANKSEL	(_AppConfig + 7)
	MOVWF	(_AppConfig + 7), B
	BANKSEL	(_AppConfig + 44)
;	.line	247; TCPIP_Stack/StackTsk.c	AppConfig.Flags.bInConfigMode = TRUE;
	BSF	(_AppConfig + 44), 7, B
;	.line	248; TCPIP_Stack/StackTsk.c	DHCPInit(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DHCPInit
	INCF	FSR1L, F
_00120_DS_:
;	.line	256; TCPIP_Stack/StackTsk.c	DHCPTask();
	CALL	_DHCPTask
;	.line	258; TCPIP_Stack/StackTsk.c	if(DHCPIsBound(0))
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DHCPIsBound
	MOVWF	r0x03
	INCF	FSR1L, F
	MOVF	r0x03, W
	BZ	_00124_DS_
	BANKSEL	(_AppConfig + 44)
;	.line	259; TCPIP_Stack/StackTsk.c	AppConfig.Flags.bInConfigMode = FALSE;
	BCF	(_AppConfig + 44), 7, B
_00124_DS_:
;	.line	275; TCPIP_Stack/StackTsk.c	UDPTask();
	CALL	_UDPTask
_00145_DS_:
;	.line	290; TCPIP_Stack/StackTsk.c	UDPDiscard();
	CALL	_UDPDiscard
;	.line	295; TCPIP_Stack/StackTsk.c	if(!MACGetHeader(&remoteNode.MACAddr, &cFrameType))
	MOVLW	HIGH(_remoteNode + 4)
	MOVWF	r0x04
	MOVLW	LOW(_remoteNode + 4)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_StackTaskHelp_cFrameType_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_StackTaskHelp_cFrameType_1_1)
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
	CALL	_MACGetHeader
	MOVWF	r0x03
	MOVLW	0x06
	ADDWF	FSR1L, F
	MOVF	r0x03, W
	BTFSC	STATUS, 2
	BRA	_00147_DS_
;	.line	299; TCPIP_Stack/StackTsk.c	switch(cFrameType)
	MOVFF	_StackTaskHelp_cFrameType_1_1, r0x03
	CLRF	r0x04
	MOVF	r0x03, W
	BNZ	_00167_DS_
	MOVF	r0x04, W
	BZ	_00128_DS_
_00167_DS_:
	MOVF	r0x03, W
	XORLW	0x06
	BNZ	_00168_DS_
	MOVF	r0x04, W
	BZ	_00169_DS_
_00168_DS_:
	BRA	_00145_DS_
_00169_DS_:
;	.line	303; TCPIP_Stack/StackTsk.c	ARPProcess();
	CALL	_ARPProcess
;	.line	304; TCPIP_Stack/StackTsk.c	break;
	BRA	_00145_DS_
_00128_DS_:
;	.line	308; TCPIP_Stack/StackTsk.c	if(!IPGetHeader(&tempLocalIP, &remoteNode, &cIPFrameType, &dataCount))
	MOVLW	HIGH(_StackTaskHelp_tempLocalIP_1_1)
	MOVWF	r0x04
	MOVLW	LOW(_StackTaskHelp_tempLocalIP_1_1)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_remoteNode)
	MOVWF	r0x07
	MOVLW	LOW(_remoteNode)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	MOVLW	HIGH(_StackTaskHelp_cIPFrameType_1_1)
	MOVWF	r0x0a
	MOVLW	LOW(_StackTaskHelp_cIPFrameType_1_1)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVLW	HIGH(_StackTaskHelp_dataCount_1_1)
	MOVWF	r0x0d
	MOVLW	LOW(_StackTaskHelp_dataCount_1_1)
	MOVWF	r0x0c
	MOVLW	0x80
	MOVWF	r0x0e
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
	CALL	_IPGetHeader
	MOVWF	r0x03
	MOVLW	0x0c
	ADDWF	FSR1L, F
	MOVF	r0x03, W
	BTFSC	STATUS, 2
	BRA	_00145_DS_
;	.line	312; TCPIP_Stack/StackTsk.c	if(cIPFrameType == IP_PROT_ICMP)
	MOVFF	_StackTaskHelp_cIPFrameType_1_1, r0x03
	CLRF	r0x04
	MOVF	r0x03, W
	XORLW	0x01
	BNZ	_00170_DS_
	MOVF	r0x04, W
	BZ	_00171_DS_
_00170_DS_:
	BRA	_00136_DS_
_00171_DS_:
;	.line	333; TCPIP_Stack/StackTsk.c	if( (tempLocalIP.Val == AppConfig.MyIPAddr.Val) ||
	MOVFF	_StackTaskHelp_tempLocalIP_1_1, r0x05
	MOVFF	(_StackTaskHelp_tempLocalIP_1_1 + 1), r0x06
	MOVFF	(_StackTaskHelp_tempLocalIP_1_1 + 2), r0x07
	MOVFF	(_StackTaskHelp_tempLocalIP_1_1 + 3), r0x08
	MOVFF	_AppConfig, r0x09
	MOVFF	(_AppConfig + 1), r0x0a
	MOVFF	(_AppConfig + 2), r0x0b
	MOVFF	(_AppConfig + 3), r0x0c
	MOVF	r0x05, W
	XORWF	r0x09, W
	BNZ	_00173_DS_
	MOVF	r0x06, W
	XORWF	r0x0a, W
	BNZ	_00173_DS_
	MOVF	r0x07, W
	XORWF	r0x0b, W
	BNZ	_00173_DS_
	MOVF	r0x08, W
	XORWF	r0x0c, W
	BNZ	_00173_DS_
	BRA	_00131_DS_
_00173_DS_:
;	.line	334; TCPIP_Stack/StackTsk.c	(tempLocalIP.Val == 0xFFFFFFFF) ||
	MOVF	r0x05, W
	XORLW	0xff
	BNZ	_00175_DS_
	MOVF	r0x06, W
	XORLW	0xff
	BNZ	_00175_DS_
	MOVF	r0x07, W
	XORLW	0xff
	BNZ	_00175_DS_
	MOVF	r0x08, W
	XORLW	0xff
	BZ	_00131_DS_
_00175_DS_:
	BANKSEL	(_AppConfig + 4)
;	.line	335; TCPIP_Stack/StackTsk.c	(tempLocalIP.Val == ((AppConfig.MyIPAddr.Val & AppConfig.MyMask.Val) | ~AppConfig.MyMask.Val)))
	MOVF	(_AppConfig + 4), W, B
	ANDWF	r0x09, F
	BANKSEL	(_AppConfig + 5)
	MOVF	(_AppConfig + 5), W, B
	ANDWF	r0x0a, F
	BANKSEL	(_AppConfig + 6)
	MOVF	(_AppConfig + 6), W, B
	ANDWF	r0x0b, F
	BANKSEL	(_AppConfig + 7)
	MOVF	(_AppConfig + 7), W, B
	ANDWF	r0x0c, F
	BANKSEL	(_AppConfig + 4)
	COMF	(_AppConfig + 4), W, B
	MOVWF	r0x0d
	BANKSEL	(_AppConfig + 5)
	COMF	(_AppConfig + 5), W, B
	MOVWF	r0x0e
	BANKSEL	(_AppConfig + 6)
	COMF	(_AppConfig + 6), W, B
	MOVWF	r0x0f
	BANKSEL	(_AppConfig + 7)
	COMF	(_AppConfig + 7), W, B
	MOVWF	r0x10
	MOVF	r0x0d, W
	IORWF	r0x09, F
	MOVF	r0x0e, W
	IORWF	r0x0a, F
	MOVF	r0x0f, W
	IORWF	r0x0b, F
	MOVF	r0x10, W
	IORWF	r0x0c, F
	MOVF	r0x05, W
	XORWF	r0x09, W
	BNZ	_00178_DS_
	MOVF	r0x06, W
	XORWF	r0x0a, W
	BNZ	_00178_DS_
	MOVF	r0x07, W
	XORWF	r0x0b, W
	BNZ	_00178_DS_
	MOVF	r0x08, W
	XORWF	r0x0c, W
	BZ	_00131_DS_
_00178_DS_:
	BRA	_00145_DS_
_00131_DS_:
;	.line	337; TCPIP_Stack/StackTsk.c	ICMPProcess(&remoteNode, dataCount);
	MOVLW	HIGH(_remoteNode)
	MOVWF	r0x06
	MOVLW	LOW(_remoteNode)
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
	BANKSEL	(_StackTaskHelp_dataCount_1_1 + 1)
	MOVF	(_StackTaskHelp_dataCount_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_StackTaskHelp_dataCount_1_1
	MOVF	_StackTaskHelp_dataCount_1_1, W, B
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_ICMPProcess
	MOVLW	0x05
	ADDWF	FSR1L, F
;	.line	340; TCPIP_Stack/StackTsk.c	break;
	BRA	_00145_DS_
_00136_DS_:
;	.line	354; TCPIP_Stack/StackTsk.c	if(cIPFrameType == IP_PROT_UDP)
	MOVF	r0x03, W
	XORLW	0x11
	BNZ	_00180_DS_
	MOVF	r0x04, W
	BZ	_00181_DS_
_00180_DS_:
	BRA	_00145_DS_
_00181_DS_:
;	.line	358; TCPIP_Stack/StackTsk.c	if(UDPProcess(&remoteNode, &tempLocalIP, dataCount))
	MOVLW	HIGH(_remoteNode)
	MOVWF	r0x04
	MOVLW	LOW(_remoteNode)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	HIGH(_StackTaskHelp_tempLocalIP_1_1)
	MOVWF	r0x07
	MOVLW	LOW(_StackTaskHelp_tempLocalIP_1_1)
	MOVWF	r0x06
	MOVLW	0x80
	MOVWF	r0x08
	BANKSEL	(_StackTaskHelp_dataCount_1_1 + 1)
	MOVF	(_StackTaskHelp_dataCount_1_1 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_StackTaskHelp_dataCount_1_1
	MOVF	_StackTaskHelp_dataCount_1_1, W, B
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
	CALL	_UDPProcess
	MOVWF	r0x03
	MOVLW	0x08
	ADDWF	FSR1L, F
	MOVF	r0x03, W
	BZ	_00147_DS_
;	.line	359; TCPIP_Stack/StackTsk.c	if(last_remote_ip != NULL){
	MOVF	r0x00, W
	IORWF	r0x01, W
	IORWF	r0x02, W
	BZ	_00147_DS_
;	.line	360; TCPIP_Stack/StackTsk.c	memcpy(last_remote_ip, &remoteNode.IPAddr, sizeof(remoteNode.IPAddr));
	MOVLW	HIGH(_remoteNode)
	MOVWF	r0x04
	MOVLW	LOW(_remoteNode)
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
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
_00147_DS_:
;	.line	367; TCPIP_Stack/StackTsk.c	}
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
S_StackTsk__StackTask	code
_StackTask:
;	.line	210; TCPIP_Stack/StackTsk.c	void StackTask(){
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
;	.line	211; TCPIP_Stack/StackTsk.c	StackTaskHelp(NULL);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_StackTaskHelp
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_StackTsk__StackInit	code
_StackInit:
;	.line	115; TCPIP_Stack/StackTsk.c	void StackInit(void)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	BANKSEL	_smStack
;	.line	117; TCPIP_Stack/StackTsk.c	smStack                     = SM_STACK_IDLE;
	CLRF	_smStack, B
	BANKSEL	(_AppConfig + 44)
;	.line	124; TCPIP_Stack/StackTsk.c	AppConfig.Flags.bInConfigMode = TRUE;
	BSF	(_AppConfig + 44), 7, B
;	.line	128; TCPIP_Stack/StackTsk.c	srand(GenerateRandomDWORD());
	CALL	_GenerateRandomDWORD
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_srand
	MOVLW	0x04
	ADDWF	FSR1L, F
;	.line	130; TCPIP_Stack/StackTsk.c	MACInit();
	CALL	_MACInit
;	.line	139; TCPIP_Stack/StackTsk.c	ARPInit();
	CALL	_ARPInit
;	.line	142; TCPIP_Stack/StackTsk.c	UDPInit();
	CALL	_UDPInit
;	.line	174; TCPIP_Stack/StackTsk.c	DHCPInit(0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DHCPInit
	INCF	FSR1L, F
	BANKSEL	(_AppConfig + 44)
;	.line	176; TCPIP_Stack/StackTsk.c	if(!AppConfig.Flags.bIsDHCPEnabled)
	BTFSC	(_AppConfig + 44), 6, B
	BRA	_00107_DS_
;	.line	178; TCPIP_Stack/StackTsk.c	DHCPDisable(0);  
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_DHCPDisable
	INCF	FSR1L, F
_00107_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	



; Statistics:
; code size:	 1096 (0x0448) bytes ( 0.84%)
;           	  548 (0x0224) words
; udata size:	   19 (0x0013) bytes ( 0.49%)
; access size:	   17 (0x0011) bytes


	end
