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
{enc.i}
{&OUT} '
<h2>Compras X Internet</h2>
<ul>
<table width = "100%" border = 0>
' skip.                               

FOR EACH ITEM WHERE  category2 = v-catid.
    {&OUT} ' 
           <li><a href="?p=show_book.p&isbn=' Itemnum '&user=' v-user '&ord=' v-ord '">
                <img src="images/cat' string(Itemnum,"99999") '.jpg" height = 50 width = 65 border=0></a>
               <li><a href="?p=show_book.p&isbn=' Itemnum '&user=' v-user '&ord=' v-ord '">' ItemName '</a>
               <li>' price '
               <li>' CatDescription '
          '.
END.
{&OUT} '
</table><hr><center><a href="p.php?p=index1.p&user=' v-user '&ord=' v-ord '">
           <img src="images/continue-shopping.gif"
           alt="Continue Shopping" border=0 height = 50 width = 135></a></center>  </body>
</html>

' skip.


