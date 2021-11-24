Webcam.set({
    width: 300,
    height: 300,
    image_format: 'jpeg',
    jpeg_quality: 90
});

Webcam.attach('#my_camera');

function take_snapshot() {
    Webcam.snap(function (data_uri) {
        $(".image-tag").val(data_uri);
        document.getElementById('results').innerHTML = '<img width="300" height="300" src="' + data_uri + '"/>';
    });
}