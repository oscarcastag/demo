$("#formaDocumentos").validator().on("submit", function (event) {
    if (event.isDefaultPrevented()) {
        // handle the invalid form...
        FormaTutoresError();
        submiuTut(false, "Llene los campos Requeridos");
    } else {
        // everything looks good!
        event.preventDefault();
        submitFormTutores();
    }
});

$("#FormaTutores").validator().on("submit", function (event) {
    if (event.isDefaultPrevented()) {
        // handle the invalid form...
        FormaTutoresError();
        submiuTut(false, "Llene los campos Requeridos");
    } else {
        // everything looks good!
        event.preventDefault();
        submitFormTutores();
    }
});

function submitFormTutores() {
    var dataString = $('#FormaTutores').serialize();
    //alert('data '+dataString);
    //swalert('Exito', dataString, 'success');
    var idialumno = $("#idialumno").val();
    $.ajax({
        type: "POST",
        url: "dataConect/API.php",
        data: "idialumno=" + idialumno + "&action=setTutor&" + dataString,
        success: function (text) {
            console.log(text);
            var success = text.includes("success");
            if (success) {
                swalert('!Exito¡', 'Registro guardado correctamente', 'success');
                formSuccess();
            } else {
                var KeyDuplicate = text.includes("Duplicate entry");
                if (KeyDuplicate) {
                    swalert('Error', 'La Matricula está duplicada', 'error');
                } else {
                    FormaTutoresError();
                    submiuTut(false, text);
                }
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            alert("No fue posible conectar con el servidor");
            submiuTut(false, "No fue posible conectar con el servidor");
        }
    });
}

function formSuccess() {
    $("#FormaTutores")[0].reset();
    submiuTut(true, "");
}

function FormaTutoresError() {
    $("#FormaTutores").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
        $(this).removeClass();
    });
}
function submiuTut(valid, msg) {
    if (valid) {
        var msgClasses = "h3 text-center tada animated text-success";
    } else {
        var msgClasses = "h3 text-center text-danger";
    }
    $("#msgTS").removeClass().addClass(msgClasses).text(msg);
}