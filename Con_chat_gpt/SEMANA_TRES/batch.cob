       IDENTIFICATION DIVISION.
       PROGRAM-ID. BATCH-BANCO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CUENTAS-FILE ASSIGN TO 'CUENTAS.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT MOVIMIENTOS-FILE ASSIGN TO 'MOVIMIENTOS.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.

       FD CUENTAS-FILE.
       01 CUENTA-REG.
          05 NUMERO-CUENTA PIC 9(4).
          05 NOMBRE        PIC X(20).
          05 SALDO         PIC 9(5).
       
       FD MOVIMIENTOS-FILE.
       01 MOV-REG.
           05 MOV-CUENTA PIC 9(4).
           05 OPERACION   PIC X.
           05 IMPORTE     PIC 9(5).

        WORKING-STORAGE SECTION.
        01 EOF-MOV PIC X VALUE 'N'.
           88 FIN-MOV VALUE 'S'.
           88 NO-FIN-MOV VALUE 'N'.

        01 IDX PIC 9 VALUE 1.
        01 CUENTAS-TABLA.
        05 CUENTA OCCURS 5 TIMES INDEXED BY IDX-TABLA.
           10 TAB-NUMERO PIC 9(4).
           10 TAB-NOMBRE PIC X(20).
           10 TAB-SALDO  PIC 9(5).

       PROCEDURE DIVISION.

       *>---- Abrir archivos
            OPEN INPUT CUENTAS-FILE
            OPEN INPUT MOVIMIENTOS-FILE

      *---- Cargar cuentas en memoria
            PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 5
            READ CUENTAS-FILE
              AT END MOVE 1 TO IDX
              NOT AT END
                 MOVE NUMERO-CUENTA TO TAB-NUMERO(IDX)
                 MOVE NOMBRE TO TAB-NOMBRE(IDX)
                 MOVE SALDO TO TAB-SALDO(IDX)
           END-READ
            END-PERFORM

      *---- Procesar movimientos
             READ MOVIMIENTOS-FILE
                AT END MOVE 'S' TO EOF-MOV
             END-READ

           PERFORM UNTIL FIN-MOV

            *> Buscar cuenta en tabla (búsqueda binaria si la tabla está 
                      SEARCH ALL CUENTA
                WHEN TAB-NUMERO(IDX-TABLA) = MOV-CUENTA
                   IF OPERACION = '+'
                      ADD IMPORTE TO TAB-SALDO(IDX-TABLA)
                   ELSE
                      SUBTRACT IMPORTE FROM TAB-SALDO(IDX-TABLA)
                   END-IF
             END-SEARCH

             *> Leer siguiente movimiento
             READ MOVIMIENTOS-FILE
                AT END MOVE 'S' TO EOF-MOV
             END-READ

            END-PERFORM
            
      *---- Mostrar resultados
            PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 5
                DISPLAY "CUENTA: " TAB-NUMERO(IDX)
                DISPLAY "TITULAR: " TAB-NOMBRE(IDX)
                DISPLAY "SALDO: " TAB-SALDO(IDX)
            END-PERFORM

            *>---- Cerrar archivos
            CLOSE CUENTAS-FILE
            CLOSE MOVIMIENTOS-FILE

             STOP RUN.