
$(document).ready(function () {
    getNivel();
});
function getNivel() {
    $("#divNivel").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getNivel",
        success: function (text) {
            //console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="NivelId" name="NivelId" required onchange="getcCarrerasbyId()">';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].NivelId + '">' + date[x].Descripcion + '</option>';
            }
            txt += "</select>";
            $("#divNivel").html(txt);
        }
    });
}

function getcCarrerasbyId() {
    var NivelId = $('#NivelId').val();
    $("#divCarrera").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getcCarrerasbyID2&NivelId=" + NivelId,
        success: function (text) {
            //console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="CarreraId" name="CarreraId" required >';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].idicarrera + '">' + date[x].nombre + '</option>';
            }
            txt += "</select>";
            $("#divCarrera").html(txt);
        }
    });
}


function getGradosByID() {
   
    var CarreraId = $('#CarreraId').val();
    $("#divGrado").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getGradosByID&idiCarrera=" + CarreraId,
        success: function (text) {
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="GradosId" name="GradosId" required">';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].GradosId + '">' + date[x].Descripcion + '</option>';
            }
            txt += "</select>";
            $("#divGrado").html(txt);
        }
    });
}



