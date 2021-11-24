<?php include './headers.php'; ?>

 <!-- Config. table start -->
		<div class="card">
			<div class="card-header">
				<h5>Configuration Option</h5>
				<span>The Responsive extension for DataTables can be applied to a DataTable in one of two ways; with a specific class name on the table, or using the DataTables initialisation options. This method shows the latter, with the responsive option being set to the boolean value true.</span>
				<div class="card-header-right">    <ul class="list-unstyled card-option">        <li><i class="icofont icofont-simple-left "></i></li>        <li><i class="icofont icofont-maximize full-card"></i></li>        <li><i class="icofont icofont-minus minimize-card"></i></li>        <li><i class="icofont icofont-refresh reload-card"></i></li>        <li><i class="icofont icofont-error close-card"></i></li>    </ul></div>
			</div>
			<div class="card-block">
				<div class="table-responsive">
					<div class="dt-responsive table-responsive">
						<table id="res-config" class="table table-striped table-bordered nowrap">
							<thead>
								<tr>
									<th>First name</th>
									<th>Last name</th>
									<th>Position</th>
									<th>Office</th>
									<th>Age</th>
									<th>Start date</th>
									<th>Salary</th>
									<th>Extn.</th>
									<th>E-mail</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Tiger</td>
									<td>Nixon</td>
									<td>System Architect</td>
									<td>Edinburgh</td>
									<td>61</td>
									<td>2011/04/25</td>
									<td>$320,800</td>
									<td>5421</td>
									<td>t.nixon@datatables.net</td>
								</tr>
								<tr>
									<td>Garrett</td>
									<td>Winters</td>
									<td>Accountant</td>
									<td>Tokyo</td>
									<td>63</td>
									<td>2011/07/25</td>
									<td>$170,750</td>
									<td>8422</td>
									<td>g.winters@datatables.net</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- Config. table end -->
<!-- Page-header start -->
	<div class="page-header card">
		<div class="row align-items-end">
			<div class="col-lg-8">
				<div class="page-header-title">
					<i class="icofont icofont-drwaing-tablet bg-c-orenge"></i>
					<div class="d-inline">
						<h4>Editable Table</h4>
						<span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="page-header-breadcrumb">
					<ul class="breadcrumb-title">
				<li class="breadcrumb-item">
					<a href="index.html">
						<i class="icofont icofont-home"></i>
					</a>
				</li>
				<li class="breadcrumb-item"><a href="#!">Editable Table</a>
				</li>
			</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Page-header end -->
	
	<!-- Page-body start -->
	<div class="page-body">
		<!-- Edit With Click card start -->
		<div class="card">
			<div class="card-header">
				<h5>Edit With Click</h5>
				<span>Click on row to perform edit action then Enter for save</span>
				<div class="card-header-right">    <ul class="list-unstyled card-option">        <li><i class="icofont icofont-simple-left "></i></li>        <li><i class="icofont icofont-maximize full-card"></i></li>        <li><i class="icofont icofont-minus minimize-card"></i></li>        <li><i class="icofont icofont-refresh reload-card"></i></li>        <li><i class="icofont icofont-error close-card"></i></li>    </ul></div>
			</div>
			<div class="card-block">
				<div class="table-responsive">
					<table class="table table-striped table-bordered" id="example-1">
						<thead>
							<tr>
								<th>#</th>
								<th>First</th>
								<th>Last</th>
								<th>Nickname</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td class="tabledit-view-mode"><span class="tabledit-span">Mark</span>
									<input class="tabledit-input form-control input-sm" type="text" name="First" value="Mark">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">Otto</span>
									<input class="tabledit-input form-control input-sm" type="text" name="Last" value="Otto">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">@mdo</span>
									<select class="tabledit-input form-control input-sm d-none" name="Nickname" disabled="">
				<option value="1">@mdo</option>
				<option value="2">@fat</option>
				<option value="3">@twitter</option>
			</select>
								</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td class="tabledit-view-mode"><span class="tabledit-span">Jacob</span>
									<input class="tabledit-input form-control input-sm" type="text" name="First" value="Jacob" disabled="">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">Thorntonkk</span>
									<input class="tabledit-input form-control input-sm" type="text" name="Last" value="Thornton" disabled="">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">@mdo</span>
									<select class="tabledit-input form-control input-sm d-none" name="Nickname" disabled="">
				<option value="1">@mdo</option>
				<option value="2">@fat</option>
				<option value="3">@twitter</option>
			</select>
								</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td class="tabledit-view-mode"><span class="tabledit-span">Larry</span>
									<input class="tabledit-input form-control input-sm" type="text" name="First" value="Larry" disabled="">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">the Bird</span>
									<input class="tabledit-input form-control input-sm" type="text" name="Last" value="the Bird" disabled="">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">@mdo</span>
									<select class="tabledit-input form-control input-sm d-none" name="Nickname" disabled="">
				<option value="1">@mdo</option>
				<option value="2">@fat</option>
				<option value="3">@twitter</option>
			</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<button type="button" class="btn btn-primary waves-effect waves-light add" onclick="add_row();">Add Row
