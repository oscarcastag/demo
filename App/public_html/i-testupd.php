<?php include './headers.php'; ?>
    <p id="result"> </p>
    <div id="header"></div>
    <div id="help"></div>
    <div class="card panel-heading">
        <div class="card-header">
            <div class="d-flex justify-content-between align-items-end">
                <h4>Actualizar Proveedor</h4>
            </div>
        </div>
        <div class="card-body">
            <form role="form" id="formACTO" data-toggle="validator" class="shake" autocomplete="off">
                <div class="row">
  <div class="col-sm-3">
    <div class="form-group">
        <label for="Proveedor">Proveedor</label>
        <div class="input-group mb-3">
            <input type="text" class="form-control" id="Proveedor" name="Proveedor" onblur="validaProveedor();" required>
        </div>
        <div class="help-block with-errors text-danger"></div>
    </div>
  </div>
  <div class="col-sm-3">
       <div class="form-group">
           <label for="Nombre">Nombre</label>
		   <div class="input-group mb-3">
           <input type="text" class="form-control" id="Nombre" name="Nombre" onblur="validaNombre();" placeholder="Capturar Nombre " required >
		   </div>
           <div class="help-block with-errors text-danger"></div>
       </div>
  </div>    
  <div class="col-sm-3">
       <div class="form-group">
           <label for="Nombre">Estatus</label>
		   <div class="input-group mb-3">
           <input type="text" class="form-control" id="Estatus" name="Estatus" onblur="validaEstatus();" placeholder="Capturar Estatus " disabled>
		   </div>
           <div class="help-block with-errors text-danger"></div>
       </div>
  </div>    
    <div class="col-sm-3">
        <div class="form-group">
           <label> </label>
            <button type="submit" id="form-submit" class="btn btn-outline-success btn-block">Actualizar</button>
        </div>
    </div>
	<div class="col-sm-3">
		<div class="form-group">
		   <label> </label>
		   <button type="button" class="btn btn-outline-primary" onclick="location.href = 'i-test.php';">Regresar</button>
		</div>
	</div>
    </div>
    <div id="msgSubmit" class="h4 text-center hidden"></div>
    <div class="clearfix"></div>
</form>
    </div>
</div>
<!-- Table Clientes -->
<div class="modal fade" id="modalACTO">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
 
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Catalogo Proveedor</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
 
            <!-- Modal body -->
            <div class="modal-body">
                <div id="loadTableClient"></div>
            </div>
  
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
                    
        </div>
    </div>
</div>
<?php include_once './footer.php'; ?>
<script type="text/javascript" src="asset/js/formtestupd.js"></script>
<script>
    $(document).ready(function () {
        $('#3x').DataTable();
    });
</script>
</div> 
</body>
</html>
