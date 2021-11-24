&GLOBAL-DEFINE OUT PUT UNFORMATTED
&SCOPED-DEFINE Result-Rows  12
DEF VAR SelfURL AS CHAR INITIAL "ordenped.php".
DEF VAR v-qty AS DEC.
DEF VAR v-num AS INTE.
{&OUT} '
<!DOCTYPE html>
<html lang="en"><!-- manifest="html5.manifest"-->
<head>
<title>La Roca Software SA de CV</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css" media="screen">
@import "iui/iui.css";
@import "iui/t/default/default-theme.css";
@import "iui/ext-sandbox/masabi/t/default/iui_ext.css";
@import "images/ticketsales.css";
</style>
<script type="application/x-javascript" src="iui/ext-sandbox/masabi/iui_ext.js"></script>
<script type="application/x-javascript" src="iui/iui.js"></script>
<script type="application/x-javascript" src="ticketsales.js"></script>
<meta name="viewport" content="width=320; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<meta name="apple-touch-fullscreen" content="YES" />
<meta name="apple-mobile-web-app-capable" content="yes">
<link rel="apple-touch-icon" href="iphone.jpg"/>
</head>
' skip.
{&OUT} '
    <body>
    <div class="toolbar">
    <a id="backButton" class="button" href="#"></a>
    <h1 id="pageTitle"></h1>
    </div>

    <div id="scr_mainMenu" class="panel" title="Menu Principal" selected="true">
    <ul>
    <li><a href="#scr_buy"><img src="images/PT_ADULT.png"> Clientes </a></li>
    <li><a href="#scr_pro"><img src="images/mainmenu_view.png"> Productos </a></li>
    <li><a href="#scr_info"><img src="images/mainmenu_info.png"> Informacion </a></li>
    </ul>
    <h2>La Roca Software SA de CV</h2>
    <ul>
    <li><a href="">
    <span >Consultas desde tu Iphone
     <span class="from"><img src="images/logo1.png" title="La Roca Software SA"></span>
     <span class="datetime">' today string(time,"hh:mm:ss")'</span>
    </ul>
    </div>
'.
{&OUT} '
    <div id="scr_view" class="panel" title="View Ticket">
    <ul class="ticket">
    <li><img src="images/toc.png"></li>
    <li><span class="date">Friday, 22nd Oct 2009</span></li>
    <li><span class="time">11:23</span></li>
    <li><span class="from">Aberdeen</span><span class="destination">London Liverpool St</span></li>
    <li class="journeyoptions">
    <span class="tt_day">Day Return</span>
    <span class="tc_1st">1st Class</span>
    <span class="rc_youth">Youth Rail Card</span>
    <span class="pt_adult">Adult Traveller</span>
    </li>
    <li>&nbsp;</li>
    </ul>

    <!--<img src="images/aztec.png" width="287" height="287" class="barcode">-->
    <img src="http://www.qrcode.es/generador/qr_img.php?d=Oscar Castañeda GonzalezLa Roca Software SA de CVLa Roca No. 1 Santa Cruz Acalpixca&s=7&color=" height="287" class="barcode" /> 
    <!--<img src="http://www.qrcode.es/generador/qr_img.php?d=Oscar CastaÃ±eda Gonzalez La Roca Software SA de CV La Roca No. 1 Santa Cruz Acalpixca&s=7&color=&idioma=es&tipo_qrcode=texto&pdf=1" height="287" class="barcode" /> -->
    <p>Note: Descargar este ticket en su telefono!</p>
    <a class="grayButton" type="submit" href="#">Grabar este ticket</a>
    </div>
'.
{&OUT} '
        <!-- Buy Tickets section -->
        <div id="scr_pro" class="panel" title="Productos">
        <ul>' skip.
        v-num = 0.
            /*
            {&OUT} '
           <form id="paso" class="panel" title="Hola">' SKIP. */
        FOR EACH item NO-LOCK :
           {&out} '<li><a name = "Producto" href="#' itemnum '"><span class="from">' itemName   '</span></a></li>' SKIP.
           v-num = v-num + 1.
        END. 
    {&OUT} '
       </ul>
        </div>
    '. 
    v-num = 0.
