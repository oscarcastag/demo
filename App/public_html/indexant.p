
&GLOBAL-DEFINE OUT PUT UNFORMATTED       


DEF STREAM pagina.
DEF VAR v-user AS CHAR.
DEF VAR v-ord  AS CHAR.
DEF VAR v-cant AS CHAR.
DEF VAR v-qty AS INT.
DEF VAR v-tot AS DEC.
DEF VAR v-new AS CHAR.
def var v-cat as char.

v-user  = OS-GETENV("user").
v-ord   = OS-GETENV("ord").
v-cat   = OS-GETENV("catid").
/*
{c:\appserv\www\ton\enc.i}
*/
DEF VAR v-titulo AS CHAR.
v-titulo = "Ventas On Line".

{c:\appserv\www\ton\inicio.i}
 

IF v-user <> ? THEN
 FIND customer WHERE custnum = int(v-user) NO-LOCK NO-ERROR.
 IF AVAIL customer THEN DO:
    {&OUT} '
    <div id="home" class="current page">
    <h2>Bienvenido: ' customer.name  '<br> a Ventas X Internet</h2>
    <p>Elija una categoría:</p>' skip.
    IF v-user <> "99999" THEN
    IF v-ord = ? OR v-ord = "!" THEN v-ord = string(NEXT-VALUE(NextOrdNum)).
    {&OUT} '<ul class="links">' SKIP.
    {&OUT} '<form action="#portfolio" method="post">' skip. 
    {&OUT} '<input type="hidden" name="ord" value"' v-ord '"><BR>' skip.
    IF v-user <> "99999" THEN
    FOR EACH ITEM BREAK BY category2.
     IF last-of(category2) THEN do:
       {&OUT} '<input type="hidden" name="catid" value"' category2 '"><BR>' skip.
       {&OUT} '<li><a href="#category">' category2 '</a><br>'.
     end.  
    END.
    IF v-user = "99999" THEN
     {&OUT} '<li><a href="p.php?p=show_cliente1.p&user=' v-user '&cte=' v-user '"> Ventas Clientes </a><br>'.
     {&OUT} '<li><a href="p.php?p=show_venta1.p&user=' v-user '&ord=' v-ord '"> Ventas en Linea </a><br>'.
     {&OUT} '<li><a href="p.php?p=index.p&user=&ord="> Login </a><br>'.
     {&OUT} '</form>'.
     {&OUT} '</div>'.
 END.
 ELSE DO:
    {&OUT} '
        <div id="home" class="current page">
        <ul class="links">
        <form action="?p=index.p&ord=" method="post">
              <li><font face="Arial, Helvetica, sans-serif">Usuario: </font></td></li>
              <li><input type="text" name="user"></td></li>
              <li><font face="Arial, Helvetica, sans-serif">Contrase&ntilde;a:</font></td>
              <li><input type="password" name="passwd"></td>
              <li> <input type="hidden" name="iniciado">
              <li> <input type="submit" name="Submit" value="Iniciar sesion"></td>
          </form>
          </ul>
          </div> ' skip.
    {&OUT} '
  		   	<div id="category" class="page">
		   		<div class="toolbar">
		   			<a class="back revealme" href="#home">&larr; Tap to go back</a>
		   		</div>
		   		
		   		<h3>Portafolio' '</h3>
		   		<ul class="entries">
		   			<li></li>
		   			<li><a href="http://192.168.1.65/MiroPhp/Menu1.html" target="_blank">Demo de Navegacion por Internet/Intranet de Apliaciones Progress (WebSpeed)</li>
		   			<li><a href="http://192.168.1.65/Progress/Trigoeb2/Mercurio.php" target="_blank">Demo de Navegacion por Internet/Intranet de Apliaciones Progress (PHP)</li>
		   		</ul>
		   			
		   	<!-- #portfolio close -->
   			</div>

' skip.

 END.
{&OUT} '
    </ul><hr>  
    </body>
    </html> 
' skip.

