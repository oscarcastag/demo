<?php
session_start();
unset($_SESSION["usuario"]);
session_destroy();
echo " You are not logged in ";
exit;
?>