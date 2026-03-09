       IDENTIFICATION DIVISION.
       PROGRAM-ID. TABLA.
       
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 TABLA PIC 9(2).
       01 I PIC 9(2) VALUE 1.
       01 RESULTADO PIC 9(2).
       PROCEDURE DIVISION.
           DISPLAY "INTRODUCE TABLA".
           ACCEPT TABLA.
           DISPLAY "TABLA DE " TABLA.
           PERFORM UNTIL I > 10
               COMPUTE RESULTADO = TABLA * I
               DISPLAY TABLA " X " I " = " RESULTADO
               ADD 1 TO I
           END-PERFORM.
         

           
           STOP RUN.

           