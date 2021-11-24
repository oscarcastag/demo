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
    var txt;
    var r = confirm("Está seguro de inscribir a este alumno?");
    if (r) {
        $("#spinner-form").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
        //swalert('Exito', dataString, 'success');
        $.ajax({
            type: "POST",
            url: "dataConect/API.php",
            data: "action=addAlumno&" + dataString,
            success: function (text) {
                console.log(text);
                var idialumno = text.data[0].idialumno;
                if (isNaN(idialumno)) {
                    formError();
                    submitMSG(false, text);
                } else {
                    formSuccess(idialumno);
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);
                $("#spinner-form").html(jqXHR + " " + textStatus + " " + errorThrown);
            }
        });
    } else {
        txt = "You pressed Cancel!";
    }
    //alert(txt);
}

function formSuccess(idialumno) {
    $("#FormInscrpcion")[0].reset();
    ConsultaSolpesJson();//recargamos la tabla datos generales
    document.getElementById('results').innerHTML = 'La imagen capturada aparecerá aquí ... <br> Recuerde habilitar el permiso para usar la Camara';
    submitMSG(true, "");
    //location.href = "credencialEstudiante.php?idialumno=" + idialumno;
    window.open("credencialEstudiante.php?idialumno=" + idialumno, '_blank');
    $("#spinner-form").html('');
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