FOR EACH item NO-LOCK:
    v-qty = Onhand.
    v-num = v-num + 1.
 {&OUT} '
    <form id="' itemnum '" class="panel" title="' itemnum '">
    <fieldset>
    <div class="row"><label for="buy_fromStation">Descripcion</label>
    <input name="' itemnum '1" id="buy_fromStation" type="text" class="az" value="' itemName '">
    </div>
     <div class="row"><label for="buy_fromStation">Categoria</label>
     <input name="' itemnum '2" id="buy_fromStation" type="text" class="az" value="' Category1 '">
     </div>
    <div class="row"><label for="buy_travelX">Precio </label>
    <input name="' itemnum '3" id="buy_travelX" type="text" class="az" value="' Price '">
    </div>
    <div class="row"><label for="buy_travelC">Existencias </label> 
    <input name="' itemnum '4" id="buy_travelC"  type="text" class="az" value="' v-qty '">
    </div>
    <div class="row"><label for="buy_travelC">Almacen </label> 
    <input name="' itemnum '5" id="buy_travelC"  type="text" class="az" value="' CatPage '">
    </div>
    </fieldset>' skip.
/* {&OUT} '<img src="http://www.qrcode.es/generador/qr_img.php?d=' string(itemnum) + "|" + itemName + category1 + "|" + string(price) + "|" + string(time,"hh:mm:ss") + string(catPage) '&s=7&color=&idioma=es&tipo_qrcode=texto" height="287" class="barcode" />' skip. */
{&OUT} '
    <a class="whiteButton" type="submit" href="#scr_view_' itemnum '">Imagen</a>
    </form>'.
     DEF VAR v-arch AS CHAR.
     v-arch = "x.prn".
     {&OUT} '
     <div id="scr_view_' itemnum '" class="panel" title="Vista">
     <ul class="ticket">
     <li><span class="date">' today '</span></li>
     <li><span class="time">' string(time,"hh:mm:ss")'</span></li>
     <li><span class="from">Desc:' itemName + category1 "<BR> Precio: "  price '</span><span class="destination">Almacen:' catPage  " Existencias:" v-qty   '</span></li>
     </ul>
     <img src="images/cat' string(itemnum,"99999") '.jpg" width="300" height="300" class="barcode">
      </div>
 '.
 IF v-num > 10 THEN LEAVE.
END.
{&OUT} '
    <!-- Buy Tickets section -->
    <div id="scr_buy" class="panel" title="Clientes">
    <ul>' skip.
        /*
        {&OUT} '
       <form id="paso" class="panel" title="Hola">' SKIP. */
    v-num = 0.
    FOR EACH Customer NO-LOCK  :

       {&out} '<li><a name = "Cliente" href="#' custnum '"><span class="from">' name '</span></a></li>' SKIP.
       v-num = v-num + 1.
       if v-num = 100 then leave.
    END. 
{&OUT} '
   </ul>
    </div>
'. 
/*scr_buy_select*/
v-num = 0.
FOR EACH Customer NO-LOCK :
    v-num = v-num + 1.

{&OUT} '
    <form id="' custnum '" class="panel" title="' name '">
    <input type="hidden" name="' custnum '1" value=""/>
    <input type="hidden" name="' custnum '2" value=""/>
    <input type="hidden" name="' custnum '3" value=""/>

    <fieldset>
    <div class="row"><label for="buy_fromStation">Razon Social</label>
    <input name="' custnum '1" id="buy_fromStation" type="text" class="az" value="' name '">
    </div>
    <div class="row"><label for="buy_travelX">Direccion </label>
    <input name="' custnum '2" id="buy_travelX" type="text" class="az" value="' address + Address2 + " ZIP:" + PostalCode '">
    </div>
    <div class="row"><label for="buy_travelC">Ciudad </label> 
    <input name="' custnum '3" id="buy_travelC"  type="text" class="az" value="' city + " " + country '">
    </div>
    </fieldset>
    <fieldset>
    <div class="row"><label for="buy_travelB">Balance</label>
    <input name="' custnum '6" id="buy_travelB"  type="text" class="az" value="' balance '"></div>
    </div>
    <div class="row"><label for="buy_travelL">Limite Credito</label>
    <input name="' custnum '7" id="buy_travelL"  type="text" class="az" value="' CreditLimit '"></div>
    </div>
    <div class="row"><label for="buy_travelM">Moneda</label>
    <input name="' custnum '9" id="buy_travelM"  type="text" class="az" value="'  '"></div>
    </div>
    </fieldset>
    <a class="whiteButton" type="submit" href="#scr_view_' custnum '">Imagen</a>
    </form>
