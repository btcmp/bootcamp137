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
  <title>List Product</title>
  	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
	  <!-- Tell the browser to be responsive to screen width -->
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
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
  	#header{
			background-color:#0069D9;
			margin-bottom:10px;
			height:40px;
		}
		
		#header h5{
		font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;
		padding-top:8px;
		padding-left:8px;
		color:white;
		}
		
		/* #body{
			width:96%;
			color:white;
			background-color:white;
			margin:auto;
		}
			
			#body1{
			margin:auto;
			margin-bottom:20px;
			} */
		
		#btn-add{
			float:right;
			width:70px;
		}
		
		#btn-search{
			width:70px;
		}
  		
  		table{
			counter-reset:tableCount;
		}
		
		.counterCell:before{
			content: counter(tableCount);
			counter-increment: tableCount;
		}
  		
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
  	
  	  <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  	
  	
  	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btn-add').on('click', function(){
			$('#modalAdd').modal();
		});
		
		$(function() {
		   	$( "#Date_Created" ).datepicker({
		        dateFormat:"yy-mm-dd"
		    });
		});
		
       $("#success-alert").hide();
		
		$('#save').on('click', function(){
			var product = {
					code : $('#cde').val(),
					name : $('#nme').val(),
					description : $('#des').val()
			}
			
			var statusname=0;
			if($('#nme').val() == ''){
			     alert('Name can not be left blank');
			     statusname=0;
			}else{
				statusname=1;
			}
			
			console.log(product);
			
			if(statusname==1){
				$.ajax({
					url: '${pageContext.request.contextPath}/product/save',
					type: 'POST',
					contentType : 'application/json',
					data : JSON.stringify(product),
					success : function(data){
						window.location = '${pageContext.request.contextPath}/product'
						/* $('.alert').alert('oke', function(){
									$("#success-alert").fadeTo(4000, 500).slideUp(500, function(){
							    	$("#success-alert").slideUp(500);
							    });
							}); */
						/* $("#save").click(); */
						
						/* $("#save").click(function showAlert() {
						    $("#success-alert").fadeTo(4000, 500).slideUp(500, function(){
						    	$("#success-alert").slideUp(500);
						    });             
						}); */
					},
					error : function(){
						alert('Error Update');
					}
				});
				
				
			};
		});
		
		
		
		var deleteid;
		$('.delete').on('click', function(){
			deleteid = $(this).attr('id');
			$('#modalDelete').modal();
		});
		
		$('#btn-delete-yes').on('click', function(){
			console.log(deleteid);
			window.location='${pageContext.request.contextPath}/product/delete/'+deleteid;
		});
		
		$('.edit').on('click', function(){
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/product/getproduct?id='+id,
				type : 'GET',
				success : function(object){
					$('#id').val(object.id);
					$('#editcode').val(object.code);
					$('#editname').val(object.name);
					$('#editdescription').val(object.description);
					console.log(object);
				}
			});
			$('#modalEdit').modal();
		});
		
		$('#editsave').on('click', function(){
			var product = {
				id : $('#id').val(),
				code : $('#editcode').val(),
				name : $('#editname').val(),
				description : $('#editdescription').val(),
			}
			
			console.log(product);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/product/edit',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(product),
				success : function(data){
					alert('update oke');
					console.log(data);
					window.location = '${pageContext.request.contextPath}/product'
				},
				error : function(){
					alert('Error Update');
				}
			});
		});
		
		$('.view').on('click', function(){
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/product/getproduct?id='+id,
				type : 'GET',
				success : function(object){
					$('#viewcode').val(object.code);
					$('#viewname').val(object.name);
					$('#viewdescription').val(object.description);
					console.log(object);
				}
			});
			$('#modalView').modal();
		});
		
		$('#btn-search').on('click', function(){
			var form = $("#form-search");
			var data = form.serialize();
			console.log(data);
			window.location = '${pageContext.request.contextPath}/product/search?'+data;
		});
	});
