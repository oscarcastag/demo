$("#FormReInscripcion").validator().on("submit", function (event) {
    if (event.isDefaultPrevented()) {
        // handle the invalid form...
        formError();
        submitMSG(false, "Todos los campos son requeridos");
    } else {
        // everything looks good!
        event.preventDefault();
        submitForm();
    }
});

function submitForm() {
    $("#spinner-form").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    // Initiate Variables With Form Content
    var dataString = $('#FormReInscripcion').serialize();
    var r = confirm("Está seguro de reinscribir a este alumno?");
    if (r) {
        $.ajax({
            type: "POST",
            url: "dataConect/API.php",
            data: 'action=reinscription&' + dataString,
            success: function (text) {
                console.log(text);
                swalert('Mensaje!', text, 'info');
//                //Alumno reinscrito
                var n = text.includes("Alumno reinscrito");
                if (n) {
                    swalert('Mensaje!', 'Alumno reinscrito', 'success');
                    formSuccess();
                } else {
                    swalert('Mensaje!', text, 'info');
                }
            }
        });
    }
}

function formSuccess() {
    $("#FormReInscripcion")[0].reset();
    submitMSG(true, "Reinscripión exitosa!");
    location.href = "getAlumnos.php";
}

function formError() {
    $("#FormReInscripcion").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
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
    getPlanPago();
});

function getPlanPago() {
    $("#selePlan").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getPlanPago",
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control" id="idiplan" name="idiplan"">';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].idiplan + '">' + date[x].clave + ' > ' + date[x].descripcion + '</option>';
            }
            txt += "</select>";
            document.getElementById("selePlan").innerHTML = txt;
        }
    });
}