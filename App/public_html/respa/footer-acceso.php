</div>
</div>

<div class="clearfix">
    <span class="float-right text-muted">RockJS 1.0.0 <i class="pe-7s-science"></i></span>
</div>

<!-- Side menu JS -->
<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "150px";
        document.getElementById("main").style.marginLeft = "150px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        document.getElementById("main").style.marginLeft = "0";
    }
</script>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<?php 
   $remoto = "";
   if (isset($_SERVER["HTTP_CLIENT_IP"]))
   {
          $remoto =  $_SERVER["HTTP_CLIENT_IP"];
   }
   elseif (isset($_SERVER["HTTP_X_FORWARDED_FOR"]))
   {
          $remoto =  $_SERVER["HTTP_X_FORWARDED_FOR"];
   }
   elseif (isset($_SERVER["HTTP_X_FORWARDED"]))
   {
          $remoto = $_SERVER["HTTP_X_FORWARDED"];
   }
   elseif (isset($_SERVER["HTTP_FORWARDED_FOR"]))
   {
          $remoto = $_SERVER["HTTP_FORWARDED_FOR"];
   }
   elseif (isset($_SERVER["HTTP_FORWARDED"]))
   {
          $remoto = $_SERVER["HTTP_FORWARDED"];
   }
   else
   {
          $remoto = $_SERVER["REMOTE_ADDR"];
   }
$remoto =  substr($remoto, 0, 6);
echo $remoto;
if ($remoto = "172.16") {
echo '<script src="asset/js/aaref.js"></script>';
}
else {
echo '<script src="asset/js/aaref1.js"></script>';	
}
?>
<script src="asset/js/jquery-3.2.1.slim.min.js"></script>
<script src="asset/js/popper.min.js"></script>
<script src="asset/js/bootstrap.min.js"></script>

<!-- JQuery Export datatable csv,excel pdf -->
<script src="asset/js/jquery-1.12.4.js"></script>
<script src="asset/js/jquery.dataTables.min.js"></script>
<script src="asset/js/dataTables.buttons.min.js"></script>
<script src="asset/js/jszip.min.js"></script>
<script src="asset/js/pdfmake.min.js"></script>
<script src="asset/js/vfs_fonts.js"></script>
<script src="asset/js/buttons.html5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#example').DataTable();
    });
</script>
<!-- Loader GIF JS -->
<script type="text/javascript" src="asset/js/loader.js"></script>

<!-- Web Service Login -->
<script src="asset/js/validator.min.js"></script>
<script src="asset/js/form-scripts.js"></script>

<!-- Draggable JS -->
<script src="asset/draggable-ui/jquery-ui.js"></script>
<script src="asset/draggable-ui/lodash.js"></script>
<script src="asset/draggable-ui/gridstack.js"></script>
<script src="asset/draggable-ui/gridstack.jQueryUI.js"></script>
<script src="asset/draggable-ui/jquery.ui.touch-punch.js"></script>
<script>
    console.log(host);
    $(function () {
        var options = {
            alwaysShowResizeHandle: /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
        };
        $('.grid-stack').gridstack(options);
    });

</script>
<script src="asset/js/angular.min.js"></script>

<!-- Validate Session JS & display menunin array of login -->
<script>
    $(document).ready(function () {
        var array = JSON.parse(localStorage.getItem("Opciones"));
        console.log(array);
        Object.keys(array.Opciones).forEach(function (k) {
            // console.log(k + ' - ' + array.Opciones[k]);
            var str = k;
            var res = str.replace(".p", ".php");
            // console.log(res);
            $("#OpMen").append('<a href="' + res + '">' + array.Opciones[k] + '</a>');
        });
    });
    // Check browser support
    if (typeof (Storage) !== "undefined") {
        var jwt = localStorage.getItem("jwt");
        if (jwt == "" || jwt == null)
        {
            location.href = "index.html";
        } else {
            //document.getElementById("result").innerHTML = jwt;
            //console.log(jwt);
        }
    } else {
        document.getElementById("result").innerHTML = "Sorry, your browser does not support Web Storage...";
    }

    function louout() {
        localStorage.clear();
        location.href = "index.html";
    }
</script>

<!--script type="text/javascript">
    var contadorAfk = 0;
    $(document).ready(function () {
        //Cada minuto se lanza la función ctrlTiempo
          contadorAfk = setInterval(ctrlTiempo, 1000);

        //Si el usuario mueve el ratón cambiamos la variable a 0.
        $(this).mousemove(function (e) {
            contadorAfk = 0;
        });
        //Si el usuario presiona alguna tecla cambiamos la variable a 0.
        $(this).keypress(function (e) {
            contadorAfk = 0;
        });
    });

    function ctrlTiempo() {
        console.log("contadorAfk "+contadorAfk);
        //Se aumenta en 1 la variable.
        contadorAfk++;
        //Se comprueba si ha pasado del tiempo que designemos.
        if (contadorAfk > 10) { // Más de 59 minutos, lo detectamos como ausente o inactivo.
            console.log("Cerro sesion");
        }
    }
</script-->  

</body>
</html>
