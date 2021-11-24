/**
 * Genera el folio consecutovo y muestra el folio consecutivo de la venta
 */
$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "dataConect/pagos.php",
        data: "action=generarFolioPago",
        success: function (text) {
            console.log(text.data);
            console.log(text.data[0].idiventa);
            var idiventa = $("#idiventa").val();
            $("#idiventa").val(text.data[0].idiventa);
            $("#folio").val(text.data[0].folio);
        }
    });
});

/**
 * Agrega las partidas de la venta 
 * @returns {undefined}
 */
function setPartida() {
    // Initiate Variables With Form Content
    var idialumno = $("#idialumno").val();//Alumno seleccionado
    var idiventa = $("#idiventa").val();//idi de la venta
    var folio = $("#folio").val();//String del folio

    var descripcion = $("#descripcion").val();//descripcion del servicio
    var idiservicio = $("#idiservicio").val();//idi del servicio
    var precio = $("#precio").val(); //precio del servicio
    var unidad = $("#unidad").val(); //cantidad del servicio
    var metodo_pago = $("#metodo_pago").val(); //metodo de pago


    var errorMSG = "";
    if (typeof idialumno === "undefined" || idialumno == "") {
        errorMSG = "idialumno es required ";
    }
    if (typeof idiventa === "undefined" || idiventa == "") {
        errorMSG += "idiventa es required ";
    }
    if (typeof descripcion === "undefined" || descripcion == "") {
        errorMSG += "descripcion es required ";
    }
    if (typeof idiservicio === "undefined" || idiservicio == "") {
        errorMSG += "idiservicio es required ";
    }
    if (typeof precio === "undefined" || precio == "") {
        errorMSG += "precio es required ";
    }
    if (typeof unidad === "undefined" || unidad == "") {
        errorMSG += "unidad es required ";
    }

    if (errorMSG == "") {
        //swalert('!Exito¡', 'Servicio Agregado alumno' + idialumno + ' servicio ' + idiservicio + ' venta ' + idiventa + ' unidad ' + unidad + ' precio ' + precio + " descripcion" + descripcion, 'success');
        $.ajax({
            type: "POST",
            url: "dataConect/pagos.php",
            data: "action=setVentaAsServicio&idialumno=" + idialumno + "&idiservicio=" + idiservicio + "&idiventa=" + idiventa + "&unidad=" + unidad + "&precio=" + precio,
            success: function (text) {
                if (text == "success") {
                    //swalert('Exito!', 'Cobro agregado correctamente', 'success');
                    getpartidasServicios(idialumno, idiventa);
                    getSubtotalVent(idialumno, idiventa);
                    invoice();
                } else {
                    swalert('Error!', text, 'error');
                }

            }
        });
    } else {
        if (errorMSG == "") {
            //echo "Something went wrong :(";
            swalert('Cuidado!', 'Something went wrong :(', 'warning');
        } else {
            //echo $errorMSG;
            swalert('Error!', errorMSG, 'error');
        }
    }
}

/**
 * retorna la tabal de partidas pro ventas
 * @param {type} idialumno
 * @param {type} idiventa
 * @returns {undefined}
 */

function getpartidasServicios(idialumno, idiventa) {
    $("#partidasServicios").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/pagos.php",
        data: "action=getpartidasServicios&idialumno=" + idialumno + "&idiventa=" + idiventa,
        success: function (text) {
            console.log(text);
            console.log(text.data);
            var date = text.data;
            var txt = "";
            console.log(date);
            txt += '<h5>Detalle de cargos</h5>';

            txt += '<table id="tableServicios" class="table table-striped">';
            txt += '<thead class="table-primary text-light"> <tr><th>#</th><th>Servicio</th><th>Precio</th><th>Cantidad</th><th>Total</th></tr> </thead>';
            for (x in date) {
                txt += '<tbody><tr>';
                txt += '<td><button type="button" value="idialumno=' + date[x].idialumno + '&idiventa=' + date[x].idialumno + '" name="eliminaPartida' + date[x].idiventa_as_servicio + '" id="eliminaPartida' + date[x].idiventa_as_servicio + '" class="btn btn-danger btn-sm" title="Quitar Servicio" onclick="eliminaPartida(' + date[x].idiventa_as_servicio + ',' + date[x].idialumno + ',' + date[x].idiventa + ')"><i class="pe-7s-close-circle pe-va"></i></button></td>';
                txt += "<td>" + date[x].descripcion + "</td>";
                txt += "<td>$" + date[x].precio + "</td>";
                txt += "<td>" + date[x].unidad + "</td>";
                txt += "<td>$" + date[x].total + "</td>";
                txt += '<input type="hidden" value="' + date[x].idiventa_as_servicio + '" name="idiventa_as_servicio" id="idiventa_as_servicio">';
                txt += "</tr></tbody>";
            }
            txt += "</table>"
            document.getElementById("partidasServicios").innerHTML = txt;
            document.getElementById("invoice-detail-table").innerHTML = txt;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            //alert("No fue posible conectar con el servidor");
            document.getElementById("partidasServicios").innerHTML = errorThrown;
        }
    });

}

