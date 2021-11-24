$("#mailForm").validator().on("submit", function (event) {
    if (event.isDefaultPrevented()) {
        // handle the invalid form...
        formErrorMail();
        submitMSGMail(false, "Escriba el correo de destino");
    } else {
        // everything looks good!
        event.preventDefault();
        submitFormMail();
        //formSuccessMail();
    }
});


function submitFormMail() {
    // Initiate Variables With Form Content
    var dataString = $('#mailForm').serialize();
    console.log(dataString);

    $.ajax({
        type: "POST",
        url: "mailAttachFile.php",
        data: dataString,
        success: function (text) {
            $("#documento .close").click()
            console.log(text);
            if (text == "success") {
                swalert('Mensaje!', "Factura enviada!", 'info');
            } else {
                swalert('Mensaje!', text, 'info');
            }
        }
    });
}

function formSuccessMail() {
    //$("#mailForm")[0].reset();
    //submitMSGMail(true, "Factura enviada!")

}

function formErrorMail() {
    $("#mailForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
        $(this).removeClass();
    });
}

function submitMSGMail(valid, msg) {
    if (valid) {
        var msgClasses = "h3 text-center tada animated text-success";
    } else {
        var msgClasses = "h3 text-center text-danger";
    }
    $("#msgSubmitMail").removeClass().addClass(msgClasses).text(msg);
}
