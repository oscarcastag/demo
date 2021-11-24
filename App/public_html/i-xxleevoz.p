&GLOBAL-DEFINE OUT PUT UNFORMATTED  

DEFINE TEMP-TABLE tt-tablas
    FIELD tt-nombre1    AS CHAR FORMAT "X(30)"
    FIELD tt-nombre2   AS CHAR FORMAT "X(30)".
DEFINE TEMP-TABLE tt-campos
    FIELD tt-tabla  AS CHAR FORMAT "X(30)"
    FIELD tt-campo1 AS CHAR FORMAT "X(30)"
    FIELD tt-campo2 AS CHAR FORMAT "X(20)"
    FIELD tt-cam1   AS CHAR FORMAT "X(20)"
    FIELD tt-cam2   AS CHAR FORMAT "X(20)".
DEFINE TEMP-TABLE tt-info
    FIELD tt-info1 AS CHAR FORMAT "X(30)"
    FIELD tt-info2 AS CHAR FORMAT "X(30)"
    INDEX tt-info tt-info1 DESC.

DEF var v-comando AS CHAR no-undo.
DEF var v-proceso AS CHAR no-undo.
DEF var v-palabras AS CHAR no-undo.
DEF var v-orden AS CHAR no-undo.
DEF VAR v-line1 AS CHAR FORMAT "x(70)".

v-comando   = OS-GETENV("orden").
v-proceso   = OS-GETENV("proceso").
v-palabras  = OS-GETENV("palabras").
v-orden     = OS-GETENV("orden2").
v-line1 = v-comando.


RUN conecta.
RUN carga.
/*
{&out} "l:" v-line1 " p:" v-palabras " O:" v-orden " C:" v-comando " P:" v-proceso.
*/
IF v-palabras <> ? AND v-orden <> ? THEN RUN palabras.
ELSE IF v-line1 BEGINS "borrar"  THEN RUN borrar.
ELSE IF v-line1 BEGINS "proceso" THEN RUN proceso.
ELSE IF v-line1 BEGINS "datos" THEN RUN datos.
ELSE DO:
  RUN transforma.
  RUN ejecuta.
END.

PROCEDURE transforma.
    RUN procesa.
END.

PROCEDURE procesa.
   FOR EACH tt-info WHERE tt-info1 <> "":
       v-line1 = REPLACE(v-line1, tt-info1, tt-info2). 
   END.
   FOR EACH tt-tablas :
       IF tt-nombre1 = "" THEN NEXT.
       v-line1 = REPLACE(v-line1, tt-nombre1, tt-nombre2). 
   END.
   FOR EACH tt-campos WHERE tt-cam1 <> "":
       v-line1 = REPLACE(v-line1, tt-cam1, tt-campo1). 
   END.
END.

PROCEDURE ejecuta.
 OUTPUT TO p.txt.
    {&OUT}  v-line1 skip.
 OUTPUT CLOSE.
 RUN p.txt.
END.
PROCEDURE datos.
   FOR EACH tt-info.
       DISP tt-info.
   END.
END.
PROCEDURE proceso.
    v-line1 = SUBSTRING(v-line1,9,30).
    IF v-line1 = "" THEN v-line1 = "paso.p".
    OUTPUT TO value(v-line1).
       PUT UNFORM v-proceso SKIP.
    OUTPUT CLOSE.
END.

PROCEDURE palabras.
    IF v-palabras = ? OR v-orden = ? THEN NEXT.
    IF v-palabras = "" OR v-orden = "" THEN NEXT.
    IF v-palabras = "!" OR v-orden = "!" THEN NEXT.
    FIND FIRST tt-info WHERE tt-info1 = v-palabras NO-ERROR.
    IF NOT AVAIL tt-info THEN DO:
       CREATE tt-info.
       ASSIGN tt-info.tt-info1 = v-palabras.
              tt-info.tt-info2 = v-orden.
    END.
    ELSE DO:
        ASSIGN tt-info.tt-info1 = v-palabras.
               tt-info.tt-info2 = v-orden.

    END.
    OUTPUT TO c:\mfgchr\xxdatos.txt.
    FOR EACH tt-info.
        EXPORT tt-info.
    END.
    OUTPUT CLOSE.
END.
PROCEDURE borrar.
    FIND tt-info WHERE tt-info1 = v-palabras NO-ERROR.
    IF AVAIL tt-info THEN DO:
        DELETE tt-info.
    END.
    OUTPUT TO c:\mfgchr\xxdatos.txt.
    FOR EACH tt-info.
        EXPORT tt-info.
    END.
    OUTPUT CLOSE.
END.

PROCEDURE conecta.
    IF NOT CONNECTED("Sports2000") THEN
       CONNECT c:\wrk91d\sports2000.db -N tcp  -H localhost  -S 11660.
END.

PROCEDURE carga.
    INPUT FROM c:\mfgchr\xxtablas.txt.
    REPEAT:
        CREATE tt-tablas.
        IMPORT tt-tablas.
    END.
    INPUT CLOSE.
    INPUT FROM c:\mfgchr\xxcampos2.txt.
    REPEAT:
        CREATE tt-campos.
        IMPORT tt-campos.
    END.
    INPUT CLOSE.
    INPUT FROM c:\mfgchr\xxdatos.txt.
    REPEAT:
        CREATE tt-info.
        IMPORT tt-info.
    END.
    INPUT CLOSE.
END.
