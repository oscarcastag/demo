$(document).ready(function () {
    Aspirantes();
    Alumnos();
    Men();
    WoMen();
    //newSatudent();
});

function Aspirantes2() {
    $("#aspirantes").html('<i class="pe-7s-config pe-spin pe-va"></i>');
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // var serverRequest = this.responseText;
            // //consoles.log(serverRequest);
            var myObj = JSON.parse(this.responseText);
            var count = Object.keys(myObj.data).length;
            //consoles.log(count);
            document.getElementById("aspirantes").innerHTML = count;
            $({Counter: 0}).animate({
                Counter: $('#aspirantes').text()
            }, {
                duration: 1000,
                easing: 'swing',
                step: function () {
                    $('#aspirantes').text(Math.ceil(this.Counter));
                }
            });
        }
    };
    xhttp.open("GET", "dataConect/API.php?action=countAllAspiirante", true);
    xhttp.send();
}

function Aspirantes() {
    $("#aspirantes").html('<i class="pe-7s-config pe-spin pe-va"></i>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=countAllAspiirante",
        success: function (text) {
            //consoles.log(text.data[0].total);
            var count = text.data[0].total;
            document.getElementById("aspirantes").innerHTML = count;
            $({Counter: 0}).animate({
                Counter: $('#aspirantes').text()
            }, {
                duration: 1000,
                easing: 'swing',
                step: function () {
                    $('#aspirantes').text(Math.ceil(this.Counter));
                }
            });
        }
    });
}
function Alumnos() {
    $("#alumnos").html('<i class="pe-7s-config pe-spin pe-va"></i>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=countAllAlumno",
        success: function (text) {
            //consoles.log(text.data[0].total);
            var count = text.data[0].total;
            document.getElementById("alumnos").innerHTML = count;
            $({Counter: 0}).animate({
                Counter: $('#alumnos').text()
            }, {
                duration: 1000,
                easing: 'swing',
                step: function () {
                    $('#alumnos').text(Math.ceil(this.Counter));
                }
            });
        }
    });
}


function Men() {
    $("#men").html('<i class="pe-7s-config pe-spin pe-va"></i>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getManPerson",
        success: function (text) {
            //consoles.log(text.data[0].total);
            var count = text.data[0].total;
            document.getElementById("men").innerHTML = count;
            $({Counter: 0}).animate({
                Counter: $('#men').text()
            }, {
                duration: 1000,
                easing: 'swing',
                step: function () {
                    $('#men').text(Math.ceil(this.Counter));
                }
            });
        }
    });
}


function WoMen() {
    $("#women").html('<i class="pe-7s-config pe-spin pe-va"></i>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getWomanPerson",
        success: function (text) {
            //consoles.log(text.data[0].total);
            var count = text.data[0].total;
            document.getElementById("women").innerHTML = count;
            $({Counter: 0}).animate({
                Counter: $('#women').text()
            }, {
                duration: 1000,
                easing: 'swing',
                step: function () {
                    $('#women').text(Math.ceil(this.Counter));
                }
            });
        }
    });
}


function WoMen2() {
    $("#women").html('<i class="pe-7s-config pe-spin pe-va"></i>');
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            // var serverRequest = this.responseText;
            // //consoles.log(serverRequest);
            var myObj = JSON.parse(this.responseText);
            var count = Object.keys(myObj.data).length;
            //consoles.log(count);
            document.getElementById("women").innerHTML = count;
            $({Counter: 0}).animate({
                Counter: $('#women').text()
            }, {
                duration: 1000,
                easing: 'swing',
                step: function () {
                    $('#women').text(Math.ceil(this.Counter));
                }
            });
        }
    };
    xhttp.open("GET", "dataConect/API.php?action=getWomanPerson", true);
    xhttp.send();
}

function newSatudent() {
    $("#newSatudent").html('<i class="pe-7s-config pe-spin pe-va"></i>');
    $.ajax({
        type: "GET",
        url: "dataConect/API.php",
        data: "action=getnewSatudent",
        success: function (text) {
            //consoles.log(text.data[0].total);
            var count = text.data[0].total;
            document.getElementById("newSatudent").innerHTML = count;
            $({Counter: 0}).animate({
                Counter: $('#newSatudent').text()
            }, {
                duration: 1000,
                easing: 'swing',
                step: function () {
                    $('#newSatudent').text(Math.ceil(this.Counter));
                }
            });
        }
    });
}

