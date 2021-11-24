$("#documentos").validator().on("submit", function (event) {
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
    var dataString = $('#documentos').serialize();
    //alert('data '+dataString);
    var idialumno = $("#idialumno").val();
    //swalert(dataString);
    $.ajax({
        type: "POST",
        url: "dataConect/API.php",
        data: "idialumno=" + idialumno + "&action=addDocumentos&" + dataString,
        success: function (text) {
            console.log(text);
            if (text == "success") {
               swalert('Exito¡', 'Registro actualizado correctamente', 'success');
               //formSuccess();
            } else {
                var KeyDuplicate = text.includes("Duplicate entry");
                if (KeyDuplicate) {
                    swalert('Error', 'El CURP o RFC Están Duplicados', 'error');
                } else {
                    formError();
                    submitMSG(false, text);
                }
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            alert("No fue posible conectar con el servidor");
            submitMSG(false, "No fue posible conectar con el servidor");
        }
    });
}

function formSuccess() {
    $("#documentos")[0].reset();
    submitMSG(true, "");
    location.href = "getAlumnos.php";
}

function formError() {
    $("#documentos").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
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