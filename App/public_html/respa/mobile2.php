<?php
$mobile_browser = '0';

//$_SERVER['HTTP_USER_AGENT'] -> el agente de usuario que está accediendo a la página.
//preg_match -> Realizar una comparación de expresión regular

if(preg_match('/(up.browser|up.link|mmp|symbian|smartphone|midp|wap|phone)/i',strtolower($_SERVER['HTTP_USER_AGENT']))){
    $mobile_browser++;
}

//$_SERVER['HTTP_ACCEPT'] -> Indica los tipos MIME que el cliente puede recibir. 
if((strpos(strtolower($_SERVER['HTTP_ACCEPT']),'application/vnd.wap.xhtml+xml')>0) or
    ((isset($_SERVER['HTTP_X_WAP_PROFILE']) or isset($_SERVER['HTTP_PROFILE'])))){
    $mobile_browser++;
}

$mobile_ua = strtolower(substr($_SERVER['HTTP_USER_AGENT'],0,4));
$mobile_agents = array(
    'w3c ','acs-','alav','alca','amoi','audi','avan','benq','bird','blac',
    'blaz','brew','cell','cldc','cmd-','dang','doco','eric','hipt','inno',
    'ipaq','java','jigs','kddi','keji','leno','lg-c','lg-d','lg-g','lge-',
    'maui','maxo','midp','mits','mmef','mobi','mot-','moto','mwbp','nec-',
    'newt','noki','oper','palm','pana','pant','phil','play','port','prox',
    'qwap','sage','sams','sany','sch-','sec-','send','seri','sgh-','shar',
    'sie-','siem','smal','smar','sony','sph-','symb','t-mo','teli','tim-',
    'tosh','tsm-','upg1','upsi','vk-v','voda','wap-','wapa','wapi','wapp',
    'wapr','webc','winw','winw','xda','xda-');

//buscar agentes en el array de agentes
if(in_array($mobile_ua,$mobile_agents)){
    $mobile_browser++;
}

//$_SERVER['ALL_HTTP'] -> Todas las cabeceras HTTP
//strpos -> Primera aparicion de una cadena dentro de otra
if(strpos(strtolower($_SERVER['ALL_HTTP']),'OperaMini')>0) {
    $mobile_browser++;
}
if(strpos(strtolower($_SERVER['HTTP_USER_AGENT']),'windows')>0) {
    $mobile_browser=0;
}

$aleatorio=rand();
settype ($aleatorio,"string");
$valor = $cliente;
$aleatorio=rand();
settype ($aleatorio,"string");
$cadena = "p-".$aleatorio.".p";

$file = "corre2.sh";
$cadena = "test.p";

$comando = '
export TERM=xterm
export DLC=/var/lib/minishift/test/dlc102b
export PATH=%DLC:$DLC/bin:$DLC/oebpm/server/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/dlc/dba/procomdb
#cd /opt/lampp/htdocs/Vida/
/var/lib/minishift/test/dlc102b/bin/_progres -b -p '.$cadena ;

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
/*

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
*/
?>
</BODY>
</HTML>
