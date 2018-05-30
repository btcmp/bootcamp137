<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu</title>
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

<script>
	$(document).ready(function(){

		//add data event listener
		$(document).on('click', '.btn-add', function(event){
			$('#btnAddModal').modal();
		});
		
		//button save when click button add
		$(document).on('click', '#btnSave', function(event){
			//alert('test');
			event.preventDefault();
			alert('testdata');
			var menu = {
					code: $("#codeAdd").val(),
					name: $("#nameAdd").val(),
					controller: $("#controllerAdd").val(),
					parentId: {
						id : $('#menuNameAdd option:selected').val()
					}
				}
			console.log(menu); //deskripsi data yang dikirimkan server
			$.ajax({
				url: '${pageContext.request.contextPath}/menu/save',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(menu),
				success:function(data){
					console.log(data);
					window.location = '${pageContext.request.contextPath}/menu'
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
			$('#modalDelete').modal();
		});
		
		//button delete function
		$('#btnDel').on('click', function(){
			//alert('tes');
			window.location="${pageContext.request.contextPath}/menu/delete/" +delCode;
		});
		
		//view icon
		$(document).on('click', '.iconView', function(){
			var viewCode = $(this).attr('view-id');
			$.ajax({
				url: '${pageContext.request.contextPath}/menu/getmenu/' + viewCode,
				type: 'GET',
				success:function(data){
					$('#idView').val(data.id);
					$('#codeView').val(data.code);
					$('#nameView').val(data.name);
					$('#controllerView').val(data.controller);
					$('#menuNameView').val(data.parentId.id);
					console.log(data);
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
				url: '${pageContext.request.contextPath}/menu/getmenu/' + editCode,
				type: 'GET',
				success:function(data){
					$('#id').val(data.id);
					$('#codeEdit').val(data.code);
					$('#nameEdit').val(data.name);
					$('#controllerEdit').val(data.controller);
					$('#menuNameEdit').val(data.parentId.id);
					
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
			var menu = {
				id: $('#id').val(),
				name: $('#nameEdit').val(),
				controller: $('#controllerEdit').val()
			}
			$.ajax({
				url:'${pageContext.request.contextPath}/menu/update',
				type:'POST',
				data:JSON.stringify(menu),
				contentType:'application/json',
				success:function(data){
					alert('update ok');
					console.log(data);
					window.location = '${pageContext.request.contextPath}/menu'
				},error:function(){
					alert('gagal update');
				}
			});
		});

		//search button
		$('#btnSearch').on('click', function(){
			var form = $("#formmenu");
			var data = form.serialize();
			console.log(data);
			window.location = '${pageContext.request.contextPath}/menu/search?'+data;
		});
		
	});
</script>

</head>
<body>

	<div style="height:40px;background-color:#0069D9;margin-bottom:10px">
		<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List Menu</h5>
	</div>
	
	<div style="width:98%;margin:auto;">
		<ol class="breadcrumb">
  			<li><a href="#">Home </a>/</li>
  			<li><a href="#"> Master </a>/</li>
 		 	<li class="active">Menu</li>
		</ol>
    

    	<a href="#" class="btn btn-primary btn-add" style="width:70px;float:right;">Add</a><br/><br/>
		<form id="formmenu">
	    	<div class="form-row">
	    		<div class="col ">
	    			<select id="data-menu-code" class="form-control" name="menucode">
	    				<option value="" selected>- Select Menu Code -</option>
	    				<c:forEach items="${listMenuComponent}" var="menu">
	    					<option value="${menu.code}">${menu.code}</option>
	    				</c:forEach>
	    			</select>
	    		</div>
	    		<div class="col">
	    			<select id="data-menu-name" class="form-control" name="menuname">
	    				<option value="" selected>- Select Menu Name -</option>
	    				<c:forEach items="${listMenuComponent}" var="menu">
	    					<option value="${menu.name}">${menu.name}</option>
	    				</c:forEach>
	    			</select>
	    		</div>
	    		<div class="col-auto">
	    			<input placeholder="Created" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="create-date" menu="menucreateddate">	
	    		</div>
	    		<div class="col-auto">
	    			<input placeholder="Created By" class="form-control" type="text" name="menucreatedby">	
	    		</div>
	    		<div class="col-auto">
	    			<a href="#" id="btnSearch" class="btn btn-warning" style="width:70px;color:white;">Search</a>
	    		</div>
	    	</div>
    	</form>
    	<table id="data-menu" class="table" style="margin-top:10px;">
			<thead>
		    	<tr>
		      		<th scope="col">No</th>
					<th scope="col">Code</th>
					<th scope="col">Menu Name</th>
					<th scope="col">Created Date</th>
					<th scope="col">Created By</th>
					<th scope="col">Action</th>
		    	</tr>
		  	</thead>
		  	<tbody id="menu">
		    	<c:forEach items="${listMenu}" var="menu">
					<tr role-id='${menu.id }'>
						<td class="counterCell"></td>
						<td>${menu.code }</td>
						<td>${menu.name }</td>
						<td>${menu.createdDate }</td>
						<td>${menu.createdBy }</td>
						<td>
							<a href="#" style="color:inherit" class="iconView" view-id="${menu.id}"><i class="fas fa-search"></i></a>
							<a href="#" style="color:inherit" class="iconEdit" edit-id="${menu.id}"><i class="fas fa-pencil-alt"></i></a>
							<a href="#" style="color:inherit" class="iconDelete" del-id="${menu.id}"><i class="fas fa-trash"></i></a>
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
	        <h5 class="modal-title" id="exampleModalLongTitle">Add Menu</h5>
	      </div>
	      <div class="modal-body">
	      
	      	<form>
			  <div class="modal-body">
			    <div class="col">
			      * Menu Code <input type="text" id="codeAdd" class="form-control" placeholder="${result}" value="${result}" disabled>
			    </div>
			    <div class="col">
			      * Menu Name <input type="text" id="nameAdd" class="form-control" placeholder="Type Menu Name">
			    </div>
			    <div class="col">
			      * Controller Name <input type="text" id="controllerAdd" class="form-control" placeholder="Type Controller">
			    </div>
			    <div class="col">
			      		* Parent 
<!-- 			      		<input type="text" id="parentView" class="form-control" disabled> -->
							<input type="hidden" id="idAdd">
							<select id="menuNameAdd" class="form-control" name="menuname">
	    						<option value=0>- Select Menu Code -</option>
	    						<c:forEach items="${listMenu}" var="menu">
	    						<option value="${menu.id }">${menu.name}</option>
	    						</c:forEach>
	    					</select>
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
		        <h5 class="modal-title" id="exampleModalLongTitle">Edit Menu</h5>
		      </div>
		      <div class="modal-body">
		      
		      	<form>
				  <div class="modal-body">
				    <div class="col">
				    	<input type="hidden" id="id"/>
				      * Menu Code <input type="text" id="codeEdit" class="form-control" placeholder="${result}" value="${ result}" disabled>
				    </div>
				    <div class="col">
				      * Menu Name <input type="text" id="nameEdit" class="form-control">
				    </div>
				    <div class="col">
				      * Controller Name <input type="text" id="controllerEdit" class="form-control">
				    </div>
				    <div class="col">
			      		* Parent 
<!-- 			      		<input type="text" id="parentView" class="form-control" disabled> -->
							<input type="hidden" id="idEdit">
							<select id="menuNameEdit" class="form-control" name="menucode">
	    						<option value="" selected>- Select Menu Code -</option>
	    						<c:forEach items="${listMenu}" var="menu">
	    						<option value="${menu.name}">${menu.name}</option>
	    						</c:forEach>
	    					</select>
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
	        <h5 class="modal-title" id="exampleModalLongTitle">View Menu</h5>
	      </div>
	      <div class="modal-body">
	      
	      	<form>
			  <div class="modal-body">
			    <div class="col">
			      * Menu Code <input type="text" id="codeView" class="form-control" placeholder="${result}" disabled>
			    </div>
			    <div class="col">
			      * Menu Name <input type="text" id="nameView" class="form-control" disabled>
			    </div>
			    <div class="col">
			      * Controller Name <input type="text" id="controllerView" class="form-control" disabled>
			    </div>
			    <div class="col">
			      * Parent 
<!-- 			      	<input type="text" id="parentView" class="form-control" disabled> -->
					<input type="hidden" id="idView">
			      	<select id="menuNameView" class="form-control" name="menuname">
			      				<option value="" selected>- Select Menu Code -</option>
	    						<c:forEach items="${listMenu}" var="menu">
	    						<option value="${menu.id}">${menu.name}</option>
	    						</c:forEach>
	    			</select>
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

</body>
</html>