
v-qty = 0.
v-tot = 0.
FOR EACH orderline WHERE ordernum = int(v-ord) NO-LOCK:
    v-qty = 1 + v-qty.
    v-tot = ExtendedPrice  + v-tot.
END.
{&OUT} '
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />  
        <meta name="viewport" content="initial-scale=1,maximum-scale=1,minimum-scale=1 user-scalable=no,width = 320" /> 
		<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" /> 
		<meta name="apple-mobile-web-app-capable" content="yes" /> 
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		
		<title>La Roca Software SA de CV- Oscar Castañeda G</title>
		
		<link rel="stylesheet" href="assets/jqtouch/jqtouch.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="assets/css/main.css" type="text/css" media="screen" />
		
		<script type="text/javascript" src="assets/jqtouch/jquery.1.3.2.min.js"></script>
		<script type="text/javascript" src="assets/jqtouch/jqtouch.js"></script>
   		<script type="text/javascript" src="assets/js/global.js"></script>
	</head>
' skip.

