$(document).ready(function () {
   // consultaAlumnos(); //consulta Alumnos
    sumarb();
    $('#abreAspirantes').click();//simular clic para abrir modal aspirantes
    //$("search:first").focus();
});

//$(document).ready(function () {
//    $("#buscaAlumno").click(function () {
//        var matricula = $("#inpmatricula").val();
//        buscaAlumno(matricula);
//    });
//});
function buscaAlumno(matricula) {
    $("#loadTableServicios").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getcardAlumnoMatricula&matricula=" + matricula,
        success: function (text) {
            var date = text.data;
            console.log(text);
            var txt = "";
            txt += '<div class="table-responsive">'
                    + '<table id="sumab" class="table table-striped table-bordered table-hover table-sm dt-responsive nowrap">'
                    + ' <thead class="table-primary text-light"> <tr><th>#</th><th>Matricula</th><th>Nombre</th><th>Apellido Paterno</th><th>Apellido Materno</th><th>Carrera</th><th>Turno</th><th>Cuatrimestre</th><th>Beca</th><th>Categoria</th> </tr> </thead><tbody>';
            for (x in date) {
                txt += "<td>" + date[x].idialumno + "</td>";
                txt += "<td>" + date[x].matricula + "</td>";
                txt += "<td>" + date[x].nombre + "</td>";
                txt += "<td>" + date[x].apellido_paterno + "</td>";
                txt += "<td>" + date[x].apellido_materno + "</td>";
                txt += "<td>" + date[x].carrera + "</td>";
                txt += "<td>" + date[x].turno + "</td>";
                txt += "<td>" + date[x].cuatrimestre + "</td>";
                txt += "<td>" + date[x].beca_colegiatura + "</td>";
                txt += "<td>" + date[x].categoria + "</td>";
            }
            txt += '</tbody></table> </div>';
            document.getElementById("TablaAlumnos").innerHTML = txt;
            var table = $('#sumab').DataTable({
                responsive: true,
                "destroy": true,
                "deferRender": true,
                "processing": true,
                //dom: 'Bfrtip',
                //buttons: ['excel'],
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
            $('#sumab tbody').on('click', 'tr', function () {
                var datos = table.row(this).data();
                // alert(datos[0]);
                var cuatrimestre = parseInt(datos[7]);
                var promovido = cuatrimestre + 1;
                //alert(datos.idialumno);
                $("#idialumno").val(datos[0]);
                $("#nombre").val(datos[2]);
                $("#apellido_paterno").val(datos[3]);
                $("#apellido_materno").val(datos[4]);
                $("#carrera").val(datos[5]);
                $("#matricula").val(datos[1]);
                $("#turno").val(datos[6]);
                $("#cuatrimestre").val(datos[7]);
                $("#beca_colegiatura").val(datos[9]);
                $("#categoria").val(datos[9]);
                $("#promovido").val(promovido);
                $("#promovido").attr({
                    "max": promovido, // substitute your own
                    "min": cuatrimestre          // values (or variables) here
                });
                $("#alumno .close").click();
                validAdeudos();
            });



        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            document.getElementById("TablaAlumnos").innerHTML = "0 Resultados";
        }
    });
}


var sumarb = function () {
    var spin = '<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>';

    var table = $("#sumab").DataTable({
        "destroy": true,
        "responsive": true,
        "deferRender": true,
        //"processing": true,
        //"responsive": true,
        "ajax": {
            "url": "dataConect/API.php?action=getcardAlumno",
            "type": "GET"
        },
        "columns": [
            //{"data": "btnEditar"},
            //{"data": "btnCredencial"},
            {"data": "idialumno"},
            {"data": "matricula"},
            {"data": "nombre"},
            {"data": "apellido_paterno"},
            {"data": "apellido_materno"},
            {"data": "carrera"},
            {"data": "turno"},
            {"data": "cuatrimestre"},
            {"data": "beca_colegiatura"},
            {"data": "categoria"},
        ],
        //"dom": 't',
        language: {
            "decimal": "",
            "emptyTable": "No hay información",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
            "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ Entradas",
            "loadingRecords": spin,
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

    $('#sumab tbody').on('click', 'tr', function () {
        var datos = table.row(this).data();
        var cuatrimestre = parseInt(datos.cuatrimestre);
        var promovido = cuatrimestre + 1;
        //alert(datos.idialumno);
        $("#idialumno").val(datos.idialumno);
        $("#nombre").val(datos.nombre);
        $("#apellido_paterno").val(datos.apellido_paterno);
        $("#apellido_materno").val(datos.apellido_materno);
        $("#carrera").val(datos.carrera);
        $("#matricula").val(datos.matricula);
        $("#turno").val(datos.turno);
        $("#cuatrimestre").val(cuatrimestre);
        $("#beca_colegiatura").val(datos.beca_colegiatura);
        $("#categoria").val(datos.categoria);
        $("#promovido").val(promovido);
        $("#promovido").attr({
            "max": promovido, // substitute your own
            "min": cuatrimestre          // values (or variables) here
        });
        $("#alumno .close").click();
        validAdeudos();
    });

}

function consultaAlumnos2() {
    $("#TablaAlumnos").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getcardAlumno",
        success: function (text) {
            console.log(text.data);
            var date = text.data;
            var txt = "";
            console.log(date);
            txt += '<div class="table-responsive"> <table id="solpx5" class="table table-striped table-bordered table-hover table-sm dt-responsive nowrap">';
            txt += '<thead class="table-primary text-light"><tr><th>Código</th><th>Nombre</th><th>Apellido Paterno</th><th>Apellido Materno</th><th>Carrera</th><th>Matricula</th><th>Turno</th><th>Cuatrimestre</th><th>% Beca</th><th>Categoria</th></tr> </thead>';
            for (x in date) {
                txt += "<tr><td>" + date[x].idialumno + "</td>";
                txt += "<td>" + date[x].nombre + "</td>";
                txt += "<td>" + date[x].apellido_paterno + "</td>";
                txt += "<td>" + date[x].apellido_materno + "</td>";
                txt += "<td>" + date[x].carrera + "</td>";
                txt += "<td>" + date[x].matricula + "</td>";
                txt += "<td>" + date[x].turno + "</td>";
                txt += "<td>" + date[x].cuatrimestre + "</td>";
                txt += "<td>" + date[x].beca_colegiatura + "</td>";
                txt += "<td>" + date[x].categoria + "</td>";
                txt += "</tr>";
            }
            txt += "</table> </div>"
            document.getElementById("TablaAlumnos").innerHTML = txt;
            var table = $('#solpx5').DataTable({responsive: true});

            $('#solpx5 tbody').on('click', 'tr', function () {
                var datos = table.row(this).data();
                var cuatrimestre = parseInt(datos[7]);
                var promovido = cuatrimestre + 1;
                //alert(datos[0]);
                $("#idialumno").val(datos[0]);
                $("#nombre").val(datos[1]);
                $("#apellido_paterno").val(datos[2]);
                $("#apellido_materno").val(datos[3]);
                $("#carrera").val(datos[4]);
                $("#matricula").val(datos[5]);
                $("#turno").val(datos[6]);
                $("#cuatrimestre").val(cuatrimestre);
                $("#beca_colegiatura").val(datos[8]);
                $("#categoria").val(datos[9]);
                $("#promovido").val(promovido);
                $("#promovido").attr({
                    "max": promovido, // substitute your own
                    "min": cuatrimestre          // values (or variables) here
                });
                $("#alumno .close").click()
            });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            //alert("No fue posible conectar con el servidor");
            document.getElementById("TablaAlumnos").innerHTML = "0 alumnos inscritos";
        }
    });
}
