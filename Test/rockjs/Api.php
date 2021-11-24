<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of RockjsApi
 *
 * @author Ing. Bernabe Gutierrez Rodriguez
 */
class Api {

    public function __construct() {
        $method = $_SERVER['REQUEST_METHOD'];
        switch ($method) {
            case 'GET'://consulta
                if (empty($_GET['action'])) {
                    $this->testApi();
                }
                break;
            case 'POST'://inserta
                echo 'POST';			
                break;
            case 'PUT'://actualiza
                echo 'PUT';
                break;
            case 'DELETE'://elimina
                echo 'DELETE';
                break;
            default://metodo NO soportado
                echo 'METODO NO SOPORTADO';
                break;
        }
    }

    function testApi() {
		
        $errorMSG = "";
		$pass = "test";
		$user = "test";

		$jwt = $this->Auth($user, $pass);
		
		
        if ($errorMSG == "") {
                $this->response(200, "Ok", $jwt);
            }
         else {
            $this->response(200, 'Error', $errorMSG);
        }
    }


    function Auth($user = "", $pass = "") {
        $errorMSG = '';
        if ($errorMSG == "") {
            include './Pro.php';
            $mfg = new Pro();
            $this->response(200, 'Ok', $mfg->auth($user, $pass));
        } else {
            $this->response(200, 'Error', $errorMSG);
        }
    }

    /**
     * Valida JWT invoca Auth0JWT
     * Retorna Boleano
     * True = JWT valido
     * False = JWT expiro
     * @param type $jwt
     * @return type
     */
    public function validateWJT($jwt) {
        include './rockjs/Auth0JWT.php';

        $jwtActive = new Auth0JWT();

        return $jwtActive->validateJWT($jwt);
    }

    /**
     * Respuesta al cliente
     * @param type $code
     * @param type $status
     * @param type $message
     * @param type $jwt
     */
    function response($code = 200, $status = "", $message = "") {
        //header('Content-Type: application/json');
        http_response_code($code);
        if (!empty($status) && !empty($message)) {
            $response = array("status" => $status, "message" => $message);
            echo json_encode($response, JSON_PRETTY_PRINT);
        }
    }

}
