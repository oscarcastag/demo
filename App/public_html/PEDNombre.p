{C:\Cnxns-GMM\individual\endodos\anteriores\inicio.i endosos}
/*********************************************************************
Programa:   COLMC640.P                                               *
Autor:      JMA/LRI 10/2000                                          *
Funcion:    Regla del Negocio.                                       *
            Consulta Nacional de Asegurados por poliza/nombre aseg.  *
**********************************************************************/

DEF TEMP-TABLE t-asegurados LIKE EDAsegurados
    FIELD t-recid           AS RECID.             

DEF INPUT        PARAMETER p-ap-pat    AS  CHAR.
DEF INPUT        PARAMETER p-poliza    AS  CHAR FORMAT "X(12)".
DEF INPUT-OUTPUT PARAMETER table       FOR t-asegurados.   

DEF VAR l-completo      AS CHAR.
DEF VAR l-ap-nom        AS CHAR.
DEF VAR l-nom-ap        AS CHAR.
DEF VAR l-ap-nom-match  AS CHAR.
DEF VAR l-nom-ap-match  AS CHAR.
DEF VAR l-index         AS INTE.
DEF VAR l-len           AS INTE.
DEF VAR l-char          AS CHAR.
DEF VAR l-resul         AS CHAR.   
DEF VAR l-ApNom         AS LOGI.
DEF VAR l-resp          AS CHAR.
DEF VAR l-contains      AS CHAR.
DEF VAR l-matches-ap    AS CHAR.
DEF VAR l-matches-nom   AS CHAR.
DEF VAR l-chorombolo    AS LOGI.
DEF VAR l-resultado     AS CHAR.
DEF VAR l-hastaqui      AS INTE.
DEF VAR l-totcomp       AS INTE.
DEF VAR l-SiRaro        AS LOGI.

DEF VAR l-ascii      AS INTE FORMAT "999" EXTENT 22
INITIAL [193,201,205,211,218,       /* Á,É,Í,Ó,Ú */
         225,233,237,243,250,       /* á,é,í,ó,ú */
         192,200,204,210,217,       /* À,È,Ì,Ò,Ù */
         224,232,236,242,249,       /* à,è,ì,ò,ù */
         209,241].                  /* Ñ,ñ       */
         

RUN ArmaVariablesBusqueda.

/*message "l-chorombolo   " + string(l-chorombolo)   skip
 *         "l-ap-nom-match " + l-ap-nom-match         skip
 *         "l-nom-ap-match " + l-nom-ap-match         skip
 *         "l-completo     " + l-completo             skip
 *         "l-contains     " + l-contains             skip
 *         "l-matches-nom  " + l-matches-nom          skip 
 *         "l-matches-ap   " + l-matches-ap  view-as Alert-box.*/

FOR EACH t-asegurados:
    DELETE t-asegurados.
END.

IF l-chorombolo THEN DO:
    IF p-poliza = "" or p-poliza = " " THEN DO:
        FOR EACH EDAsegurados 
            WHERE (NombreCompleto contains l-contains) 
              AND ((NombreCompleto matches l-matches-nom) 
                OR (NombreCompleto matches l-matches-ap))
            NO-LOCK: 
            CREATE t-asegurados.
            BUFFER-COPY EDAsegurados TO t-asegurados.
            t-asegurados.t-recid = RECID(EDAsegurados).
        END.
    END.
    ELSE DO:
        FOR EACH EDAsegurados 
            WHERE /*(EDAsegurados.cve-pol begins p-poliza) AND*/
                  (NombreCompleto contains l-contains) 
              AND ((NombreCompleto matches l-matches-nom) 
               OR (NombreCompleto matches l-matches-ap))
            NO-LOCK:
            CREATE t-asegurados.
            BUFFER-COPY EDAsegurados TO t-asegurados.
            t-asegurados.t-recid = RECID(EDAsegurados).
        END.   
    END.   
END.
ELSE DO:  
    IF p-poliza = "" OR p-poliza = " " THEN DO:
        FOR EACH EDAsegurados 
            WHERE (NombreCompleto contains l-completo) 
              AND ((NombreCompleto matches l-nom-ap-match  
               OR NombreCompleto matches l-ap-nom-match ))
            NO-LOCK: 
            CREATE t-asegurados.
            BUFFER-COPY EDAsegurados TO t-asegurados.
            t-asegurados.t-recid = RECID(EDAsegurados).
        END.
    END.
    ELSE DO:
        FOR EACH EDAsegurados 
            WHERE /*(EDAsegurados.cve-pol begins p-poliza) AND*/
                  ((NombreCompleto contains l-completo)  
              AND (NombreCompleto matches l-nom-ap-match 
                OR NombreCompleto matches l-ap-nom-match))
            NO-LOCK: 
            CREATE t-asegurados.
            BUFFER-COPY EDAsegurados TO t-asegurados.
            t-asegurados.t-recid = RECID(EDAsegurados).
        END.   
    END.   
