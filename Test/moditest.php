<?php
require_once './rockjs/RockJSconfdbf.php';
$DLC         = constant("DLC");
$DLC = "
@echo off
call provweb.exe ";
$aleatorio=rand();
settype ($aleatorio,"string");
$aleatorio=rand();
settype ($aleatorio,"string");
$cadena = "p-".$aleatorio.".sql";
$file  = $cadena;
$Proveedor     = $_POST["Proveedor"];
$Nombre        = $_POST["Nombre"];
$comando = '"C,'.$Proveedor.','.$Nombre.',Direccion Test,Colonia Test,Ciudad Test"' ;

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

$programa = $comando;
$comando = $DLC." ".$programa;


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

$data = file_get_contents("modiprov.log");
$data = str_replace("","",$data);
$data = str_replace("[","",$data);
$data = str_replace("]","",$data);
$data = json_decode($data, true);
header('Content-Type: text/html; charset=utf-8');             
echo json_encode($data, JSON_PRETTY_PRINT);
$programa = $cadena;
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

?>
