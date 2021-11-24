<?php

/**
 * @copyright (c) 2017, RockJS Framework by Focus On Serivices
 * @version 1.0
 * @requires OpenEdge 102b or 91d
 * @author Ing. Bernabé Gutierrez Rodriguez 
 * Date 03/10/2018
 * @license http://focusonservices.com/rockjs FOCUS ON SERVICES
 * @throws Windows Server Version
 * 
 */
class RockJS {

    public $setResult;
    private $progressExe = "";
    private $WorckSpace = "";
    private $pfdata = "";
    private $sysErrNo;
    private $sysErrDesc;
    private $SetingErrorValue = "";
    private $exe;

    // Constructor
    public function __construct() {
        include_once "RockJSconf.php";
        //Setings
        $this->app_name = constant("app_name");
        $this->server = constant("server");
        $this->developMode = constant("DVM");
        $this->debug = constant("debug");
        $this->progressExe = constant("DLC");
        $this->WorckSpace = constant("PATHPROG");
        $this->pfdata = constant("PROCGI");
        $this->timezone = constant("timezone");
        $this->locale = constant("locale");
        $this->secure = constant("secure");
        //$this->expire_on_close = constant("expire_on_close");
        //$this->lifetime = constant("lifetime");
        date_default_timezone_set($this->timezone);
        $this->hoy = strtotime(date("d-m-Y H:i:00", time()));
        $this->caducidad = strtotime("31-12-2019 21:00:00");
		$this->licencia = "RJSFRM-00001";
        $this->getServer();
        $this->getDVM();
        //$this->getDebug();
    }

    private function getDVM() {
        if (is_bool($this->developMode)) {
            if ($this->developMode) {
                //echo "true";
            } else {
                error_reporting(0);
            }
        } else {
            //echo 'Production mode Active';
            $this->errorLogRockJS("Error", "RockJSconf", "Use of undefined constant DVM");
        }
    }

    /**
     * @abstract getSession
     * @static funcion que evalua var: secure para definir seguridad por SESSION 
     * @param type $secure Description  El valor determina si usara seguridad mediante SESSION
     */
    private function getDebug() {
        if (is_bool($this->debug)) {
            switch ($this->debug) {
                case true:
                    echo " ($this->sysErrNo) $this->sysErrDesc <br>";
                    break;
                case false:
                    break;
                default:
                    $this->SetingErrorValue .= "<pre>Error in Default Session Settings value:  $this->debug "
                            . "<br>check the <strong>configuration file</strong><pre>";
            }
        } else {
            echo 'false';
            $this->errorLogRockJS("Error", "RockJSconf", "Use of undefined constant debug");
        }
    }

    /**
     * @abstract getSession
     * @static funcion que evalua var: secure para definir seguridad por SESSION 
     * @param type $secure Description  El valor determina si usara seguridad mediante SESSION
     */
    private function getSession() {
        switch ($this->secure) {
            case true:
                //echo 'true';
                include_once 'config/session.php';
                break;
            case false:
                break;
            default:
                $this->SetingErrorValue .= "<pre>Error in Default Session Settings value:  $this->secure "
                        . "<br>check the <strong>configuration file</strong><pre>";
        }
    }

    /**
     * @abstract getServer
     */
    private function getServer() {
        switch ($this->server) {
            case "Windows":
                $this->exe = "\_progres.exe -b";
                break;
            case "Linux":
                $this->exe = "/_progres -b";
                break;
            default:
                $this->SetingErrorValue .= "<pre>Error in Application server operating system value:  $this->server "
                        . "<br>check the <strong>configuration file</strong><pre>";
                $this->errorLogRockJS("ERROR", "RockJSconf", $this->SetingErrorValue); //when ocurred error log
        }
    }

    /**
     * 
     * @return type
     */
    private function getWorckSpace() {
        // Devolvemos un atributo
        return $this->WorckSpace;
    }

    /**
     * Log de errores en la aplicacion
     * @param  $tipo tipo de falla trace | debug | info | warn | error | fatal
     * @param type $origen de la falla
     * @param type $detalle de la falla
     */
    private function errorLogRockJS($tipo, $origen, $detalle) {
        error_log('[' . date("d-m-Y-h:i:sa", $this->hoy) . "] " . $tipo . " " . $origen . " detail: " . $detalle . " \r\n", 3, dirname(__FILE__) . "/error2.log");
    }

    /**
     * 
     * @param type $WorckSpace
     */
    private function setWorckSpace($WorckSpace) {
        //Le damos un valor a un atributo
        $this->WorckSpace = $WorckSpace;
    }

