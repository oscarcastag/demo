$("#editGroup").validator().on("submit", function (event) {
    if (event.isDefaultPrevented()) {
        // handle the invalid form...
        swalert('Mensaje!', 'Llene los campos requeridos', 'info');
    } else {
        // everything looks good!
        event.preventDefault();
        var dataString = $('#editGroup').serialize();
        swalert('Mensaje!', 'Procesando...', 'info');
        $("#editaGrupo .close").click();
        $.ajax({
            type: "POST",
            url: "dataConect/API.php",
            data: "action=updateGrupoEscolar&" + dataString,
            success: function (text) {
                console.log(text);
                var request = String(text);
                var str = request;
                var n = str.includes("success");
                if (n) {
                    swalert('Mensaje!', 'El horario se guardó correctamente', 'success');
                    //getHorarioEscolarByGrupoId();
                } else {
                    swalert('Mensaje!', str, 'info');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                swalert('Mensaje!', 'Exito', 'success');
                location.reload();
                console.log(textStatus);
                console.log(errorThrown);
            }
        });
    }
});


$(document).ready(function () {
    nivel();
    getNiveles();
    getCiclo();
    getcAulas();
    seleTurno();
    divTurno();
    cliclo();
});

$(document).on("click", ".fill", function () {
    var clave, descripcion = "";
    var grado = $("#GradosId option:selected").text();
    var carrara = $("#CarreraId option:selected").text();
    var str = $("#CicloId option:selected").text();
    var turno = $("#TurnoId option:selected").text();
    var ciclo = str.substring(2, 6);
    descripcion = grado + '°  ' + carrara + ' ' + turno + ' ' + ciclo;
    $('#Descripcion').val(descripcion);
});

function cliclo() {
    $("#divCiclo").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getCiclo",
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="ciclo" name="ciclo" required>';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].idiciclo + '">' + date[x].ciclo + '</option>';
            }
            txt += "</select>";
            $("#divCiclo").html(txt);
        }
    });
}

function getCiclo() {
    $("#seleCiclo").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getCiclo",
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="CicloId" name="CicloId" required>';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].idiciclo + '">' + date[x].ciclo + '</option>';
            }
            txt += "</select>";
            $("#seleCiclo").html(txt);
        }
    });
}
function getNiveles() {
    $("#seleNivel2").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getNivel",
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="idinivel" name="idinivel" onchange="getcCarrerasbyID()" required>';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].NivelId + '">' + date[x].Descripcion + '</option>';
            }
            txt += "</select>";
            $("#seleNivel2").html(txt);
        }
    });
}

function getcCarrerasbyID() {
    var NivelId = $('#idinivel').val();
    $("#seleCarrera2").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getcCarrerasbyID&NivelId=" + NivelId,
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="CarreraId" name="CarreraId" required onchange="getcGradosById()">';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].CarreraId + '">' + date[x].Descripcion + '</option>';
            }
            txt += "</select>";
            $("#seleCarrera2").html(txt);
        }
    });
}

function getcGradosById() {
    var CarreraId = $('#CarreraId').val();
    $("#seleGrado2").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getcGradosById&CarreraId=" + CarreraId,
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="GradosId" name="GradosId" required>';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].GradosId + '" > ' + date[x].Descripcion + '</option>';
            }
            txt += "</select>";
            $("#seleGrado2").html(txt);
        }
    });
}

function getcAulas() {
    $("#seleAulas2").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getcAulas",
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="AulaId" name="AulaId" required>';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].AulaId + '">' + date[x].Descripcion + '</option>';
            }
            txt += "</select>";
            $("#seleAulas2").html(txt);
        }
    });
}

function seleTurno() {
    $("#seleTurno").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getTurno",
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="TurnoId" name="TurnoId">';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].TurnoId + '"><i class="text-info">' + date[x].Descripcion + '</i></option>';
            }
            txt += "</select>";
            $("#seleTurno").html(txt);
        }
    });
}

function divTurno() {
    $("#divTurno").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getTurno",
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="myturno" name="myturno">';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].TurnoId + '">' + date[x].Descripcion + '</option>';
            }
            txt += "</select>";
            $("#divTurno").html(txt);
        }
    });
}

function nivel() {
    $("#divNivel").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getNivel",
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="nivel" name="nivel" onchange="FindCarrerasbyID()" required>';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].NivelId + '">' + date[x].Descripcion + '</option>';
            }
            txt += "</select>";
            $("#divNivel").html(txt);
        }
    });
}
function FindCarrerasbyID() {
    var NivelId = $('#nivel').val();
    $("#divCarrera").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getcCarrerasbyID&NivelId=" + NivelId,
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="carrera" name="carrera" required >';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].CarreraId + '">' + date[x].Descripcion + '</option>';
            }
            txt += "</select>";
            $("#divCarrera").html(txt);
        }
    });
}
/**
 * Funciones para aregar estudiantes a los grupos 
 */

