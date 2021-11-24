<?php
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: SAMEORIGIN');
header('X-XSS-Protection: 1;mode=block');
date_default_timezone_set('America/Mexico_City');
$globalNombre = "Focus on Services SA de CV";
?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Rockjs Framework | Focus on Services SA de CV</title>
        <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 10]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- Meta -->
        <meta charset="utf-8">
        <meta content="text/html; charset=UTF-8; X-Content-Type-Options=nosniff" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="description" content="#">
        <meta name="keywords"
              content="flat ui, admin Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
        <meta name="author" content="#">
        <!-- Favicon icon -->
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
        <!-- Google font--><link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
        <!-- Required Fremwork -->
        <link rel="stylesheet" type="text/css" href="bower_components/bootstrap/css/bootstrap.min.css">
        <!-- themify-icons line icon -->
        <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
        <!-- ico font -->
        <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
        <!-- flag icon framework css -->
        <link rel="stylesheet" type="text/css" href="assets/pages/flag-icon/flag-icon.min.css">
        <!-- Menu-Search css -->
        <link rel="stylesheet" type="text/css" href="assets/pages/menu-search/css/component.css">
        <!-- Style.css -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <!-- Style RockJs -->
        <link rel="stylesheet" href="asset/css/rockjs.css">
        <!-- ICON personalite CSS -->
        <link rel="stylesheet" href="asset/css/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
        <link rel="stylesheet" href="asset/css/pe-icon-7-stroke/css/helper.css">
        <!-- JQuery Export datatable csv,excel pdf -->
        <!--        <link rel="stylesheet" href="asset/css/jquery.dataTables.min.css">-->
        <!--link rel="stylesheet" href="asset/css/buttons.dataTables.min.css"-->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.18/r-2.2.2/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css"/>

        <!-- Draggable personalite CSS -->
        <script src="asset/js/sweetalert2/sweetalert2.min.js"></script>
        <link rel="stylesheet" href="asset/js/sweetalert2/sweetalert2.min.css">
        <!-- Style RockJs -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
    </head>

    <body>
        <!-- Pre-loader start -->
        <div class="theme-loader">
            <div class="ball-scale">
                <div class='contain'>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                    <div class="ring"><div class="frame"></div></div>
                </div>
            </div>
        </div>
        <!-- Pre-loader end -->
        <div id="pcoded" class="pcoded">
            <div class="pcoded-overlay-box"></div>
            <div class="pcoded-container navbar-wrapper">

                <nav class="navbar header-navbar pcoded-header">
                    <div class="navbar-wrapper">

                        <div class="navbar-logo">
                            <a class="mobile-menu" id="mobile-collapse" href="#!">
                                <i class="ti-menu"></i>
                            </a>
                            <a class="mobile-search morphsearch-search" href="#">
                                <i class="ti-search"></i>
                            </a>
                            <a href="menu.php">
                                <img class="img-fluid" src="asset/images/logo.png"  alt="Focus on Services" />
                            </a>
                            <a class="mobile-options">
                                <i class="ti-more"></i>
                            </a>
                        </div>

                        <div class="navbar-container container-fluid">
                            <ul class="nav-left">
                                <li>
                                    <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                                </li>

                                <li>
                                    <a href="#!" onclick="javascript:toggleFullScreen()">
                                        <i class="ti-fullscreen"></i>
                                    </a>
                                </li>

                            </ul>
                            <ul class="nav-right">

                                <li class="user-profile header-notification">
                                    <a href="#!">
									<img src="asset/images/img_avatar3.png" class="img-radius" alt="User-Profile-Image">
                                        <span><?php echo $globalNombre; ?></span>
                                        <i class="ti-angle-down"></i>
                                    </a>
                                    <ul class="show-notification profile-notification">
                                        <li>
                                            <a href="index.html" onclick="louout()">
                                                <i class="ti-layout-sidebar-left"></i> Salir
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            </nav>

                            <!-- Sidebar inner chat end-->
                            <div class="pcoded-main-container">
                                <div class="pcoded-wrapper">
                                    <nav class="pcoded-navbar">
                                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                                        <div class="pcoded-inner-navbar main-menu">

                                            <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Navegación</div>
                                            <ul class="pcoded-item pcoded-left-item">
                                                  <ul class="pcoded-item pcoded-left-item">
												<li class="pcoded-hasmenu">
													<a href="javascript:void(0)">
														<span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
														<span class="pcoded-mtext" data-i18n="nav.dash.main">Dashboard</span>
														<span class="pcoded-mcaret"></span>
													</a>
													<ul class="pcoded-submenu">
														<li class="">
															<a href="grafica.html">
																<span class="pcoded-micon"><i class="ti-angle-right"></i></span>
																<span class="pcoded-mtext" data-i18n="nav.dash.default">Proveedores</span>
																<span class="pcoded-mcaret"></span>
															</a>
														</li>
													</ul>
												</li>
												<li class="">    <a href="addprov.php">        <span class="pcoded-micon"><i class="ti-layout-cta-right"></i><b>N</b></span>        
													 <span class="pcoded-mtext" data-i18n="nav.navigate.main">Proveedores</span>        
													 <span class="pcoded-mcaret"></span>    </a>
												</li>
												<li class="">    <a href="menu.php">        <span class="pcoded-micon"><i class="ti-layout-cta-right"></i><b>N</b></span>        
													 <span class="pcoded-mtext" data-i18n="nav.navigate.main">Bienvenida</span>        
													 <span class="pcoded-mcaret"></span>    </a>
												</li>                                            </ul>
												<li class="">    <a href="index.html">        <span class="pcoded-micon"><i class="ti-layout-cta-right"></i><b>N</b></span>        
													 <span class="pcoded-mtext" data-i18n="nav.navigate.main">Salir</span>        
													 <span class="pcoded-mcaret"></span>    </a>
												</li>                                        </div>
                                    </nav>
                                    <div class="pcoded-content">
                                        <div class="pcoded-inner-content">

                                            <div class="main-body">
                                                <div class="page-wrapper">

                                                    <div class="page-body">