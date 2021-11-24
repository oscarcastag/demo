<?php
class RockjsApi {
    public function __construct() {
        $method = $_SERVER['REQUEST_METHOD'];
        switch ($method) {
            case 'GET': //consulta
                //echo 'GET';
                if (empty($_GET['action'])) {
                    $this->testApi();
                }
                break;
            case 'POST': //inserta
                //echo 'POST';
                $action = $_POST['action'];
                if ($action == 'auth') {
                    $this->Auth();
                }
                break;
            case 'PUT': //actualiza
                //echo 'PUT';
                $action = $_POST['action'];
                break;
            case 'DELETE': //elimina
                //echo 'DELETE';
                $action = $_POST['action'];

                break;
            default: //metodo NO soportado
                echo 'METODO NO SOPORTADO';
                break;
        }
    }
     function uploadFile() {                                                                 
         $var = null;                                                                         
         $errorMSG = "";                                                                      
         $allowed = array('csv', 'zip');                                                      
         //archivo                                                                            
         if(isset($_FILES['archivo']) && $_FILES['archivo']['error'] == 0){                  
             $errorMSG .= "archivo is required ";                                             
         } else {                                                                            
             $archivo = $_FILES["archivo"]["tmp_name"];                                       
         }                                                                                    
                                                                                              
         if ($errorMSG == "") {                                                              
             $fileName = uniqid() . '.pdf';                                                   
             $archivo = $_FILES["archivo"]["tmp_name"];                                       
             $size = $_FILES["archivo"]["size"];                                              
             $tipo = $_FILES["archivo"]["type"];                                              
                                                                                              
             $fp = fopen($archivo, "rb");                                                     
             $contenido = fread($fp, $size);                                                  
             $contenido = addslashes($contenido);                                             
             fclose($fp);                                                                     
                                                                                              
         } else {                                                                            
             if ($errorMSG == "") {                                                          
                 echo "Something went wrong :(";                                              
                 $var = false;                                                                
             } else {                                                                        
                 echo $errorMSG;                                                              
                 $var = false;                                                                
             }                                                                                
         }                                                                                    
         //return $var;                                                                       
     }                                                                                        
          function testApi() {                                  
              $errorMSG = "";                                    
              if (empty($_GET['jwt'])) {                        
                  $errorMSG = "jwt is required ";                
              } else {                                          
                  $jwt = $_GET['jwt'];                           
              }                                                  
                                                                 
             if ($errorMSG == "") {                             
                // $auth = $this->validateWJT($jwt); //obtenemos el jwt y validam~ os si esta activo 
                 $auth = 1; 
                 if ($auth) {                      //true continua ejeución
                      include 'http://my-wordpress-site-mywordpresstest.192.168.99.100.nip.io/rockjs/RockjsPRO.php'; 
                      $mfg = new Rockjs();    
                      $this->response(200, "Ok", $mfg->lorem());
                  } else {                    //false token invalido 
                      $this->response(200, "Error", array("auth" => "The session ended"));
                  }
              } else {
                  $this->response(200, 'Error', $errorMSG);      
              }                                                  
          }                                                      
                                                                 
          function Auth() {                                     
              $errorMSG = '';                                    
                                                                 
             if (empty($_POST["usuario"])) {                    
                 $errorMSG = "usuario is required ";             
              } else {                                          
                  $user = $_POST["usuario"];                     
              }                                                  
              if (empty($_POST["Password"])) {                  
                  $errorMSG .= " Password is required ";         
              } else {                                          
                  $pass = $_POST["Password"];                    
              }                                                  
                                                                 
              if ($errorMSG == "") {                            
                  //include 'http://my-wordpress-site-mywordpresstest.192.168.99.~ 100.nip.io/rockjs/RockjsPRO.php';                        
                  // $mfg = new RockjsPRO();                           
                  // $this->response(200, 'Ok', $mfg->auth($user, $pass));
                 $this->response(200,'Ok', 'ok'); 
              } else {                                                
                  $this->response(200, 'Error', $errorMSG);            
              }                                                        
          }                                                            
                                                                       
          public function validateWJT($jwt) {                         
              //include 'http://my-wordpress-site-mywordpresstest.192.168.99.199.~ nip.io/rocjs/Auth0JWT.php';                                 
              //$jwtActive = new Auth0JWT();                             
              // return $jwtActive->validateJWT($jwt); 
              return "1";                   
          }                                                            
          function response($code = 200, $status = "", $message = "") {
              header('Content-Type: application/json');                 
              http_response_code($code);                                
              if (!empty($status) && !empty($message)) {               
                  $response = array("status" => $status, "message" => $message);
                  echo json_encode($response, JSON_PRETTY_PRINT);               
              }                                                                 
          }
 
}
?>
