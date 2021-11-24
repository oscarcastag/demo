    $("#datosGenerales").validator().on("submit", function (event) {
        if (event.isDefaultPrevented()) {
            // handle the invalid form...
            formError();
            submitMSG(false, "Llene los campos obligatorios");
        } else {
            // everything looks good!
            event.preventDefault();
            submitFormUpdateAlumno();
        }
    });

    function submitFormUpdateAlumno() {
        var dataString = $('#datosGenerales').serialize();
        //alert('data '+dataString);
        swalert('Exito', dataString, 'success');


        $.ajax({
            type: "POST",
            url: "dataConect/API.php",
            data: "action=putGenerales&" + dataString,
            success: function (text) {
                console.log(text);
                swalert('Mensaje!', text, 'info');
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);
                //alert("No fue posible conectar con el servidor");
                //submitMSG(false, "No fue posible conectar con el servidor");
            }
        });
    }
