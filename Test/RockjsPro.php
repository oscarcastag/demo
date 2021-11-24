<?php
$host = "http://my-wordpress-site-mywordpresstest.192.168.99.100.nip.io/rockjs";
require_once $host.'/rockjs/openrockjs.php';
 
class RockjsPro {
 
    public function __construct() {
 
    }
 
    public function auth($user, $pass) {
        $rockjs = new RockJS(); //objRockjs
        $var = '';              //data to return
        if ($rockjs->_openrockjs("cxclogin") == false) { //error
            $var = 'Something went wrong please try again';
            return $var;
        } else {
            include $host.'/Auth0JWT.php';
            $objJWT = new Auth0JWT();
             header('Content-Type: text/html; charset=utf-8');             
            $request = $rockjs->setResult; //cath data 
            $Array = json_decode($request);
            $jwt = array("JWT" => $objJWT->getJWT($user, $pass));
            array_push($Array, $jwt);
            return $Array;                //return data
        }
    }
 

}
?>
