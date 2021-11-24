&GLOBAL-DEFINE OUT PUT UNFORMATTED       
DEF STREAM pagina.

DEF VAR f-edo AS CHAR.

/* ************************  Frame Definitions  *********************** */
  f-edo = OS-GETENV("edo").
  FOR EACH tabla
        WHERE tabla.CVE_ENT = INT(f-edo) NO-LOCK .
      {&OUT} '<option value="' Tabla.LAT_DEC   ','  Tabla.LON_DEC '">' Tabla.NOM_MUN  Tabla.NOM_LOC '</option>' skip.

  END.


