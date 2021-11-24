<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
 $name= test_input($_POST["name"]);
 $mail= test_input($_POST["email"]);
 $subject= test_input($_POST["subject"]);
 $sms= test_input($_POST["message"]);
}

 if (isset($name,$mail, $sms)) {
		$to = "bernita.gutierrez@gmail.com, focusonservicess@gmail.com, development@focusonservices.com, rosendo.navarro@focusonservices.com";
		$subject = $_POST["subject"];

		$message = "
		<html>
		<head>
		<title>Este mensaje proviene de la pagina www.focusonservices.com</title>
		</head>
		<body>
		<p>Este mensaje proviene de la pagina focusonservices.com</p>
		<p>Un cliente se ha puesto en contacto</p>
		<table>
		<tr>
		<th>".$name."</th>
		</tr>
		<tr>
		<td>".$mail."</td>
		</tr>
		</table>
		<p>".$sms."</p>
		</body>
		</html>
		";
		// Always set content-type when sending HTML email
		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

		// More headers
		$headers .= 'From: <focusonservices.com>' . "\r\n";

		mail($to,$subject,$message,$headers);

		
		
 }else{
	 echo "Variables NO definidas!!!";
	 header('Location: http://www.focusonservices.com/');
 }
 
  function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>

<!DOCTYPE html>
<html>
<title>Gracias!</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="icon" href="../img/favicon.ico" type="image/x-icon"/>
<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon"/>
<style>
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
.bgimg {
    background-image: url('forestbridge.jpg');
    min-height: 100%;
    background-position: center;
    background-size: cover;
}
</style>
<body>

<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  <div class="w3-display-topleft w3-padding-large w3-xlarge">
    <a href="http://www.focusonservices.com" title="back"><img src="../img/logo.png" class="img-responsive" alt="Focus On Services | Servicios de TI en México y América Latina. Soporte Técnico, Data Center, Soluciones Empresariales en Tecnología" /></a>
  </div>
  <div class="w3-display-middle">
    <h1 class="w3-jumbo w3-animate-top">Gracias, hemos recibido su mensaje.</h1>
    <hr class="w3-border-grey" style="margin:auto;width:40%">
    <p class="w3-large w3-center">En breve nos pondremos en contacto.</p>
  </div>
</div>

</body>
</html>
