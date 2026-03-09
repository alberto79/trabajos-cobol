       IDENTIFICATION DIVISION.
       PROGRAM-ID. del_1_al_10.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       01 I PIC 9(2) VALUE 1.
       PROCEDURE DIVISION.
       
           PERFORM VARYING I FROM 
           1 BY 1 UNTIL I > 10
               DISPLAY "contador: " I
           END-PERFORM.

           
           STOP RUN.




       