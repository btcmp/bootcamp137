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
  <title>List Souvenir</title>
  	
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<!-- 	ini di copy buat validasi -->
  	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/parsley.min.js"></script>
<!-- 	ini di copy buat validasi -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous"></script>
  	
	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
	  <!-- Tell the browser to be responsive to screen width -->
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/plugins/font-awesome/css/font-awesome.min.css">
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

select.parsley-error
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
  	
  	
  	<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
     <!--  <script src = "https://code.jquery.com/jquery-1.10.2.js"></script> -->
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  	
  	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script type="text/javascript">
	//isi script
	 $(function() {
         $( "#created-date" ).datepicker({
        	 dateFormat:"yy-mm-dd"
         });
         
      });
	
	
	$(document).ready(function(){
		$(document).on('click', '#btn-add', function(){
			$('#modal-add').modal();
		});
		
		$(document).on('click', '#save-btn', function(){
			//json (Javascript object notation)
			//di json kalo mau buat object gak perlu buat class
			//di json kalo ada kurung kurawal otomatis di anggap object (var a = {...};)
			
			var souvenir = {
					code : $('#code').val(),
					mUnitId : {
						id : $('#unit-valid option:selected').val()
					},
					name : $('#name').val(),
					description : $('#description').val()
				};
			
			//validasi field di  modal add
			
			var validateUnit = $('#unit-valid').parsley({
				required : true,
				requiredMessage : 'The Field cant be Empty'
			});
			var validateName = $('#name').parsley({
				required : true,
				requiredMessage : 'The Field cant be Empty'
			});
			
			//validate function
			function getValid(validate){
				validate.validate();
				return validate.isValid();
			}
			
			var valid = getValid(validateUnit);
				valid = getValid(validateName);
			
				//ajax (asynchronous javascript and xml)
				if(valid){
					$.ajax({
						url : '${pageContext.request.contextPath}/souvenir/save',
						type : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(souvenir), //converst objek ke string
						success : function(data){
							console.log(data);
							window.location = '${pageContext.request.contextPath}/souvenir'
						}, error: function(){
							alert('error');
						}
					});
				} else {
					alert('Please Complete the Blank Field(s)');
				}
		});
		
		$(document).on('click', '#btn-edit', function(){
			var id = $(this).attr('data-id');
			$.ajax({
				url : '${pageContext.request.contextPath}/souvenir/getsouvenir?id=' + id,
				type : 'GET',
				success : function(obj){
					$('#id-edit').val(obj.id);
					$('#code-edit').val(obj.code);
					$('#unit-edit').val(obj.mUnitId.id);
					$('#name-edit').val(obj.name);
					$('#description-edit').val(obj.description);
				}		
			});
			
			$('#modal-edit').modal();
		});
		
		
		
		$(document).on('click', '#update-btn', function(){
			var souvenir = {
					id : $('#id-edit').val(),
					code : $('#code-edit').val(),
					mUnitId : {
						id : $('#unit-edit option:selected').val()
					},
					name : $('#name-edit').val(),
					description : $('#description-edit').val()
			}
			
			//validasi field di  modal edit
			var validateCodeEdit = $('#code-edit').parsley({
				required : true,
				requiredMessage : 'The Field cant be Empty'
			});
			var validateUnitEdit = $('#unit-edit').parsley({
				required : true,
				requiredMessage : 'The Field cant be Empty'
			});
			var validateNameEdit = $('#name-edit').parsley({
				required : true,
				requiredMessage : 'The Field cant be Empty'
			});
			
			//validate function
			function getValid(validate){
				validate.validate();
				return validate.isValid();
			}
			
			var valid = getValid(validateCodeEdit);
				valid = getValid(validateUnitEdit);
				valid = getValid(validateNameEdit);
		
			//do ajax
			if(valid){
				$.ajax({
					url : '${pageContext.request.contextPath}/souvenir/update',
					type : 'PUT',
					data : JSON.stringify(souvenir),
					contentType : 'application/json',
					success : function(data){
						window.location = '${pageContext.request.contextPath}/souvenir'
					}, error : function(){
						alert('failed');
					}
				});
			} else {
				alert('Please Complete the Blank Field(s)');
			}
		});
		
		$(document).on('click', '#btn-view', function(){
			var id = $(this).attr('data-id');
			$.ajax({
				url : '${pageContext.request.contextPath}/souvenir/getsouvenir?id=' + id,
				type : 'GET',
				success : function(obj){
					$('#id-view').val(obj.id);
					$('#code-view').val(obj.code);
					$('#unit-view').val(obj.mUnitId.id);
					$('#name-view').val(obj.name);
					$('#description-view').val(obj.description);
				}		
			});
			
			$('#modal-view').modal();
		});
		
		$(document).on('click', '#btn-delete', function(){
			$('#modal-delete').modal();
			var id = $(this).attr('data-id');
			
			$('#delete-btn').on('click', function(){
				
				$.ajax({
					url : '${pageContext.request.contextPath}/souvenir/delete?id=' + id,
					type : 'DELETE',
					success: function(data){
						window.location = '${pageContext.request.contextPath}/souvenir'
					}, error: function(){
						alert('failed');
					}
				});
			});
		});
		
		//search listener
		$('.search').on('click', function(){
			var form = $('#form-master-souvenir');
			var data = form.serialize();
			
			console.log(data);
			
			window.location='${pageContext.request.contextPath }/souvenir/search?'+data;
		});
	});
