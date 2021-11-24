DEF STREAM pagina.
DEF VAR v-isbn AS CHAR.
DEF VAR v-user AS CHAR.
DEF VAR v-ord AS CHAR.
DEF VAR v-qty AS INT.
DEF VAR v-tot AS DEC.
DEF VAR v-new AS CHAR.
DEF VAR v-cant AS CHAR.
ASSIGN
v-user     = OS-GETENV("user")
v-isbn     = OS-GETENV("isbn")
v-ord      = OS-GETENV("ord").
v-user     = entry(1,session:parameter).
v-ord      = entry(2,session:parameter).
v-isbn     = entry(3,session:parameter).
&GLOBAL-DEFINE OUT PUT UNFORMATTED       

v-qty = 0.
v-tot = 0.
FOR EACH orderline WHERE ordernum = int(v-ord) NO-LOCK:
    v-qty = 1 + v-qty.
    v-tot = ExtendedPrice  + v-tot.
END.
/*
{&OUT} '
    <html>
    <head>
    <title>Bienvenido a Ventas Online</title>
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

{&OUT} '
 <body>
  <table width=100% border=0 cellspacing = 0 bgcolor=#cccccc>
  <tr>
  <td rowspan = 2>
  <a href = "?p=index1.p"><img src="images/Book-O-Rama.gif" alt="Bookorama" border=0
       align=left valign=bottom height = 60 width = 247></a>
  </td>
  <td align = right valign = bottom>
  Total Items = 0  </td>
  <td align = right rowspan = 2 width = 135>
  <center><a href="p.php?show_cart.p"><img src="images/view-cart.gif"
           alt="View Your Shopping Cart" border=0 height = 50 width = 135></a></center>  </tr>
  <tr>
  <td align = right valign = top>
  Precio Total = $0.00  </td>
  </tr>
  </table>
' skip.
*/
{cabecera.i}
FIND ITEM WHERE  item.itemnum = INT(v-isbn) NO-LOCK NO-ERROR.
{&OUT} '<h2>' ItemName  '</h2>'.
IF AVAIL ITEM THEN
{&OUT} '
    <TABLE>
        <tr><td><img src="images/cat' string(item.Itemnum,"99999") '.jpg" 
                border=0 width = 81 height = 81></td><td><ul>
                   <li><b>Descripcion:</b> '
                   ItemName '<li><b>ISBN:</b>'
                   item.Itemnum '<li><b>Nuestro Precio:</b>' 
                   item.price '<li><b>Descripción:</b>'
                   CatDescription '
                   </ul></td></tr>
    </table>' skip.
{&OUT} '        
    <hr><center><a href="?p=show_cart.p&new=' item.itemnum '&user=' v-user '&ord=' v-ord '"><img src="images/add-to-cart.gif"
                   alt="Add' item.ItemNum '" border=0 height = 50 width = 135></a></center><center>
                   <a href="?p=show_cat.p&catid=' category2 '&user=' v-user '&ord=' v-ord '"><img src="images/continue-shopping.gif"
                   alt="Continue Shopping" border=0 height = 50 width = 135></a></center>  </body>
          </html>' skip.

