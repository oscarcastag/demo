$(document).ready(function () {
    $("#fecha_nacimiento").change(function (e) {
        var vals = e.target.value.split('-');
        var year = vals[0];
        var month = vals[1];
        var day = vals[2];
        var d = new Date();
        var n = d.getFullYear();
        var edad = n - year;
        console.info(edad);
        $("#edad").val(edad);
        console.info(day, month, year);
    });
});