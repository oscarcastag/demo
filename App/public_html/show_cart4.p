&GLOBAL-DEFINE OUT PUT UNFORMATTED       
DEF STREAM pagina.
DEF VAR v-lin AS INTE.
DEF VAR v-user AS CHAR.
DEF VAR v-new AS CHAR.
DEF VAR v-cant AS CHAR.
DEF VAR v-qty AS INT.
DEF VAR v-tot AS DEC.
DEF VAR v-ord AS CHAR.
DEF VAR v-cte AS CHAR.

ASSIGN
v-new      = OS-GETENV("new")
v-ord      = OS-GETENV("ord")
v-user     = OS-GETENV("user")
v-cte      = OS-GETENV("cte").

{c:\appserv\www\ton\cabecera2.i}


{&OUT} '
<h2>Tu orden de venta:' v-cte '</h2>
<table border = 0 width = 100% cellspacing = 0>
' skip.         
FIND order WHERE order.ordernum = INT(v-ord) NO-LOCK NO-ERROR.
IF AVAIL order THEN DO:
   FIND customer OF order NO-LOCK NO-ERROR.
 {&OUT} '
   <tbody><tr><th colspan="2" bgcolor="#cccccc">Detalles Orden Venta</th></tr>
   <tr>
     <td>Orden</td>
     <td>'    order.ordernum 
      '</td>
   </tr>
   <tr>
     <td>Tarjeta</td>
     <td>' Order.Creditcard '</td>
   </tr>
   <tr>
     <td>Fecha </td>
     <td>' order.orderdate '</td> 
   </tr>
   <tr>
     <td>Estatus</td>
     <td>' Order.OrderStatus '</td>
   </tr>
   </tbody>
' skip.
{&out} '
     <table border = 0 width = 100% cellspacing = 0>
     <tr><th colspan = 2 bgcolor="#cccccc">Información de cliente</th></tr>
     <tr>
       <td>Nombre</td>
       <td>' name '</td>
     </tr>
     <tr>
       <td>Dirección</td>
       <td>' address '</td>
     </tr>
     <tr>
       <td>Ciudad/Suburbio</td>
       <td>' city '</td>
     </tr>
     <tr>
       <td>Estado/Provincia</td>
       <td>' state '</td>
     </tr>
     <tr>
       <td>Código Postal o Código Zip</td>
       <td>' Postalcode '</td>
     </tr>
     <tr>
       <td>País</td>
       <td>' country '</td>
     </tr>
     </table>' skip.

END.

{&OUT} '
  <table border = 0 width = 100% cellspacing = 0>
  <form action =?p=show_cart.p&user=' v-user '&ord=' v-ord ' method = post>
          <tr><th colspan = 2 bgcolor="#cccccc">Item</th>
          <th bgcolor="#cccccc">Precio</th>
          <th bgcolor="#cccccc">Cantidad</th>
          <th bgcolor="#cccccc">Total</th></tr>
' skip.              
v-qty = 0.
v-tot = 0.
FOR EACH orderline WHERE ordernum = int(v-ord) NO-LOCK:
    FOR FIRST ITEM WHERE ITEM.itemnum = orderline.itemnum NO-LOCK:
    END.
{&OUT} '
        <tr> 
          <td align = left><img src="images/cat' string(orderline.itemnum,"99999") '.jpg" border=0 width = 31 height = 47></td>
          <td align = left>' CatDescription '
     </td>
          <td align = center>' orderline.price '</td>
          <td align = center>' orderline.qty   '</td>
          <td align = center>' ExtendedPrice format "$>>>,>>>,>>>.99"  '</td>
    </tr>
' skip.
    v-qty = orderline.qty + v-qty.
    v-tot = ExtendedPrice  + v-tot.
END.
{&OUT} '
          <tr>
          <th colspan = 3 bgcolor="#cccccc">&nbsp;</td>
          <th align = center bgcolor="#cccccc">' v-qty '</th>
          <th align = center bgcolor="#cccccc">' v-tot format "$>>>,>>>,>>>.99" '</th>
          </tr>
          </form>
      </table>
      <center><a href="?p=show_orden.p&&user=' v-user '&ord=' v-ord '&cte=' v-cte '">
               <img src="images/continue-shopping.gif"
               alt="Continuar Comprando" border=0 height = 50 width = 135></a>
               </center> </body>
    </html>' 
skip.

          
