$(document).ready(function () {
    $('.sigPad').signaturePad({drawOnly: true, drawBezierCurves: true, lineTop: 90});
});

$("#btnSaveSign").click(function (e) {
    html2canvas([document.getElementById('sign-pad')], {
        onrendered: function (canvas) {
            var canvas_img_data = canvas.toDataURL('image/png');
            var img_data = canvas_img_data.replace(/^data:image\/(png|jpg);base64,/, "");
            //ajax call to save image inside folder
            $.ajax({
                url: 'sign/save_sign.php',
                data: {img_data: img_data},
                type: 'post',
                dataType: 'json',
                success: function (response) {
                    console.log(response.file_name);
                    $('#signaturePicture').val(response.file_name);
                }
            });
        }
    });
});

//clearSignature

//$("#clearSignature").click(function () {
//    var c = document.getElementById("sign-pad");
//    var ctx = c.getContext("2d");
//    ctx.fillStyle = "white";
//    ctx.fillRect(0, 0, 300, 150);
//    ctx.clearRect(0, 0, 300, 150);
//});


