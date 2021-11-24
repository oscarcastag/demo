
&GLOBAL-DEFINE OUT PUT UNFORMATTED       


DEF STREAM pagina.
DEF VAR v-user AS CHAR.
DEF VAR v-ord  AS CHAR.
DEF VAR v-cant AS CHAR.
DEF VAR v-qty AS INT.
DEF VAR v-tot AS DEC.
DEF VAR v-new AS CHAR.

v-user  = OS-GETENV("user").
v-ord   = OS-GETENV("ord").
v-user  = entry(1,session:parameter).
v-ord   = entry(2,session:parameter).

/*v-user = '2'.*/
{cabecera.i} 

IF v-user <> ? THEN
 FIND first customer WHERE custnum = int(v-user) NO-LOCK NO-ERROR.
 /*{&out} avail customer " " v-user.*/
 IF AVAIL customer THEN DO:
    {&OUT} '
    <h2>Bienvenido: ' customer.name  '<br> a Ventas X Internet</h2>
    <p>Elija una categoría:</p>' skip.
    IF v-user <> "99999" THEN
    IF v-ord = "" OR v-ord = "!" THEN v-ord = string(NEXT-VALUE(NextOrdNum)).
    IF v-user <> "99999" THEN
    FOR EACH ITEM BREAK BY category2.
     IF last-of(category2) THEN 
       {&OUT} '<li><a href="p.php?p=show_cat.p&catid=' category2  '&user=' v-user '&ord=' v-ord '">' category2 '</a><br>'.
    END.
    IF v-user = "99999" THEN
     {&OUT} '<li><a href="p.php?p=show_cliente.p&user=' v-user '&cte=' v-user '"> Ventas Clientes </a><br>'.
     {&OUT} '<li><a href="p.php?p=show_venta.p&user=' v-user '&ord=' v-ord '"> Ventas en Linea </a><br>'.
     {&OUT} '<li><a href="p.php?p=index1.p&user=&ord="> Login </a><br>'.
 END.
 ELSE DO:
    {&OUT} '
        <form action="p.php?p=index1.p&ord=" method="post">
          <table border="0" cellspacing="2" cellpadding="1">
            <tr>
              <td><font face="Arial, Helvetica, sans-serif">Usuario: </font></td>
              <td><input type="text" name="user"></td>
            </tr>
            <tr>
              <td><font face="Arial, Helvetica, sans-serif">Contrase&ntilde;a:</font>
              </td>
              <td><input type="password" name="passwd"></td>
            </tr>
            <tr>
              <td colspan="2"><div align="center">
                  <input type="hidden" name="iniciado">
                  <input type="submit" name="Submit" value="Iniciar sesion">
                </div></td>
            </tr>
          </table>
          </form>
' skip.

 END.
{&OUT} '
    </ul><hr>  
    </body>
    </html> 
' skip.
quit.

