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
  <title>List Event</title>
  	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
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
<script type="text/javascript">
	//isi script
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
          <li class="nav-header">Menu</li>
          <li class="nav-item">
            <a href="${pageContext.request.contextPath }/company" class="nav-link">
              <i class="nav-icon fa fa-circle-o text-info"></i>
              <p>Company</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="${pageContext.request.contextPath }/event" class="nav-link">
              <i class="nav-icon fa fa-circle-o text-info"></i>
              <p>Event</p>
            </a>
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
    	
    	 <div class="content-header">
		      <div class="container-fluid">
		        <div class="row mb-2">
		          <div class="col-sm-6">
		            <h1 class="m-0 text-dark">MARCOM APPS</h1>
		          </div><!-- /.col -->
		          <div class="col-sm-6">
		            <ol class="breadcrumb float-sm-right">
		              <li class="breadcrumb-item"><a href="#">Home</a></li>
		            </ol>
		          </div><!-- /.col -->
		        </div><!-- /.row -->
		      </div><!-- /.container-fluid -->
		    </div>
    	
    	
       		<div class="row">
	          <div class="col-lg-6">
	            
	            
	            <div class="card card-primary card-outline">
	              <div class="card-header">
	                <h5 class="m-0">Company</h5>
	              </div>
	              <div class="card-body">
	                <h6 class="card-title">Data Company</h6>
	
	                <p class="card-text">Contain About Information List Company</p>
	                <a href="${pageContext.request.contextPath }/company" class="btn btn-primary">Company</a>
	              </div>
	            </div>
	
	            <div class="card card-primary card-outline">
	              <div class="card-header">
	                <h5 class="m-0">Role</h5>
	              </div>
	              <div class="card-body">
	                <h6 class="card-title">Data Role</h6>
	
	                <p class="card-text">Contain About Information List Role</p>
	                <a href="${pageContext.request.contextPath}/ role" class="btn btn-primary">Role</a>
	              </div>
	            </div>
	          </div>
	          <!-- BAGIAN KANAN DALAM CONTENT -->
	          <div class="col-lg-6">
	           <div class="card card-primary card-outline">
	              <div class="card-header">
	                <h5 class="m-0">Employee</h5>
	              </div>
	              <div class="card-body">
	                <h6 class="card-title">Data Employee</h6>
	
	                <p class="card-text">Contain About Information List Employee</p>
	                <a href="${pageContext.request.contextPath }/employee" class="btn btn-primary">Employee</a>
	              </div>
	            </div>
	
	            <div class="card card-primary card-outline">
	              <div class="card-header">
	                <h5 class="m-0">Featured</h5>
	              </div>
	              <div class="card-body">
	                <h6 class="card-title">Special title treatment</h6>
	
	                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
	                <a href="#" class="btn btn-primary">Go somewhere</a>
	              </div>
	            </div>
	          </div>
	          <!-- /.col-md-6 -->
	        </div>
	        <!-- /.row -->
		
		
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