</script>
	  
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
      </li>
    </ul>
   <!-- Right navbar links --> <!-- logout ada disini -->
    <!-- <ul class="navbar-nav ml-auto">
     <a href="javascript:formSubmit()"> Logout</a>
    </ul> -->
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
    	
    	 <div id="container">
    	 
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
		
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<h2>
					Welcome : ${pageContext.request.userPrincipal.name} | <a
						href="javascript:formSubmit()"> Logout</a>
				</h2>
			</c:if>
    	 
			<div id="header">
				<h5>LIST PRODUCT<h5>
			</div>
			<div id="body" style="width:98%; margin:auto;">
			  <div id="body1">
				<ol class="breadcrumb">
				  <li><a href="#">Home </a>/</li>
				  <li><a href="#">Master </a>/</li>
				  <li><a href="#">List Souvenir Stock</a></li>
				</ol>
				
				<a href="#" class="btn btn-sm btn-primary" id="btn-add" data-toggle="modal" data-target="#exampleModalCenter">Add</a><br><br>
			  <form id="form-search">
				<div class="form-row" style="margin-bottom:20px;">
					<div class="col-auto">
					  <input type=text name="code" id="Product_Code" class="form-control" placeholder="Product Code">
					</div>
					<div class="col-auto">
					  <input type=text name="name" id="Product_Name" class="form-control" placeholder="Product Name">
					</div>
					<div class="col-auto">
					  <input type=text name="description" id="Description" class="form-control" placeholder="Description">
					</div>
					<div class="col">
					  <input type=text name="createdDate" id="Date_Created" class="form-control" placeholder="Created Date"> <!-- onfocus="(this.type='date')" onblur="(this.type='text')" -->
					</div>
					<div class="col-auto">
					  <input type=text name="createdBy" id="Created_By" class="form-control" placeholder="Created_By">
					</div>
					<div class="col-auto">
					  <a href="#" class="btn btn-sm btn-warning" id="btn-search" data-toggle="modal" data-target="#exampleModalCenter">Search</a>
					</div>
				</div>
				</form>
			  </div>
			  <div id="body2">
				  <table class="table">
					<thead>
					  <tr>
						<th>No</th>
						<th>Product Code</th>
						<th>Product Name</th>
						<th>Description</th>
						<th>Created Date</th>
						<th>Created By</th>
						<th>Action</th>
					  </tr>
					</thead>
				   <c:forEach items="${listDll}" var="product">
				    <tbody>
					  <tr>
					    <td class="counterCell"></td>
					    <td>${product.code}</td>
					    <td>${product.name}</td>
					    <td>${product.description}</td>
					    <td>${product.createdDate}</td>
					    <td>${product.createdBy}</td>
					    <td>
						  <a href="#" class="delete" id="${product.id}" style="color:inherit;"><i class="fas fa-trash"></i></a>
						  <a href="#" class="edit" id="${product.id}" style="color:inherit;"><i class="fas fa-pencil-alt"></i></a>
						  <a href="#" class="view" id="${product.id}" style="color:inherit;"><i class="fas fa-search"></i></a></td>
					  </tr>
				    </tbody>
				   </c:forEach>
			  	</table>
			  </div>					
			</div>					
		  </div>
		
		<!-- /////////////////////////////////// Modal Add \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
		<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add Product</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div id="add-container">
		        	<div class="row">
			      		<div class="col-sm-4" style="text-align:right;">
			      			<p>*Product Code</p>
			      		</div>
			      		<div class="col-sm-6">
			      			<input type="text" name="code" placeholder="${hasil}" value="${hasil}" class="form-control" id="cde" disabled>
			      		</div>
			      	</div>
			      	
			      	<div class="row">
			      		<div class="col-sm-4" style="text-align:right;">
			      			<p>*Product Name</p>
			      		</div>
			      		<div class="col-sm-6">
			      			<input type="text" name="name" placeholder="Type Product Name" class="form-control" id="nme">
			      		</div>
			      	</div>
			      	
			      	<div class="row">
			      		<div class="col-sm-4" style="text-align:right;">
			      			<p>Description</p>
			      		</div>
			      		<div class="col-sm-6">
			      			<input type="text" name="description" placeholder="Type Description" class="form-control" id="des">
			      		</div>
			      	</div>
			      	
		        </div>
		        
		      </div>
		      	<div class="modal-footer">
			        <button type="button" class="btn btn-primary" id="save">Save</button>
			        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
			    </div>
		    </div>
		  </div>
		</div>
		
		<!--/////////////////////////////// Alert Save \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
		<div class="alert alert-primary" id="success-alert" role="alert">
		  <strong>Success!<a href="#" class="alert-link">an example link</a></strong> This alert box could indicate a successful or positive action.
		</div>
			
		<!--/////////////////////////////// Modal Delete \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
		<div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document" style="width:250px;">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">Are You Sure?</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" style="margin:auto;">
		        <button type="button" class="btn btn-warning" id="btn-delete-yes">Yes</button>
		        <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
		      </div>
		    </div>
		  </div>
		</div>
	
		<!-- /////////////////////////////////// Modal Edit \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
		<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add Product</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div id="add-container">
		        	<input type="hidden" id="id">
		        	<div class="row">
		        		<div class="col-sm-4" style="text-align:right;">
		        			<p>*Product Code</p>
		        		</div>
		        		<div class="col-sm-6">
		        			<input type="text" name="code" placeholder="Auto Generate" class="form-control" id="editcode" disabled>
		        		</div>
		        	</div>
		        	
		        	<div class="row">
		        		<div class="col-sm-4" style="text-align:right;">
		        			<p>*Product Name</p>
		        		</div>
		        		<div class="col-sm-6">
		        			<input type="text" name="name" placeholder="Type Product Name" class="form-control" id="editname">
		        		</div>
		        	</div>
		        	
		        	<div class="row">
		        		<div class="col-sm-4" style="text-align:right;">
		        			<p>Description</p>
		        		</div>
		        		<div class="col-sm-6">
		        			<input type="text" name="description" placeholder="Type Description" class="form-control" id="editdescription">
		        		</div>
		        	</div>
		        </div>
		      </div>
		      	<div class="modal-footer">
			        <button type="button" class="btn btn-primary" id="editsave">Save</button>
			        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
			    </div>
		    </div>
		  </div>
		</div>
		
		<!-- /////////////////////////////////// Modal View \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
		<div class="modal fade" id="modalView" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add Product</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div id="add-container">
		        	<div class="row">
		        		<div class="col-sm-4" style="text-align:right;">
		        			<p>*Product Code</p>
		        		</div>
		        		<div class="col-sm-6">
		        			<input type="text" name="code" placeholder="Auto Generate" class="form-control" id="viewcode" disabled >
		        		</div>
		        	</div>
		        	<div class="row">
		        		<div class="col-sm-4" style="text-align:right;">
		        			<p>*Product Name</p>
		        		</div>
		        		<div class="col-sm-6">
		        			<input type="text" name="name" placeholder="Type Product Name" class="form-control" id="viewname" disabled>
		        		</div>
		        	</div>
		        	<div class="row">
		        		<div class="col-sm-4" style="text-align:right;">
		        			<p>Description</p>
		        		</div>
		        		<div class="col-sm-6">
		        			<input type="text" name="description" placeholder="Type Description" class="form-control" id="viewdescription" disabled>
		        		</div>
		        	</div>		
		        </div>
		       	
		     </div>
		     	<div class="modal-footer">
			       <button type="button" class="btn btn-warning" id="close" data-dismiss="modal">Close</button>
			 	</div>
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
   var t = $('#tabelCompany').DataTable({
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
