<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Data User</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style type="text/css">
table {
    counter-reset: tableCount;     
}
.counterCell:before {              
    content: counter(tableCount); 
    counter-increment: tableCount; 
}
</style>

<style>
	#header{
		height:40px;
		background-color:#0069D9;
		margin-bottom:10px;
	}
	
	#header h5{
		font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;
		padding-top:8px;
		padding-left:8px;
		color:white;
	}
	
	#body1{
		width:98%;
		margin:auto;
	}
	
	#btn-add{
		width:70px;
		float:right;
		color:white;
	}
	
	#btn-search{
		width:70px;
		color:white;
	}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		//add button
		$('#btn-add').on('click', function(){
			$('#modalAdd').modal();
		});
		
		//Submit Add
		$(document).on('click', '#btn-save-add', function(event){
			event.preventDefault();
			var user={
				mEmployeeId:{
					id : $('#m-employee-id option:selected').val()
				},
				listRole:[],
				username: $('#username-add').val(),
				password: $('#password-add').val()
			}			
			
			user.listRole.push({
				id: $('#m-role-id option:selected').val()
			});
			
			$.ajax({
				url: '${pageContext.request.contextPath}/user/save',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify(user),
				success:function(data){
					//console.log(data);
					window.location = '${pageContext.request.contextPath}/user'
				},
				error:function(){
					alert('error');
				}
			});
		});
		
		$('.edit').on('click', function(){
			var editCode = $(this).attr('edit-id');
			console.log(editCode);
			$.ajax({
				url: '${pageContext.request.contextPath}/menu/getmenu/' + editCode,
				type: 'GET',
				success:function(data){
					$('#id').val(data.id);
					$('#roleEdit').val(data.listRole[0].name);
					$('#employeeEdit').val(data.mEmployeeId.firstName);
					$('#usernameEdit').val(data.username);
					$('#passwordEdit').val(data.password);
					console.log(data);	
				},
				error:function(){
					alert('Data not found');
				},
				dataType: 'JSON'
			});
			$('#modalEdit').modal();
		});
		
		//view data
		$(document).on('click', '.view', function(){
			var viewCode = $(this).attr('view-id');
			$.ajax({
				url: '${pageContext.request.contextPath}/user/getuser?id=' + viewCode,
				type: 'GET',
				success:function(data){
					$('#roleView').val(data.listRole[0].name);
					$('#employeeView').val(data.mEmployeeId.firstName);
					$('#usernameView').val(data.username);
					$('#passwordView').val(data.password);
					console.log(data);
				},
				error:function(){
					alert('Data not found');
				},
				dataType: 'JSON'
			});
			$('#modalView').modal();
		});
		
		//delete
		var delCode;
		$(document).on('click', '.delete', function(){
			delCode = $(this).attr('del-id');
			console.log(delCode);
			$('#modalDelete').modal();
		});
		
		//button delete function
		$('#btnDel').on('click', function(){
			//alert('tes');
			window.location="${pageContext.request.contextPath}/user/delete/" +delCode;
		});
	});
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<h5>List User<h5>
		</div>
		<div id="body">
			<div id="body1">
				<ol class="breadcrumb">
					<li><a href="#">Home </a>/</li>
					<li><a href="#">Master </a>/</li>
					<li class="active">List User</li>
				</ol>
				
				<a href="#" class="btn btn-sm btn-primary" id="btn-add">Add</a><br><br>
				
				<div class="form-row">
					<div class="col-auto">
						<input type=text name="employee" id="empName" class="form-control" placeholder="Select Employee Name">
					</div class="col-auto">
					<div class="col-auto">
						<input type=text name="role" id="roleName" class="form-control" placeholder="Select Role Name">
					</div class="col-auto">
					<div class="col-auto">
						<input type=text name="company" id="companyName" class="form-control" placeholder="Select Company Name">
					</div class="col-auto">
					<div class="col-auto">
						<input type=text name="user" id="username" class="form-control" placeholder="Username">
					</div class="col-auto">
					<div class="col">		
						<input type=text name="crdate" id="createdDate" class="form-control" placeholder="Created Date">
					</div>
					<div class="col-auto">		
						<input type=text name="crby" id="createdBy" class="form-control" placeholder="Created By">
					</div>
					<div class="col-auto">		
						<a href="#" class="btn btn-sm btn-warning" id="btn-search" data-toggle="modal" data-target="#exampleModalCenter" >Search</a>
					</div>
				</div>
			</div>
			
			<div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">Employee</th>
							<th scope="col">Role</th>
							<th scope="col">Company</th>
							<th scope="col">Username</th>
							<th scope="col">Created Date</th>
							<th scope="col">Created By</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					
					<tbody>
					<c:forEach items="${listUser}" var="user">
						<tr user-id='${user.id }'>
							<td class="counterCell"></td>
							<td>${user.mEmployeeId.firstName} ${user.mEmployeeId.lastName}</td>
							<td>
							<c:forEach items="${user.listRole}" var="role">
								<a>${role.name}</a>
							</c:forEach>
							</td>
							<td>${user.mEmployeeId.mCompanyId.name}</td>
							<td>${user.username}</td>
							<td>${user.createdDate}</td>
							<td>${user.createdBy}</td>
							<td>
								<a href="#" class="view" view-id="${user.id}"><i class="fas fa-search"></i></a>
								<a href="#" class="edit" edit-id="${user.id}"><i class="fas fa-pencil-alt"></i></a>
								<a href="#" class="delete" del-id="${user.id}"><i class="fas fa-trash"></i></a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- Modal Add-->
		<div class="modal fade bd-example-modal-lg" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add User</h5>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
		      
			      	<div class="row">
					  <div class="col">
						<div class="row">  	
						  	<div class="col">
						      <label for="name">* Role Name</label>
						    </div>
						    <div class="col" id="m-role-id">
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
						      <label for="name">* Employee Name</label>
						    </div>
						    <div class="col" id="m-employee-id">
						       <select class="form-control" style="font-size: 12px;">
						       		<option>Select Employee Name</option>
						       		<c:forEach items="${listEmployee}" var="employee">
						       			<option value="${employee.id}">${employee.firstName} ${employee.lastName}</option>
						       		</c:forEach>
						       </select>
						    </div>
						</div>					  
					  </div>
					  
					  <div class="col">
						  <div class="row">  
						  	<div class="col">
						      <label for="name">* Username</label>
						    </div>
						    <div class="col">
						       <input type="text" class="form-control" id="username-add" aria-describedby="emailHelp" placeholder="Type Username">
						    </div>
						  </div>
						  
						   <div class="row">  
						  	<div class="col">
						      <label for="name">* Password</label>
						    </div>
						    <div class="col">
						       <input type="password" class="form-control" id="password-add" name="pass" aria-describedby="emailHelp" placeholder="Type Password">
						    </div>
						  </div>
						  
						  <!-- <div class="row">  
						  	<div class="col">
						      <label for="name">* Re-Type Password</label>
						    </div>
						    <div class="col">
						       <input type="password" class="form-control" id="repassword" name="repass" aria-describedby="emailHelp" placeholder="Re-Type Password">
						       <span id='message'></span>
						    </div>
						  </div> -->
						  
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
		
		<!-- Modal Edit-->
		<div class="modal fade bd-example-modal-lg" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">Edit User</h5>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
		      
			      	<div class="row">
					  <div class="col">
						<div class="row">  	
						  	<div class="col">
						      <label for="name">* Role Name</label>
						    </div>
						    <div class="col" id="roleEdit">
						        <select class="form-control" style="font-size: 12px;">
						       		<c:forEach items="${listRole}" var="role">
						       			<option value="${role.id}">${role.name}</option>
						       		</c:forEach>
						       </select>
						    </div>
						</div>
						
						<div class="row">  	
						  	<div class="col">
						      <label for="name">* Employee Name</label>
						    </div>
						    <div class="col" id="employeeEdit">
						       <select class="form-control" style="font-size: 12px;">
						       		<c:forEach items="${listEmployee}" var="employee">
						       			<option value="${employee.id}">${employee.firstName} ${employee.lastName}</option>
						       		</c:forEach>
						       </select>
						    </div>
						</div>					  
					  </div>
					  
					  <div class="col">
						  <div class="row">  
						  	<div class="col">
						      <label for="name">* Username</label>
						    </div>
						    <div class="col">
						       <input type="text" class="form-control" id="usernameEdit" aria-describedby="emailHelp">
						    </div>
						  </div>
						  
						   <div class="row">  
						  	<div class="col">
						      <label for="name">* Password</label>
						    </div>
						    <div class="col">
						       <input type="password" class="form-control" id="passwordEdit" aria-describedby="emailHelp">
						    </div>
						  </div>
						  
						  <!-- <div class="row">  
						  	<div class="col">
						      <label for="name">* Re-Type Password</label>
						    </div>
						    <div class="col">
						       <input type="password" class="form-control" id="repassword-edit" aria-describedby="emailHelp">
						    </div>
						  </div> -->
						  
						 </div>
					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		      <button type="button" class="btn btn-primary" value="testing" id="btn-save-update">Update</button>
		      <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Cancel</button>
			  	
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal View-->
		<div class="modal fade bd-example-modal-lg" id="modalView" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">View User</h5>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
		      
			      	<div class="row">
					  <div class="col">
						<div class="row">  	
						  	<div class="col">
						      <label for="name">* Role Name</label>
						    </div>
						    <div class="col">
						       <input type="text" id="roleView" class="form-control" disabled>
						    </div>
						</div>
						
						<div class="row">  	
						  	<div class="col">
						      <label for="name">* Employee Name</label>
						    </div>
						    <div class="col">
						       <input type="text" id="employeeView" class="form-control" disabled>
						    </div>
						</div>					  
					  </div>
					  
					  <div class="col">
						  <div class="row">  
						  	<div class="col">
						      <label for="name">* Username</label>
						    </div>
						    <div class="col">
						       <input type="text" class="form-control" id="usernameView" aria-describedby="emailHelp" disabled>
						    </div>
						  </div>
						  
						   <div class="row">  
						  	<div class="col">
						      <label for="name">* Password</label>
						    </div>
						    <div class="col">
						       <input type="password" class="form-control" id="passwordView" aria-describedby="emailHelp" disabled>
						    </div>
						  </div>
						  
						  <!-- <div class="row">  
						  	<div class="col">
						      <label for="name">* Re-Type Password</label>
						    </div>
						    <div class="col">
						       <input type="password" class="form-control" id="repassword-view" aria-describedby="emailHelp" disabled>
						    </div>
						  </div> -->
						  
						 </div>
					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		      <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Close</button>
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
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-footer">
	        <button id="btnDel" type="button" class="btn btn-primary">Delete</button>
	        <button  type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
	      </div>
	    </div>
	  	</div>
	</div>
		
	</div>
</body>
</html>