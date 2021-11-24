&GLOBAL-DEFINE OUT PUT UNFORMATTED       
DEF STREAM pagina.
DEF VAR v-lin AS INTE.
DEF VAR v-user AS CHAR.
DEF VAR v-new AS CHAR.
DEF VAR v-cant AS CHAR.
DEF VAR v-qty AS INT.
DEF VAR v-tot AS DEC.

def var v-name as char .
def var v-address as char .
def var v-city as char .
def var v-state as char .
def var v-zip as char .
def var v-country as char .

def var ship_name as char .
def var ship_address as char .
def var ship_city as char .
def var ship_state as char .
def var ship_zip as char .
def var ship_country as char .
DEF VAR v-ord AS CHAR.

ASSIGN
v-new      = OS-GETENV("new")
v-user     = OS-GETENV("user")
v-cant     = OS-GETENV("cant")
v-ord      = OS-GETENV("ord")
 v-name = OS-GETENV("name")
 v-address = OS-GETENV("address")
 v-city = OS-GETENV("city") 
 v-state = OS-GETENV("state")
 v-zip = OS-GETENV("zip")
 v-country = OS-GETENV("country") 
v-user     = entry(1,session:parameter).
v-ord      = entry(2,session:parameter).
ASSIGN
 v-qty = 0
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
                <td align = LEFT>' item.CatDescription '</td>
                <td align = center>' orderline.price '</td>
                <td align = center>' orderline.qty   '</td>
                <td align = center>' ExtendedPrice   '</td>
          </tr>
      ' skip.
          v-qty = orderline.qty + v-qty.
          v-tot = ExtendedPrice  + v-tot.
      END.
      v-tot = v-tot + 20.
      {&OUT} '
                <tr>
                <th colspan = 3 bgcolor="#cccccc">&nbsp;</td>
                <th align = center bgcolor="#cccccc">' v-qty '</th>
                <th align = center bgcolor="#cccccc">' dec(v-tot) '</th>
                </tr>
                </form>
          <table border="0" width="100%" cellspacing="0">
           <tbody>
           <tr><th bgcolor="#cccccc" align="left">Enviío</th>
               <th bgcolor="#cccccc" align="right">' 20.00 '</th></tr>
           <tr><th bgcolor="#cccccc" align="left">TOTAL Incluido Envio</th>
               <th bgcolor="#cccccc" align="right">' dec(v-tot)  '</th>
           </tr>
           </tbody></table><br>
' skip.
{&OUT} '
          <table border="0" width="100%" cellspacing="0">
          <form action="?p=pagocaja.p&&user=' v-user '&ord=' v-ord '" method="post">
          <input type = hidden name = "name" value = "' v-name    '" >     
          <input type = hidden name = "address" value = "' v-address '" >  
          <input type = hidden name = "address" value = "' v-city    '" >  
          <input type = hidden name = "state" value = "' v-state   '" >  
          <input type = hidden name = "zip" value = "' v-zip     '" >  
          <input type = hidden name = "country" value = "' v-country '" >  

          <tbody><tr><th colspan="2" bgcolor="#cccccc">Detalles Tarjeta Crédito</th></tr>
          <tr>
            <td>Tipo</td>
            <td><select name="card_type"><option>VISA</option><option>MasterCard</option><option>American Express</option></select></td>
          </tr>
          <tr>
            <td>Número</td>
            <td><input type="text" name="card_number" value="" maxlength="16" size="40"></td>
          </tr>
          <tr>
            <td>Fecha Expiración</td>
            <td>Mes <select name="card_month"><option>01</option><option>02</option><option>03</option><option>04</option><option>05</option><option>06</option><option>07</option><option>08</option><option>09</option><option>10</option><option>11</option><option>12</option></select>
            año <select name="card_year"><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option></select></td>
          </tr>
          <tr>
            <td>Nombre en Tarjeta</td>
            <td><input type="text" name="card_name" value="" maxlength="40" size="40"></td>
          </tr>
          <tr>
            <td colspan="2" align="center">
              <b>Por favor pulsa comprar para confirmar tu compra,
                 o Continuar Comprando para añadir o eliminar artículos</b>
             <center><input type="image" src="./images/purchase.gif" alt="Purchase These Items" border="0" height="50" width="135"></center>    </td>
          </tr>
          </tbody>
        </form>
        </table>
        <center><a href="?p=show_cart.p&user=' v-user '&ord=' v-ord '"><img src="./images/continue-shopping.gif" alt="Continue Shopping" border="0" height="50" width="135"></a></center>  
        </body>
  </html> ' skip.
