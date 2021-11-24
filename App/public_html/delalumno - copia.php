<?php include 'headers.php'; ?>
<div class="card">
    <div class="card-header bg-fos text-light">Catálogo de Proveedores</div>
</div>


<style type="text/css">
    #signArea{
        width:304px;
        margin: 50px auto;
    }
    .sign-container {
        width: 60%;
        margin: auto;
    }
    .sign-preview {
        width: 150px;
        height: 50px;
        border: solid 1px #CFCFCF;
        margin: 10px 5px;
    }
    .tag-ingo {
        font-family: cursive;
        font-size: 12px;
        text-align: left;
        font-style: oblique;
    }
</style>
<div class="card">
    <div class="card-body">
        <form role="form" id="FormInscrpcion" data-toggle="validator" class="shake" autocomplete="off">
            <div class="d-flex">
                <div class="p-2 mr-auto">
                    <div class="page-header-title">
                        <i class="pe-7s-study bg-c-pink"></i>
                        <div class="d-inline">
                            <h4>Eliminar Proveedores</h4>
                            <span></span><br>
                            <span><a href="addalumno.php"><p class="pe-7s-back-2"></p> Regresar</a></span>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="card card-border-success">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-4">
                                    <label for="proveedor">Proveedor</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="Proveedor" name="Proveedor" placeholder="Ingrese Proveedor" required maxlength="10" >
                                    </div>
                                </div>                                            
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="nombre">Nombre</label>
                                        <input type="text" readonly="true" class="form-control" id="Nombre" name="Nombre" placeholder="Ingrese Nombre" required maxlength="75">
                                        <div class="help-block with-errors text-danger"></div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label for="apellido_materno">Estatus</label>
                                        <input type="text" readonly="true" class="form-control" id="Estatus" name="Estatus" placeholder="Ingrese Estatus" maxlength="140">
                                        <div class="help-block with-errors text-danger"></div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div id="spinner-form"></div>
            <button type="submit" id="form-submit" class="btn btn-success btn-lg pull-right ">Guardar datos</button>
            <div id="msgSubmit" class="h3 text-center hidden"></div>
            <div class="clearfix"></div>
        </form>
    </div>
</div>




<!-- The Modal -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Seleccione un aspirante</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div id="Solpes"></div>
            </div>
        </div>
    </div>
</div>

<!-- The Modal -->
<div class="modal fade" id="alumno">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Seleccione Un alumno de la lista</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div id="TablaAlumnos"></div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
<?php include './footer.php'; ?>

<script>
$("#FormInscrpcion").validator().on("submit", function (event) {
	if (event.isDefaultPrevented()) {
		// handle the invalid form...
		formError();
		submitMSG(false, "Llene los campos obligatorios");
	} else {
		// everything looks good!
		event.preventDefault();
		submitForm();
	}
});
function submitForm() {
        var dataString = $('#FormInscrpcion').serialize();
    	var jwt = localStorage.getItem("jwt");
		var myUSer = localStorage.getItem("userLog");
		console.log (dataString);
		console.log(host + "/Test/moditest.php" + "action=altatest&jwt=" + jwt + "&" + dataString);
    $.ajax({
		type: "POST",
		url: host + "/Test/bajatest.php",
		data: "action=bajatest&jwt=" + jwt + "&" + dataString,
		success: function (text) {
			console.log(text);
			text = JSON.parse(text);
			if (text.resultado == "success") {
				//localStorage.setItem("jwt", text.message[2].JWT);
				//formSuccess();
				submitMSG(false, text.mensaje);
			} else {
				formError();
				submitMSG(false, text.mensaje);
			}
		},
		error: function (jqXHR, textStatus, errorThrown) {
			submitMSG(false, "No fue posible conectar con el servidor");
		}
	});
    getAlumnos();
}
function formSuccess() {
	$("#FormInscrpcion")[0].reset();
	submitMSG(true, "Bienvenido!");
	location.href = "addalumno.php";
}

function formError() {
    $("#FormInscrpcion").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
        $(this).removeClass();
    });
}

function submitMSG(valid, msg) {
    if (valid) {
        var msgClasses = "h3 text-center tada animated text-success";
    } else {
        var msgClasses = "h3 text-center text-danger";
    }
    $("#msgSubmit").removeClass().addClass(msgClasses).text(msg);
}

$(document).ready(function () {
var Proveedor = <?php echo '"'.$idi = $_GET['Proveedor'].'"' ?>;
var Nombre    = <?php echo '"'.$idi = $_GET['Nombre'].'"' ?>;
console.log(Proveedor + Nombre);
$("#Proveedor").val(Proveedor);
$("#Nombre").val(Nombre);

});


</script>