<?php

$cadena = "test.p";

$file = "corre.sh";
$comando =
"
export TERM=xterm
export DLC=/opt/app-root/src/dlc102b
export PATH=%DLC:$DLC/bin:$DLC/oebpm/server/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/dlc/dba/procomdb
$DLC/bin/_progres -b -p test.p 

";
echo $comando."<br>";



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

exec("chmod 775 ./corre.sh", $output);

$file = "sh ./".$file;

echo $file;

exec($file, $output);




foreach($output as $outputline){
    echo("$outputline");
}

?>

