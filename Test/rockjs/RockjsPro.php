<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Rockjs
 *
 * @author Ing. Bernabe Gutierrez Rodriguez
 */
require_once './openrockjs.php';

class RockjsPro {

    public function __construct() {
        
    }

    public function auth($user, $pass) {
        $rockjs = new RockJS(); //objRockjs
        $var = '';              //data to return
            include './Auth0JWT.php';
            $objJWT = new Auth0JWT();
            //header('Content-Type: application/json');
            $jwt = array("JWT" => $objJWT->getJWT($user, $pass));
			return $jwt;
    }        

    /**
     * lorem function Test
     * @return string
     */
    public function lorem() {
        $rockjs = new RockJS(); //objRockjs
        $var = '';              //data to return
        if ($rockjs->_openrockjs("users") == false) { //error
            $var = 'Something went wrong please try again';
            return $var;
        } else {
            header('Content-Type: application/json');
            $request = $rockjs->setResult; //cath data 

            $Array = json_decode($request); //parse json

            $users = array(
                'data' => $Array
            );
            $var = json_encode($users, JSON_PRETTY_PRINT);
            return $Array;                //return data
        }
    }


}
