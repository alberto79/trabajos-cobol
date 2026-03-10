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
              DISPLAY "-------------------"
              DISPLAY "SISTEMA BANCARIO"
              DISPLAY "1.CREAR CUENTA"
              DISPLAY "2.CONSULTAR SALDO"
              DISPLAY "3.DEPOSITAR DINERO"
              DISPLAY "4.RETIRAR DINERO"
              DISPLAY "5.SALIR"
              DISPLAY "-------------------"
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
          *>  DISPLAY "AQUI SE CREA LA CUENTA".   
           DISPLAY "INGRESE SU NOMBRE".
           ACCEPT NOMBRE_CLIENTE.
           DISPLAY "INGRESE SU PRIMER APELLIDO".
           ACCEPT APELLIDO1_CLIENTE.
           DISPLAY "INGRESE SU SEGUNDO APELLIDO".
           ACCEPT APELLIDO2_CLIENTE.
           DISPLAY "INGRESE SU SALDO INICIAL".
           ACCEPT SALDO_CLIENTE.
           
        CONSULTAR_SALDO.
          
            DISPLAY "SU SALDO ACTUAL ES: " SALDO_CLIENTE.
        DEPOSITAR.
           *> DISPLAY "AQUI DEPOSITO DINERO".
            DISPLAY "INGRESE LA CANTIDAD A DEPOSITAR".
            ACCEPT CANTIDAD.
            COMPUTE SALDO_CLIENTE = SALDO_CLIENTE + CANTIDAD.
            DISPLAY "DEPOSITO REALIZADO, SU NUEVO SALDO ES: "
             SALDO_CLIENTE.
        RETIRAR.
          *>  DISPLAY "AQUI RETIRO DINERO".    
            DISPLAY "INGRESE LA CANTIDAD A RETIRAR".
            ACCEPT CANTIDAD.
            IF CANTIDAD > SALDO_CLIENTE
               DISPLAY "FONDOS INSUFICIENTES"
            ELSE
               COMPUTE SALDO_CLIENTE = SALDO_CLIENTE - CANTIDAD
               DISPLAY "RETIRO REALIZADO, SU NUEVO SALDO ES: "
                SALDO_CLIENTE
            END-IF.

           
            








     
 







 