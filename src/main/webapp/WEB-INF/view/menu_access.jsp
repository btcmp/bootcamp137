<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu Access</title>
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
			$('#modalAdd').modal();
		});
		
		//button save when click button add
		$(document).on('click', '#btn-save-add', function(event){
			event.preventDefault();
			var menuAccess = {
					mRoleId:{
						id : $('#roleAdd option:selected').val()
					},
					mMenuId:{
						id : $('#menuAdd option:selected').val()
					}
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/menu_access/save',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(menuAccess),
				success:function(data){
					console.log(data);
					window.location = '${pageContext.request.contextPath}/menu_access'
				},
				error:function(){
					alert('error');
				}
			});
		});
		
		//delete icon
		var delCode;
		$(document).on('click', '.delete', function(){
			delCode = $(this).attr('del-id');
			$('#modalDelete').modal();
		});
		
		//button delete function
		$('#btnDel').on('click', function(){
			//alert('tes');
			window.location="${pageContext.request.contextPath}/menu_access/delete/" +delCode;
		});
		
		//view icon
		$(document).on('click', '.view', function(){
			var viewCode = $(this).attr('view-id');
			$.ajax({
				url: '${pageContext.request.contextPath}/menu_access/getmenuaccess?id=' + viewCode,
				type: 'GET',
				success:function(data){
					
					$('#roleView').val(data.mRoleId.name);
					$('#menuView').val(data.mMenuId.name);
					console.log(data);
				},
				error:function(){
					alert('Data not found');
				},
				dataType: 'JSON'
			});
			$('#modalView').modal();
		});
		
		//edit icon
		$(document).on('click', '.edit', function(){
			var editCode = $(this).attr('edit-id');
			console.log(editCode);
			$.ajax({
				url: '${pageContext.request.contextPath}/menu_access/getmenuaccess?id=' + editCode,
				type: 'GET',
				success:function(data){
					$('#id').val(data.id);
					$('#roleEdit').val(data.mRoleId.id);
					$('#menuEdit').val(data.mMenuId.id);
					console.log(data);
					
				},
				error:function(){
					alert('Data not found');
				},
				dataType: 'JSON'
			});
			$('#modalEdit').modal();
		});
		
		//button update function
		$('#btn-save-edit').on('click', function(){
			var menuAccess = {
					id: $('#id').val(),
					mRoleId:{
						id : $('#roleEdit option:selected').val()
					},
					mMenuId:{
						id : $('#menuEdit option:selected').val()
					}
			}
			console.log(menuAccess);
			$.ajax({
				url:'${pageContext.request.contextPath}/menu_access/update',
				type:'PUT',
				data:JSON.stringify(menuAccess),
				contentType:'application/json',
				success:function(data){
					alert('update ok');
					console.log(data);
					window.location = '${pageContext.request.contextPath}/menu_access'
				},error:function(){
					alert('gagal update');
				}
			});
		});
		
		//search button
		$('#btnSearch').on('click', function(){
			var form = $("#formmenuaccess");
			var data = form.serialize();
			console.log(data);
			if(data == "maCreatedDate=&maCreatedBy="){
				window.location = '${pageContext.request.contextPath}/menu_access'	
			}
			else{
				window.location = '${pageContext.request.contextPath}/menu_access/search?'+data;	
			}
		});

		
	});
</script>

