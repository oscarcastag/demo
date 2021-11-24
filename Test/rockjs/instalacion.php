<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>RockJS Framework®</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta name="apple-mobile-Web-app-title" content="RockJS Framework®">
        <meta name="author" content="RockJS Framework®|Focus On Services">
        <meta name="keywords" content="Soporte tecnico,it,ti,soluciones,datacenter,consultoria,centro de datos,empresarial,administracion,proyectos,soporte multimarca, Focus On Services es un proveedor global de servicios con presencia en más de 16 países de Latinoamérica con un amplio portafolio de servicios en Tecnologías de Información y con los mejores tiempos de respuesta de la industria, Software, Desarrollo, app, apps, android, IOS, 
              Transformación digital, Software on demand, Software a la medida, Servicios de desarrollo de software, fabrica de software, Progress, 4GL, ABL, app server, PAS, Servicios Web Síncronos,protocolos REST JSON XML">
        <meta name="description" content="La forma más rápida de adoptar la Transformación Digital">


        <!-- Favicon -->
        <link href="http://www.focusonservices.com/rockjs/img/favicon.ico" rel="icon">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Sniglet:400,500,700|Metric-Light:400,900" rel="stylesheet">
        <!-- Bootstrap CSS File -->
        <link href="http://www.focusonservices.com/rockjs/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Libraries CSS Files -->
        <link href="http://www.focusonservices.com/rockjs/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- Main Stylesheet File -->
        <link href="http://www.focusonservices.com/rockjs/css/style.css" rel="stylesheet">
        <link href="http://www.focusonservices.com/rockjs/css/pixeden/assets/Pe-icon-7-stroke.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <!-- Header -->
    <header id="header">
        <div class="container">  
            <div id="logo" class="pull-left">
                <a href="http://www.focusonservices.com/rockjs/"><img src="http://www.focusonservices.com/rockjs/img/rock/sniglet-blue-sl.png" alt="Transformación digital" title="RockJS Framework®|Focus On Services" /></img></a>
            </div>   
            <nav id="nav-menu-container">
                <ul class="nav-menu">
                    <li><a href="http://www.focusonservices.com/rockjs/#RockJS">RockJS</a></li>
                    <li><a href="http://www.focusonservices.com/rockjs/#servicios">Servicios</a></li>
                    <li><a href="http://www.focusonservices.com/rockjs/#beneficios">Beneficios</a></li>
                    <li><a href="http://www.focusonservices.com/rockjs/RockJSFrameworkBluePrint.pdf" download="RockJS Framework.pdf">Blueprint</a></li>
                    <li><a href="http://www.focusonservices.com/rockjs/#contact">Contáctenos</a></li>
                </ul>
            </nav><!-- #nav-menu-container -->

            <nav class="nav social-nav pull-right hidden-sm-down">
                <ul class="nav-menu">
                    <li class="menu-has-children"><span class="pe-7s-global white"></span>
                        <ul>
                            <li><div id="google_translate_element"></div></li> 
                        </ul>
                    </li>        
                </ul>
            </nav>
        </div>
    </header><!-- #header -->
    <body>
        <div class="container">
            <h2 class="text-center cfos">
                <img src="http://www.focusonservices.com/rockjs/img/rock/sniglet-sl-b.png" width="50" alt="Transformación digital" title="RockJS Framework®|Focus On Services"/></img>&nbsp;<span class="rck cfos">RockJS</span> Framework Instalacion
            </h2>
            <div>
                <div class="container">

                    <?php
                    /**
                     * @copyright (c) 2017, RockJS Framework by Focus On Serivices
                     * @version 1.0
                     * @requires OpenEdge 102b or 91d
                     * @author RockJS Framework by Focus On Serivices
                     * 
                     */
                    /*
                      |--------------------------------------------------------------------------
                      | Service Web
                      |--------------------------------------------------------------------------
                      | Debe especificar el nombre del programa .P Transformado por RockJS  definida en $_GET["p"]
                      | La funcion setProgram hace el llamado al programa .P y lleva a cabo su ejecucion
                      | Mostrando el setResult con el atributo $Rockobj
                      | Puede modificar el llamado con variables estaticas o como mejor convenga
                     */

                    include "./openrockjs.php";

                    /**
                     * @param $_GET["p"] Description:
                     * Recibe el nombre del programa Progress a Ejecutar
                     */
                     
                    if (empty($_GET["p"])) {
                        $prog = "test.p";
                        echo "<Table>";
                        echo "<tr>";
                        echo "<H1>Hola Mundo!</H1>";
                        echo "<H2>Instalacion de RocksJS FrameWork instalado correctamente</H2>";
                        echo "<H3>Felicidades...Por favor contactar a Focus on Services para su activacion </H3>";
                        echo '<H3> <a href="/rockJS1.0/docs/">Documentacion Rockjs Framework v01</a></H3>';
                        echo '<H3> <a href="/rockJS1.0/rockjs/version.php">Version y Licencia</a></H3>';
                        echo '<H3> <a href="/rockJS1.0/rockjs/validatoken.php">Validación de token JWT</a></H3>';
                        echo "</Table>";
                        echo "</tr>";
                        //setProgram($prog);
                    } else {
                        $prog = $_GET["p"];
                        setProgram($prog);
                    }

                    /**
                     * 
                     * @param type $prog Description:
                     * Define el objeto programa Progress concatenando los elementos necesarios 
                     * para la ejecucion en RockJS
                     */
                    function setProgram($prog) {
                        /* | Creación del objeto RockJS */
                        $Rockobj = new RockJS;

                        /**
                         * @method type _openrockjs(type $Programa) Description:
                         * Crea una instancia de la clase RockJS y retorna data-type Boleano
                         * False: Error
                         * True: Muestra el resultado de la ejecucion
                         */
                        if ($prog == "") {
                        }
                        else {
                        if ($Rockobj->_openrockjs($prog) == false) {
                            setError($Rockobj->sysErrNo);
                        } else {
                            echo $Rockobj->setResult;
                        }
                        }
                    }
                    ?>


                    <script>
                        $(document).ready(function () {
                            $("#myInput").on("keyup", function () {
                                var value = $(this).val().toLowerCase();
                                $("#myTable tr").each(function () {
                                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                });
                            });
                        });
                    </script>
                    <!-- Optional JavaScript -->
                    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                </div>

                </body>
                </html>
