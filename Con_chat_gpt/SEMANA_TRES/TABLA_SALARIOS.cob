        *>Guardar 5 salarios y calcular el salario total.
         IDENTIFICATION DIVISION.
         PROGRAM-ID. TABLA-SALARIOS.
   
         DATA DIVISION.
         WORKING-STORAGE SECTION.
         01 SALARIOS.
            05 SALARIO PIC 9(5)V99 OCCURS 5 TIMES.
         01 TOTAL-SALARIO PIC 9(7)V99 VALUE ZERO.
         01 I PIC 9(1) VALUE 1.
         PROCEDURE DIVISION.
            PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
                  DISPLAY "Ingrese el salario " I ": "
                  ACCEPT SALARIO(I)
                  ADD SALARIO(I) TO TOTAL-SALARIO
            END-PERFORM
   
            DISPLAY "El salario total es: " TOTAL-SALARIO
   
            STOP RUN.

            