$("#regForm").validator().on("submit", function (event) {
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
    var dataString = $('#regForm').serialize();
    var folio = $("#folio").val();
    var matricula = $("#matricula").val();
    var idiventa = $("#idiventa").val();
    //alert('data ' + dataString);
    $.ajax({
        type: "POST",
        url: "dataConect/pagos.php",
        data: "action=setPago&" + dataString,
        success: function (text) {
            console.log(text);
            var success = text.includes("Cobro agregado correctamente");
            if (success) {
                swalert('Exito!', text, 'success');
                formSuccess();
                window.open('ticket.php?folio=' + folio + '&matricula=' + matricula + '&idiventa=' + idiventa, '_blank');
            } else {
                swalert('Error', text, 'error');
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            //alert("No fue posible conectar con el servidor");
            submitMSG(false, "No fue posible conectar con el servidor");
        }
    });

}

function formSuccess() {
    $("#regForm")[0].reset();
    //submitMSG(true, "Message Submitted!")
    location.href = "cobro.php";
}

function formError() {
    $("#regForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
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