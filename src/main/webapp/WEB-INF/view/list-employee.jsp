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
  <title>List Employee</title>
  	
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

	table{
		counter-reset: tableCount;
		}
		.counterCell:before {
			content : counter(tableCount);
			counter-increment: tableCount;
		}
		
  </style>
  
<!-- 	ini di copy buat validasi -->
  	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/parsley.min.js"></script>
<!-- 	ini di copy buat validasi -->
 
   	 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>

  	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
	$(function() {
        $( "#created-date" ).datepicker({
       	 dateFormat:"yy-mm-dd"
        });
        
     });
	
	$(document).ready(function(){

		//ADD
		$('#btn-add').on('click', function(){
			$('#modal-add').modal();
		});
		
		//SUBMIT ADD
		$('#btn-submit-add').click(function(){
			var id = $(this).attr('data-id');
			var input;
			var isd1 = <%= request.isUserInRole("ROLE_ADMIN") %>;
			if(isd1==true){
				//alert('ROLE_ADMIN');
				input = "ADMINISTRATOR";	
				
				}
			var isd3 = <%= request.isUserInRole("ROLE_REQUESTER") %>;
				if(isd3==true){
					//alert('ROLE_REQUESTER');
					input = "REQUESTER";
			}
			
			var employee = {
					
				code : $('#codeEmployee').val(),
				mCompanyId : {
					id : $('#mCompanyId option:selected').val()
				},
				firstName : $('#firstName').val(),
				lastName : $('#lastName').val(),
				email : $('#email').val(),
				createdBy : input
			};
			
			var validatefirstName = $('firstName').parsley({
				required : true,
				requiredMessage : 'The Field cant be Empty'
			});
			
			var validatecodeEmployee = $('#codeEmployee').parsley({
				required : true,
				requiredMessage : 'Employee number name cannot be empty or please insert another number',
				minlengthMessage: ' must 8 character',
			});
			
			
			
			
			var valid = getValid(validatefirstName);
				valid = getValid(validatecodeEmployee);
			
			
			if(valid){
				$.ajax({
					url : '${pageContext.request.contextPath}/employee/save',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(employee),
					success : function(data){
						window.location="${pageContext.request.contextPath}/employee";
					}, error: function(){
						alert('error');
					}
				});
			}else {
				alert('Please use another number employee');
			}
			
			
			function getValid(validate){
				validate.validate();	
				return validate.isValid();
			}
		}); 
		
		
		//VIEW
		$(document).on('click','#btn-detail', function(){
			var id = $(this).attr('data-id');
			  $.ajax({
					url : '${pageContext.request.contextPath}/employee/getemployee?id='+id,
					type: 'GET',
					success : function(obj){
						$('#codeDetail').val(obj.code);
						$('#idCompanyDetail').val(obj.mCompanyId.name);
						$('#firstNameDetail').val(obj.firstName);
						$('#lastNameDetail').val(obj.lastName);
						$('#emailDetail').val(obj.email);
						console.log(obj);
					},
					error : function(){
						alert('gagal');
					},
					dataType :'json'
				}); 
	
			$('#modal-detail').modal();
		});
		
		//EDIT
		$(document).on('click','#btn-edit', function(){
			var id = $(this).attr('data-id');
			var input;
			var isd1 = <%= request.isUserInRole("ROLE_ADMIN") %>;
			if(isd1==true){
				//alert('ROLE_ADMIN');
				input = "ADMINISTRATOR";	
				
				}
			var isd3 = <%= request.isUserInRole("ROLE_REQUESTER") %>;
				if(isd3==true){
					//alert('ROLE_REQUESTER');
					input = "REQUESTER";
			}
			  $.ajax({
					url : '${pageContext.request.contextPath}/employee/getemployee?id='+id,
					type: 'GET',
					success : function(obj){
						$('#idEdit').val(obj.id);
						$('#codeEdit').val(obj.code);
						$('#idCompanyEdit').val(obj.mCompanyId.id);
						$('#firstNameEdit').val(obj.firstName);
						$('#lastNameEdit').val(obj.lastName);
						$('#emailEdit').val(obj.email);
						$('#updatedBy').val(input);
						console.log(obj);
					},
					error : function(){
						alert('gagal');
					},
					dataType :'json'
				}); 			
			$("#modal-edit").modal();
		});
		//SUBMIT EDIT
		$('#btn-submit-edit').click(function(){
			var employee = {
				id : $("#idEdit").val(), 
				code : $('#codeEdit').val(),
				mCompanyId : {
					id : $('#idCompanyEdit option:selected').val()
				},
				firstName : $('#firstNameEdit').val(),
				lastName : $('#lastNameEdit').val(),
				email : $('#emailEdit').val(),
				updated_by : $('#updatedBy').val()
			}
			
			var validatefirstName = $('#firstNameEdit').parsley({
				required : true,
				requiredMessage : "First name cannot be empty"
			})
			
			var validatecodeEdit = $('#codeEdit').parsley({
				required : true,
				requiredMessage : "Employee number name cannot be empty or please insert another number"
			})
			
			
			function getValid(validate){
				validate.validate();
				return validate.isValid();
			}
			
			var valid = getValid(validatefirstName);
				valid = getValid(validatecodeEdit);
			
			console.log(employee);
			$.ajax({
				url : '${pageContext.request.contextPath}/employee/update',
				type : 'PUT',
				data : JSON.stringify(employee),
				contentType : 'application/json',
				success : function(data){
					window.location="${pageContext.request.contextPath}/employee";
					console.log(employee);
					alert("Update berhasil");
				}, error : function() {
					alert('failed');
				}
			});
		});
		
		//DELETE
		var id;
		$(document).on('click','#btn-delete', function(){
			id = $(this).attr('data-id');
			$("#modal-delete").modal();
		});
			
		$(document).on('click','#btn-submit-delete', function(){
				$.ajax({
					url : '${pageContext.request.contextPath}/employee/delete?id=' + id,
					type : 'DELETE',
				    success: function(data){
				    	window.location='${pageContext.request.contextPath}/employee';
				    }, error : function(){
				    	alert('failed');
				    }
				});		
		});
		
		//SEARCH
		$('#btn-search').click(function() {
			var form = $("#form-search-emp");
			var data = form.serialize(); //untuk mengambil semua data yang ada di table
			console.log(data);
			/* if(data == "codeSearch=&nameSearch=&createdDateSearch=&createdBySearch=&companySearch"){
				console.log(data);
				window.location = '${pageContext.request.contextPath}/employee';
			}
			else{
				console.log(data);
				window.location = '${pageContext.request.contextPath}/employee/search?'+data;	
			} 	 */	
			 
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
	    	<!-- body -->
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
		
		
		<div style="height:40px;background-color:#0069D9;margin-bottom:10px">
			<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List Employee</h5>
		</div>
		
		<div style="width:98%;margin:auto;">
			<ol class="breadcrumb">
	  			<li><a href="#">Home </a>/</li>
	  			<li><a href="#"> Master </a>/</li>
	 		 	<li class="active"> List Employee</li>
			</ol>
	    
	
	    	<a href="#" class="btn btn-primary" id="btn-add" style="width:70px;float:right;">Add</a><br/><br/>
	
			<form id="form-search-emp">
	    	<div class="form-row" >
	    		<div class="col-auto">
	    			<input type="text" class="form-control" id="code-Search" placeholder="Employee ID Number" name="codeSearch" style="font-size: 13px" >
	    		</div>
	    		<div class="col">
	    			<input type="text" class="form-control" id="name-Search" placeholder="Employee Name" name="nameSearch" style="font-size: 13px">
	    		</div>
	    		<div class="form-group">
	    			<div class="col-auto" id="company-Search" name="companySearch">
		  				<select class="form-control" id="exampleFormControlSelect1" style="font-size: 13px">
		      				<option>- Select Company Name -</option>
		      				<c:forEach items="${listCompany}" var="company">
							<option id="company-Name-Search" value="${company.id}">${company.name}</option>
							</c:forEach>
		    			</select> 
		    		</div>
	  			</div>
	    		
	    		<div class="col-auto">
	    			<input placeholder="Created" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="created-Date-Search" name="createdDateSearch" style="font-size: 13px">	
	    		</div>
	    		<div class="col-auto">
	    			<input type="text" class="form-control" id="created-By-Search" name="createdBySearch" placeholder="Created By" style="font-size: 13px">
	    		</div>
	    		<div class="col-auto">
	    			<a href="#" class="btn btn-warning" id="btn-search" style="width:70px;color:white;">Search</a>
	    		</div>	
	    	</div>
	    	</form>
	    	
	    	<table class="table"  >
					<thead>
			    	<tr>
			      		<th>No</th>
						<th>Employee ID Number</th>
						<th>Employee Name</th>
						<th>Company Name</th>
						<th>Created Date</th>
						<th>Created By</th>
						<th>Action</th>
			    	</tr>
			  	</thead>
			  	<tbody id ="emp">
			    	<c:forEach items="${listEmployee}" var="employee">
						<tr>
							<td class="counterCell"></td>
							<td>${employee.code}</td>
							<td>${employee.firstName} ${employee.lastName}</td>
							<td>${employee.mCompanyId.name}</td>
							<td>${employee.createdDate}</td>
							<td>${employee.createdBy}</td>
							<td>
								<a href="#" id="btn-detail" data-id='${employee.id}'><i class="fas fa-search"></i></a>
								<a data-role-admin="<%= request.isUserInRole("ROLE_ADMIN") %>" data-role-requester="<%= request.isUserInRole("ROLE_REQUESTER") %> href="#" id="btn-edit" data-id='${employee.id}'><i class="fas fa-pencil-alt"></i></a>
								<a href="#" id="btn-delete" data-id='${employee.id}'><i class="fas fa-trash"></i></a>
							</td>
						</tr>	
					</c:forEach>
			  	</tbody>
			</table>    		
		</div>
		<%@ include file="modal/modal-employee.jsp" %>
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
