<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Role</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>

<style type="text/css">
table {
    counter-reset: tableCount;     
}
.counterCell:before {              
    content: counter(tableCount); 
    counter-increment: tableCount; 
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		//add data event listener
		$(document).on('click', '.btn-add', function(event){
			$('#btnAddModal').modal();
		});
		
		//button save when click button add
		$(document).on('click', '#btnSave', function(event){
			event.preventDefault();
			var role = {
					code: $("#codeAdd").val(),
					name: $("#nameAdd").val(),
					description: $("#descriptionAdd").val()
				}
			//console.log(role);
			$.ajax({
				url: '${pageContext.request.contextPath}/role/save',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(role),
				success:function(data){
					window.location = '${pageContext.request.contextPath}/role'
				},
				error:function(){
					alert('error');
				}
			});
		});
		
		//delete icon
		var delCode;
		$(document).on('click', '.iconDelete', function(){
			delCode = $(this).attr('del-id');
			console.log(delCode);
			$('#modalDelete').modal();
		});
		
		//button delete function
		$('#btnDel').on('click', function(){
			//alert('tes');
			window.location="${pageContext.request.contextPath}/role/delete/" +delCode;
		});
		
		//view icon
		$(document).on('click', '.iconView', function(){
			var viewCode = $(this).attr('view-id');
			$.ajax({
				url: '${pageContext.request.contextPath}/role/getrole/' + viewCode,
				type: 'GET',
				success:function(data){
					
					$('#codeView').val(data.code);
					$('#nameView').val(data.name);
					$('#descriptionView').val(data.description);
					//console.log(data);
				},
				error:function(){
					alert('Data not found');
				},
				dataType: 'JSON'
			});
			$('#btnViewModal').modal();
		});
		
		//edit icon
		$(document).on('click', '.iconEdit', function(){
			var editCode = $(this).attr('edit-id');
			console.log(editCode);
			$.ajax({
				url: '${pageContext.request.contextPath}/role/getrole/' + editCode,
				type: 'GET',
				success:function(data){
					$('#id').val(data.id);
					$('#codeEdit').val(data.code);
					$('#nameEdit').val(data.name);
					$('#descriptionEdit').val(data.description);
					
				},
				error:function(){
					alert('Data not found');
				},
				dataType: 'JSON'
			});
			$('.btnEditModal').modal();
		});
		
		//button update function
		$('#btnEdit').on('click', function(){
			var role = {
				id: $('#id').val(),
				name: $('#nameEdit').val(),
				description: $('#descriptionEdit').val()
			}
			$.ajax({
				url:'${pageContext.request.contextPath}/role/update',
				type:'POST',
				data:JSON.stringify(role),
				contentType:'application/json',
				success:function(data){
					alert('update ok');
					console.log(data);
					window.location = '${pageContext.request.contextPath}/role'
				},error:function(){
					alert('update failed');
				}
			});
		});
		
		//search button
		$('#btnSearch').on('click', function(){
			var form = $("#formrole");
			var data = form.serialize(); //untuk mengambil semua data yang ada di table
			console.log(data);
			if(data == "rolecode=&rolename=&rolecreateddate=&rolecreatedby="){
				window.location = '${pageContext.request.contextPath}/role';
			}
			else{
				window.location = '${pageContext.request.contextPath}/role/search?'+data;	
			} 			
		});
		
	});
