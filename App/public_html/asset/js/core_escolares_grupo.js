$("#addNewGrupo").validator().on("submit", function (event) {
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
    // Initiate Variables With Form Content
    var dataString = $('#addNewGrupo').serialize();
    $.ajax({
        type: "POST",
        url: "dataConect/API.php",
        data: "action=addGrupoEscolar&" + dataString,
        success: function (text) {
            if (text == "success") {
                formSuccess(text);
            } else {
                formError();
                submitMSG(false, text);
            }
        }
    });
}

function formSuccess(text) {
    submitMSG(true, 'Grupo agregado')
    $('#Clave').val('');
    $('#Descripcion').val('');
}

function formError() {
    $("#addNewGrupo").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
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
    sumarb();
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
            txt += '<select class="form-control fill" id="myturno" name="myturno" onchange="sumarb()">';
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

function sumarb() {
    var carrera = $("#carrera").val();
    var ciclo = $("#ciclo").val();
    var turno = $("#myturno").val();
    console.log(turno);
    $("#tableCalendario").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        "url": "dataConect/API.php",
        data: "action=getGrupos&idicarrera=" + carrera + "&CicloId=" + ciclo + "&TurnoId=" + turno,
        success: function (text) {
            var date = text.data;
            var txt = "";
            console.log(date);
            txt += '<div class="table-responsive"> <table id="tbxd09" class="table table-striped table-bordered table-hover table-sm dt-responsive nowrap table-sm table-xs">';
            txt += '<thead class="table-primary text-light"> <tr><th>#</th><th>Grado</th><th>Alumnos</th><th>Grupo</th><th>Turno</th><th>Ciclo</th><th>Aula</th><th>Editar</th><th>Estatus</th><th>Clave</th></tr> </thead>';
            for (x in date) {
                var a = parseInt(x);
                txt += '<tr>';
                txt += "<td>" + (a + 1) + "</td>";
                txt += "<td>" + date[x].Grado + "°</td>";
                txt += "<td>" + date[x].aforo + ' <a href="core_escolares_getbAlumnoGrupo.php?GrupoId=' + date[x].GrupoId + '" data-toggle="tooltip" title="Ver Grupo"><i class="pe-7s-notebook pe-2x pe-va text-primary"></a></td>';
                txt += "<td>" + date[x].Grupo + "</td>";
                txt += "<td>" + date[x].Turno + "</td>";
                txt += "<td>" + date[x].Ciclo + "</td>";
                txt += "<td>" + date[x].Aula + "</td>";
                txt += "<td>" + ' <a data-toggle="modal" data-target="#editaGrupo" onclick="fillData(' + date[x].GrupoId + ');"><i class="pe-7s-note pe-2x pe-va" title="Editar"></i></a></td>';
                txt += "<td>" + date[x].Estatus + "</td>";
                txt += "<td>" + date[x].Clave + "</td>";
                txt += "</tr>";
            }
            txt += "</table> </div>"
            document.getElementById("tableCalendario").innerHTML = txt;
            var table = $('#tbxd09').DataTable({
                responsive: true,
                dom: 'Bfrtip',
                buttons: ['excel'],
                language: {
                    "decimal": "",
                    "emptyTable": "No hay información",
                    "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                    "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                    "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                    "infoPostFix": "",
                    "thousands": ",",
                    "lengthMenu": "Mostrar _MENU_ Entradas",
                    "loadingRecords": "Cargando...",
                    "processing": "Procesando...",
                    "search": "Buscar:",
                    "zeroRecords": "Sin resultados encontrados",
                    "paginate": {
                        "first": "Primero",
                        "last": "Ultimo",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    }
                }
            });

            $('#tbxd09 tbody').on('click', 'tr', function () {
                var datos = table.row(this).data();
            });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            // console.log(jqXHR);
            //console.log(textStatus);
            //console.log(errorThrown);
            //alert("No fue posible conectar con el servidor");
            document.getElementById("tableCalendario").innerHTML = " 0 results";
        }
    });
}