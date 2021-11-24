</div>
</div>
<div id="styleSelector">

</div>
</div>
</div>
</div>
</div>
<div class="clearfix"><span class="float-right text-muted">SAEM 1.0.0 <i class="pe-7s-science"></i></span></div>
</div>
</div>

<script src="asset/js/aaref.js"></script>	

<!-- Required Jquery -->
<script type="text/javascript" src="bower_components/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="bower_components/jquery-ui/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="bower_components/popper.js/js/popper.min.js"></script>
<script type="text/javascript" src="bower_components/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="bower_components/jquery-slimscroll/js/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="bower_components/modernizr/js/modernizr.js"></script>
<script type="text/javascript" src="bower_components/modernizr/js/css-scrollbars.js"></script>

<!-- i18next.min.js -->
<script type="text/javascript" src="bower_components/i18next/js/i18next.min.js"></script>
<script type="text/javascript" src="bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
<script type="text/javascript" src="bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
<script type="text/javascript" src="bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="assets/js/demo-12.js"></script>
<script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Custom js -->
<script type="text/javascript" src="assets/js/script.js"></script>
<script>
    function louout() {
        localStorage.clear();
        location.href = "BackEndSAP/logout.php";
    }
</script>
<!-- JQuery Export datatable csv,excel pdf -->

<!--<script src="asset/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>-->
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.18/r-2.2.2/datatables.min.js"></script>
<script src="asset/js/dataTables.buttons.min.js"></script>
<script src="asset/js/jszip.min.js"></script>
<script src="asset/js/pdfmake.min.js"></script>
<script src="asset/js/vfs_fonts.js"></script>
<script src="asset/js/buttons.html5.min.js"></script>
<!-- Web Service Login -->
<script src="asset/js/validator.min.js"></script>
<script>
    function swalert(title, texto, type) {
        Swal({
            title: title,
            text: texto,
            type: type,
            confirmButtonText: 'Cerrar'
        })
    }

    $(document).ready(function (e) {
        // Simular click
        $('#mobile-collapse').click();
        //buttons-excel btn btn-sm btn-primary
        //style="display: none;"
        $("#styleSelector").hide();
        $(".buttons-excel").removeClass("dt-button buttons-html5");
        $(".buttons-excel").addClass("btn btn-sm btn-primary");
    });

    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

</body>

</html>
