$("#formcHorasHorario").validator().on("submit", function (event) {
    if (event.isDefaultPrevented()) {
        // handle the invalid form...
        swalert('Mensaje!', 'Llene los campos requeridos', 'info');
    } else {
        // everything looks good!
        event.preventDefault();
        var dataString = $('#formcHorasHorario').serialize();
        swalert('Mensaje!', 'Procesando...', 'info');
        $.ajax({
            type: "POST",
            url: "dataConect/API.php",
            data: "action=addHorasHorario&" + dataString,
            success: function (text) {
                if (text == "success") {
                    swalert('Mensaje!', 'El horario se guardó correctamente', 'success');
                    getHorasHorario();
                } else {
                    swalert('Mensaje!', text, 'info');
                }
            }
        });
    }
});

$(document).ready(function () {
    $('.time').mask('00:00:00');
    getNivel();
    divTurno();
});

function getNivel() {
    $("#divNivel").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getNivel",
        success: function (text) {
            console.log(text);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control fill" id="NivelId" name="NivelId" onchange="getHorasHorario()" required>';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].NivelId + '">' + date[x].Descripcion + '</option>';
            }
            txt += "</select>";
            $("#divNivel").html(txt);
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
            txt += '<select class="form-control fill" id="TurnoId" name="TurnoId" onchange="getHorasHorario()">';
            txt += '<option value="">Seleccione</option>';
            for (x in date) {
                txt += '<option value="' + date[x].TurnoId + '">' + date[x].Descripcion + '</option>';
            }
            txt += "</select>";
            $("#divTurno").html(txt);
        }
    });
}

function getHorasHorario() {
    var TurnoId = $("#TurnoId").val();
    var NivelId = $("#NivelId").val();
    $("#idiNivel").val(NivelId);
    $("#idiTurno").val(TurnoId);
    $("#tableCalendario").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        "url": "dataConect/API.php",
        data: "action=getHorasHorario&TurnoId=" + TurnoId + "&NivelId=" + NivelId,
        success: function (text) {
            var date = text.data;
            var txt = "";
            console.log(date);
            txt += '<div class="table-responsive"> <table id="tbxd09" class="table table-striped table-bordered table-hover table-sm dt-responsive nowrap table-sm table-xs">';
            txt += '<thead class="table-primary text-light"> <tr><th>#</th><th>Acción</th><th>Hora Inicial</th><th>Hora Final</th><th>Código</th></tr> </thead>';
            for (x in date) {
                var a = parseInt(x);
                txt += '<tr>';
                txt += "<td>" + (a + 1) + "</td>";
                //txt += "<td>" + date[x].HoraHorarioId + "°</td>";
                txt += '<td>';
                txt += '<div class="btn-group btn-group-sm">';
                txt += '<button type="button" class="btn btn-default btn-sm" title="Editar" data-toggle="modal" data-target="#modalUpdateHoras"><i class="pe-7s-note"></i></button>';
                txt += '<button type="button" class="btn btn-danger  btn-sm" title= "Borrar"onclick="deleteHora(' + date[x].HoraHorarioId + ');"><i class="pe-7s-close-circle"></i></button>';
                txt += '</div>';
                txt += '</td>';
                txt += "<td>" + date[x].HoraInicial + "</td>";
                txt += "<td>" + date[x].HoraFinal + "</td>";
                txt += "<td>" + date[x].HoraHorarioId + "</td>";
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
                //alert(datos[2]);
                $("#HoraHorarioId").val(datos[4]);
                $("#upNivel").val(NivelId);
                $("#upTurno").val(TurnoId);
                $("#upHoraInicial").val(datos[2]);
                $("#upHoraFinal").val(datos[3]);
            });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            document.getElementById("tableCalendario").innerHTML = " 0 results";
        }
    });
}

function deleteHora(HoraHorarioId) {
    var txt;
    var r = confirm("Desea eliminar la hora?");
    if (r) {
        $.ajax({
            type: "POST",
            url: "dataConect/API.php",
            data: "action=deleteHora&HoraHorarioId=" + HoraHorarioId,
            success: function (text) {
                if (text == "success") {
                    swalert('Exito!', 'Hora eliminada', 'success');
                    getHorasHorario();
                } else {
                    swalert('Error!', text, 'error');
                }

            }
        });
    } else {
        txt = "You pressed Cancel!";
    }
    //alert(txt);
}

$("#formUpdateHoras").validator().on("submit", function (event) {
    if (event.isDefaultPrevented()) {
        // handle the invalid form...
        swalert('Mensaje!', 'Llene los campos requeridos', 'info');
    } else {
        // everything looks good!
        event.preventDefault();
        var dataString = $('#formUpdateHoras').serialize();
        swalert('Mensaje!', 'Procesando...', 'info');
        $.ajax({
            type: "POST",
            url: "dataConect/API.php",
            data: "action=updateHorasHorario&" + dataString,
            success: function (text) {
                if (text == "success") {
                    swalert('Mensaje!', 'El horario se guardó correctamente', 'success');
                    getHorasHorario();
                } else {
                    swalert('Mensaje!', text, 'info');
                }
            }
        });
    }
});