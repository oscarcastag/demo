<?php




$cadena = "test.p";


$file = "ls -lt /opt/app-root/src ";
//$file = "ls -lt /var/lib/";
$programa = $cadena;

echo $file."<br>";

exec($file, $output);

echo "<PRE>";
foreach($output as $outputline){
    
    echo("$outputline");
    echo "<br>";
}
echo "</PRE>";
 
?>

