<?php
$aleatorio=rand();
settype ($aleatorio,"string");
$aleatorio=rand();
settype ($aleatorio,"string");
$cadena = "test.p";

$file = "sh ./corress.sh ";
//$file = "ls -l";
$programa = $cadena;
echo $file."<br>";

exec($file, $output);
//$file = "ls -l /var/"

//$output[0]                    = "";
//$output[1]                    = "";
echo "<PRE>";
foreach($output as $outputline){
    
    echo("$outputline");
    echo "<br>";
}
echo "</PRE>";
echo '<frame src="http://172.16.100.64" width = "600" height = "800"></iframe>';
 
?>

