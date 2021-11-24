<?php

/**
 * Description of Auth0JWT
 * clase que genera y valida JWT mediante firebase
 * @author Ing. Bernabe Gutierrez Rodriguez
 */
use \Firebase\JWT\JWT;
use \Firebase\JWT\BeforeValidException;
use \Firebase\JWT\ExpiredException;

class Auth0JWT {

    /**
     * genera un JWT con validez de 5 min
     * @param type $user
     * @param type $pass
     * @return type
     */
    function getJWT($user, $pass) {
        include __DIR__ . './jwt/JWT.php';  //libreria jwt
        $myJWT = '';                        //Variable de retorno 
        $now = time();                      //tiempo de inicio
        $expire = $now + (60 * 120);          //expire inicio + 5 min
        $key = "example_key";               //key
        $token = array(//array
            "id" => uniqid(), //id inique
            "sub" => "1234567890", //
            "company" => "Focus On Services",
            "name" => $user,
            "iat" => $now, //inicio
            "nbf" => $now, //disponible apartir de
            "exp" => $expire                //tiempo de vida del JWT
        );

        $myJWT = JWT::encode($token, $key); //contruct JTW
        return $myJWT;                      //return JWT
    }

    /**
     * valida JWT y retorna boolean
     * @param type $jwt
     * @return boolean
     */
    public function validateJWT($jwt) {
        include __DIR__ . './jwt/JWT.php'; //libreria JWT
        include __DIR__ . './jwt/BeforeValidException.php'; //libreria JWT
        include __DIR__ . './jwt/ExpiredException.php'; //libreria JWT
        $validate = false;                  //data de retorno
        $key = "example_key";               //key

        try {
            $decoded = json_encode(JWT::decode($jwt, $key, array('HS256'))); // decode JWT
            $obj = json_decode($decoded, true); //Parse in JSON

            $inicio = time();              //este momento
            $fin = $obj['exp'];            //tiempo de expiración//

            if ($inicio > $fin) {               //diferencia de tiempo
                //echo " You are not logged in ";
            } else {
                //echo " welcome ";
                $validate = true;           //token valido
            }
        } catch (\Firebase\JWT\ExpiredException $e) {
            //echo 'Caught exception: ', $e->getMessage(), "\n";
            $validate = false;              //token invalido
        }
        return $validate;                  //return flag      
    }

}