    /**
     * 
     * @return type
     */
    private function getpfdata() {
        return $this->pfdata;
    }

    /**
     * 
     * @param type $prog_info
     * @return boolean
     */
    public function _openrockjs($prog_info) {
        //Invoca hostorial
        $this->history_request();
        //Verifica vigencia de la aplicación
        if ($this->hoy > $this->caducidad) {
            echo "<h1>Su Licenca RockJS Framework de prueba con vigencia de 30 dias ha expirado</h1>";
            echo "<p>Contáctenos para ampliar su licencia</p>";
            $this->errorLogRockJS("WARN", "openrockjs", "Su Licenca RockJS Framework de prueba con vigencia de 30 dias ha expirado Contáctenos para ampliar su licencia"); //when ocurred error log
        }
        //verifica que no haya errores en RockjsConf.php
        if ($this->SetingErrorValue != "") {
            echo $this->SetingErrorValue;
        } else {
			if ($prog_info == "cxclogin") {
                $setResult = '[{"auth": "success"}, {"Opciones": ""} ]';
				$this->setResult = $setResult;
	            return true;			
			}
            /*
             * Este segmento de codigo
             * recibe las llamadas tipo GET|POST|SERVER
             * !Muy importante no borrar¡
             * $vparse es una variable parseada por el metodo
             * Protect_XSSHtml_Injection que evita la inyeccion de codigo
             */
            while (list($k, $v) = each($_GET)) {
                if ($v == "") {
                    /*
                     * putenv carga las variables
                     * en memoria
                     */
                    putenv("$k=!");
                } else {
                    $vparse = $this->Protect_XSSHtml_Injection($v);
                    putenv("$k=$vparse");
                }
            }
            while (list($k, $v) = each($_SERVER)) {
                putenv("$k=$v");
            }
            while (list($k, $v) = each($_POST)) {
                if ($v == "") {
                    putenv("$k=!");
                } else {
                    $vparse = $this->Protect_XSSHtml_Injection($v);
                    putenv("$k=$vparse");
                }
            }
            //Invoca a DOS con la ejecucion 
            $CMD = $this->_comand_value($prog_info);
            $fp = popen("$CMD", "r");
            $setResult = "";
            //echo $CMD;
            while ($read = fread($fp, 2096)) {
                if (substr($read, 0, 26) == "Tabla desconocida o ambigua") {
                    $read = "**" . $read;
                    $this->extractError($read);
                    pclose($fp);
                    return false;
                }
                if (substr($read, 0, 2) == "**") {
                    $this->extractError($read);
                    pclose($fp);
                    return false;
                }
                if (substr($read, 0, 31) == "There is no server for database") {
                    $read = "** " . $read;
                    $this->extractError($read);
                    pclose($fp);
                    return false;
                }
                $this->setResult .= $read;
            }
            pclose($fp);
            return true;
        }//end licence else
    }

    /**
     * 
     * @param type $errString
     */
    private function extractError($errString) {
        // Remove leading ** 
        $errString = trim(substr($errString, 3));
        // Find err no
        $rpos = strrpos($errString, "(");
        if ($rpos > 0) {
            $this->sysErrDesc = substr($errString, 0, $rpos - 1);
            $errString = substr($errString, $rpos + 1);
            $errString = substr($errString, 0, strlen($errString) - 1);
            $this->sysErrNo = $errString;
            /* Cuando suceda un error se escribira en el archivo error.log */
            $this->error_log_write();
            $this->getDebug();
        } else {
            $this->sysErrDesc = $errString;
            $this->sysErrNo = -1;
        }
    }

    /**
     * Funcion que recibe datos de intputs y escapa caracteres especiales para evitar inyeccion de codigo 
     * Cross Site Scripting o, por su abreviación, 
     * XSS es una vulnerabilidad en el sistema de validación de HTML
     * la cual permite inyectar, en páginas web, código JavaScript
     * u otro lenguaje similar (ej: VBScript).
     * @param type $data
     * @return type
     */
    private function Protect_XSSHtml_Injection($data) {
        $data = htmlspecialchars(addslashes(stripslashes(strip_tags(trim($data)))));
        return $data;
    }

    /* Funcion que recibe y evalua el comado que va a ejecutar RockJS */

