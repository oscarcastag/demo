<?php




$cadena = "test.p";


$file = "ls -lt /opt/app-root/src ";
$file = "./cor.sh $cadena";
$programa = $cadena;

//echo $file."<br>";

exec($file, $output);

echo '<div class="consultup-breadcrumb-section">';
foreach($output as $outputline){
    
    echo("$outputline");
    //echo "<br>";
}
echo "<div>";
 
?>

