$("#contactForm").validator().on("submit", function (event) {
    if (event.isDefaultPrevented()) {
        // handle the invalid form...
        formError();
        submitMSG(false, "Llene los campos requeridos");
    } else {
        // everything looks good!
        event.preventDefault();
        submitForm();
    }
});


function submitForm() {
    // Initiate Variables With Form Content
    var dataString = $('#contactForm').serialize();
    //alert('data '+dataString);
    $.ajax({
        type: "POST",
        url: "dataConect/API.php",
        data: "action=profesor&" + dataString,
        //data: dataString,
        success: function (text) {
            if (text == "success") {
                formSuccess();
                swalert('Exito!', "Profesor Agregado", 'success');
            } else {
                formError();
                submitMSG(false, text);
                swalert('Exito!', text, 'success');
            }
        }
    });
}

function formSuccess() {
    $("#contactForm")[0].reset();
    location.href = "getProfesores.php";
    //submitMSG(true, "Message Submitted!")
}

function formError() {
    $("#contactForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
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