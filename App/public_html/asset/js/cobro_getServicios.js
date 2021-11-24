$(document).ready(function () {
    getServicios();
});
function getServicios() {
    $("#loadTableServicios").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/pagos.php",
        data: "action=getServiciosEscolares",
        success: function (text) {
            console.log(text);
            console.log(text.data);
            var date = text.data;
            var txt = "";
            console.log(date);
            txt += '<div class="table-responsive"> <table id="tableServicios" class="table table-striped table-bordered table-hover table-sm dt-responsive nowrap">';
            txt += '<thead class="table-primary text-light"> <tr><th>Código</th><th>Servicio</th><th>Precio</th><th>Vigente</th><th>Estatus</th><th>Fecha</th></tr> </thead>';
            for (x in date) {
                txt += '<tr>';
                txt += "<td>" + date[x].idiservicio + "</td>";
                txt += "<td>" + date[x].descripcion + "</td>";
                txt += "<td>" + date[x].precio + "</td>";
                txt += "<td>" + date[x].activo + "</td>";
                txt += "<td>" + date[x].estatus + "</td>";
                txt += "<td>" + date[x].fecha + "</td>";
                txt += "</tr>";
            }
            txt += "</table> </div>"
            document.getElementById("loadTableServicios").innerHTML = txt;
            var table = $('#tableServicios').DataTable({
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

            $('#tableServicios tbody').on('click', 'tr', function () {
                var datos = table.row(this).data();
                //alert(datos[0]);
                $("#idiservicio").val(datos[0]);
                $("#descripcion").val(datos[1]);
                $("#precio").val(datos[2]);
                //$("#infoAlumno").html('<strong>Alumno:</strong> ' + datos[1] + " " + datos[2] + " " + datos[3] + ' <strong>Matrícula: </strong>' + datos[5] + ' <strong>Carrera: </strong>' + datos[4]);
                $("#modalMateriales .close").click()
            });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            alert("No fue posible conectar con el servidor");
            document.getElementById("loadTableServicios").innerHTML = errorThrown;
        }
    });
}