'.
    /*     <img src="http://www.qrcode.es/generador/qr_img.php?d=' custnum + "|" + ad_phone + "|" + name + "|" + address2 + ad_phone '&s=7&color=&idioma=es&tipo_qrcode=texto&pdf=1" height="287" class="barcode" />
*/
    {&OUT} '
    <!-- View Tickets Section -->
    <div id="scr_view_' custnum '" class="panel" title="Vista">
    <ul class="ticket">
    <li><span class="from"></span></li>
    <li><span class="date">' today '</span></li>
    <li><span class="time">' string(today,"99/99/9999") + " " + string(time,"hh:mm:ss")'</span></li>
    <li><span class="from">' name + address + "<BR> " + Contact '</span><span class="destination">' city  " " country  '</span></li>
    <li><a href="?Cliente=' address + "|" name '"><img src="images/mainmenu_info.png"> Envia Informacion </a></li>
    <li>&nbsp;</li>
    </ul>
    <img src="images/cte' custnum '.jpg" width="300" height="300" class="barcode">
    <img src="images/cte' custnum '.bmp" width="300" height="300" class="barcode">
    </div>
'.
       if v-num = 100 then leave.
    END.
{&OUT} '
    <form id="scr_buy_pricelist" class="panel" title="Price">
    <p class="review">
    <var class="date" title="travelDate">Friday, 22nd Oct 2009</var>
    <var id="from-scr_but_pricelist" title="from" class="from _lookup">.</var>
     <var id="from-dest-scr_but_pricelist" title="destination" class="destination _lookup">.</var>
    </p>
    <ul>
    <li><a href="#scr_buy_cardSelect">Anytime <var>&pound;20.00</var><small>Valid Anytime</small></a></li>
    <li><a href="#scr_buy_cardSelect">Off Peak <var>&pound;15.00</var><small>Valid from 08:00 - 10:00</small></a></li>
    <li><a href="#scr_buy_cardSelect">Spr Off Peak <var>&pound;10.00</var><small>Valid after 22:00</small></a></li>
    </ul>
    </form>

    <div id="scr_buy_cardSelect" class="panel" title="Card Details">
    <ul>
    <li><a href="#scr_buy_cardDetails">New Card</a></li>
    </ul>
    <h2>Use Previous Card:</h2>
    <ul>
    <li><a href="#scr_buy_review"><img src="images/card_visa.png"> **** **** **** 1111</a></li>
    </ul>
    </div>
'.
{&OUT} '
    <form id="scr_buy_cardDetails" class="panel" title="Card Details">
    <!-- TODO enable cancel button -&gt; home -->
    <h2>Review The Ticket:</h2>
    <p class="review">
    <var class="date" title="travelDate">Friday, 22nd Oct 2009</var>
    <!-- var class="time" title="time">11:23</var -->
    <var class="from _lookup" title="from" id="from-scr_buy_cardDetails">.</var> <var class="destination _lookup" title="destination" id="from-dest-scr_buy_cardDetails">.</var>
    <input type="hidden" name="from" value=""/><input type="hidden" name="destination" value=""/>
    <span class="journeyoptions">
     <input type="hidden" name="journeytype" value=""/><var id="journeytype-scr_buy_cardDetails" class="_lookup" title="journeytype">.</var>
     <input type="hidden" name="travellerclass" value=""/><var id="travellerclass-scr_buy_cardDetails" class="_lookup" title="travellerclass">.</var>
     <input type="hidden" name="travellertype" value=""/><var id="travellertype-scr_buy_cardDetails" class="_lookup" title="travellertype">.</var>
     <input type="hidden" name="railcard" value=""/><var id="railcard-scr_buy_cardDetails" class="_lookup" title="railcard">.</var>
    </span>
    </p>
    <h2>Enter Card Details:</h2>
    <fieldset>
    <div class="row"><label>Name</label><input type="text" name="cardName"></div>
    <div class="row"><label>Number</label><input type="number" name="cardNumber" maxlength="16"></div>
    <div class="row"><label>Expiry Date</label><div class="pair"><input type="number" name="cardExpiryMonth" maxlength="2"> / <input type="number" name="cardExpiryYear" maxlength="2"></div></div>
    <div class="row"><label>Start Date</label><div class="pair"><input type="number" name="cardExpiryMonth" maxlength="2"> / <input type="number" name="cardExpiryYear" maxlength="2"></div></div>
    <div class="row"><label><img src="images/cvv.png" alt="CVV" title="CVV" style="margin:2px 0;"></label><input type="number" name="cardCVV" maxlength="3"></div>
    </fieldset>
    <a class="whiteButton" type="submit" href="#scr_view">Purchase Ticket</a>
    </form>
