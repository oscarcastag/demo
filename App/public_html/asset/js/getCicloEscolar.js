$(document).ready(function () {
    getCicloEscolar();
});
function getCicloEscolar() {
    $("#divCiclo").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getCiclo",
        success: function (text) {
            console.log(text);
            console.log(text.data);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control" id="generacion" name="generacion" required>';
            txt += '<option value="">Seleccione una opción</option>';
            for (x in date) {
                txt += '<option value="' + date[x].abrev + '"><i class="text-info">' + date[x].ciclo + '</option>';
            }
            txt += "</select>";
            document.getElementById("divCiclo").innerHTML = txt;
            $('#generacion').on('change', function () {
                getFechaLimiteInscripcionByAbrebv(this.value);
            });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            //alert("No fue posible conectar con el servidor");
            document.getElementById("divCiclo").innerHTML = errorThrown;
        }
    });
}

function getFechaLimiteInscripcionByAbrebv(abrev) {
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getCicloByAbrev&abrev=" + abrev,
        success: function (text) {
            console.log(text);
            var limite_inscipcion = text.data[0].limite_inscipcion;
            var termino = text.data[0].termino;
            $('#vigencia').val(termino);
            $('#termino').val(limite_inscipcion);
            $('#periodo').val(text.data[0].ciclo);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            //alert("No fue posible conectar con el servidor");
            //document.getElementById("divCiclo").innerHTML = errorThrown;
        }
    });
}