    private function _comand_value($action) {
        $CMD = "";
        switch ($action) {
            case "version":
                if ($this->developMode == true) {
                    /* Muestra la version del producto RockJS */
                    $version = ' <div class="grid-stack"><div class="grid-stack-item" data-gs-x="0" data-gs-y="0" data-gs-width="12" data-gs-height="6"><div class="grid-stack-item-content">';
                    $version .= '<div class="card"><div class="card-header"><pre><h4>Información del producto</h4></div>';
                    $version .= '<div class="card-body">';
                    $version .= "App Name: $this->app_name";
                    $version .= '<br>copyright (c) 2018, RockJS Framework by Focus On Serivices';
                    $version .= "<br>Last release: 2018";
                    $version .= '<br>version  VP' . $this->server . '1.0';
                    $version .= "<br>$this->server Server Version";
                    $version .= "<br>Zona Horaria: $this->timezone";
                    $version .= "<br>Region: $this->locale";
                    $version .= '<br>license https://www.focusonservices.com';
                    $version .= '<br>____________________________________________';
                    $version .= "<br>Modo desarrollo: $this->developMode";
                    $version .= "<br>Modo debug: $this->debug";
                    $version .= "<br>controlador de SESSION: $this->secure";
                    $version .= "<br>Licencia Rockjs Framework: $this->licencia";
                    $version .= "<br>Vencimiento de licencia " . date("d-m-Y", $this->caducidad) . " </pre></div></div></div></div></div>";
                    echo $version;
                    break;
                }
            case "cmd":
                /* Muestra el comando DOS RockJS solo si esta en modo develop */
                if ($this->developMode == true) {
                    $Programa = builder_factory::create($action);
                    //$PROEXE = path bin + progres 
                    $PROEXE = $this->progressExe . $this->exe;
                    //$path_info = $PROEXE + Program.p
                    $path_info = $this->WorckSpace . $Programa->prog;
                    $DOS = "<pre>$PROEXE -pf " . $this->pfdata . " -p $path_info</pre>";
                    //echo $DOS;
                    break;
                } else {
                    echo ' This option is not available ';
                }
            default:
                /* Crea el objeto tipo Programa que ejecuta Rockjs */
                $Programa = builder_factory::create($action);
                //$PROEXE = path bin + progres 
                //$PROEXE = $this->progressExe . $this->exe;
				$PROEXE = $this->progressExe ;
                //$path_info = $PROEXE + Program.p
                $path_info = $this->WorckSpace . $Programa->prog;
                //$CMD = "$PROEXE -pf " . $this->pfdata . " -p $path_info";
				$CMD = "$PROEXE " . $this->pfdata . " $path_info";
				//echo $CMD;
        }
        return $CMD;
    }

    /* Escribe en el archivo error.log los errores Prgress que suceden en ejecucion */