</button>
			</div>
		</div>
		<!-- Edit With Click card end -->
		<!-- Edit With Button card start -->
		<div class="card">
			<div class="card-header">
				<h5>Edit With Button</h5>
				<span>Click on buttons to perform actions</span>
				<div class="card-header-right">    <ul class="list-unstyled card-option">        <li><i class="icofont icofont-simple-left "></i></li>        <li><i class="icofont icofont-maximize full-card"></i></li>        <li><i class="icofont icofont-minus minimize-card"></i></li>        <li><i class="icofont icofont-refresh reload-card"></i></li>        <li><i class="icofont icofont-error close-card"></i></li>    </ul></div>
			</div>
			<div class="card-block">
				<div class="table-responsive">
					<table class="table table-striped table-bordered" id="example-2">
						<thead>
							<tr>
								<th>#</th>
								<th>First</th>
								<th>Last</th>
								<th>Nickname</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td class="tabledit-view-mode"><span class="tabledit-span">Mark</span>
									<input class="tabledit-input form-control input-sm" type="text" name="First" value="Mark">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">Otto</span>
									<input class="tabledit-input form-control input-sm" type="text" name="Last" value="Otto">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">@mdo</span>
									<select class="tabledit-input form-control input-sm" name="Nickname" disabled="" style="display:none;">
				<option value="1">@mdo</option>
				<option value="2">@fat</option>
				<option value="3">@twitter</option>
			</select>
								</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td class="tabledit-view-mode"><span class="tabledit-span">Jacob</span>
									<input class="tabledit-input form-control input-sm" type="text" name="First" value="Jacob" disabled="">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">Thorntonkk</span>
									<input class="tabledit-input form-control input-sm" type="text" name="Last" value="Thornton" disabled="">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">@mdo</span>
									<select class="tabledit-input form-control input-sm" name="Nickname" disabled="" style="display:none;">
				<option value="1">@mdo</option>
				<option value="2">@fat</option>
				<option value="3">@twitter</option>
			</select>
								</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td class="tabledit-view-mode"><span class="tabledit-span">Larry</span>
									<input class="tabledit-input form-control input-sm" type="text" name="First" value="Larry" disabled="">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">the Bird</span>
									<input class="tabledit-input form-control input-sm" type="text" name="Last" value="the Bird" disabled="">
								</td>
								<td class="tabledit-view-mode"><span class="tabledit-span">@mdo</span>
									<select class="tabledit-input form-control input-sm" name="Nickname" disabled="" style="display:none;">
				<option value="1">@mdo</option>
				<option value="2">@fat</option>
				<option value="3">@twitter</option>
			</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- Edit With Button card end -->
	</div>
	<!-- Page-body end -->
</div>


<?php include './footer.php'; ?>