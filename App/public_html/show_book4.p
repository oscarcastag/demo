&GLOBAL-DEFINE OUT PUT UNFORMATTED       

DEF STREAM pagina.
DEF VAR v-isbn AS CHAR.
DEF VAR v-user AS CHAR.
DEF VAR v-cant AS CHAR.
DEF VAR v-uni AS INTE.
DEF VAR v-tot AS DECI.
DEF VAR v-mod AS CHAR.
DEF VAR v-del AS CHAR.
DEF VAR v-ord AS CHAR.
DEF VAR v-qty AS INT.

ASSIGN
v-user     = OS-GETENV("user")
v-cant     = OS-GETENV("cant")
v-isbn     = OS-GETENV("isbn")
v-ord      = OS-GETENV("ord").

ASSIGN
v-mod     = OS-GETENV("cambia")
v-del     = OS-GETENV("borra").
/*
{&OUT} "mod:" v-mod  " del:" v-del.
*/
v-qty = 0.
v-tot = 0.
FOR EACH orderline WHERE ordernum = int(v-ord) NO-LOCK:
    v-qty = 1 + v-qty.
    v-tot = ExtendedPrice  + v-tot.
END.

{&OUT} '
    <html>
    <head>
    <title>Bienvenido a la Librería Online</title>
    <meta name="viewport" content="width=520; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
    <style>
    h2 ~{ font-family: Arial, Helvetica, sans-serif; font-size: 22px; color = red; margin = 6px }
    body ~{ font-family: Arial, Helvetica, sans-serif; font-size: 13px }
        body ~{width:60%;margin:auto;min-width:400px;max-width:600px}
    li, td ~{ font-family: Arial, Helvetica, sans-serif; font-size: 13px }
    hr ~{ color: #FF0000; width=70%; text-align=center}
    a ~{ color: #000000 }
    </style>
    </head>
 ' skip.
 v-uni = 0.
 v-tot = 0.
 FOR EACH orderline WHERE orderline.ordernum = int(v-ord) NO-LOCK:
     v-uni = v-uni + 1.
     v-tot = v-tot + extendedprice.
 END.

{&OUT} '
 <body>
  <table width=100% border=0 cellspacing = 0 bgcolor=#cccccc>
  <tr>
  <td rowspan = 2>
  <a href = "?p=index1.p"><img src="images/Book-O-Rama.gif" alt="Bookorama" border=0
       align=left valign=bottom height = 60 width = 247></a>
  </td>
  <td align = right valign = bottom>
  Total Items = ' v-uni '  </td>
  <td align = right rowspan = 2 width = 135>
  <center><a href="p.php?show_cart.p"><img src="images/view-cart.gif"
           alt="View Your Shopping Cart" border=0 height = 50 width = 135></a></center>  </tr>
  <tr>
  <td align = right valign = top>
  Precio Total = ' v-tot ' </td>
  </tr>
  </table>
' skip.
FIND ITEM WHERE  item.itemnum = INT(v-isbn) NO-LOCK NO-ERROR.
FIND orderline WHERE orderline.ordernum = int(v-ord) AND 
     orderline.itemnum = INT(v-isbn) EXCLUSIVE-LOCK NO-ERROR.
/*
{&OUT} "isbn:" v-isbn " cant:" v-cant " user:" v-user.
*/
IF v-mod = "1" THEN DO:
 IF v-cant <> ? AND INT(v-cant) <> 0 THEN DO:
   orderline.qty = int(v-cant).
   RELEASE orderline.
   FIND orderline WHERE orderline.ordernum = int(v-ord) AND 
        orderline.itemnum = INT(v-isbn) NO-LOCK NO-ERROR.
 END.
END.
ELSE 
IF v-del = "1" THEN DO:
   DISABLE TRIGGERS FOR LOAD OF orderline.
   DELETE orderline.
   {&OUT} 'Registro eliminado...!'.        
END.
IF AVAIL orderline THEN
{&OUT} '<h2>' ItemName '</h2>
    <form action =?p=show_book2.p&user=' v-user '&ord=' v-ord ' method = post>
    <TABLE>
        <tr><td><img src="images/cat' string(orderline.Itemnum,"99999") '.jpg" 
                border=0 width = 81 height = 81></td><td><ul>
                   <li><b>Descripcion:</b> ' ItemName '
                   <li><b>ISBN:</b>' orderline.Itemnum ' 
                   <li><b>Cantidad:</b>                   
    <input TYPE="text" name = "cant" value =' orderline.qty ' size = 3>
                   <li><b>Nuestro Precio:</b>' orderline.price '
                   <li><b>Descripción:</b>' CatDescription '
                   </ul></td></tr>
    </table>
    <tr>
    <td colspan = 2>&nbsp;</td>
    <td align = center>
      <input type = hidden name = "user" value = "' v-user '" >
      <input type = hidden name = "isbn" value = "' v-isbn '" >
      <input type = image src = "images/save-changes.gif" value="1" NAME = "cambia" border = 0 alt = "Salva Cambios">
      <input type = image src = "images/eliminar.gif" value="1" NAME = "borra" border = 0 alt = "Borra Registro">
    </td>
    <td>&nbsp;</td>
    </form>' skip.
{&OUT} '        
    <center><a href="?p=checkout.p&user=' v-user '&ord=' v-ord '">
           <img src="images/continue-shopping.gif"
           alt="Continuar Comprando" border=0 height = 50 width = 135></a>
           </center><center>
          </body>
          </html>' skip.

