
v-qty = 0.
v-tot = 0.
FOR EACH orderline WHERE ordernum = int(v-ord) NO-LOCK:
    v-qty = 1 + v-qty.
    v-tot = ExtendedPrice  + v-tot.
END.

{&OUT} '
    <html>
    <head>
    <title>Bienvenido a Ventas Online</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta id="viewport" name="viewport" content="width=320; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
    <link rel="stylesheet" href="stylesheets/iphone.css" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png" />
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
' skip.
/*
  <table width=100% border=0 cellspacing = 0 bgcolor=#cccccc>
  <tr>
  <td rowspan = 2>
  <a href = "p.php?p=index1.p&user=' v-user '&ord=' v-ord '">
       <img src="images/Book-O-Rama.gif" alt="Bookorama" border=0
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
