
       01  TELACEP.
           05  BLANK SCREEN.
           05  LINE 01  COLUMN 01 
               VALUE  "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
           05  LINE 01  COLUMN 41 
               VALUE  "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿".
           05  LINE 02  COLUMN 01 
               VALUE  "³                         CADASTRO DE CE".
           05  LINE 02  COLUMN 41 
               VALUE  "P                                      ³".
           05  LINE 03  COLUMN 01 
               VALUE  "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
           05  LINE 03  COLUMN 41 
               VALUE  "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´".
           05  LINE 04  COLUMN 01 
               VALUE  "³".
           05  LINE 04  COLUMN 41 
               VALUE  "                                       ³".
           05  LINE 05  COLUMN 01 
               VALUE  "³  CODIGO:".
           05  LINE 05  COLUMN 41 
               VALUE  "                                       ³".
           05  LINE 06  COLUMN 01 
               VALUE  "³  LOGRADOURO:".
           05  LINE 06  COLUMN 41 
               VALUE  "                                       ³".
           05  LINE 07  COLUMN 01 
               VALUE  "³  BAIRRO:".
           05  LINE 07  COLUMN 41 
               VALUE  "                                       ³".
           05  LINE 08  COLUMN 01 
               VALUE  "³  CIDADE:".
           05  LINE 08  COLUMN 41 
               VALUE  "                                       ³".
           05  LINE 09  COLUMN 01 
               VALUE  "³  UF:".
           05  LINE 09  COLUMN 41 
               VALUE  "                                       ³".
           05  LINE 10  COLUMN 01 
               VALUE  "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ".
           05  LINE 10  COLUMN 41 
               VALUE  "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ".
           05  TCOD
               LINE 05  COLUMN 12  PIC 99999.999
               USING  CEP
               HIGHLIGHT.
           05  TLOG
               LINE 06  COLUMN 16  PIC X(40)
               USING  LOGRAD
               HIGHLIGHT.
           05  TBAIR
               LINE 07  COLUMN 12  PIC X(20)
               USING  BAIRRO
               HIGHLIGHT.
           05  TCID
               LINE 08  COLUMN 12  PIC X(20)
               USING  CIDADE
               HIGHLIGHT.
           05  TUF
               LINE 09  COLUMN 08  PIC X(02)
               USING  UF
               HIGHLIGHT.
           05  TUFC
               LINE 09  COLUMN 12  PIC X(20)
               USING  DSCUF
               HIGHLIGHT.
