<?php include './headers.php'; ?>
    <div class="card">
       <div class="card-header bg-fos text-right text-light"> Catálogo Proveedores </div>
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Proveedores</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    </div>
    <p id="result"> </p>
    <div id="header"></div>
    <div id="help"></div>
    <div class="card panel-heading">
        <div class="card-header">
            <div class="d-flex justify-content-between align-items-end">
                <h4>Agregar Proveedor</h4>
            </div>
        </div>
        <div class="card-body">
            <form role="form" id="formBenefits" data-toggle="validator" class="shake" autocomplete="off">
                <div class="row">
  <div class="col-sm-3">
    <div class="form-group">
        <label for="Proveedor">Proveedor</label>
        <div class="input-group mb-3">
            <input type="text" class="form-control" id="Proveedor" name="Proveedor" onblur="validaProveedor();" required>
			<div class="input-group-append">
				<button class="btn btn-success" type="button" data-toggle="modal" data-target="#alumno" id="abreAspirantes">Buscar <i class="pe-7s-search"></i></button> 
			</div>
			
            <div class="input-group-append">
                <button class="btn btn-outline-info" title="Consultar Proveedor" id="Benefits" data-toggle="modal" data-target="#modalBenefits"><i class="pe-7s-look"></i></button>
            </div>
        </div>
        <div class="help-block with-errors text-danger"></div>
    </div>
  </div>
  <div class="col-sm-3">
       <div class="form-group">
           <label for="Nombre">Nombre</label>
		   <div class="input-group mb-3">
           <input type="text" class="form-control" id="Nombre" name="Nombre" onblur="validaNombre();" placeholder="Capturar SINONIMO REGISTRO " required >
		   </div>
           <div class="help-block with-errors text-danger"></div>
       </div>
  </div>
  <div class="col-sm-3">
       <div class="form-group">
           <label for="Nombre">Estatus</label>
		   <div class="input-group mb-3">
           <input type="text" class="form-control" id="Estatus" name="Estatus" onblur="validaEstatus();" placeholder="Capturar Estatus "  disabled>
		   </div>
           <div class="help-block with-errors text-danger"></div>
       </div>
  </div>  
    <div class="col-sm-3">
        <div class="form-group">
           <label> </label>
            <button type="submit" id="form-submit" class="btn btn-outline-success btn-block">Agregar</button>
        </div>
    </div>
<div class="col-sm-3">
    <div class="form-group">
       <label> </label>
       <button type="button" class="btn btn-outline-primary" onclick="location.href = 'i-test.php';">Actualizar Tabla</button>
    </div>
</div>
    </div>
    <div id="msgSubmit" class="h4 text-center hidden"></div>
    <div class="clearfix"></div>
</form>
    </div>
</div>
<!-- Table Clientes -->
<div class="modal fade" id="modalBenefits">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
 
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Proveedor</h4>
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
<!-- The Modal -->
<div class="modal fade" id="alumno">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Seleccione un alumno de la lista</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">

                <div class="table-responsive">
                    <table id="sumab" class="table table-striped table-bordered table-hover table-sm dt-responsive nowrap">
                        <thead class="table-primary text-light"> <tr><th>#</th><th>Matricula</th><th>Nombre</th><th>Apellido Paterno</th><th>Apellido Materno</th><th>Carrera</th><th>Turno</th><th>Cuatrimestre</th><th>Beca</th><th>Categoria</th> </tr> </thead>
                        <tbody></tbody>
                    </table> 
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card-body">
	<div id="loadTableLote"></div>
</div>
<!-- The Modal -->
<div class="modal fade" id="alumno">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Seleccione Un alumno de la lista</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <div id="TablaAlumnos"></div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
<?php include_once './footer.php'; ?>
<script type="text/javascript" src="asset/js/formtest.js"></script>
<script type="text/javascript" src="asset/js/addalumno_getaOferta.js"></script>
<script>
    $(document).ready(function () {
        $('#3x').DataTable();
    });
</script>
</div> 
</body>
</html>
