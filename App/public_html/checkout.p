&GLOBAL-DEFINE OUT PUT UNFORMATTED       
DEF STREAM pagina.
DEF VAR v-lin AS INTE.
DEF VAR v-user AS CHAR.
DEF VAR v-new AS CHAR.
DEF VAR v-cant AS CHAR.
DEF VAR v-qty AS INT.
DEF VAR v-tot AS DEC.
DEF VAR v-ord AS CHAR.


ASSIGN
v-new      = OS-GETENV("new")
v-user     = OS-GETENV("user")
v-ord      = OS-GETENV("ord")
v-cant     = OS-GETENV("cant").
ASSIGN
v-user     = entry(1,session:parameter)
v-ord      = entry(2,session:parameter).
v-qty = 0.
v-tot = 0.
FOR EACH orderline WHERE ordernum = int(v-ord) NO-LOCK:
    v-qty = 1 + v-qty.
    v-tot = ExtendedPrice  + v-tot.
END.
{cabecera.i}
{&OUT} '
<h2>Caja de pago</h2>
' skip.         

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
      DEF VAR v-desc AS CHAR.
      FOR EACH orderline WHERE ordernum = int(v-ord) NO-LOCK:
          v-desc = "".
          FOR FIRST ITEM WHERE ITEM.itemnum = orderline.itemnum NO-LOCK:
              v-desc = CatDescription.
          END.
      {&OUT} '
              <tr> 
                <td align = left><img src="images/cat' string(orderline.itemnum,"99999") '.jpg" border=0 width = 31 height = 47></td>
                <td align = left><a href = "?p=show_book4.p&isbn=' orderline.itemnum '&user=' v-user '&ord=' v-ord '">' v-desc '</a> </td>
                <td align = center>' orderline.price '</td>
                <td align = center>' orderline.qty   '</td>
                <td align = center>' ExtendedPrice   '</td>
          </tr>
      ' skip.
          v-qty = orderline.qty + v-qty.
          v-tot = ExtendedPrice  + v-tot.
      END.
      {&OUT} '
                <tr>
                <th colspan = 3 bgcolor="#cccccc">&nbsp;</td>
                <th align = center bgcolor="#cccccc">' v-qty '</th>
                <th align = center bgcolor="#cccccc">' v-tot '</th>
                </tr>
                </form>
' skip.
FIND customer WHERE custnum = int(v-user) NO-LOCK NO-ERROR.
IF AVAIL customer THEN  DO:
{&OUT} '

  <table border = 0 width = 100% cellspacing = 0>
  <form action = "?p=purchase.p&user=' v-user '&ord=' v-ord '" method = post>
  <tr><th colspan = 2 bgcolor="#cccccc">Su información</th></tr>
  <tr>
    <td>Nombre</td>
    <td><input type = text name = name value = "' name '" maxlength = 40 size = 40></td>
  </tr>
  <tr>
    <td>Dirección</td>
    <td><input type = text name = address value = "' address '" maxlength = 40 size = 40></td>
  </tr>
  <tr>
    <td>Ciudad/Suburbio</td>
    <td><input type = text name = city value = "' city '" maxlength = 20 size = 40></td>
  </tr>
  <tr>
    <td>Estado/Provincia</td>
    <td><input type = text name = state value = "' state '" maxlength = 20 size = 40></td>
  </tr>
  <tr>
    <td>Código Postal o Código Zip</td>
    <td><input type = text name = zip value = "'Customer.PostalCode '" maxlength = 10 size = 40></td>
  </tr>
  <tr>
    <td>Paiís</td>
    <td><input type = text name = country value = "' Customer.Country  '" maxlength = 20 size = 40></td>
  </tr>
  <tr>
    <td colspan = 2 align = center>
      <b>Por favor pulsar comprar para confirmar su compra,
         o Continuar comprando para añadir o eliminar artículos</b>
     <center><input type = image src="images/purchase.gif"
           alt="Purchase These Items" border=0 height = 50 width = 135></center>    </td>
  </tr>
  </form>
  </table>' skip.
END.
{&out}
'    
    <hr>
<center><a href="?p=show_cart.p&user=' v-user '&ord=' v-ord '"><img src="images/continue-shopping.gif"
           alt="Continue Shopping" border=0 height = 50 width = 135></a></center>  </body>
  </html> ' skip.