</script>
</head>
<body>
	<!-- Logout -->
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>

	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h2>
			Welcome : ${pageContext.request.userPrincipal.name} | <a
				href="javascript:formSubmit()"> Logout</a>
		</h2>
	
	<div style="height:40px;background-color:#0069D9;margin-bottom:10px">
		<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List Role</h5>
	</div>
	
	<div style="width:98%;margin:auto;">
		<ol class="breadcrumb">
  			<li><a href="#">Home </a>/</li>
  			<li><a href="#"> Master </a>/</li>
 		 	<li class="active">Role</li>
		</ol>
    

    	<a href="#" class="btn btn-primary btn-add" style="width:70px;float:right;">Add</a><br/><br/>
		<form id="formrole">
	    	<div class="form-row" >
	    		<div class="col">
	    			<select id="data-role-code" class="form-control" name="rolecode">
	    				<option value="" selected>- Select Role Code -</option>
	    				<c:forEach items="${listRoleComponent}" var="role">
	    					<option id="roleCodeSearch" value="${role.code}">${role.code}</option>
	    				</c:forEach>
	    			</select>
	    		</div>
	    		<div class="col">
	    			<select id="data-role-name" class="form-control" name="rolename">
	    				<option value="" selected>- Select Role Name -</option>
	    				<c:forEach items="${listRoleComponent}" var="role">
	    					<option id="roleNameSearch" value="${role.name}">${role.name}</option>
	    				</c:forEach>
	    			</select>
	    		</div>
	    		<div class="col-auto">
	    			<input placeholder="Created" class="form-control" type="text" name="rolecreateddate" onfocus="(this.type='date')" onblur="(this.type='text')" id="create-date">	
	    		</div>
	    		<div class="col-auto">
	    			<input placeholder="Created By" class="form-control" type="text" name="rolecreatedby" id="create-by">	
	    		</div>
	    		<div class="col-auto">
	    			<a href="#" id="btnSearch" class="btn btn-warning" style="width:70px;color:white;">Search</a>
	    		</div>
	    	</div>
    	</form>
    	<table id="data-role" class="table" style="margin-top:10px;">
			<thead>
		    	<tr>
		      		<th scope="col">No</th>
					<th scope="col">Role Code</th>
					<th scope="col">Role Name</th>
					<th scope="col">Created Date</th>
					<th scope="col">Created By</th>
					<th scope="col">Action</th>
		    	</tr>
		  	</thead>
		  	<tbody id="role">
		    	<c:forEach items="${listRole}" var="role">
					<tr role-id='${role.id }'>
						<td class="counterCell"></td>
						<td>${role.code }</td>
						<td>${role.name }</td>
						<td>${role.createdDate }</td>
						<td>${role.createdBy }</td>
						<td>
							<a href="#" style="color:inherit" class="iconView" view-id="${role.id}"><i class="fas fa-search"></i></a>
							<a href="#" style="color:inherit" class="iconEdit" edit-id="${role.id}"><i class="fas fa-pencil-alt"></i></a>
							<a href="#" style="color:inherit" class="iconDelete" del-id="${role.id}"><i class="fas fa-trash"></i></a>
						</td>
					</tr>
				</c:forEach>
		  	</tbody>
		</table>
	</div>	
	
	<!-- Modal Add -->
	<div class="modal fade bd-example-modal-sm" id="btnAddModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">Add Role</h5>
	      </div>
	      <div class="modal-body">
	      
	      	<form>
			  <div class="modal-body">
			    <div class="col">
			      * Role Code <input type="text" id="codeAdd" class="form-control" placeholder="${result}" value="${ result}" disabled>
			    </div>
			    <div class="col">
			      * Role Name <input type="text" id="nameAdd" class="form-control" placeholder="Type Role Name">
			    </div>
			    <div class="col">
			      * Description <input type="text" id="descriptionAdd" class="form-control" placeholder="Type Description">
			    </div>
			  </div>
			</form>
			
	      </div>
	      <div class="modal-footer">
	        <button id="btnSave" type="button" class="btn btn-primary">Save</button>
	        <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Modal Delete -->
	<div id="modalDelete" class="modal" tabindex="-1" role="dialog">
	  	<div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Delete Data</h5>
	        <button type="button" class="close btn-danger" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-footer">
	        <button id="btnDel" type="button" class="btn btn-primary">Delete</button>
	        <button  type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
	      </div>
	    </div>
	  	</div>
	</div>
	
	<!-- Modal Edit -->
	<div class="modal fade bd-example-modal-sm btnEditModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">Edit Role</h5>
	      </div>
	      <div class="modal-body">
	      
	      	<form>
			  <div class="modal-body">
			    <div class="col">
			    	<input type="hidden" id="id"/>
			      * Role Code <input type="text" id="codeEdit" class="form-control" placeholder="${result}" value="${ result}" disabled>
			    </div>
			    <div class="col">
			      * Role Name <input type="text" id="nameEdit" class="form-control" placeholder="Type Role Name">
			    </div>
			    <div class="col">
			      * Description <input type="text" id="descriptionEdit" class="form-control" placeholder="Type Description">
			    </div>
			  </div>
			</form>
			
	      </div>
	      <div class="modal-footer">
	      	<button id="btnEdit" type="button" class="btn btn-primary">Update</button>
	        <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
		
	<!-- Modal View -->
	<div id="btnViewModal" class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">View Role</h5>
	      </div>
	      <div class="modal-body">
	      
	      	<form>
			  <div class="modal-body">
			    <div class="col">
			      * Role Code <input type="text" id="codeView" class="form-control" placeholder="${result}" disabled>
			    </div>
			    <div class="col">
			      * Role Name <input type="text" id="nameView" class="form-control" placeholder="Type Role Name" disabled>
			    </div>
			    <div class="col">
			      * Description <input type="text" id="descriptionView" class="form-control" placeholder="Type Description" disabled>
			    </div>
			  </div>
			</form>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
</c:if>
</body>
</html>