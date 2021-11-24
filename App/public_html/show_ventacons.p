&GLOBAL-DEFINE OUT PUT UNFORMATTED       
DEF STREAM pagina.
DEF VAR v-lin AS INTE.
DEF VAR v-user AS CHAR.
DEF VAR v-new AS CHAR.
DEF VAR v-cant AS CHAR.
DEF VAR v-qty AS INT.
DEF VAR v-tot AS DEC.
DEF VAR v-ord  AS CHAR.

ASSIGN
v-new      = OS-GETENV("new")
v-ord      = OS-GETENV("ord")
v-user     = OS-GETENV("user")
v-cant     = OS-GETENV("cant").

{c:\ampps\www\ton\cabecera.i}

v-qty = 0.
v-tot = 0.
IF v-user <> "99999" THEN
FOR EACH ventaslin WHERE  custnum = int(v-user):
 v-qty = 1 + v-qty.
 FOR EACH order WHERE ordernum = ventaslin.ordernum NO-LOCK:
    FOR EACH orderline OF order NO-LOCK:
       v-tot = ExtendedPrice  + v-tot.
    END.
 END.
END.
ELSE
    FOR EACH ventaslin :
     v-qty = 1 + v-qty.
     FOR EACH order WHERE ordernum = ventaslin.ordernum NO-LOCK:
        FOR EACH orderline OF order NO-LOCK:
        v-tot = ExtendedPrice  + v-tot.
        END.
     END.
    END.



{&OUT} '
<h2>Tus compras ON LINE</h2>
<table border = 0 width = 100% cellspacing = 0>
' skip.         
{&OUT} '
  <form action =?p=show_cart.p&user=' v-user '&ord=' v-ord ' method = post>
          <tr><th colspan = 2 bgcolor="#cccccc">Orden</th>
          <th bgcolor="#cccccc">Fecha</th>
          <th bgcolor="#cccccc">Nombre</th>
          <th bgcolor="#cccccc">Direccion</th>
          <th bgcolor="#cccccc">Estatus Order</th>
          <th bgcolor="#cccccc"># Items</th>
          <th bgcolor="#cccccc">Total</th></tr>
' skip.              

DEF VAR v-qty1 AS INTE.
DEF VAR v-tot1 AS INTE.

FOR EACH ventaslin WHERE v-user = "99999" OR custnum = int(v-user) NO-LOCK:
    v-qty1 = 0.
    v-tot1 = 0.
    FOR EACH orderlin WHERE ordernum = ventaslin.ordernum NO-LOCK:
     v-tot1 = ExtendedPrice  + v-tot1.
     v-qty1 = v-qty1 + 1.
    END.
    FIND order WHERE order.ordernum = ventaslin.ordernum NO-LOCK NO-ERROR.

    {&OUT} '
        <tr> 
          <td align = left><a href = "?p=show_cart2.p&user=' v-user '&ord='  ventaslin.ordernum '">' ventaslin.ordernum '</a> </td>
          <td align = left>'  '</td>
          <td align = center>' ventaslin.orderDate '</td>
          <td align = center>' ventaslin.nombre   '</td>
          <td align = center>' ventaslin.direccion   '</td>
          <td align = center>' orderstatus   '</td>
          <td align = center>' v-qty1  format ">>>,>>>" '</td>
          <td align = center>' v-tot1 format "$>>>,>>>,>>>.99"  '</td>
    </tr>
' skip.
END.
{&OUT} '
          <tr>
          <th colspan = 6 bgcolor="#cccccc">&nbsp;</td>
          <th align = center bgcolor="#cccccc">' v-qty format ">>>,>>>" '</th>
          <th align = center bgcolor="#cccccc">' v-tot format "$>>>,>>>,>>>.99" '</th>
          </tr>
          </form>
      </table>
      <center><a href="?p=show_ventacons.p&user=' v-user '&ord=' v-ord '">
               <img src="images/continue-shopping.gif"
               alt="Continuar Comprando" border=0 height = 50 width = 135></a>
               </center>  
    </body>
    </html>' 
skip.

          
