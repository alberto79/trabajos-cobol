       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM-NAME.
       ENVIRONMENT DIVISION. 
         INPUT-OUTPUT SECTION.
          FILE-CONTROL.
              SELECT ARCHIVO-ASIGNADO ASSIGN TO 'clientes.txt'
                 ORGANIZATION IS LINE SEQUENTIAL.
                
                 
       DATA DIVISION.
       FILE SECTION.
       FD ARCHIVO-ASIGNADO.
       01 REGISTRO-ARCHIVO PIC X(50).
              
       WORKING-STORAGE SECTION.
       01 FIN-FILE PIC X VALUE 'N'.
       PROCEDURE DIVISION.
                OPEN INPUT ARCHIVO-ASIGNADO

                PERFORM UNTIL FIN-FILE = 'S'
                READ ARCHIVO-ASIGNADO
                AT END
                MOVE 'S' TO FIN-FILE
                NOT AT END
                DISPLAY REGISTRO-ARCHIVO
                END-READ
                END-PERFORM

                CLOSE ARCHIVO-ASIGNADO
                  
           GOBACK.