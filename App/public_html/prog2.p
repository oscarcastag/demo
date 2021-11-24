&GLOBAL-DEFINE OUT PUT UNFORMATTED       
DEF STREAM pagina.
DEF VAR v-user AS CHAR.
DEF VAR v-ord  AS CHAR.
DEF VAR v-cant AS CHAR.
DEF VAR v-qty AS INT.
DEF VAR v-tot AS DEC.
DEF VAR v-new AS CHAR.
DEF VAR V-PALABRA AS CHAR.
DEF VAR v-lin AS CHAR.
DEF VAR v-lin2 AS CHAR.
DEF VAR v-num AS INTE.
DEF VAR v-pal AS CHAR INIT "Nehemias 13.23-27.".
DEF VAR v-libro AS CHAR.
DEF VAR v-cap   AS CHAR.
DEF VAR v-ver1 AS CHAR.
DEF VAR v-ver2 AS CHAR.
DEF VAR v-caplog AS LOG.
DEF VAR v-caplog1 AS LOG.
DEF VAR v-caplog2 AS LOG.

{c:\appserv\www\ton\cabecera3.i}

DEFINE TEMP-TABLE tt-biblia LIKE libros.

DEF TEMP-TABLE tt-conc1 LIKE tt-conc.
DEF TEMP-TABLE tt-conc2 LIKE tt-conc.

DEFINE BUTTON b-salir 
     LABEL "Salir" 
     SIZE 15 BY 1.14.

DEFINE VARIABLE F-letra AS CHARACTER FORMAT "X(256)":U 
     LABEL "Letra" 
     VIEW-AS FILL-IN 
     SIZE 11 BY 1
     BGCOLOR 15 FGCOLOR 1  NO-UNDO.

DEFINE VARIABLE f-palabra AS CHARACTER FORMAT "X(256)":U 
     LABEL "Palabra" 
     VIEW-AS FILL-IN 
     SIZE 30 BY 1
     BGCOLOR 15 FGCOLOR 1  NO-UNDO.

DEFINE VARIABLE f-busca AS CHARACTER FORMAT "X(256)":U 
     LABEL "Busca" 
     VIEW-AS FILL-IN 
     SIZE 30 BY 1
     BGCOLOR 15 FGCOLOR 1  NO-UNDO.

DEFINE VARIABLE f-relacion AS CHARACTER FORMAT "X(256)":U 
     LABEL "Relacion" 
     VIEW-AS FILL-IN 
     SIZE 59 BY 1
     BGCOLOR 15 FGCOLOR 1  NO-UNDO.

DEF VAR f-todo AS CHAR.

/* Query definitions                                                    */


/* ************************  Frame Definitions  *********************** */
  f-palabra = OS-GETENV("palabra").
  f-letra   = OS-GETENV("letra").
  f-busca   = OS-GETENV("busca").
  f-todo    = OS-GETENV("todo").
  /*
  {&OUT} "Letra:" f-letra " todo:" f-todo.
  */    
  {&OUT} '
  <form action="?p=prog2.p" method="post">' skip '
   <table border="0" cellspacing="2" cellpadding="1">' skip '
      <tr> ' skip '
        <td><font face="Arial, Helvetica, sans-serif">Letra: </font></td>
        <td><input type="text" name="letra"  VALUE=' f-letra '></td>
      </tr>
      <tr> ' skip '
        <td><font face="Arial, Helvetica, sans-serif">Palabra:</font>
        </td>
            <td><input type="text" name="palabra" VALUE=' f-palabra '></td>
      </tr>  ' skip '
      <tr>
        <td colspan="2"><div align="center">
            <input type="hidden" name="iniciado">
            <input type="submit" name="Submit" value="Busqueda">
            <input type="submit" name="todo" value="Toda Biblia">
          </div></td>
      </tr>  ' skip '
   </table> ' skip '
  </form>  ' skip '
  </ul><hr>  ' skip '
   '.
  
  if f-busca <> ? then do:
     RUN busca.
  end.
  
  if f-palabra <> ? then do:
     RUN palabra.
  END.
  if f-letra <> ? then do:
    RUN letra.
  end.
  if f-todo <> ? then do:
    RUN todo.
  end.
  {&OUT} '
      </body>
      </html> 
  ' skip.

