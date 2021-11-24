&GLOBAL-DEFINE OUT PUT UNFORMATTED       
DEF STREAM pagina.
DEF VAR v-lin AS INTE.
DEF VAR v-user AS CHAR.
DEF VAR v-new AS CHAR.
DEF VAR v-cant AS CHAR.
DEF VAR v-qty AS INT.
DEF VAR v-tot AS DEC.
DEF VAR v-ord  AS CHAR.
DEF VAR v-cte  AS CHAR.

ASSIGN
v-ord      = OS-GETENV("ord")
v-user     = OS-GETENV("user")
v-cte      = OS-GETENV("cte").
ASSIGN
v-ord      = entry(2,session:parameter)
v-user     = entry(1,session:parameter)
v-cte      = entry(3,session:parameter).

{cabecera.i}

{&OUT} '
<h2>Catalogo de Clientes</h2>
    <center><a href="?p=index1.p&user=' v-user '&cte=' v-cte '">
             <img src="images/continue-shopping.gif"
             alt="Continuar Comprando" border=0 height = 50 width = 135></a>
<table align=center border = 0 width = 100% cellspacing = 0>
' skip.         
{&OUT} '
          <tr>
          <th bgcolor="#cccccc">Cliente</th>
          <th bgcolor="#cccccc">Nombre</th>
          <th bgcolor="#cccccc">Direccion</th>
          <th bgcolor="#cccccc">Ciudad</th>
          <th bgcolor="#cccccc">Estado</th>
          <th bgcolor="#cccccc">Pais</th>
          <th bgcolor="#cccccc">Saldo</th>
    </tr>
' skip.              

DEF VAR v-qty1 AS INTE.
DEF VAR v-tot1 AS INTE.

FOR EACH customer  NO-LOCK BY NAME:
     IF balance <> 0 THEN
    {&OUT} '
        <tr> 
          <td align = left><a href = "?p=show_orden.p&user=' v-user '&cte='  custnum '">' custnum '</a> </td>
          <td align = left>' name         '</td>
          <td align = center>' address     '</td>
          <td align = center>' city     '</td>
          <td align = center>' state   '</td>     
          <td align = center>' country  '</td>
          <td align = center>' balance format "$>>>,>>>,>>>.99"  '</td>
    </tr></li>
' skip.
END.
{&OUT} '
      </table>
    </center>
    </body>
    </html>' 
skip.

          