</script>
	  
</head>
<body class="hold-transition sidebar-mini">

<!-- For login user -->
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
    <a href="index3.html" class="brand-link">
      <img src="${pageContext.request.contextPath }/assets/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Marcom Apps</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
     <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
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
          
           <li class="nav-item">
            <a href="${pageContext.request.contextPath }/souvenir" class="nav-link">
              <i class="nav-icon fa fa-circle-o text-info"></i>
              <p>Souvenir</p>
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
	            <a href="${pageContext.request.contextPath }/souvenirrequest" class="nav-link">
	              <i class="nav-icon fa fa-circle-o text-info"></i>
	              <p>Souvernir Request</p>
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
		<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List Souvenir Request</h5>
	</div>
	
	<div style="width:98%;margin:auto;">
		<ol class="breadcrumb">
  			<li><a href="#">Home </a>/</li>
  			<li><a href="#"> Master </a>/</li>
 		 	<li class="active"> List Souvenir</li>
		</ol>
    

    	<a href="#" class="btn btn-primary" id="btn-add" style="width:70px;float:right;">Add</a><br/><br/>

		<form id="form-master-souvenir">
    	<div class="form-row">
    		<div class="col">
    			<input type="text" class="form-control" name="souvenircode" id="souvenir-code" placeholder="Souvenir Code">
    		</div>
    		<div class="col">
    			<input type="text" class="form-control" name="souvenirname" id="souvenir-name" placeholder="Souvenir Name">
    		</div>
    		<div id="data-unit">
    			<div class="col-auto">
	  				<select class="form-control" name="unitname">
	      				<c:forEach items="${listUnit }" var="unit">
								<option value="${unit.id }">${unit.name }</option>
							</c:forEach>
	    			</select>
	    		</div>
  			</div>
    		<div class="col-auto">
    			<input placeholder="Created" class="form-control" type="text" name="createddate" id="created-date">	
    		</div>
    		<div class="col-auto">
    			<input type="text" class="form-control" name="createdby" id="created-by" placeholder="Created By">
    		</div>
    		<div class="col-auto">
    			<a href="#" class="btn btn-warning search" style="width:70px;color:white;">Search</a>
    		</div>	
    	</div>
    	</form>
    	
    	<table class="table" id="table-souvenir">
			<thead>
		    	<tr>
		      		<th scope="col">No</th>
					<th scope="col">Souvenir Code</th>
					<th scope="col">Souvenir Name</th>
					<th scope="col">Unit</th>
					<th scope="col">Cretaed Date</th>
					<th scope="col">Create By</th>
					<th scope="col">Actions</th>
		    	</tr>
		  	</thead>
		  	<tbody>
		  		<c:forEach items="${listSouvenir }" var="souvenir">
					<tr>
						<td scope="col"></td>
						<td scope="col">${souvenir.code }</td>
						<td scope="col">${souvenir.name }</td>
						<td scope="col">${souvenir.mUnitId.name }</td>
						<td scope="col">${souvenir.createdDate }</td>
						<td scope="col">${pageContext.request.userPrincipal.name}</td>
						<td scope="col">
							<a data-id="${souvenir.id }" id="btn-view" href="#" style="color:inherit;"><i class="fas fa-search"></i></a>
		  					<a data-id="${souvenir.id }" id="btn-edit" href="#" style="color:inherit;"><i class="fas fa-pencil-alt"></i></a>
		  					<a data-id="${souvenir.id }" id="btn-delete" href="#" style="color:inherit;"><i class="fas fa-trash"></i></a>
						</td>
					</tr>
				</c:forEach>
		  	</tbody>
		</table>
    		
	</div>
	
	
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
		      		<div class="col-md-3">
		      			<label>* Souvenir Code</label>
		      		</div>
		      		<div class="col-md-3">
		      			<input type="text" id="code" class="form-control" placeholder="${hasil }" value="${hasil }" disabled>
		      			<input type="hidden" id="created-date">
		      		</div>
		      		<div class="col-md-2">
		      			<label>* Unit Name</label>
		      		</div>
		      		<div class="col-md-4" id="m-unit-id">
		      			<select class="form-control" id="unit-valid">
		      				<option selected value = "">- Select Unit -</option>
		      				<c:forEach items="${listUnit }" var="unit">
								<option value="${unit.id }">${unit.name }</option>
							</c:forEach>
		    			</select>
		      		</div>
		      	</div>
		      	
		      	<p></p>
		      	
		      	<div class="row">
		      		<div class="col-md-3">
		      			<label>* Souvenir Name</label>
		      		</div>
		      		<div class="col-md-3">
		      			<input type="text" id="name" class="form-control" placeholder="Type Souvenir Name">
		      		</div>
		      		<div class="col-md-2">
		      			<label>Description</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input type="text" id="description" class="form-control" placeholder="Type Description">
		      		</div>
		      	</div>
		      </form>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" id="save-btn" class="btn btn-primary">Save</button>
	        <button type="button" class="btn btn-warning save-btn" style="color:white;" data-dismiss="modal">Cancel</button>
	      </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	
		<!-- Modal Edit -->
	<div class="modal fade bd-example-modal-lg" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">Edit Souvenir</h5>
	      </div>
	      <div style="width:95%;margin:auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
	      <div class="modal-body">
	      
		      <form>
		      	<div class="row">
		      		<div class="col-md-3">
		      			<label>* Souvenir Code</label>
		      		</div>
		      		<div class="col-md-3">
		      			<input type="hidden" id="id-edit">
		      			<input id="code-edit" type="text" class="form-control" placeholder="Auto generated" disabled>
		      		</div>
		      		<div class="col-md-2">
		      			<label>* Unit Name</label>
		      		</div>
		      		<div class="col-md-4">
		      			<select class="form-control" id="unit-edit">
		      				<c:forEach items="${listUnit }" var="unit">
								<option value="${unit.id }">${unit.name }</option>
							</c:forEach>
		    			</select>
		      		</div>
		      	</div>
		      	
		      	<p></p>
		      	
		      	<div class="row">
		      		<div class="col-md-3">
		      			<label>* Souvenir Name</label>
		      		</div>
		      		<div class="col-md-3">
		      			<input id="name-edit" type="text" class="form-control" placeholder="Type Souvenir Name">
		      		</div>
		      		<div class="col-md-2">
		      			<label>Description</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input id="description-edit" type="text" class="form-control" placeholder="Type Description">
		      		</div>
		      	</div>
		      </form>
	      </div>
	      
	      <div class="modal-footer">
	        <button id="update-btn" type="button" class="btn btn-primary">Update</button>
	        <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Cancel</button>
	      </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	
			<!-- Modal View -->
	<div class="modal fade bd-example-modal-lg" id="modal-view" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">View Souvenir</h5>
	      </div>
	      <div style="width:95%;margin:auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
	      <div class="modal-body">
	      
		      <form>
		      	<div class="row">
		      		<div class="col-md-3">
		      			<label>* Souvenir Code</label>
		      		</div>
		      		<div class="col-md-3">
		      			<input type="hidden" id="id-view">
		      			<input id="code-view" type="text" class="form-control" placeholder="Auto generated" disabled>
		      		</div>
		      		<div class="col-md-2">
		      			<label>* Unit Name</label>
		      		</div>
		      		<div class="col-md-4">
		      			<select class="form-control" id="unit-view" disabled>
		      				<c:forEach items="${listUnit }" var="unit">
								<option value="${unit.id }">${unit.name }</option>
							</c:forEach>
		    			</select>
		      		</div>
		      	</div>
		      	
		      	<p></p>
		      	
		      	<div class="row">
		      		<div class="col-md-3">
		      			<label>* Souvenir Name</label>
		      		</div>
		      		<div class="col-md-3">
		      			<input id="name-view" type="text" class="form-control" placeholder="Type Souvenir Name" disabled>
		      		</div>
		      		<div class="col-md-2">
		      			<label>Description</label>
		      		</div>
		      		<div class="col-md-4">
		      			<input id="description-view" type="text" class="form-control" placeholder="Type Description" disabled>
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
	</div>
	
	<!-- Modal Delete -->
	<div class="modal fade bd-example-modal-sm" id="modal-delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div style="float:right;clear:right;">
	        <button style="background-color:red;" type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p style="text-align:center;">Delete Data?</p>
	      </div>
	      <div style="margin:auto;padding-bottom:5px;">
	        <button id="delete-btn" type="button" class="btn btn-primary">Delete</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal" style="color:white;">Cancel</button>
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
   var t = $('#table-souvenir').DataTable({
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
