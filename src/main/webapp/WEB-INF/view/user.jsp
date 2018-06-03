<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
  <title>List User</title>
  	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
	  <!-- Tell the browser to be responsive to screen width -->
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
		<!-- Ionicons -->
	  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	  <!-- Theme style -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/dist/css/adminlte.min.css">
	  <!-- iCheck -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/plugins/iCheck/flat/blue.css">
	  <!-- Morris chart -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/plugins/morris/morris.css">
	  <!-- jvectormap -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
	  <!-- Date Picker -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/plugins/datepicker/datepicker3.css">
	  <!-- Daterange picker -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/plugins/daterangepicker/daterangepicker-bs3.css">
	  <!-- bootstrap wysihtml5 - text editor -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
	  <!-- Google Font: Source Sans Pro -->
	  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <style>
  input.parsley-error
{
	color: #B94A48 !important;
	background-color: #F2DEDE !important;
	border: 1px solid #EED3D7 !important;
}
  </style>
  
<!-- 	ini di copy buat validasi -->
  	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/parsley.min.js"></script>
<!-- 	ini di copy buat validasi -->
  	
  	
  	
  	
  	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script>
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
		
		var oCode1 = $('#username-add').parsley( {
			required : true,
			requiredMessage : ' must be filled!!',
			minlengthMessage: ' must more than 5 character',
			typeMessage: ' must be email character'
			
		} );
		
		var oCode2 = $('#password-add').parsley( {
			required : true,
			requiredMessage : ' must be filled!!',
			minlengthMessage: ' must more than 5 character',
			typeMessage: ' must be email character'
			
		} );
		
		var valid = getValid(oCode1);
			valid = getValid(oCode2);
		
		if(valid){
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
		}
		
		function getValid(validate){
			validate.validate();	
			return validate.isValid();
		}
	});
	
	//icon edit
	$('.edit').on('click', function(){
		var editCode = $(this).attr('edit-id');
		console.log(editCode);
		$.ajax({
			url: '${pageContext.request.contextPath}/user/getuser?id=' + editCode,
			type: 'GET',
			success:function(data){
				$('#id').val(data.id);
				$('#roleEdit').val(data.listRole[0].id);
				$('#employeeEdit').val(data.mEmployeeId.id);
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
	
	//button update function
	$('#btn-save-update').on('click', function(){
		var user = {
			id: $('#id').val(),
			mEmployeeId:{
				id : $('#employeeEdit option:selected').val()
			},
			listRole:[],
			username: $('#username-add').val(),
			password: $('#password-add').val()
		}
		user.listRole.push({
			id: $('#roleEdit option:selected').val()
		});
		$.ajax({
			url:'${pageContext.request.contextPath}/user/update',
			type:'POST',
			data:JSON.stringify(user),
			contentType:'application/json',
			success:function(data){
				alert('update ok');
				console.log(data);
				window.location = '${pageContext.request.contextPath}/user'
			},error:function(){
				alert('gagal update');
			}
		});
	});
	
	//view data
	$(document).on('click', '.view', function(){
		var viewCode = $(this).attr('view-id');
		$.ajax({
			url: '${pageContext.request.contextPath}/user/getuser?id=' + viewCode,
			type: 'GET',
			success:function(data){
				var fullName= data.mEmployeeId.firstName + ' ' +data.mEmployeeId.lastName;
				$('#roleView').val(data.listRole[0].name);
				$('#employeeView').val(fullName);
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
	
	//search button
	$('#btnSearch').on('click', function(){
		var form = $("#formuser");
		var data = form.serialize();
		console.log(data);
		if(data == "usernameSearch=&userCreatedDate=&userCreatedBy="){
			window.location = '${pageContext.request.contextPath}/user'	
		}
		else{
			window.location = '${pageContext.request.contextPath}/user/search?'+data;	
		}
	});
});
</script>
	  
</head>
<body class="hold-transition sidebar-mini">
<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
      </li>
    </ul>
   <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
   		<ol class="breadcrumb">
	  			<li> ${pageContext.request.userPrincipal.name}</li>
	  			<li><a href="javascript:formSubmit()"><i class="fas fa-door-open"></i></a></li>
	 		 
			</ol>
   
          
     
      
      
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img src="${pageContext.request.contextPath }/assets/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Marcom Apps</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
     <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link active">
          
               <i class="nav-icon fa fa-th"></i>
              <p>
                Master Menu
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
            <a href="${pageContext.request.contextPath }/company" class="nav-link">
              <i class="nav-icon fa fa-circle-o text-info"></i>
              <p>Company</p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="${pageContext.request.contextPath }/employee" class="nav-link">
              <i class="nav-icon fa fa-circle-o text-info"></i>
              <p>Employee</p>
            </a>
          </li>
         
          <li class="nav-item">
            <a href="${pageContext.request.contextPath }/unit" class="nav-link">
              <i class="nav-icon fa fa-circle-o text-info"></i>
              <p>Unit</p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="${pageContext.request.contextPath }/product" class="nav-link">
              <i class="nav-icon fa fa-circle-o text-info"></i>
              <p>Product</p>
            </a>
          </li>
          
           
		</ul>
     </li>
     
     <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link active">
               <i class="nav-icon fa fa-th"></i>
              <p>
                Transaction Menu
                <i class="right fa fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
	             <li class="nav-item">
	           		 <a href="${pageContext.request.contextPath }/event" class="nav-link">
	           	   <i class="nav-icon fa fa-circle-o text-info"></i>
	              <p>Event</p>
	            </a>
	          	</li>
	          
	          <li class="nav-item">
	            <a href="${pageContext.request.contextPath }/design" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-info"></i>
	              <p>Design</p>
	            </a>
	          </li>
	          
	          <li class="nav-item">
	            <a href="${pageContext.request.contextPath }/promotion" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-info"></i>
	              <p>Promotion</p>
	            </a>
	          </li>
	          
	         <li class="nav-item">
	            <a href="${pageContext.request.contextPath }/souvenir" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-info"></i>
	              <p>Souvernir</p>
	            </a>
	          </li>
	          
	          
		</ul>
     </li>
          
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
   

    <!-- Main content -->
    <section class="content">
    	<div class="container-fluid">
    	
    	<div style="height:40px;background-color:#0069D9;margin-bottom:10px">
		<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List User</h5>
	</div>
	
	<div style="width:98%;margin:auto;">
		<ol class="breadcrumb">
  			<li><a href="#">Home </a>/</li>
  			<li><a href="#"> Master </a>/</li>
 		 	<li class="active">User</li>
		</ol>
    

    	<a href="#" class="btn btn-primary" id="btn-add" style="width:70px;float:right;">Add</a><br/><br/>
		<form id="formuser">
    	<div class="form-row">
    		<div class="col">
    			<input type="text" class="form-control" id="employee-name" placeholder="- Select Employee Name -">
    		</div>
    		<div class="col">
    			<input type="text" class="form-control" id="role-name" placeholder="- Select Role Name -">
    		</div>
    		<div class="col">
    			<input type="text" class="form-control" id="company-name" placeholder="- Select Company Name -">
    		</div>
    		<div class="col">
    			<input type="text" class="form-control" id="username" name="usernameSearch" placeholder="Username">
    		</div>
    		<div class="col-auto">
	    			<input placeholder="Created Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="create-date" name="userCreatedDate">	
	    	</div>
    		<div class="col-auto">
	    			<input placeholder="Created By" class="form-control" type="text" name="userCreatedBy">	
	    	</div>
    		<div class="col-auto">
    			<a href="#" id="btnSearch" class="btn btn-warning" style="width:70px;color:white;">Search</a>
    		</div>
    	</div>
    	</form>
			
			<div>
				<table class="table" id="tabs">
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
							<input type="hidden" id="id">  	
						  	<div class="col">
						      <label for="name">* Role Name</label>
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
						      <label for="name">* Employee Name</label>
						    </div>
						    <div class="col">
						        <select class="form-control" id="employeeEdit" style="font-size: 12px;">
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
       
       
       
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2018 <a href="http://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.0.0-alpha
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath }/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath }/assets/dist/js/adminlte.min.js"></script>
<%-- </c:if> --%>

<script>
 $(function () {
    //datatabel
   var t = $('#tabs').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
    
    t.on( 'order.dt search.dt', function () {
	        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            cell.innerHTML = i+1;
	        } );
	    } ).draw();
    
  }); 
</script>
</body>
</html>
