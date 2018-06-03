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
  <title>List Menu Access</title>
  	
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
					},
					createdBy: $('#createdBy').val()
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
					},
					updatedBy: $('#updatedBy').val()
			}
			console.log(menuAccess);
			$.ajax({
				url:'${pageContext.request.contextPath}/menu_access/update',
				type:'POST',
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
		<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List Menu Access</h5>
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
    	
    	<table class="table" id="tabs">
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
						      <input type="hidden" id="createdBy" value="${pageContext.request.userPrincipal.name}">
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
		        <h5 class="modal-title" id="exampleModalLongTitle">Edit Menu Access</h5>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
		      
			      	<div class="row">
					  <div class="col">
						<div class="row">  	
						  	<div class="col">
						  	<input type="hidden" id="id">
						  	<input type="hidden" id="updatedBy" value="${pageContext.request.userPrincipal.name}">
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
						  	<div class="col">
						      <label for="name">* Menu Access</label>
						    </div>
						</div>
						<div class="row">
							<div class="col" style="margin-left:10px;">
							<input type="text" id="menuView" class="form-control" disabled>
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
		      <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Cancel</button>
			  	
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