</head>
<body>

	<div style="height:40px;background-color:#0069D9;margin-bottom:10px">
		<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List Role</h5>
	</div>
	
	<div style="width:98%;margin:auto;">
		<ol class="breadcrumb">
  			<li><a href="#">Home </a>/</li>
  			<li><a href="#"> Master </a>/</li>
 		 	<li class="active">Menu Access</li>
		</ol>
    

    	<a href="#" class="btn btn-primary btn-add" style="width:70px;float:right;">Add</a><br/><br/>
		<form id="formmenuaccess">
    	<div class="form-row">
    		<div class="col">
    			<select id="roleCode" class="form-control">
	    				<option value="" selected>- Select Role Code -</option>
	    				<c:forEach items="${listRoleComponent}" var="role">
	    					<option value="${role.code}">${role.code}</option>
	    				</c:forEach>
	    		</select>
    		</div>
    		<div class="col">
    			<input type="text" class="form-control" id="role-name" placeholder="- Select Role Name -">
    		</div>
    		<div class="col-auto">
	    			<input placeholder="Created" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="create-date" name="maCreatedDate">	
	    	</div>
    		<div class="col-auto">
	    			<input placeholder="Created By" class="form-control" type="text" name="maCreatedBy">	
	    	</div>
    		<div class="col-auto">
    			<a href="#" id="btnSearch" class="btn btn-warning" style="width:70px;color:white;">Search</a>
    		</div>
    	</div>
    	</form>
    	
    	<table class="table">
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
		  	<tbody>
		    	<c:forEach items="${listMenuAccess}" var="menuAccess">
					<tr>
						<td class="counterCell"></td>
						
						<td>${menuAccess.mRoleId.code}</td>
						<td>${menuAccess.mRoleId.name}</td>
						<td>${menuAccess.createdDate}</td>
						<td>${menuAccess.createdBy}</td>
						<td>
							<a href="#" style="color:inherit" class="view" view-id="${menuAccess.id}"><i class="fas fa-search"></i></a>
							<a href="#" style="color:inherit" class="edit" edit-id="${menuAccess.id}"><i class="fas fa-pencil-alt"></i></a>
							<a href="#" style="color:inherit" class="delete" del-id="${menuAccess.id}"><i class="fas fa-trash"></i></a>
						</td>
					</tr>
				</c:forEach>
		  	</tbody>
		</table>
	</div>

	<!-- Modal Add-->
		<div class="modal fade bd-example-modal-lg" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content" style="width:50%">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add Menu Access</h5>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
		      
			      	<div class="row">
					  <div class="col">
						<div class="row">  	
						  	<div class="col">
						      <label for="name">* Role Id</label>
						    </div>
						    <div class="col" id="roleAdd">
						       <select class="form-control" style="font-size: 12px;">
						       		<option>Select Role Name</option>
						       		<c:forEach items="${listRole}" var="role">
						       			<option value="${role.id}">${role.name}</option>
						       		</c:forEach>
						       </select>
						    </div>
						</div>
						
						<div class="row">  	
						  	<div class="col">
						      <label for="name">* Menu Access</label>
						    </div>
							<div class="col"style="margin-left:10px;" id="menuAdd">
								<select class="form-control" style="font-size: 12px;">
						       		<option>Select Menu Access</option>
						       		<c:forEach items="${listMenu}" var="menu">
						       			<option value="${menu.id}">${menu.name}</option>
						       		</c:forEach>
						       </select>
						       <%-- <c:forEach items="${listMenu}" var="menu">
							      	<input type="checkbox" id="menuAdd" name="menuadd" value="${menu.id}"/>
									<span>${menu.name}</span><br/>
								</c:forEach> --%>
						    </div>
						</div>					  
					  </div>
					  
					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		      <button type="button" class="btn btn-primary" value="testing" id="btn-save-add">Save</button>
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
	
 		<!-- Modal Edit-->
		<div class="modal fade bd-example-modal-lg" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content" style="width:50%">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add User</h5>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
		      
			      	<div class="row">
					  <div class="col">
					  	<!-- <div class="row">
					  		<input type="hidden" id="id" class="form-control">
					  	</div> -->
						<div class="row">  	
						  	<div class="col">
						  	<input type="hidden" id="id">
						      <label for="name">* Role Id</label>
						    </div>
						    <div class="col">
						       	<select class="form-control" id="roleEdit" style="font-size: 12px;">
						       		<c:forEach items="${listRole}" var="role">
						       			<option value="${role.id}">${role.name}</option>
						       		</c:forEach>
						       </select>
						    </div>
						</div>
						
						<div class="row">  	
						  	<div class="col">
						      <label for="name">* Menu Access</label>
						    </div>
						</div>
						<div class="row">
							<div class="col" style="margin-left:10px;">
							<select class="form-control" id="menuEdit" style="font-size: 12px;">
						       		<c:forEach items="${listMenu}" var="menu">
						       			<option value="${menu.id}">${menu.name}</option>
						       		</c:forEach>
						       </select>
							<%-- <c:forEach items="${listMenu}" var="menu">
						      	<input type='checkbox' name='id[0]' id='menuEdit' value="${menu.id}"/>
								<span>${menu.name}</span><br/>
							</c:forEach> --%>	
						    </div>
						</div>					  
					  </div>
					  
					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		      <button type="button" class="btn btn-primary" value="testing" id="btn-save-edit">Save</button>
		      <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Cancel</button>
			  	
		      </div>
		    </div>
		  </div>
		</div>
		
 		<!-- Modal View-->
		<div class="modal fade bd-example-modal-lg" id="modalView" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content" style="width:50%">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">View Menu Access</h5>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
		      
			      	<div class="row">
					  <div class="col">
						<div class="row">  	
						  	<div class="col">
						      <label for="name">* Role Id</label>
						    </div>
						    <div class="col">
						       		<input type="text" id="roleView" class="form-control" disabled>
						    </div>
						</div>
						
						<div class="row">  	
						  	<div class="col" style="margin-left:10px;">
						      <label for="name">* Menu Access</label>
						    </div>
						</div>
						<div class="row">
							<div class="col" style="margin-left:10px;">
								<input type="text" id="menuView" class="form-control" disabled>
							<%-- <c:forEach items="${listMenu}" var="menu">
						      	<input type='checkbox' name='id[0]' id='menuView' value="${menu.id}"/>
								<span>${menu.name}</span><br/>
							</c:forEach>	 --%>
						    </div>
						</div>					  
					  </div>
					  
					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		      <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Cancel</button>
			  	
		      </div>
		    </div>
		  </div>
		</div>


</body>
</html>