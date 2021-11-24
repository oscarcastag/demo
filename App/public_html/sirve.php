<?php
$file = "./sir.sh";

exec ($file, $output);

foreach($output as $outputline) {
    echo $outputline;
}


 







?>
