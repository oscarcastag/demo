$("#EditForm").validator().on("submit", function (event) {
    if (event.isDefaultPrevented()) {
        // handle the invalid form...
        formErrorX();
        submitMSGX(false, "Complete los campos requeridos");
    } else {
        // everything looks good!
        event.preventDefault();
        submitFormX();
    }
});


function submitFormX() {
    $('#modalEditarCargo').click();
    var dataString = $('#EditForm').serialize();
    //swalert(dataString);
    console.log(dataString);
    //formSuccess();
    $.ajax({
        type: "POST",
        url: "dataConect/pagos.php",
        data: "action=uptadePriceRecargoVAS&" + dataString,
        success: function (text) {
            swalert('Mensaje!', text, 'info');
            var matricula = $("#matricula").val();
            buscaAlumno(matricula);
            getPartidasPendientesByIdiAlumno(idialumno);
            getSubTotalOfServiciosByAlumno(idialumno);
        }
    });
}

//$("#recargo").change(function (e) {
//    var recargo = $("#recargo").val();
//    var total = $("#total").val();
//    var nuevoTotal = (parseInt(total) - parseInt(recargo));
//    $("#total").val(nuevoTotal);
//});

function formSuccess() {
    $("#EditForm")[0].reset();
    submitMSGX(true, "Message Submitted!")
}

function formErrorX() {
    $("#EditForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
        $(this).removeClass();
    });
}

function submitMSGX(valid, msg) {
    if (valid) {
        var msgClasses = "h3 text-center tada animated text-success";
    } else {
        var msgClasses = "h3 text-center text-danger";
    }
    $("#msgSubmit").removeClass().addClass(msgClasses).text(msg);
}
