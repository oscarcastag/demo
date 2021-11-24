<?php

session_start();

if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    //disposicion de las variables de session iniciadas en auth.php
    echo $usuario = $_SESSION["usuario"];
    $id = $_SESSION["id_user"];
    $menu = $_SESSION["menu"];

    //*TOKEN WEB*//
    $token = $_SESSION['token'];
    $token_nacimiento = $_SESSION['token_nacimiento'];
    //*TOKEN WEB*//
} else {
    echo " You are not logged in ";
    exit;
}

$now = time();
//si el tiempo de la session se ha excedido termina
if ($now > $_SESSION['expire']) {
    session_destroy();
    echo " You are not logged in ";
    exit;
}
?>