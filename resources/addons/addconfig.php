<?php
/**
 * @copyright (c) 2017, RockJS Framework by Focus On Serivices
 * @version 1.0
 * @requires OpenEdge 102b or 91d
 * @author RockJS Framework by Focus On Serivices
 * @license http://focusonservices.com/rockjs FOCUS ON SERVICES
 * @throws Windows Server Version
 * Created: 15/03/2018
 * Abstract: Escribe las configuraciones de RockjsConf.php
 */

$ln = "\n";
$errorMSG = "";
$date = 'Last Updated at ' . date('Y-m-d') . ' ' . date("h:i:sa") . "\n";
$coments = '
<?php
/**
 * @copyright (c) 2017, RockJS Framework by Focus On Serivices
 * @version 1.0
 * @requires OpenEdge 102b or 91d
 * @author RockJS Framework by Focus On Serivices
 * @license http://focusonservices.com/rockjs FOCUS ON SERVICES
 * @throws Windows Server Version
 * 
    Last Updated at '. $date .'
    *--------------------------------------------------------------------------
    * Default Database Progress Connection
    *--------------------------------------------------------------------------
    *Progress config setings:
    * $DVM: Develop Mode  * Param bolean: true/active false/inactive
    * $DLC: Path progress * Param string: Ubicacion de la carpeta bin Progress 
    * $PATHPROG: Path WRK * Param string: Ubicacion del repositorio de Programas .P y de la DB
    * $PROCGI: Path PF    * Ubicacion del archivo .pf 
 */
';
//error_reporting(0);
// DLC
if (empty($_POST["DLC"])) {
    $errorMSG = "DLC is required ";
} else {
    $DLC = 'define("DLC","' . $_POST["DLC"] . '",false);';
}
// PATHPROG
if (empty($_POST["PATHPROG"])) {
    $errorMSG = "PATHPROG is required ";
} else {
    $PATHPROG = 'define("PATHPROG","' . $_POST["PATHPROG"] . '",false);';
}
// DLC
if (empty($_POST["PROCGI"])) {
    $errorMSG = "PROCGI is required ";
} else {
    $PROCGI = 'define("PROCGI","' . $_POST["PROCGI"] . '",false);';
}
// BD
if (empty($_POST["BD"])) {
    $errorMSG = "BD is required ";
} else {
    $BD = 'define("BD","' . $_POST["BD"] . '",false);';
}
// LOG
if (empty($_POST["LOG"])) {
    $errorMSG = "LOG is required ";
} else {
    $LOG = 'define("LOG","' . $_POST["LOG"] . '",false);';
}
// param
if (empty($_POST["param"])) {
    $errorMSG = "param is required ";
} else {
    $param = 'define("param","' . $_POST["param"] . '",false);';
}


if ($errorMSG == "") {
    $configuration = fopen("RockJSconf.php", "w") or die("Unable to open file!");

    fwrite($configuration, $coments . $ln);
    fwrite($configuration, 'define("DVM", false, false);');
    fwrite($configuration, $DLC . $ln);
    fwrite($configuration, $PATHPROG . $ln);
    fwrite($configuration, $PROCGI . $ln);
    fwrite($configuration, $BD . $ln);
    fwrite($configuration, $LOG . $ln);
    fwrite($configuration, $param . $ln);
    fwrite($configuration, "?>");
    fclose($configuration);
    echo "success";
} else {
    if ($errorMSG == "") {
        echo "Something went wrong";
        echo $errorMSG;
    } else {
        echo $errorMSG;
    }
}
?>