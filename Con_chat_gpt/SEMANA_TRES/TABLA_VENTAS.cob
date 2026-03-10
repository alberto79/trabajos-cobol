                *>Guardar 5 ventas y calcular el ventas total,
                *> venta maxima , venta media.
         IDENTIFICATION DIVISION.
         PROGRAM-ID. TABLA-SALARIOS.
   
         DATA DIVISION.
         WORKING-STORAGE SECTION.
         01 VENTAS.
            05 VENTA PIC 9(5)V99 OCCURS 5 TIMES.
         01 TOTAL-VENTA PIC 9(7)V99 VALUE ZERO.
         01 VENTA-MAXIMA PIC 9(7)V99 VALUE ZERO.
         01 VENTA-MEDIA PIC 9(7)V99 VALUE ZERO.
         01 I PIC 9(1) VALUE 1.
         PROCEDURE DIVISION.
            PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
                  DISPLAY "Ingrese la venta " I ": "
                  ACCEPT VENTA(I)
                  ADD VENTA(I) TO TOTAL-VENTA
                  IF VENTA(I) > VENTA-MAXIMA
                     MOVE VENTA(I) TO VENTA-MAXIMA
                  END-IF
            END-PERFORM
   
            DISPLAY "VENTA TOTAL: " TOTAL-VENTA.
            DISPLAY "VENTA MAXIMA: " VENTA-MAXIMA.
            COMPUTE VENTA-MEDIA = TOTAL-VENTA / 5.
            DISPLAY "VENTA MEDIA: " VENTA-MEDIA.
   
            STOP RUN.



            