PROCEDURE letra.

  FOR EACH tt-conc1 :
      DELETE tt-conc1 .
  END.
  
  FOR EACH tt-conc WHERE tt-conc.tt-letra BEGINS f-letra AND
               tt-conc.tt-PALABRA BEGINS f-letra
   BREAK BY tt-conc.tt-palabra:
   IF LAST-OF(tt-conc.tt-palabra) THEN DO:
        
      CREATE tt-conc1.
      BUFFER-COPY tt-conc TO tt-conc1.
   END.
  END.

  {&OUT} '<BR>
    <form action ="?p=prog2.p&letra=' f-letra '&palabra=' f-palabra ' method = post>
          <table>   <tr>
            <td bgcolor="#cccccc">Palabra</td>
            <td bgcolor="#cccccc">Frase</td>
            <td bgcolor="#cccccc">Cita/Relacion</td>
            <td bgcolor="#cccccc">Relacion1 </td>
            <td bgcolor="#cccccc">Relacion2 </td>
            <td bgcolor="#cccccc">Relacion3 </td>
            <td bgcolor="#cccccc">Relacion4 </td>
            </tr> </table>
  <TABLE BGCOLOR = "cyan">' skip.              
  FOR EACH tt-conc1 NO-LOCK.    
      f-relacion = tt-conc1.tt-frase.
       {&OUT} '
        <tr> 
        <td BGCOLOR = "white" align = left><a href = "?p=prog2.p&palabra=' tt-conc1.tt-palabra '&letra=' tt-conc1.tt-letra '">' tt-conc1.tt-palabra '</a> </td>
        <td align = center>' f-relacion '</td>  
        ' skip.
        IF tt-conc1.tt-FRASE = "Relacionar" THEN 
        {&OUT} '
        <td BGCOLOR = "white" align = center><a href = "?p=prog2.p&palabra=' tt-conc1.tt-cita1 '&letra=' tt-conc1.tt-letra '">' tt-conc1.tt-cita1 '</td>
        <td align = center><a href = "?p=prog2.p&palabra=' tt-conc1.tt-cita2 '&letra=' tt-conc1.tt-letra '">' tt-conc1.tt-cita2 '</td>
        <td align = center><a href = "?p=prog2.p&palabra=' tt-conc1.tt-cita3 '&letra=' tt-conc1.tt-letra '">' tt-conc1.tt-cita3 '</td>
        <td align = center><a href = "?p=prog2.p&palabra=' tt-conc1.tt-cita4 '&letra=' tt-conc1.tt-letra '">' tt-conc1.tt-cita4 '</td>
        </tr>' skip.
        ELSE
        {&OUT} '
            <td BGCOLOR = "white" align = center><a href = "?p=prog2.p&busca=' tt-conc1.tt-cita1 '&letra=' tt-conc1.tt-letra '&palabra=' tt-conc1.tt-palabra '">' tt-conc1.tt-cita1 '</td>
            <td align = center><a href = "?p=prog2.p&busca=' tt-conc1.tt-cita2 '&letra=' tt-conc1.tt-letra '&palabra=' tt-conc1.tt-palabra '">' tt-conc1.tt-cita2 '</td>
            <td align = center><a href = "?p=prog2.p&busca=' tt-conc1.tt-cita3 '&letra=' tt-conc1.tt-letra '&palabra=' tt-conc1.tt-palabra '">' tt-conc1.tt-cita3 '</td>
            <td align = center><a href = "?p=prog2.p&busca=' tt-conc1.tt-cita4 '&letra=' tt-conc1.tt-letra '&palabra=' tt-conc1.tt-palabra '">' tt-conc1.tt-cita4 '</td>
            </tr>' skip.

  END.
   {&OUT} '</table>'.
END.

PROCEDURE palabra.

    {&OUT} '
      <form action =?p=prog2.p&letra=' f-letra '&palabra=' f-palabra ' method = post>
             <TABLE><tr> 
              <td bgcolor="#cccccc">Palabra</td>
              <td bgcolor="#cccccc">Frase</td>
              <td bgcolor="#cccccc">Cita/Relacion</td>
        <td bgcolor="#cccccc">Relacion1 </td>
        <td bgcolor="#cccccc">Relacion2 </td>
        <td bgcolor="#cccccc">Relacion3 </td>
        <td bgcolor="#cccccc">Relacion4 </td>
    <TABLE BGCOLOR = "cyan">' skip.              

