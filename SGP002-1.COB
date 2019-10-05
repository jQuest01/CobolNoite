       IDENTIFICATION DIVISION.
       PROGRAM-ID. SGP002.
       AUTHOR. GUILHERME CAMPOS FERREIRA DA CRUZ.
      **************************************
      * MANUTENCAO DO CADASTRO DE PRODUTO  *
      **************************************
      *----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
                         DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT CADPRO ASSIGN TO DISK
                    ORGANIZATION IS INDEXED
                    ACCESS MODE  IS DYNAMIC
                    RECORD KEY   IS CODIGO
                    FILE STATUS  IS ST-ERRO
                    ALTERNATE RECORD KEY IS DENOM
                                            WITH DUPLICATES.
      *
      *-----------------------------------------------------------------
       DATA DIVISION.
       FILE SECTION.
       FD CADPRO
               LABEL RECORD IS STANDARD
               VALUE OF FILE-ID IS "CADPRO.DAT".
       01 REGPRO.
                03 CODIGO          PIC 99999.
                03 DENOM           PIC X(30).
                03 UNID            PIC X(02).
                03 DSCUNID         PIC X(12).
                03 PRECOC          PIC 9(06)V99.
                03 PRECOV          PIC 9(06)V99.
                03 TIPOPRD         PIC 9(01).
                03 DESCPRD         PIC X(15).
                03 SITUACAO        PIC X(01).
                03 DESCSITU        PIC X(10).
      *
      *-----------------------------------------------------------------
       WORKING-STORAGE SECTION.
       77 W-SEL        PIC 9(01) VALUE ZEROS.
       77 W-CONT       PIC 9(05) VALUE ZEROS.
       77 W-OPCAO      PIC X(01) VALUE SPACES.
       77 ST-ERRO      PIC X(02) VALUE "00".
       77 W-ACT        PIC 9(02) VALUE ZEROS.
       77 MENS         PIC X(50) VALUE SPACES.
       77 LIMPA        PIC X(50) VALUE SPACES.
      *
       01 TABUNID.
	  03 UND0  PIC X(12) VALUE "LITRO       ".
	  03 UND1  PIC X(12) VALUE "METRO       ".
	  03 UND2  PIC X(12) VALUE "PECA        ".
	  03 UND3  PIC X(12) VALUE "KILO        ".
	  03 UND4  PIC X(12) VALUE "AAAAA       ".
	  03 UND5  PIC X(12) VALUE "BBBBB       ".
	  03 UND6  PIC X(12) VALUE "CCCCC       ".
	  03 UND7  PIC X(12) VALUE "DDDDD       ".
	  03 UND8  PIC X(12) VALUE "EEEEE       ".
	  03 UND9  PIC X(12) VALUE "FFFFF       ".
      *
       01 TAB1 REDEFINES TABUNID.
           03 TABUND PIC X(12) OCCURS 10 TIMES.
      *
       01 TTABPRD.
	  03 PRD1  PIC X(15) VALUE "FRITO          ".
	  03 PRD2  PIC X(15) VALUE "ASSADO         ".
	  03 PRD3  PIC X(15) VALUE "COZIDO         ".
	  03 PRD4  PIC X(15) VALUE "REFRIGERANTE   ".
	  03 PRD5  PIC X(15) VALUE "CERVEJA        ".
	  03 PRD6  PIC X(15) VALUE "BBBBB          ".
	  03 PRD7  PIC X(15) VALUE "CCCCC          ".
	  03 PRD8  PIC X(15) VALUE "DDDDD          ".
	  03 PRD9  PIC X(15) VALUE "EEEEE          ".
      *
       01 TAB0 REDEFINES TTABPRD.
           03 TABPRD PIC X(15) OCCURS 9 TIMES.
      *-----------------------------------------------------------------
       SCREEN SECTION.
       COPY SGPTELA.COB.
      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
       INICIO.
      *
       INC-OP0.
           OPEN I-O CADPRO
           IF ST-ERRO NOT = "00"
               IF ST-ERRO = "30"
                      OPEN OUTPUT CADPRO
                      CLOSE CADPRO
                      MOVE "*** ARQUIVO CADPRO SENDO CRIADO **" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-OP0
                   ELSE
                      MOVE "ERRO NA ABERTURA DO ARQUIVO PRODTUO" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM
                ELSE
                    NEXT SENTENCE.
       INC-001.
                MOVE ZEROS  TO CODIGO PRECOC PRECOV TIPOPRD 
                MOVE SPACES TO DENOM UNID DSCUNID DESCPRD
                               SITUACAO DESCSITU
                DISPLAY SGPTELA.
       INC-002.
                ACCEPT TCOD
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02
                   CLOSE CADPRO
                   GO TO ROT-FIM.
                IF CODIGO  = 0
                   MOVE "*** PRODUTO INVALIDO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-002.
       LER-PRODUTO01.
                MOVE 0 TO W-SEL
                READ CADPRO
                IF ST-ERRO NOT = "23"
                   IF ST-ERRO = "00"
                      DISPLAY SGPTELA
                      MOVE "*** PRODUTO JA CADASTRAD0 ***" TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      MOVE 1 TO W-SEL
                      GO TO ACE-001
                   ELSE
                      MOVE "ERRO NA LEITURA ARQ. PRODUTO"   TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM
                ELSE
                   NEXT SENTENCE.
       INC-003.
		MOVE SPACES TO DENOM
		DISPLAY SGPTELA
                ACCEPT TDENOM
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-002.
                IF DENOM = SPACES
                   MOVE "*** INVALIDO ***" TO MENS
		   PERFORM ROT-MENS THRU ROT-MENS2
		   GO TO INC-003.
       INC-004.
		MOVE ZEROS TO UNID
		MOVE SPACES TO DSCUNID
		DISPLAY SGPTELA
                ACCEPT TUNID
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT= 02 GO TO INC-003.
                IF UNID = 0
                   MOVE "*** INVALIDO ***" TO MENS
		   PERFORM ROT-MENS THRU ROT-MENS2
		   GO TO INC-004.
		PERFORM INC-009
                IF DSCUNID = SPACES
                   MOVE "*** INVALIDO ***" TO MENS
		   PERFORM ROT-MENS THRU ROT-MENS2
		   GO TO INC-004.
       INC-005.
		MOVE ZEROS TO PRECOC
		DISPLAY SGPTELA
                ACCEPT TPRC
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT= 02 GO TO INC-004.
                IF PRECOC = 0
                   MOVE "*** INVALIDO ***" TO MENS
		   PERFORM ROT-MENS THRU ROT-MENS2
		   GO TO INC-005.
       INC-006.
		MOVE ZEROS TO PRECOV
                ACCEPT TPRV
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-005.
                IF PRECOV = 0
                   MOVE "*** INVALIDO ***" TO MENS
		   PERFORM ROT-MENS THRU ROT-MENS2
		   GO TO INC-006.
		IF PRECOV < PRECOC OR PRECOV = PRECOC
		   MOVE "VENDA NAO PODE SER IGUAL OU MENOR QUE CUSTO" 
						TO MENS
		   PERFORM ROT-MENS THRU ROT-MENS2
		   MOVE ZEROS TO PRECOV PRECOC
		   GO TO INC-005.
       INC-007.
		MOVE ZEROS TO TIPOPRD
		MOVE SPACES TO DESCPRD
		DISPLAY SGPTELA
                ACCEPT TTPRD
                ACCEPT W-ACT FROM ESCAPE KEY
		IF W-ACT = 02 GO TO INC-006.
                IF TIPOPRD = 0
                   MOVE "*** INVALIDO ***" TO MENS
		   GO TO INC-007.
		MOVE TABPRD(TIPOPRD) TO DESCPRD
		IF DESCPRD = SPACES
                   MOVE "*** INVALIDO ***" TO MENS
		   GO TO INC-007.
       INC-008.
		MOVE SPACES TO SITUACAO DESCSITU
		DISPLAY SGPTELA
                ACCEPT TSITUAT
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT= 02 GO TO INC-007.
                IF SITUACAO = SPACES
                   MOVE "*** INVALIDO ***" TO MENS
		   GO TO INC-008.
		PERFORM INC-010
		IF DESCSITU = SPACES
                   MOVE "*** INVALIDO ***" TO MENS
		   GO TO INC-008.
		DISPLAY SGPTELA.
      *
                IF W-SEL = 1
                              GO TO ALT-OPC.

       INC-OPC.
                MOVE "S" TO W-OPCAO
                DISPLAY (23, 40) "DADOS OK (S/N) : ".
                ACCEPT (23, 57) W-OPCAO WITH UPDATE
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-005.
                IF W-OPCAO = "N" OR "n"
                   MOVE "* DADOS RECUSADOS PELO OPERADOR *" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-001.
                IF W-OPCAO NOT = "S" AND "s"
                   MOVE "*** DIGITE APENAS S=SIM e N=NAO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-OPC.
       INC-WR1.
                WRITE REGPRO
                IF ST-ERRO = "00" OR "02"
                      MOVE "*** DADOS GRAVADOS *** " TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-001.
                IF ST-ERRO = "22"
                      MOVE "*** PRODUTO JA EXISTE ***     " TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO INC-001
                ELSE
                      MOVE "ERRO NA GRAVACAO DO ARQUIVO DE PRODUTO"
                                                       TO MENS
                      PERFORM ROT-MENS THRU ROT-MENS-FIM
                      GO TO ROT-FIM.
      *
      *****************************************
      * ROTINA DE CONSULTA/ALTERACAO/EXCLUSAO *
      *****************************************
      *
       ACE-001.
                DISPLAY (23, 12)
                     "F1=NOVO REGISTRO   F2=ALTERAR   F3=EXCLUIR"
                ACCEPT (23, 55) W-OPCAO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT NOT = 02 AND W-ACT NOT = 03 AND W-ACT NOT = 04
                   GO TO ACE-001.
                MOVE SPACES TO MENS
                DISPLAY (23, 12) MENS
                IF W-ACT = 02
                   MOVE 02 TO W-SEL
                   GO TO INC-001.
                IF W-ACT = 03
                   GO TO INC-003.
      *
       EXC-OPC.
                DISPLAY (23, 40) "EXCLUIR   (S/N) : ".
                ACCEPT (23, 57) W-OPCAO
                IF W-OPCAO = "N" OR "n"
                   MOVE "*** REGISTRO NAO EXCLUIDO ***" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-001.
                IF W-OPCAO NOT = "S" AND "s"
                   MOVE "* DIGITE APENAS S=SIM  e  N=NAO *" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO EXC-OPC.
       EXC-DL1.
                DELETE CADPRO RECORD
                IF ST-ERRO = "00"
                   MOVE "*** REGISTRO EXCLUIDO ***        " TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-001.
                MOVE "ERRO NA EXCLUSAO DO REGISTRO "   TO MENS
                PERFORM ROT-MENS THRU ROT-MENS-FIM
                GO TO ROT-FIM.
      *
       ALT-OPC.
                DISPLAY (23, 40) "ALTERAR  (S/N) : ".
                ACCEPT (23, 57) W-OPCAO
                ACCEPT W-ACT FROM ESCAPE KEY
                IF W-ACT = 02 GO TO INC-005.
                IF W-OPCAO = "N" OR "n"
                   MOVE "*** INFORMACOES NAO ALTERADAS *** " TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-001.
                IF W-OPCAO NOT = "S" AND "s"
                   MOVE "* DIGITE APENAS S=SIM  e  N=NAO *" TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO ALT-OPC.
       ALT-RW1.
                REWRITE REGPRO
                IF ST-ERRO = "00" OR "02"
                   MOVE "*** REGISTRO ALTERADO ***         " TO MENS
                   PERFORM ROT-MENS THRU ROT-MENS-FIM
                   GO TO INC-001.
                MOVE "ERRO NA EXCLUSAO DO REGISTRO PRODUTO"   TO MENS
                PERFORM ROT-MENS THRU ROT-MENS-FIM
                GO TO ROT-FIM.
       INC-009.
                IF UNID = "LT" MOVE TABUND(1) TO DSCUNID.
		IF UNID = "MT" MOVE TABUND(2) TO DSCUNID.
		IF UNID = "PC" MOVE TABUND(3) TO DSCUNID.
		IF UNID = "KG" MOVE TABUND(4) TO DSCUNID.
		IF UNID = "P1" MOVE TABUND(5) TO DSCUNID.
		IF UNID = "P2" MOVE TABUND(6) TO DSCUNID.
		IF UNID = "P3" MOVE TABUND(7) TO DSCUNID.
		IF UNID = "P4" MOVE TABUND(8) TO DSCUNID.
		IF UNID = "P5" MOVE TABUND(9) TO DSCUNID.
		IF UNID = "P6" MOVE TABUND(10) TO DSCUNID.
       INC-010.
                IF SITUACAO = "A" MOVE "ATIVO" TO DESCSITU.
                IF SITUACAO = "C" MOVE "CANCELADO" TO DESCSITU.
                IF SITUACAO = "S" MOVE "SUSPENSO" TO DESCSITU.
                IF SITUACAO = "D" MOVE "DELETADO" TO DESCSITU.
      *
      **********************
      * ROTINA DE FIM      *
      **********************
      *
       ROT-FIM.
                DISPLAY SGPTELA
                EXIT PROGRAM.
       ROT-FIMP.
                EXIT PROGRAM.

       ROT-FIMS.
                STOP RUN.
      *
      **********************
      * ROTINA DE MENSAGEM *
      **********************
      *
       ROT-MENS.
                MOVE ZEROS TO W-CONT.
       ROT-MENS1.
               DISPLAY SGPTELA.
       ROT-MENS2.
                ADD 1 TO W-CONT
                IF W-CONT < 3000
                   GO TO ROT-MENS2
                ELSE
		   MOVE SPACES TO MENS
                   DISPLAY SGPTELA.
       ROT-MENS-FIM.
                EXIT.
       FIM-ROT-TEMPO.
