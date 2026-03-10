       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROYECTO1.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
          01 CLIENTE.
            05 NOMBRE_CLIENTE PIC A(20).
            05 APELLIDO1_CLIENTE PIC A(20).
            05 APELLIDO2_CLIENTE PIC A(20).
            05 SALDO_CLIENTE PIC S9(6)V99.
          01 SALIR PIC X(1) VALUE 'N'.
          01 OPCION PIC 9.
          01 CANTIDAD PIC 9(6)V99.   
       PROCEDURE DIVISION.
       
            
            PERFORM UNTIL SALIR = 'S'
              DISPLAY "1.CREAR CUENTA"
              DISPLAY "2.CONSULTAR SALDO"
              DISPLAY "3.DEPOSITAR DINERO"
              DISPLAY "4.RETIRAR DINERO"
              DISPLAY "5.SALIR"
              ACCEPT OPCION
                EVALUATE OPCION
                   WHEN 1
                   PERFORM CREAR_CUENTA
                   WHEN 2
                   PERFORM CONSULTAR_SALDO
                   WHEN 3
                   PERFORM DEPOSITAR
                   WHEN 4
                   PERFORM RETIRAR
                   WHEN 5
                   MOVE 'S' TO SALIR
                  WHEN OTHER
                     DISPLAY "OPCION INCORRECTA"
                END-EVALUATE
             END-PERFORM.  
           STOP RUN. 
            
        CREAR_CUENTA.
            DISPLAY "AQUI SE CREA LA CUENTA".   
           
        CONSULTAR_SALDO.
            DISPLAY "AQUI CONSULTO EL SALDO".
        DEPOSITAR.
            DISPLAY "AQUI DEPOSITO DINERO".
        RETIRAR.
            DISPLAY "AQUI RETIRO DINERO".    

           
            








     
 







 