FOR EACH tt-conc WHERE tt-conc.tt-palabra = f-palabra  NO-LOCK.   
     f-relacion = tt-conc.tt-frase.
    {&OUT} '
        <tr> 
          <td align = left>' tt-conc.tt-palabra '</a> </td>
          <td align = center>' f-relacion '</td>' skip.
          IF tt-conc.tt-FRASE = "Relacionar" THEN 
        {&OUT} '
        <td BGCOLOR = "white" align = center><a href = "?p=prog2.p&palabra=' tt-conc.tt-cita1 '&letra=' tt-conc.tt-letra '">' tt-conc.tt-cita1 '</td>
        <td align = center><a href = "?p=prog2.p&palabra=' tt-conc.tt-cita2 '&letra=' tt-conc.tt-letra '">' tt-conc.tt-cita2 '</td>
        <td align = center><a href = "?p=prog2.p&palabra=' tt-conc.tt-cita3 '&letra=' tt-conc.tt-letra '">' tt-conc.tt-cita3 '</td>
        <td align = center><a href = "?p=prog2.p&palabra=' tt-conc.tt-cita4 '&letra=' tt-conc.tt-letra '">' tt-conc.tt-cita4 '</td>
        </tr>' skip.
        ELSE
        {&OUT} '
            <td BGCOLOR = "white" align = center><a href = "?p=prog2.p&busca=' tt-conc.tt-cita1 '&letra=' tt-conc.tt-letra '&palabra=' tt-conc.tt-palabra '">' tt-conc.tt-cita1 '</td>
            <td align = center><a href = "?p=prog2.p&busca=' tt-conc.tt-cita2 '&letra=' tt-conc.tt-letra '&palabra=' tt-conc.tt-palabra '">' tt-conc.tt-cita2 '</td>
            <td align = center><a href = "?p=prog2.p&busca=' tt-conc.tt-cita3 '&letra=' tt-conc.tt-letra '&palabra=' tt-conc.tt-palabra '">' tt-conc.tt-cita3 '</td>
            <td align = center><a href = "?p=prog2.p&busca=' tt-conc.tt-cita4 '&letra=' tt-conc.tt-letra '&palabra=' tt-conc.tt-palabra '">' tt-conc.tt-cita4 '</td>
            </tr>' skip.

END.
    {&OUT} '</table>'.

END.

PROCEDURE busca.

FOR EACH tt-biblia:
    DELETE tt-biblia.
END.
v-pal = f-busca.
OUTPUT TO xx.txt.
PUT UNFORM v-pal SKIP.
OUTPUT CLOSE.

INPUT FROM  xx.txt.
  IMPORT DELIMITER " " v-pal v-lin v-lin2.
INPUT CLOSE.
IF v-lin2 <> "" THEN assign v-pal = v-pal + " " + v-lin v-lin = v-lin2.
v-cap = "".
v-num = 1.
v-caplog = YES.
DO WHILE v-num <= LENGTH(v-lin):

    IF SUBSTRING(v-lin,v-num,1) = "." THEN ASSIGN v-caplog = NO v-caplog1 = YES.
    IF SUBSTRING(v-lin,v-num,1) = "-" THEN ASSIGN v-caplog2 = YES v-caplog1 = NO.

    IF v-caplog THEN
       v-cap = v-cap + SUBSTRING(v-lin,v-num,1). 
    IF v-caplog1 THEN
       v-ver1 = v-ver1 + SUBSTRING(v-lin,v-num,1). 
    IF v-caplog2 THEN
       v-ver2 = v-ver2 + SUBSTRING(v-lin,v-num,1). 
    v-ver1 = REPLACE(v-ver1,".","").
    v-ver1 = REPLACE(v-ver1,";","").
    v-ver2 = REPLACE(v-ver2,"-","").
    v-ver2 = REPLACE(v-ver2,".","").
    v-ver2 = REPLACE(v-ver2,";","").
    v-num = v-num + 1.
END.

FIND FIRST libros_desc WHERE nombre BEGINS v-pal NO-ERROR.
IF AVAIL libros_desc THEN 
{&out} "<BR>" f-palabra "<BR>Libro: " libros_desc.nombre "<BR>" SKIP.
FIND FIRST tt-conc WHERE tt-conc.tt-palabra = f-palabra AND 
     tt-conc.tt-cita1 = f-busca NO-LOCK NO-ERROR.
IF AVAIL tt-conc THEN
     {&out} tt-conc.tt-frase "<BR>".
IF v-ver2 = "" THEN v-ver2 = v-ver1.
{&out}
'<table border="0" bgcolor="white" >' skip. 
FOR EACH libros WHERE libros.libro = libros_desc.libro NO-LOCK:

    IF libros.Capitulo = int(v-cap) AND Libros.versiculo >= INT(v-ver1) AND
       Libros.versiculo <= INT(v-ver2)  THEN DO:
        {&out} "<TR>"
          "<TD>" libros.capitulo FORMAT ">>9":U ":"
          "<TD>" libros.versiculo FORMAT ">>9":U ".-"
          "<TD>" libros.linea  "</TR>" SKIP.
    END.
END.
{&out}
'</table>' skip. 

END.

PROCEDURE todo.

v-pal = f-palabra.
{&out} "<BR>Toda la biblia: " f-palabra "<BR>" SKIP.

FOR EACH libros_desc NO-LOCK.
{&out} '<table border="0" bgcolor="white" >' skip. 
 FOR EACH libros WHERE libros.libro = libros_desc.libro AND
     libros.linea   MATCHES "* " + v-pal  + " *" NO-LOCK:
     {&out} "<TR>" "<TD>" libros_desc.nombre 
          "<TD>" libros.capitulo FORMAT ">>9":U ":"
          "<TD>" libros.versiculo FORMAT ">>9":U ".-"
          "<TD>" libros.linea  "</TR>" SKIP.

 END.
 {&out}
 '</table>' skip. 
END.

END.
