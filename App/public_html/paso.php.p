<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta id="viewport" name="viewport" content="width=320; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
	<title>LA ROCA SOFTWARE SA IPHONE KIT</title>
	<link rel="stylesheet" href="stylesheets/iphone.css" />
	<link rel="apple-touch-icon" href="images/apple-touch-icon.png" />
	<script type="text/javascript" charset="utf-8">
		window.onload = function() {
		  setTimeout(function(){window.scrollTo(0, 1);}, 100);
		}
	</script>
	<!-- for profile image -->
	<style type="text/css" media="screen">
		li.picture { background: #fff url(images/minid-profile.png) no-repeat !important; }
	</style>
	<!-- end line customization -->
</head>
<?
$aleatorio=rand();
settype ($aleatorio,"string");
$valor = $cliente;
$aleatorio=rand();
settype ($aleatorio,"string");
$cadena = "p-".$aleatorio.".p";
$file  = $cadena;
$cliente      = $_GET["cliente"]; 
$start_code   = "index.php";
//echo "oscar:".$cadena."<BR>";
$comando = 
'
run info-clientes.p (input "'.$cliente.'").
';
if(file_exists("$file"))
{
if(unlink("$file"))
{
echo "";
}
}
if ( !file_exists($file)){
        touch ($file);
        $handle = fopen ($file, 'r+'); 
        $str = $comando;
}
else{   
        $str = $comando;
        $handle = fopen ($file, 'r+'); 
}
fwrite ($handle, $str); 
fclose ($handle); 

$file = "p-".$aleatorio.".bat";
$programa = $cadena;
$comando = '"C:\dlc91d\bin\prowin32.exe" -b -pf "loc.pf" -ininame "loc9.ini" -p '.$cadena ;

if ( !file_exists($file)){
        touch ($file);
        $handle = fopen ($file, 'r+'); 
        $str = $comando;

}
else{   
        $str = $comando;
        $handle = fopen ($file, 'r+'); 
}
fwrite ($handle, $str); 
fclose ($handle); 

exec($file, $output);

$output[0]                    = "";
$output[1]                    = "";

foreach($output as $outputline){
    echo("$outputline");
}
/**/
if(file_exists("$file"))
{
 if(unlink("$file"))
 {
  echo "";
 }
}
if(file_exists("$programa"))
{
 if(unlink("$programa"))
 {
  echo "";
 }
}
/**/
?>
</BODY>
</HTML>