END.

PROCEDURE ArmaVariablesBusqueda:

    l-Chorombolo = FALSE.
    IF p-ap-pat <> "" AND p-ap-pat <> " " THEN DO:
        l-completo  = l-completo + " " + TRIM(p-ap-pat).
        l-nom-ap    = l-nom-ap   + " " + TRIM(p-ap-pat).
        l-resultado = TRIM(p-ap-pat).
        l-SiRaro    = FALSE.
    
        RUN BuscaCaracterRaro.
        IF l-SiRaro THEN DO:
           IF LENGTH(l-resultado) > 2 THEN
              l-contains = l-contains + " " + l-resultado.
           l-Chorombolo = TRUE.
        END. 
        ELSE
           l-contains   = l-contains + " " + TRIM(p-ap-pat).   
    END. 
  
    IF p-ap-pat <> "" AND p-ap-pat <> " " THEN
        l-ap-nom   = TRIM(p-ap-pat).
 
    IF NOT l-chorombolo THEN DO:
        l-resp = l-nom-ap.
        l-ApNom = FALSE.
    
        RUN ArmaNombreMatches.
        l-resp = l-ap-nom.
        l-ApNom = TRUE.
    
        RUN ArmaNombreMatches.
    END.
    ELSE DO:
        l-resp = l-nom-ap.
        l-ApNom = FALSE.
        RUN ArmaNombreMatches.  
        l-resp = l-ap-nom.
        l-ApNom = TRUE.
        RUN ArmaNombreMatches. 
    END. 
END. /* ArmaVariblesBusqueda */
  
PROCEDURE ArmaNombreMatches:
    
    l-index = 1.
    l-len = 0.
    l-resul = "".
    DO WHILE TRUE:
        l-len = INDEX(l-resp, " ", l-index). 
        IF l-len > 0 THEN DO:
           IF l-len > l-index THEN 
                l-resul = l-resul + 
                          SUBSTRING(l-resp,l-index, l-len - l-index)+ 
                          "*".   
           l-index = l-len + 1.
        END.
        ELSE 
            LEAVE.
    END.
    l-resul = "*" + l-resul + substring(l-resp,l-index)+ "*".
 
    IF l-chorombolo THEN DO:
        IF l-ApNom THEN DO:
            l-matches-ap = TRIM(l-resul).
            l-totcomp = 1.
            DO WHILE TRUE:
               l-matches-ap = REPLACE(l-matches-ap, chr(l-ascii[l-totcomp]), "*").
               l-totcomp = l-totcomp + 1.
               IF l-TotComp > 22 THEN
                  LEAVE.
           END.
        END.
        ELSE DO:
            l-matches-nom = TRIM(l-resul).   
            l-totcomp = 1.
            DO WHILE TRUE:
               l-matches-nom = Replace(l-matches-nom, chr(l-ascii[l-totcomp]), "*").
               l-totcomp = l-totcomp + 1.
               IF l-TotComp > 22 THEN
                  LEAVE.
            END.    
        END. 
    END. 
    ELSE DO:
        IF l-ApNom THEN
            l-ap-nom-match = TRIM(l-resul).
         ELSE
            l-nom-ap-match = TRIM(l-resul).
    END.   
END. /* PROCEDURE ArmaNombreMatches */

PROCEDURE BuscaCaracterRaro:

DEF VAR l-palnva AS CHAR.
DEF VAR cuenta   AS INTE.

    l-totcomp = 1.
    DO WHILE TRUE:
        l-resultado = REPLACE(l-resultado, chr(l-ascii[l-totcomp]), "*").
        l-totcomp = l-totcomp + 1.
        IF l-TotComp > 22 THEN
            LEAVE.
    END.
    DO cuenta = 1 TO NUM-ENTRIES(l-resultado," "):
        ASSIGN l-palnva = l-palnva + ENTRY(1,ENTRY(cuenta,l-resultado,' '),'*') + '* '.
    END.


    l-hastAqui = INDEX(l-resultado, "*").
    IF l-HastAqui > 0 THEN DO: 
        l-resultado = l-palnva.
        l-SiRaro = TRUE.
    END.
END.