    //Modificado 02/10/2018
    private function error_log_write() {
        error_log('[' . date("d-m-Y-h:i:sa", $this->hoy) . "] Fatal detail: (" . $this->sysErrNo . ")" . $this->sysErrDesc . " \r\n", 3, dirname(__FILE__) . "/error2.log");
    }

//        private function error_log_write() {
//        $nombre_archivo = 'error.log';
//        $contenido = "\n[" . date('l jS \of F Y h:i:s A') . "] ($this->sysErrNo) $this->sysErrDesc";
//        // Primero vamos a asegurarnos de que el archivo existe y es escribible.
//        if (is_writable($nombre_archivo)) {
//            // En nuestro ejemplo estamos abriendo $nombre_archivo en modo de adición.
//            // El puntero al archivo está al final del archivo
//            // donde irá $contenido cuando usemos fwrite() sobre él.
//            if (!$gestor = fopen($nombre_archivo, 'a')) {
//                //echo "No se puede abrir el archivo ($nombre_archivo)";
//                exit;
//            }
//            // Escribir $contenido a nuestro archivo abierto.
//            if (fwrite($gestor, $contenido) === FALSE) {
//                //echo "No se puede escribir en el archivo ($nombre_archivo)";
//                exit;
//            }
//            //echo "Éxito, se escribió ($contenido) en el archivo ($nombre_archivo)";
//            fclose($gestor);
//        } else {
//            $myfile = fopen("error.log", "w") or die("Unable to open file!");
//            fwrite($myfile, "New Data Error \n");
//            fwrite($myfile, $contenido);
//            fclose($myfile);
//            //echo 'se creo archivo';
//        }
//    }
    /**
     * Created: 14/03/2018
     * Abstract: mapea las peticiones recibidas en la aplicacion y las guarda 
     * en un archivo history_request.json el cual sirve como historial en la aplicación
     * America/Mexico_City
     * modificado 02/10/2018
     */
    private function history_request() {
        $Data = null;
        $headers = apache_request_headers();
        $method = $_SERVER['REQUEST_METHOD'];
        switch ($method) {
            case 'GET'://consulta
                //echo 'GET';
                $Data = $_GET;
                break;
            case 'POST'://inserta
                //echo 'success';
                $Data = $_POST;
                break;
            default://metodo NO soportado
                echo 'METODO NO SOPORTADO';
                break;
        }
        $DataRequest = [
            [
                "DATE" => date("Y-m-d h:i:sa"),
                "REMOTE_ADDR" => $_SERVER['REMOTE_ADDR'],
                "REQUEST_URI" => $_SERVER['REQUEST_URI'],
                "REQUEST_METHOD" => $_SERVER['REQUEST_METHOD'],
                "REQUEST_TIME" => $_SERVER['REQUEST_TIME'],
                "DATA" => $Data,
                "HEADER" => $headers
            ]
        ];
        // Convert Array to JSON String
        $someJSON = json_encode($DataRequest, JSON_UNESCAPED_UNICODE);
        //echo $someJSON;
        $nombre_archivo = 'history_request.json';
        $contenido = $someJSON;
        try {
            // Primero vamos a asegurarnos de que el archivo existe y es escribible.
            if (is_writable($nombre_archivo)) {
                // En nuestro ejemplo estamos abriendo $nombre_archivo en modo de adición.
                // El puntero al archivo está al final del archivo
                // donde irá $contenido cuando usemos fwrite() sobre él.
                if (!$gestor = fopen($nombre_archivo, 'a')) {
                    //echo "No se puede abrir el archivo ($nombre_archivo)";
                    exit;
                }
                // Escribir $contenido a nuestro archivo abierto.
                //Sin truncar contenido previo
                if (fwrite($gestor, $contenido) === FALSE) {
                    //echo "No se puede escribir en el archivo ($nombre_archivo)";
                    //No existe el archivo
                    exit;
                }
                //echo "Éxito, se escribió ($contenido) en el archivo ($nombre_archivo)";
                fclose($gestor);
            } else {
                //Si no existe Crea un archivo nuevo
                $NewJsonHistory = fopen("history_request.json", "w") or die("Unable to open file!");
                //Escribimos el contenido
                fwrite($NewJsonHistory, $someJSON);
                fclose($NewJsonHistory);
                //echo 'se creo archivo';
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
        try {
            /*
             * Reemplaza ][ por , para que el json resultante no tenga errores
             * abrimos history_request.json original
             */
            $text_replace = fopen("history_request.json", "r") or die("Unable to open file!");
            $jsonoriginal = fread($text_replace, filesize("history_request.json"));
            fclose($text_replace);
            //Lee el texto y reemplaza ][ por ,
            $resultado = str_replace("}][{", "},{", $jsonoriginal, $contador);
            $replaceJsonParse = fopen("history_request.json", "w") or die("Unable to open file!");
            fwrite($replaceJsonParse, $resultado);
            fclose($replaceJsonParse);
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

}

/* @name: builder_factory.class
 * abstract: Crea un objeto Programa asignando prefijos y sufijos
 *  necesarios para su ejecucion en RockJS
 */

class builder_factory {

    public $prog;

    /**
     * 
     * @param string $prog
     * @return \Programa
     */
    public static function create($prog) {
        $prog = $prog . '.p';
        $DLC_PROG = "\\" . $prog;
        return new Programa($DLC_PROG);
    }

    /**
     * 
     * @return type
     */
    public function getType() {
        return get_class($this);
    }

}

class Programa extends builder_factory {

    public function __construct($prog) {
        $this->prog = $prog;
    }

}

/* Función que describe los errores mas comunes progres, mismos que son desplegados al usuario Rockjs */

function setError($error) {
    switch ($error) {
        case "492":
            echo " Unable to run startup procedure _ab.p (492)";
            break;
        case "1432":
            echo " Could not connect to server for database, error  (1432)";
            break;
        case "1247":
            echo " Unable to open parameter file, error (1247)";
            break;
        case "725":
            echo " Unknown or ambiguous table. error (725)";
            break;
        case "196":
            echo " Could not understand line error (196)";
            break;
        case "725":
            echo " error (725)";
            break;
        case "725":
            echo " error (725)";
            break;
        default:
            echo " Progress error " . $error;
    }
}
?>
 



