&GLOBAL-DEFINE OUT PUT UNFORMATTED       
DEF STREAM pagina.
DEF VAR v-catid AS CHAR.
DEF VAR v-user AS CHAR.
DEF VAR v-ord AS CHAR.
DEF VAR v-new AS CHAR.
DEF VAR v-cant AS CHAR.
DEF VAR v-qty AS INT.
DEF VAR v-tot AS DEC.

ASSIGN
v-user     = OS-GETENV("user")
v-catid    = OS-GETENV("catid").
v-ord      = OS-GETENV("ord").
v-user     = entry(2,session:parameter).
v-catid    = entry(1,session:parameter).
v-ord      = entry(3,session:parameter).
/*{&out} "u:" v-user " c:" v-catid " o:" v-ord.*/
{cabecera.i}
/*    
{&OUT} '
    <html>
    <head>
    <title>Bienvenido a Ventas Online</title>
    <meta name="viewport" content="width=520; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
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
 <body width: 485px; height: 600px; overflow: HIDE>
  <table width=100% border=0 cellspacing = 0 bgcolor=#cccccc>
  <ul><tr>
  <td rowspan = 2>
  <a href = "p.php?p=index1.p&user=' v-user '&ord=' v-ord '"><img src="images/Book-O-Rama.gif" alt="Bookorama" border=0
       align=left valign=bottom height = 60 width = 247></a>
  </td>
  <td align = right valign = bottom>
  Total Items = 0  </td>
  <td align = right rowspan = 2 width = 135>
  <center><a href="p.php?show_cart.p&user=' v-user '&ord=' v-ord '"><img src="images/view-cart.gif"
           alt="View Your Shopping Cart" border=0 height = 50 width = 135></a></center>  </tr>
  <tr>
  <td align = right valign = top>
  Precio Total = $0.00  </td>
  </tr>
  </table>
' skip.
*/
{&OUT} '
<h2>Compras X Internet</h2>
<ul>
<table width = "100%" border = 0>
' skip.                               
/*{&out} "cat:" v-catid " user:" v-user " ord:" v-ord .*/
FOR EACH ITEM WHERE  category2 = v-catid.
    {&OUT} ' 
           <tr><td><a href="p.php?p=show_book.p&isbn=' Itemnum '&user=' v-user '&ord=' v-ord '"><img src="images/cat' string(Itemnum,"99999") '.jpg" height = 100 width = 135 border=0></a><br></td>
               <td><a href="p.php?p=show_book.p&isbn=' Itemnum '&user=' v-user '&ord=' v-ord '">' ItemName '</a><br></td>
               <td>' price '<br></td>
               <td>' CatDescription '<br></td>
           </tr>'.
END.
{&OUT} '
</table><hr><center><a href="p.php?p=index1.p&user=' v-user '&ord=' v-ord '">
           <img src="images/continue-shopping.gif"
           alt="Continue Shopping" border=0 height = 50 width = 135></a></center>  </body>
</html>

' skip.


