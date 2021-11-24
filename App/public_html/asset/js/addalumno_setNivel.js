$(document).ready(function(){
  getPlantel();
});
function getPlantel() {
    $("#selectPlantel").html('<div class="alert alert-info"><strong>Espere</strong> Cargando Contenido ... Esta acción puede tardar unos momentos <i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getPlantel",
        success: function (text) {
            console.log(text);
            console.log(text.data);
            var date = text.data;
            var txt = "";
            txt += '<select class="form-control" id="idicampus" name="idicampus" required>';
            txt += '<option value="">Seleccione plantel</option>';
            for (x in date) {
                txt += '<option value="' + date[x].clave + '"><i class="text-info">' + date[x].campus + '</option>';
            }
            txt += "</select>";
            document.getElementById("selectPlantel").innerHTML = txt;
            $('#idicampus').on('change', function () {
               // var clave = this.value;
                var clave = $("#idicampus").val();
                console.log(clave);
                $("#clave").val(clave);
            });
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
            //alert("No fue posible conectar con el servidor");
            document.getElementById("selectPlantel").innerHTML = errorThrown;
        }
    });
}
