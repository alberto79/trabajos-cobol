       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMA1.
        
       ENVIRONMENT DIVISION.
         INPUT-OUTPUT SECTION.
         FILE-CONTROL.
             SELECT ARCHIVO1 ASSIGN TO 'CUENTAS.DAT'
                 ORGANIZATION IS LINE SEQUENTIAL.
             SELECT ARCHIVO2 ASSIGN TO 'CUENTAS_MAYORES.DAT'
                  ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
         FILE SECTION.
         FD ARCHIVO1.
         01 REGISTRO1.
            05 NUMERO-CUENTA PIC 9(5).
            05 NOMBRE        PIC X(20).
            05 SALDO         PIC 9(6).
         FD ARCHIVO2.
         01 REGISTRO2.
            05 NUMERO-CUENTA2 PIC 9(5).
            05 NOMBRE2        PIC X(20).
            05 SALDO2         PIC 9(6).   
         WORKING-STORAGE SECTION.
         01 FIN-ARCHIVO PIC X VALUE 'N'.
           88 EOF VALUE 'S'.
         01 SUMA PIC 9(6) VALUE 0.  
             
       PROCEDURE DIVISION.
           DISPLAY "----------------------".
             DISPLAY "DATOS DE CUENTAS ".
            
             OPEN INPUT ARCHIVO1.
             OPEN OUTPUT ARCHIVO2.
             PERFORM UNTIL EOF
                   READ ARCHIVO1
                      AT END SET EOF TO TRUE
                      NOT AT END
                          DISPLAY NUMERO-CUENTA " " NOMBRE " " SALDO
                           ADD SALDO TO SUMA
                        IF SALDO > 1000
                              MOVE NUMERO-CUENTA TO NUMERO-CUENTA2
                              MOVE NOMBRE TO NOMBRE2
                              MOVE SALDO TO SALDO2
                              WRITE REGISTRO2
                        END-IF
                   END-READ
               END-PERFORM.
               CLOSE ARCHIVO1.
               CLOSE ARCHIVO2.
               DISPLAY "----------------------".
               DISPLAY "SUMA DE SALDOS: " SUMA.
                DISPLAY "----------------------".
           STOP RUN.

