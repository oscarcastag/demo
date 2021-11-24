<?php
$aleatorio=rand();
settype ($aleatorio,"string");
$aleatorio=rand();
settype ($aleatorio,"string");
$cadena = "test.p";

//$file = "sh ./corres.sh $cadena";
$file =
"
export TERM=xterm
export DLC=/opt/app-root/src/dlc102b
export PATH=%DLC:$DLC/bin:$DLC/oebpm/server/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/dlc/dba/procomdb
/opt/app-root/src/dlc102b/bin/_progres -b -p ./test.p
";
$programa = $cadena;
echo $file."<br>";


exec($file, $output);

//$output[0]                    = "";
//$output[1]                    = "";

foreach($output as $outputline){
    echo("$outputline");
}
?>

