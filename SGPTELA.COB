
       01  SGPTELA.
           05  BLANK SCREEN.
           05  LINE 01  COLUMN 01 
               VALUE  "旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴".
           05  LINE 01  COLUMN 41 
               VALUE  "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커".
           05  LINE 02  COLUMN 01 
               VALUE  "�                            CADASTRO DE".
           05  LINE 02  COLUMN 41 
               VALUE  " PRODUTO                               �".
           05  LINE 03  COLUMN 01 
               VALUE  "쿎ODIGO:".
           05  LINE 03  COLUMN 41 
               VALUE  "                                       �".
           05  LINE 04  COLUMN 01 
               VALUE  "쿏ENOMINA�AO:".
           05  LINE 04  COLUMN 41 
               VALUE  "                                       �".
           05  LINE 05  COLUMN 01 
               VALUE  "쿢NIDADE:".
           05  LINE 05  COLUMN 41 
               VALUE  "                                       �".
           05  LINE 06  COLUMN 01 
               VALUE  "쿛RECO CUSTO:".
           05  LINE 06  COLUMN 41 
               VALUE  "                                       �".
           05  LINE 07  COLUMN 01 
               VALUE  "쿛RECO VENDA:".
           05  LINE 07  COLUMN 41 
               VALUE  "                                       �".
           05  LINE 08  COLUMN 01 
               VALUE  "쿟IPO PRODUTO:".
           05  LINE 08  COLUMN 41 
               VALUE  "                                       �".
           05  LINE 09  COLUMN 01 
               VALUE  "쿞ITUACAO:".
           05  LINE 09  COLUMN 41 
               VALUE  "                                       �".
           05  LINE 10  COLUMN 01 
               VALUE  "�".
           05  LINE 10  COLUMN 41 
               VALUE  "                                       �".
           05  LINE 11  COLUMN 01 
               VALUE  "�".
           05  LINE 11  COLUMN 41 
               VALUE  "                                       �".
           05  LINE 12  COLUMN 01 
               VALUE  "쿘ENSAGEM:".
           05  LINE 12  COLUMN 41 
               VALUE  "                                       �".
           05  LINE 13  COLUMN 01 
               VALUE  "읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴".
           05  LINE 13  COLUMN 41 
               VALUE  "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸".
           05  TCOD
               LINE 03  COLUMN 19  PIC 9(05)
               USING  CODIGO
               HIGHLIGHT.
           05  TDENOM
               LINE 04  COLUMN 19  PIC X(30)
               USING  DENOM
               HIGHLIGHT.
           05  TUNID
               LINE 05  COLUMN 19  PIC X(02)
               USING  UNID
               HIGHLIGHT.
           05  TDUNID
               LINE 05  COLUMN 22  PIC X(12)
               USING  DSCUNID
               HIGHLIGHT.
           05  TPRC
               LINE 06  COLUMN 19  PIC ZZZ.ZZ9,99
               USING  PRECOC
               HIGHLIGHT.
           05  TPRV
               LINE 07  COLUMN 19  PIC ZZZ.ZZ9,99
               USING  PRECOV
               HIGHLIGHT.
           05  TTPRD
               LINE 08  COLUMN 19  PIC 9(01)
               USING  TIPOPRD
               HIGHLIGHT.
           05  TDPRD
               LINE 08  COLUMN 22  PIC X(15)
               USING  DESCPRD
               HIGHLIGHT.
           05  TSITUAT
               LINE 09  COLUMN 19  PIC X(01)
               USING  SITUACAO
               HIGHLIGHT.
           05  TDSCSIT
               LINE 09  COLUMN 22  PIC X(10)
               USING  DESCSITU
               HIGHLIGHT.
           05  TMENS
               LINE 12  COLUMN 19  PIC X(50)
               USING  MENS
               HIGHLIGHT.