function getSubtotalVent(idialumno, idiventa) {
    $("#subtotalVent").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/pagos.php",
        data: "action=getSubtotalVentaASservicio&idialumno=" + idialumno + "&idiventa=" + idiventa,
        success: function (text) {
            console.log(text);
            console.log(text.data);
            var date = text.data[0].subtotal;
            var txt = "";
            console.log(date);
            txt += '<input type="hidden" id="subtotal" name="subtotal" value="' + date + '">';
            txt += '<input type="hidden" id="total " name="total" value="' + date + '">';
            txt += '<div class="card">';
            txt += '<div class="card-body">';
            txt += '<div class="row">';
            txt += '<div class="col-sm-6">';
            txt += '<strong class="float-right">Subtotal:</strong>';
            txt += '</div>';
            txt += '<div class="col-sm-6">';
            txt += '$' + date + '.00 MXN';
            txt += '</div>';
            txt += '</div>';
            txt += '<div class="row">';
            txt += '<div class="col-sm-6">';
            txt += '<strong class="float-right">Descuentos:</strong>';
            txt += '</div>';
            txt += '<div class="col-sm-6">';
            txt += '%0';
            txt += '</div>';
            txt += '</div>';
            txt += '<div class="row">';
            txt += '<div class="col-sm-6">';
            txt += '<strong class="float-right">TOTAL:</strong>';
            txt += '</div>';
            txt += ' <div class="col-sm-6">';
            txt += '$' + date + '.00 MXN';
            txt += ' </div>';
            txt += ' </div>';
            txt += ' </div>';
            txt += ' </div>';
            txt += ' </div>';
            document.getElementById("subtotalVent").innerHTML = txt;
            document.getElementById("invoice-total").innerHTML = txt;
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            //alert("No fue posible conectar con el servidor");
            document.getElementById("subtotalVent").innerHTML = errorThrown;
        }
    });
}

function eliminaPartida(idiventa_as_servicio, idialumno, idiventa) {
//function eliminaPartida(idia) {
    var txt;
    var r = confirm("Desea eliminar el cobro?");
    if (r) {
        $.ajax({
            type: "POST",
            url: "dataConect/pagos.php",
            data: "action=eliminarPartida&idiventa_as_servicio=" + idiventa_as_servicio,
            success: function (text) {
                if (text == "success") {
                    swalert('Exito!', 'Cobro cancelado', 'success');
                    getpartidasServicios(idialumno, idiventa);
                    getSubtotalVent(idialumno, idiventa);
                    invoice();
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
function nnn() {


        swal({
            title: 'Â¿Seguro que desea eliminar la venta?',
            text: "Â¡Esta acciÃ³n no se puede revertir!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Â¡Eliminar Venta!',
            cancelButtonText: 'Cancelar'
        }).then(function (result) {
            if (result.value) {
                $.ajax({
                    url: "/cgi-bwp/erp/ventas/eliminar.bwp",
                    method: "POST",
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function success(respuesta) {
                        if (respuesta.trim() == 'No') {
                            mensaje('No se puede eliminar la venta', 'Ventas', 'error');
                        } else {
                            mensaje('Pedido eliminado correctamente', '', 'success', 2000);
                            location.href = '/cgi-bwp/erp/ventas/main.bwp';
                        }
                    },
                    error: function error(respuesta) {
                        mensaje('Ocurrio un error al elimianar la venta' + respuesta);
                    }
                });
            }
        });


}