'.
{&OUT} '
    <form id="scr_buy_review" class="panel" title="Review Ticket">
    <!-- TODO enable cancel button -&gt; home -->
    <h2>Review The Ticket:</h2>
    <p class="review">
    <var class="date" title="travelDate">Friday, 22nd Oct 2009</var>
    <var class="time" title="time">11:23</var>
    <var class="from _lookup" title="from" id="from-scr_buy_cardDetails">.</var> <var class="destination" title="destination" id="from-dest-scr_buy_cardDetails">.</var>
    <input type="hidden" name="from" value=""/><input type="hidden" name="destination" value=""/>
    <span class="journeyoptions">
     <input type="hidden" name="journeytype" value=""/><var id="journeytype-scr_buy_cardDetails" class="_lookup" title="journeytype">.</var>
     <input type="hidden" name="travellerclass" value=""/><var id="travellerclass-scr_buy_cardDetails" class="_lookup" title="travellerclass">.</var>
     <input type="hidden" name="travellertype" value=""/><var id="travellertype-scr_buy_cardDetails" class="_lookup" title="travellertype">.</var>
     <input type="hidden" name="railcard" value=""/><var id="railcard-scr_buy_cardDetails" class="_lookup" title="railcard">.</var>
    </span>
    </p>
    <h2>Authorise Card Reuse:</h2>
    <fieldset>
    <div class="row"><label>Number</label><input type="number" name="cardNumber" maxlength="16" value="************1111" disabled="true"></div>
    <div class="row"><label><img src="images/cvv.png" alt="CVV" title="CVV" style="margin:2px 0;"></label><input type="number" name="cardCVV" maxlength="3"></div>
    </fieldset>
    <a class="whiteButton" type="submit" href="#scr_view">Purchase Ticket</a>
    </form>

    <!-- Info Section -->
    <div id="scr_info" class="panel" title="Informacion">
    <ul>
    <li><a href="#scr_info_introduction"><img src="images/mainmenu_info.png"> Introduccion</a></li>
    <li><a href="#scr_info_help"><img src="images/mainmenu_info.png"> Ayuda</a></li>
    <li><a href="#scr_info_tcs"><img src="images/mainmenu_info.png"> Terminos Y Condiciones</a></li>
    <li><a href="#scr_info_security"><img src="images/mainmenu_info.png"> Seguridad</a></li>
    <li><a href="#scr_info_about"><img src="images/mainmenu_info.png"> Acerca de Nosotros</a></li>
    </ul>
    </div>

    <div id="scr_info_introduction" class="text" title="Introduccion">
    <p>Bienvenido a La Roca Software Aplicacion Movil.</p>
    <p>Esta Aplicacion te permite consultar informacion de tu Empresa en linea desde un Iphone </p>
    <p>Se conecta via Web a tus sistema de Mfg-Pro en linea. </p>
    </div>

    <div id="scr_info_help" class="text" title="Ayuda">
    <p>Esta Aplicacion consulta la informacion de clientes Y productos rapidamente desde tu Iphone.</p>
    <p>Selecciona un Cliente o un Producto para consultarlo </p>
    <p>Para informacion comunicarse al Cel. 04455 1924 8259.</p>
    
    </div>

    <div id="scr_info_tcs" class="text" title="Terminos y Condiciones">
    <p>Tener un Iphone con Internet o conexion Wi-Fi en Intranet</p>
    <p>Tener una conexion para internet en tu Empresa o Negocio</p>
    </div>

    <div id="scr_info_security" class="text" title="Securidad">
    <p>Esta applicacion ustiliza completa seguridad de internet de HTTPS, igual que cualquier web site de e-commerce .</p>
    </div>

    <div id="scr_info_about" class="text" title="Acerca de Nosotros">
    <p>La Aplicacion Movil es desarrollada por Oscar Castañeda para La Roca Software SA.</p>
    </div>
' skip.
