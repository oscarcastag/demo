$(window).load(function () {
    $(".loader").fadeOut("slow");
});


function helper(idiv, type, message) {
    document.getElementById(idiv).innerHTML = '<div class="alert alert-info"><strong>Espere</strong> '+message+'<i class="pe-7s-config pe-spin pe-2x pe-va"></i></div>';
}