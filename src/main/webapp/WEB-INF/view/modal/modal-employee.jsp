	<style>
table, td, tr {    
    
    text-align: right;
}

table {
    border-collapse: collapse;
    width: 100%;
}

tr, td {
    padding: 5px;
}

.row{
	margin:2px;
}

</style>
		
		<!-- Modal Add -->
	<div class="modal fade bd-example-modal-lg" id="modal-add" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">Add Souvenir</h5>
	      </div>
	      <div style="width:95%;margin:auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
	      <div class="modal-body">
	      
		      <form>
		      	<div class="row">
		      		<div class="col-md-2">
		      			<label>Emp Id Number</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input type="text" class="form-control" placeholder="Type Emp ID number" id="codeEmployee" >
		      		</div>
		      		<div class="col-md-2">
		      			<label>Company Name</label>
		      		</div>
		      		<div class="col-md-4" id="mCompanyId">
		      			<select class="form-control">
		      				<c:forEach items="${listCompany}" var="company">
									<option value="${company.id}">${company.name}</option>
							</c:forEach>
		    			</select>
		      		</div>
		      	</div>
		      	
		      	<p></p>
		      	
		      	<div class="row">
		      		<div class="col-md-2">
		      			<label>First Name</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input type="text" class="form-control" placeholder="Type First Name" id="firstName">
		      		</div>
		      		<div class="col-md-2">
		      			<label>Email</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input type="text" class="form-control" placeholder="Type Email" id="email">
		      		</div>
		      	</div>
		      	<p></p>
		      	<p></p>
		      	<p></p>
		      		<div class="row">
		      		<div class="col-md-2">
		      			<label>Last Name</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input type="text" class="form-control" placeholder="Type Last Name" id="lastName">
		      		</div>
		      		<div class="col-md-2">
		      		</div>
		      		<div class="col-md-4">
		      		</div>
		      	</div>
		      </form>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" id="btn-submit-add" class="btn btn-primary">Save</button>
	        <button type="button" class="btn btn-warning save-btn" style="color:white;" data-dismiss="modal">Cancel</button>
	      </div>
	      </div>
	    </div>
	  </div>
	</div>	
	
		
		<!-- Modal DETAIL-->
	<div class="modal fade bd-example-modal-lg" id="modal-detail" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">Add Souvenir</h5>
	      </div>
	      <div style="width:95%;margin:auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
	      <div class="modal-body">
	      
		      <form>
		      	<div class="row">
		      		<div class="col-md-2">
		      			<label>Emp Id Number</label>
		      		</div>
		      		<div class="col-md-4">
		      			 <input type="text" id="codeDetail" class="form-control" placeholder="Type Emp ID number"  disabled>
		      		</div>
		      		<div class="col-md-2">
		      			<label>Company Name</label>
		      		</div>
		      		<div class="col-md-4 id="mCompanyId">
		      			<input type="text" class="form-control" placeholder="Type Id Company" id="idCompanyDetail" disabled >
		      		</div>
		      	</div>
		      	
		      	<p></p>
		      	
		      	<div class="row">
		      		<div class="col-md-2">
		      			<label>First Name</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input type="text" class="form-control" placeholder="Type First Name" id="firstNameDetail" disabled>
		      		</div>
		      		<div class="col-md-2">
		      			<label>Email</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input type="text" class="form-control" placeholder="Type Email" id="emailDetail" disabled>
		      		</div>
		      	</div>
		      	<p></p>
		      		<div class="row">
		      		<div class="col-md-2">
		      			<label>Last Name</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input type="text" class="form-control" placeholder="Type Last Name" id="lastNameDetail" disabled>
		      		</div>
		      		<div class="col-md-2">
		      		</div>
		      		<div class="col-md-4">
		      		</div>
		      	</div>
		      </form>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-warning save-btn" style="color:white;" data-dismiss="modal">Cancel</button>
	      </div>
	      </div>
	    </div>
	  </div>
	</div>	
	
	
		<!-- Modal EDIT-->
	<div class="modal fade bd-example-modal-lg" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">Add Souvenir</h5>
	      </div>
	      <div style="width:95%;margin:auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
	      <div class="modal-body">
	      
		      <form>
		      	<div class="row">
		      		<div class="col-md-2">
		      			<label>Emp Id Number</label>
		      		</div>
		      		<div class="col-md-4">
		      			 <input type="hidden" id="idEdit" class="form-control">
		      			 <input type="text" id="codeEdit" class="form-control" placeholder="Type Emp ID number"  >
		      		</div>
		      		<div class="col-md-2">
		      			<label>Company Name</label>
		      		</div>
		      		<div class="col-md-4" >
		      			<select class="form-control" id="idCompanyEdit">
		      				<c:forEach items="${listCompany}" var="company">
									<option value="${company.id}">${company.name}</option>
							</c:forEach>
		    			</select>
		      		</div>
		      	</div>
		      	
		      	<p></p>
		      	
		      	<div class="row">
		      		<div class="col-md-2">
		      			<label>First Name</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input type="text" class="form-control" placeholder="Type First Name" id="firstNameEdit" >
		      		</div>
		      		<div class="col-md-2">
		      			<label>Email</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input type="text" class="form-control" placeholder="Type Email" id="emailEdit" >
		      		</div>
		      	</div>
		      	<p></p>
		      		<div class="row">
		      		<div class="col-md-2">
		      			<label>Last Name</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input type="text" class="form-control" placeholder="Type Last Name" id="lastNameEdit" >
		      		</div>
		      		<div class="col-md-2">
		      		</div>
		      		<div class="col-md-4">
		      		</div>
		      	</div>
		      </form>
	      </div>
	      <div class="modal-footer">
	      	 <button type="button" class="btn btn-primary" id="btn-submit-edit" >Save</button>
	        <button type="button" class="btn btn-warning save-btn" style="color:white;" data-dismiss="modal">OK</button>
	      </div>
	      </div>
	    </div>
	  </div>
	</div>	
	
	
	
	<!-- MODAL DELETE -->
	<div class="modal" tabindex="-1" id="modal-delete" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Are you sure to delete this?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary"  id="btn-submit-delete" data-dismiss="modal">Yes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
      </div>
    </div>
  </div>
</div>
	