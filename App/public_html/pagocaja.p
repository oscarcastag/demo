&GLOBAL-DEFINE OUT PUT UNFORMATTED       
DEF STREAM pagina.
DEF VAR v-lin AS INTE.
DEF VAR v-user AS CHAR.
DEF VAR v-new AS CHAR.
DEF VAR v-cant AS CHAR.
DEF VAR v-qty AS INT.
DEF VAR v-tot AS DEC.
DEF VAR v-ord AS CHAR.

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
DEF VAR vcard_type   AS CHAR.
DEF VAR vcard_number AS CHAR. 
DEF VAR vcard_month  AS CHAR.
DEF VAR vcard_year   AS CHAR.
DEF VAR vcard_name   AS CHAR.

ASSIGN
v-user        = OS-GETENV("user")
v-ord         = OS-GETENV("ord")

vcard_type     = OS-GETENV("card_type")
vcard_number   = OS-GETENV("card_number")
vcard_month    = OS-GETENV("card_month") 
vcard_year     = OS-GETENV("card_year")
vcard_name     = OS-GETENV("card_name").
 
ASSIGN
v-user        = entry(1,session:parameter)
v-ord         = entry(2,session:parameter)
vcard_type    = entry(3,session:parameter)
vcard_number  = entry(4,session:parameter)
vcard_month   = entry(5,session:parameter)
vcard_year    = entry(6,session:parameter)
vcard_name    = entry(7,session:parameter).
find customer where custnum = int(v-user) no-lock no-error.
if avail customer then do:
   assign v-name    = name
          v-address = address
          v-city    = city
          v-state   = state
          v-country = country
          v-zip     = "16500".
end.
FIND order WHERE order.ordernum = int(v-ord) NO-LOCK NO-ERROR.
IF NOT AVAIL order THEN DO:
   disable triggers for load of order. 
   CREATE order.
   ASSIGN Order.CustNum   = INT(v-user)
          Order.BillToID  = INT(v-user)
          Order.Creditcard   = vcard_number
          Order.Instructions = "Venta por Internet"
          Order.OrderDate    = TODAY
          Order.Ordernum     = INT(v-ord)
          Order.OrderStatus  = "Ordenada"
          Order.PO           = "Internet"
          Order.PromiseDate  = TODAY + 5
          Order.SalesRep     = "SLS"
          Order.ShipDate     = TODAY + 5
          Order.ShipToID     = INT(v-user)
          Order.Terms        = "Pedidos En Linea".
FIND FIRST ventaslin WHERE ventaslin.ordernum = int(v-ord) NO-LOCK NO-ERROR.
IF NOT AVAIL ventaslin THEN DO:
CREATE ventaslin.
ASSIGN
ventaslin.CustNum        = int(v-user) 
ventaslin.Ordernum       = int(v-ord)
ventaslin.OrderDate      = TODAY         .
ASSIGN
ventaslin.nombre          =  v-name     
ventaslin.direccion       =  v-address  
ventaslin.ciudad          =  v-city     
ventaslin.estado          =  v-state    
ventaslin.country         =  v-country  
ventaslin.zip             =  v-zip      .
    ASSIGN
ventaslin.snombre         =  ship_name    
ventaslin.sdireccion      =  ship_address 
ventaslin.sciudad         =  ship_city    
ventaslin.sestado         =  ship_state   
ventaslin.szip            =  ship_zip     
ventaslin.spais           =  ship_country. 
    ASSIGN
ventaslin.card_type       =  vcard_type    
ventaslin.card_number     =  vcard_number  
ventaslin.card_month      =  vcard_month   
ventaslin.card_year       =  vcard_year    
ventaslin.card_name       =  vcard_name.    
END.
END.
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
                <tr><th colspan = 1 bgcolor="#cccccc">Item</th>
                <th bgcolor="#cccccc">Precio</th>
                <th bgcolor="#cccccc">Cantidad</th>
                <th bgcolor="#cccccc">Total</th></tr>
      ' skip.              
      v-qty = 0.
      v-tot = 0.
      FOR EACH orderline WHERE ordernum = int(v-ord) NO-LOCK:
          FIND ITEM WHERE ITEM.itemnum = orderline.ITEM NO-LOCK NO-ERROR.

      {&OUT} '
              <tr> 
                <td align = LEFT>  ' itemname '</td>
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
                <th colspan = 2 bgcolor="#cccccc">&nbsp;</td>
                <th align = center bgcolor="#cccccc">' v-qty '</th>
                <th align = center bgcolor="#cccccc">' v-tot '</th>
                </tr>
                </form>
          <table border="0" width="100%" cellspacing="0">
           <tbody>
           <tr><th bgcolor="#cccccc" align="left">Gastos Envío</th>
               <th bgcolor="#cccccc" align="right">' 20.00 '</th></tr>
           <tr><th bgcolor="#cccccc" align="left">TOTAL con Envio</th>
               <th bgcolor="#cccccc" align="right">' v-tot + 20 '</th>
           </tr>
           </tbody></table><br>
' skip.
{&OUT} '
        <p>Gracias por confiar en nosotros. Su pedido:' v-ord ' ha sido tramitado.<p>
        <center><a href="?p=index1.p&user=&ord="><img src="./images/continue-shopping.gif" alt="Continue Shopping" border="0" height="50" width="135"></a></center>  
        </body>
  </html> ' skip.
