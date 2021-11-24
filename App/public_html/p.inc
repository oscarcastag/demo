<?php
$cadena = "";
$cadena = $_POST["p"];
$user   = "";
$ord    = "";
$user   = $_GET["user"];
$ord    = $_GET["ord"];
$cte    = $_GET["cte"];
if ($cadena == "") { 
   $cadena = $_GET["p"]; 
   }
//echo "prog:".$cadena;
if ($cadena == "index1.p") {
   $user = $_GET["user"];
   $ord  = $_GET["ord"];
   if ($user == "") {
      $user = $_POST["user"];
      }
   $param = $user.",".$ord.",".$cadena;
   
   }
if ($cadena == "show_cat.p") {
   $user  = $_GET["user"]; 
   $ord   = $_GET["ord"];
   $catid = $_GET["catid"];
   $param = $catid.",".$user.",".$ord; 
   }
if ($cadena == "show_book.p") {
   $user  = $_GET["user"];
   $ord   = $_GET["ord"];
   $isbn  = $_GET["isbn"];
   $param = $user.",".$ord.",".$isbn;
   }
if ($cadena == "show_cart.p") {
   $user  = $_GET["user"];
   $ord   = $_GET["ord"];
   $new   = $_GET["new"];
   $cant  = $_GET["cant"];
   $param = $user.",".$ord.",".$new.",".$cant;
   }

if ($cadena == "show_book2.p" ) {
   $user  = $_GET["user"];
   $ord   = $_GET["ord"];
   $isbn  = $_GET["isbn"];
   $mod   = $_POST["cambia"];
   $del   = $_POST["borra"];
   $cant  = $_POST["cant"];
   if ($isbn == "") {
       $isbn = $_POST["isbn"];
      }
   $param = $isbn.",".$user.",".$ord.",".$mod.",".$del.",".$cant;
   }
if ($cadena == "checkout.p") {
   $user  = $_GET["user"];
   $ord   = $_GET["ord"];
   $param = $user.",".$ord.","; 
   }
if ($cadena == "purchase.p") {
   $user  = $_GET["user"];
   $ord   = $_GET["ord"];
   $param = $user.",".$ord;  
   }
if ($cadena == "pagocaja.p") {
   $user    = $_GET["user"];
   $ord     = $_GET["ord"];
   $type    = $_POST["card_type"];
   $number  = $_POST["card_numbre"];
   $month   = $_POST["card_month"];
   $year    = $_POST["card_year"];
   $name    = $_POST["card_name"];
   $param   = $user.",".$ord.",".$type.",".$number.",".$month.",".$year.",".$name;
   }
if ($cadena == "show_cliente.p") {
   $user    = $_GET["user"];
   $ord     = $_GET["ord"];
   $cte     = $_GET["cte"];
   $param   = $user.",".$ord.",".$cte;
   }
if ($cadena == "show_venta.p") {
   $user    = $_GET["user"];
   $ord     = $_GET["ord"];
   $cte     = $_GET["cte"];
   $param   = $user.",".$ord.",".$cte;
   }
if ($cadena == "show_cart2.p") {
   $user    = $_GET["user"];
   $ord     = $_GET["ord"];
   $param   = $user.",".$ord;
   }
if ($cadena == "show_cart3.p") {
   $ord     = $_GET["ord"];
   $cte     = $_GET["cte"];
   $user    = $_GET["user"];
   $param   = $user.",".$ord.",".$cte;
   }
if ($cadena == "show_orden.p") {
   $user    = $_GET["user"];
   $ord     = $_GET["ord"];
   $cte     = $_GET["cte"];
   $param   = $user.",".$ord.",".$cte;
   }
$file = "./corres.sh $cadena $param ";
//echo $file;
exec($file, $output);

foreach($output as $outputline){
    echo("$outputline");
}           
?>

