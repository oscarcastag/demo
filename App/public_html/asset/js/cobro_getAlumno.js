$(document).ready(function () {
    sumarb();
    $("#search-client").click();//simulamos clic para abrir modal alumnos
});

var sumarb = function () {
    var spin = '<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>';
    var table = $("#sumab").DataTable({
        "destroy": true,
        "responsive": false,
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

//    $('#sumab tbody').on('click', 'tr', function () {
//        var datos = table.row(this).data();
//        var cuatrimestre = parseInt(datos.cuatrimestre);
//        var promovido = cuatrimestre + 1;
//        //alert(datos.idialumno);
//        $("#idialumno").val(datos.idialumno);
//        $("#nombre").val(datos.nombre);
//        $("#apellido_paterno").val(datos.apellido_paterno);
//        $("#apellido_materno").val(datos.apellido_materno);
//        $("#carrera").val(datos.carrera);
//        $("#matricula").val(datos.matricula);
//        $("#turno").val(datos.turno);
//        $("#cuatrimestre").val(cuatrimestre);
//        $("#beca_colegiatura").val(datos.beca_colegiatura);
//        $("#categoria").val(datos.categoria);
//        $("#promovido").val(promovido);
//        $("#promovido").attr({
//            "max": promovido, // substitute your own
//            "min": cuatrimestre          // values (or variables) here
//        });
//        $("#alumno .close").click()
//    });
    
     $('#sumab tbody').on('click', 'tr', function () {
                var folio = $("#folio").val();
                var datos = table.row(this).data();
                //alert(datos[0]);
                $("#idialumno").val(datos.idialumno);
                $("#carrera").val(datos.carrera);
                $("#matricula").val(datos.matricula);
                $("#turno").val(datos.turno);
                $("#cuatrimestre").val(datos.cuatrimestre);
                $("#estatus").val(datos.estatus);
                $("#nombre").val(datos.nombre + " " + datos.apellido_paterno + " " + datos.apellido_materno);
//                $("#Fabrica").val(datos[1]);
//                $("#Almacen").val(datos[2]);
                $("#infoAlumno").html('<strong>Alumno:</strong> ' + datos.nombre + " " + datos.apellido_paterno + " " + datos.apellido_materno + ' <strong>Matrícula: </strong>' + datos.matricula + ' <strong>Carrera: </strong>' + datos.carrera + ' <strong>GDO: </strong> '+ datos.cuatrimestre + ' <strong>Estatus: </strong> '+ datos.estatus + ' <strong>Folio:</strong> ' + folio + '');
                $("#modalClientes .close").click()
            });

}
function ConsultaSolpesJson() {
    $("#loadTableClient").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getcardAlumno",
        success: function (text) {
            console.log(text);
            console.log(text.data);
            var date = text.data;
            var txt = "";
            console.log(date);
            txt += '<div class="table-responsive"> <table id="tableAlumno" class="table table-striped table-bordered table-hover table-sm dt-responsive nowrap">';
            txt += '<thead class="table-primary text-light"> <tr><th>Código</th><th>Nombre</th><th>Apellido Paterno</th><th>Aperrlido Materno</th><th>Carrera</th><th>Matrícula</th><th>Turno</th><th>Cuatrimestre</th><th>Estatus</th><th>Detalle Estatus</th><th>Vigencia de Credencial</th></tr> </thead>';
            for (x in date) {
                txt += '<tr>';
                txt += "<td>" + date[x].idialumno + "</td>";
                txt += "<td>" + date[x].nombre + "</td>";
                txt += "<td>" + date[x].apellido_paterno + "</td>";
                txt += "<td>" + date[x].apellido_materno + "</td>";
                txt += "<td>" + date[x].carrera + "</td>";
                txt += "<td>" + date[x].matricula + "</td>";
                txt += "<td>" + date[x].turno + "</td>";
                txt += "<td>" + date[x].cuatrimestre + "</td>";
                txt += "<td>" + date[x].estatus + "</td>";
                txt += "<td>" + date[x].bloqueo + "</td>";
                txt += "<td>" + date[x].vigencia + "</td>";
                txt += "</tr>";
            }
            txt += "</table> </div>"
            document.getElementById("loadTableClient").innerHTML = txt;
            var table = $('#tableAlumno').DataTable({
                responsive: true,
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

            $('#tableAlumno tbody').on('click', 'tr', function () {
                var folio = $("#folio").val();
                var datos = table.row(this).data();
                //alert(datos[0]);
                $("#idialumno").val(datos[0]);
                $("#carrera").val(datos[4]);
                $("#matricula").val(datos[5]);
                $("#turno").val(datos[6]);
                $("#cuatrimestre").val(datos[7]);
                $("#estatus").val(datos[8]);
                $("#nombre").val(datos[1] + " " + datos[2] + " " + datos[3]);
//                $("#Fabrica").val(datos[1]);
//                $("#Almacen").val(datos[2]);
                $("#infoAlumno").html('<strong>Alumno:</strong> ' + datos[1] + " " + datos[2] + " " + datos[3] + ' <strong>Matrícula: </strong>' + datos[5] + ' <strong>Carrera: </strong>' + datos[4] + ' <strong>Folio: ' + folio + '</strong>');
                $("#modalClientes .close").click()
            });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            alert("No fue posible conectar con el servidor");
            document.getElementById("loadTableClient").innerHTML = errorThrown;
        }
    });
}
