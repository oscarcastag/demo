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
assign
v-user     = entry(1,session:parameter)
v-ord      = entry(2,session:parameter)
v-cte      = entry(3,session:parameter).
{cabecera.i}

FIND customer WHERE custnum = int(v-cte) NO-LOCK NO-ERROR.

{&OUT} '
<h2>Ordenes de Venta DEL cliente:' v-cte " " name  '</h2>
<table border = 0 width = 100% cellspacing = 0>
' skip.         
{&OUT} '
          <tr><th  bgcolor="#cccccc">Orden</th>
          <th bgcolor="#cccccc">Cliente</th>
          <th bgcolor="#cccccc">Fecha</th>
          <th bgcolor="#cccccc">T Cred</th>
          <th bgcolor="#cccccc">Estatus</th>
          <th bgcolor="#cccccc">Items</th>
          <th bgcolor="#cccccc">Total</th>
    </tr>
' skip.              

DEF VAR v-qty1 AS INTE.
DEF VAR v-tot1 AS INTE.

FOR EACH order WHERE order.custnum = int(v-cte) NO-LOCK:
    v-qty1 = 0.
    v-tot1 = 0.
    FIND customer OF order NO-LOCK NO-ERROR.
    FOR EACH orderlin WHERE ordernum = order.ordernum NO-LOCK:
        v-tot = ExtendedPrice  + v-tot.
        v-qty = v-qty + 1.
     v-tot1 = ExtendedPrice  + v-tot1.
     v-qty1 = v-qty1 + 1.
    END.

    {&OUT} '
        <tr> 
          <td align = left><a href = "?p=show_cart3.p&user=' v-user '&ord='  order.ordernum '&cte='  v-cte '">' order.ordernum '</a> </td>
          <td align = left>' Order.CustNum         '</td>
          <td align = center>' order.orderDate     '</td>
          <td align = center>'  Order.Creditcard   '</td>     
          <td align = center>' Order.OrderStatus   '</td>
          <td align = center>' v-qty1  format ">>>,>>>,>>>"            '</td>
          <td align = center>' v-tot1  format "$>>>,>>>,>>>.99"           '</td>
    </tr>
' skip.
END.
{&OUT} '
          <tr>
          <th colspan = 5 bgcolor="#cccccc">&nbsp;</td>
          <th align = center bgcolor="#cccccc">' v-qty format ">>>,>>>,>>>" '</th>
          <th align = center bgcolor="#cccccc">' v-tot format "$>>>,>>>,>>>.99" '</th>
          </tr>
      </table>
      <center><a href="?p=show_cliente.p&user=' v-user '&cte=' v-cte '">
               <img src="images/continue-shopping.gif"
               alt="Continuar Comprando" border=0 height = 50 width = 135></a>
               </center>  
    </body>
    </html>' 
skip.

          
