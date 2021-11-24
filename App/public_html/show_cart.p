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
v-ord      = OS-GETENV("ord")
v-new      = OS-GETENV("new")
v-user     = OS-GETENV("user")
v-cant     = OS-GETENV("cant")
v-ord      = entry(2,session:parameter)
v-user     = entry(1,session:parameter)
v-new      = entry(3,session:parameter)
v-cant     = entry(4,session:parameter).
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
  <a href = "p.php?p=index1.p&user=' v-user '&ord=' v-ord '"><img src="images/Book-O-Rama.gif" alt="Bookorama" border=0
       align=left valign=bottom height = 60 width = 247></a>
  </td>
  <td align = right valign = bottom>
  Total Items = ' v-qty '  </td>
  <td align = right rowspan = 2 width = 135>
  <center><a href="p.php?p=show_cart.p&new=' v-new '&user=' v-user '&ord=' v-ord '"><img src="images/view-cart.gif"
           alt="View Your Shopping Cart" border=0 height = 50 width = 135></a></center>  </tr>
  <tr>
  <td align = right valign = top>
  Precio Total = ' v-tot '  </td>
  </tr>
  </table>
' skip.
*/
{cabecera.i}
{&OUT} '
<h2>Tu carro de compra</h2>
<table border = 0 width = 100% cellspacing = 0>
' skip.         
IF v-cant = "!" or v-cant = "" THEN  v-cant = "1".

FIND LAST orderline WHERE ordernum = INT(v-ord) NO-LOCK NO-ERROR.
IF AVAIL orderline THEN v-lin = linenum + 1.
ELSE v-lin = 1.
IF AVAIL orderline THEN FIND ITEM OF orderline NO-LOCK NO-ERROR.
IF v-new <> ? THEN DO:
    FIND orderline WHERE ordernum = INT(v-ord) AND 
         orderline.itemnum = int(v-new) EXCLUSIVE-LOCK NO-ERROR.
    FIND ITEM WHERE  item.itemnum = int(v-new) NO-LOCK NO-ERROR.
    IF AVAIL ITEM THEN DO:
     IF NOT AVAIL orderline THEN DO:
        CREATE orderline.
        ASSIGN
        orderline.Itemnum  = item.Itemnum
        orderline.Linenum  = v-lin
        Ordernum           = INT(v-ord)
        ExtendedPrice      = ITEM.price * INT(v-cant)
        orderline.Price    = ITEM.price
        Qty                = int(v-cant).
        RELEASE orderline.
     END.
    END.
END.
{&OUT} '
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
          <td align = left><a href = "?p=show_book2.p&isbn=' orderline.itemnum '&user=' v-user '&ord=' v-ord '">' CatDescription '</a> </td>
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
      </table>
      <center><a href="?p=show_cat.p&catid=' item.category2 '&user=' v-user '&ord=' v-ord '">
               <img src="images/continue-shopping.gif"
               alt="Continuar Comprando" border=0 height = 50 width = 135></a>
               </center><center>
               <a href="?p=checkout.p&user=' v-user '&ord=' v-ord '"><img src="images/go-to-checkout.gif"
               alt="Ir a Caja" border=0 height = 50 width = 135></a></center>  </body>
    </html>' 
skip.

          
