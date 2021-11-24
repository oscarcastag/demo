<?php

/**
 * @copyright (c) 2017, RockJS Framework by Focus On Serivices
 * @version 1.0
 * @requires OpenEdge 102b or 91d
 * @author RockJS Framework by Focus On Serivices
 * @license http://focusonservices.com/rockjs FOCUS ON SERVICES
 * @throws Windows Server Version
 * 
 */
$errorMSG = "";

// Recibimos usuario y password
//usuario
if (empty($_POST["usuario"])) {
    $errorMSG = "usuario is required ";
} else {
    $usuario = $_POST["usuario"];
}

//Password
if (empty($_POST["Password"])) {
    $errorMSG .= "Password is required ";
} else {
    $Password = $_POST["Password"];
}

// si no hay errores
if ($errorMSG == "") {
    echo 'success';
    session_start();
    // Set vars sessions
    $_SESSION["usuario"] = $usuario;
    $_SESSION['loggedin'] = true;
    $_SESSION['start'] = time();

    //*TOKEN WEB*//
    $token = md5(uniqid(rand(), TRUE));
    $_SESSION['token'] = $token;
    $_SESSION['token_nacimiento'] = time();
    //*TOKEN WEB*//
    //define duracion de la session
    //Tiempo de vida de la session
    $lifetime = constant("lifetime");
    $_SESSION['expire'] = $_SESSION['start'] + (60 * $lifetime);
    
} else {
    if ($errorMSG == "") {
        echo " Something went wrong : Login invalid ";
    } else {
        echo $errorMSG;
    }
}

