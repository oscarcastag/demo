<?php

/*
  @copyright (c) 2017, RockJS Framework by Focus On Serivices
  @version 1.0
  @requires OpenEdge 102b or 91d
  @author RockJS Framework by Focus On Serivices
  @license http://focusonservices.com/rockjs FOCUS ON SERVICES
  @throws Windows Server Version
  Created: 23/03/2018
  Abstract: Escribe las configuraciones de RockjsConf.php
  Last Updated at 2018-03-23 07:47:50pm
  Default Database Progress Connection Config Setings:
 */

/*
  |--------------------------------------------------------------------------
  | Application Name * Param string:
  |--------------------------------------------------------------------------
  | Este valor es el nombre de tu aplicación. Este valor se usa cuando el
  | marco necesita colocar el nombre de la aplicación en una notificación o
  | cualquier otra ubicación según lo requiera la aplicación o sus paquetes.
  | Supported: String
 */
define("app_name", "RokcJS");
/*
  |--------------------------------------------------------------------------
  | Application server operating system* Param string:
  |--------------------------------------------------------------------------
  | Este valor es el nombre del sistema operativo del servidor de aplicaciones
  | Supported: "Windows", "Linux"
 */
define("server", "Windows");
/*
  |--------------------------------------------------------------------------
  | DVM: Develop Mode  * Param bolean: true/active false/inactive
  |--------------------------------------------------------------------------
  |Este valor determina el "entorno" en el que se encuentra corriendo actualmente su aplicación
  |Supported: true, false
  |
 */
define("DVM", true);
/*
  |--------------------------------------------------------------------------
  | Application Debug Mode * Param bolean:
  |--------------------------------------------------------------------------
  |
  | Cuando su aplicación está en modo de depuración, los mensajes de error son detallados con
  | los rastros de pila se mostrarán en cada error que ocurra dentro de su
  | solicitud. Si está deshabilitado, se muestra un mensaje de error genérico simple.
  |  Supported: true, false
 */
define("debug", true);
/*
  |--------------------------------------------------------------------------
  | DLC: Path progress * Param string: Ubicacion de la carpeta bin Progress
  |--------------------------------------------------------------------------
  |Este valor determina el "PATH" de la carpeta /bin de Progress
  |Supported: string use \ in Windows or / Linux
  |
 */
define('DLC', 'call .\provweb.exe ');
/*
  |--------------------------------------------------------------------------
  | PATHPROG: Path WRK * Param string: Ubicacion del repositorio de Programas .P
  |--------------------------------------------------------------------------
  |Este valor determina el "PATH" de la carpeta de trabajo donde se encuentran
  |los porgramas transformados para la ehecución en RockjsFramework
  |Supported: string use \ in Windows or / Linux
 */
define("PATHPROG", "");
/*
  |--------------------------------------------------------------------------
  | PROCGI: Path PF    * Ubicacion del archivo .pf
  |--------------------------------------------------------------------------
  |Este valor determina el "PATH" del archivo pf de conexion con Progress
  |Supported: string use \ in Windows or / Linux
 */
define("PROCGI", "");
/*
  |--------------------------------------------------------------------------
  | Timezone * Param string:
  |--------------------------------------------------------------------------
  | Aquí puede especificar la zona horaria predeterminada para su aplicación, que
  | será utilizado por las funciones de fecha y hora de PHP. Lo hemos configurado
  | de manera predeterminada para usted.
  | Listado de zonas horarias admitidas: http://php.net/manual/es/timezones.america.php
  |
 */
define("timezone", "America/Mexico_City");
/*
  |--------------------------------------------------------------------------
  | Application Locale Configuration * Param string:
  |--------------------------------------------------------------------------
  |
  | La configuración regional de la aplicación determina la configuración regional predeterminada que se usará
  | por el proveedor de servicios de traducción. Usted es libre de establecer este valor
  | a cualquiera de las configuraciones regionales que serán compatibles con la aplicación.
  | Configuración Regionales admitidas: http://php.net/manual/es/class.locale.php
  |
 */
define("locale", "es");
/*
  |--------------------------------------------------------------------------
  | Default Session Settings
  |--------------------------------------------------------------------------
  |
  | Estas opciones determinan la configuracion del controlador de SESSION predeterminado por RockJS
  |
  | secure          * Param bolean: El valor determina si usara seguridad mediante SESSION
  | expire_on_close * Param bolean: El valor determina si la SESSION termina al cerrar la ventana
  | lifetime        * Param String: El valor determina en min el tiempo de la SESSION
 */
define("secure", false);
define("expire_on_close", true);
define("lifetime", "680");
?>
