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
$proceso      = $_GET["action"];
$programa = constant("PATHPROG")."/".$proceso.".p";
$programa = '"G,,,,,"';
$comando = ' ' ;
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
//$programa = $cadena;

$comando = $DLC.' '.$programa;
//echo $comando;
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

$data = file_get_contents("proveedor.json");
//var_dump($data);
$data = str_replace("","",$data);
$datos = json_encode($data, true);
//var_dump($datos); 

echo $data;
//echo $datos;


foreach($output as $outputline){
    echo("$outputline");
}


if(file_exists("$file"))
{
 if(unlink("$file"))
 {
  echo "";
 }
}

if(file_exists("$cadena"))
{
 if(unlink("$cadena"))
 {
  echo "";
 }
}

?>
