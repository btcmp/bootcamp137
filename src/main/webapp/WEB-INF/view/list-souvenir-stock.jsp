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
  	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/jquery.datetimepicker.min.css">
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
		width:96%;
		margin:auto;
		margin-bottom:20px;
	}
	
	#body2{
		width:96%;
		margin:auto;
	}
	
	#btn-add{
		width:70px;
		float:right;
	}
	
	#btn-search{
		width:70px;
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
  	
  	
  	
  	
  	<script src="${pageContext.request.contextPath }/assets/js/jquery.datetimepicker.full.js"></script>
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
		
	$(document).on(('click'), '#save-btn-add-souvenir-stock', function(){
		var stock = {
			//createdBy : $('#id-created-by').val(),
			code : $('#transaction-code-save-souvenir-stock').val(),
			receivedBy : {
				id : $('#recived-by-save-souvenir-stock option:selected').val(),
			},
			receivedDate : new Date($('#received-date-save-souvenir-stock').val()),
			note : $('#note-save-souvenir-stock').val(),
			transactionSouvenirItem : []
		};
		
		_readTableData(stock.transactionSouvenirItem);
		console.log(stock);
			
		$.ajax({
			url : '${pageContext.request.contextPath}/souvenirstock/save',
			type : 'POST',
			data : JSON.stringify(stock),
			contentType : 'application/json',
			success: function(data){
			//	console.log(data);
				window.location = '${pageContext.request.contextPath}/souvenirstock';
			}, error : function(){
				alert('error');
			}
		});
	});
		
		function _readTableData(transactionSouvenirItem){
			$('#add-item-table > tbody > tr').each(function(index, value){
				var transactionitem ={
						mSouvenirId : {
							id : parseInt($(value).find('td').eq(0).find('select option:selected').val())
						},
						qty : $(value).find('td').eq(1).find('input').val(),
						note : $(value).find('td').eq(2).find('input').val()
				};
				console.log(transactionitem);
				transactionSouvenirItem.push(transactionitem);
			});
		}
		
		$('#add-item-btn').on('click', function(){
			var aTable = $('#add-item-table');
			var tBody = aTable.find('tbody');
					
			var appendString = "<tr>";
			
				appendString += "<td>";
					appendString += '<select class="form-control"><option>- List Souvenir -</option><c:forEach items="${listSouvenir}" var="souvenir"><option value="${souvenir.id}">${souvenir.name}</option></c:forEach></select>';
				appendString += "</td>";
				
				appendString += "<td width=60px;>";
					appendString += '<input type="text" name="reciveddate" placeholder="Qty" class="form-control">';
				appendString += "</td>";
				
				appendString += "<td>";
					appendString += '<input type="text" name="Note" placeholder="Note" class="form-control">';
				appendString += "</td>";
				
				appendString += "<td>";
					appendString += '<a href="#" class="edit" id="${product.id}" style="color:inherit;"><i class="fas fa-pencil-alt"></i></a><a href="#" class="delete-append" id="${product.id}" style="color:inherit;"><i class="fas fa-trash"></i></a>';
				appendString += "</td>";
		
			appendString += "</tr>";	
			
			tBody.append(appendString);
			
			$('.delete-append').on('click', function(){
				$(this).closest("tr").remove();
			});
		});	
		
		
		var deleteid;
		$('.delete').on('click', function(){
			deleteid = $(this).attr('deleteid');
			$('#modalDelete').modal();
		});
		
		$('#btn-delete-yes').on('click', function(){
			console.log(deleteid);
			window.location='${pageContext.request.contextPath}/souvenirstock/delete/'+deleteid;
		});
		
		$('.edit').on('click', function(){
			$('#modalEdit').modal();
			var editId = $(this).attr('editid');
			//console.log(viewId);
			$.ajax({
				url : '${pageContext.request.contextPath}/souvenirstock/getTransactionSouvenir?id='+editId,
				type : 'GET',
				success : function(object){
					//object pada transaksi souvenir
					$('#id-update').val(object.id);
					$('#transaction-code-edit-souvenir-stock').val(object.code);
					$('#received-by-edit-souvenir-stock').val(object.receivedBy.id);
					$('#received-date-edit-souvenir-stock').val(object.receivedDate);
					$('#note-edit-souvenir-stock').val(object.note);
					//object pada transaksi souvenir item
					var aTable2 = $('#edit-item-table');
					var tBody2 = aTable2.find('tbody');
					tBody2.find('tr').remove();
					var i = 0;
					$.each(object.transactionSouvenirItem, function(index, value){
						//console.log(index, value);
							var souvenir = value.mSouvenirId;
							//console.log(souvenir);
							var appendString2 = "<tr>";
							
								appendString2 += "<td>";
									appendString2 += '<select id="souvenir_'+souvenir.id+'_'+i+'" class="form-control"><option>- List Souvenir -</option><c:forEach items="${listSouvenir}" var="souvenir"><option value="${souvenir.id}">${souvenir.name}</option></c:forEach></select>';
								appendString2 += "</td>";
								
								appendString2 += "<td width=60px;>";
									appendString2 += '<input type="text" class="form-control" value="'+value.qty+'">';
								appendString2 += "</td>";
								
								appendString2 += "<td>";
									appendString2 += '<input type="text" value="'+value.note+'" class="form-control">';
								appendString2 += "</td>";
								
								appendString2 += "<td>";
									appendString2 += '<a href="#" class="edit" id="${product.id}" style="color:inherit;"><i class="fas fa-pencil-alt"></i></a><a href="#" class="delete-append" id="${product.id}" style="color:inherit;"><i class="fas fa-trash"></i></a>';
								appendString2 += "</td>";
								
								appendString2 += "<td>";
									appendString2 += '<input type="hidden" value="'+value.id+'">';
								appendString2 += "</td>";
						
							appendString2 += "</tr>";	
							
							tBody2.append(appendString2);
							$('#souvenir_'+souvenir.id+'_'+i).val(souvenir.id);
							console.log(souvenir.id);
							i++;
					});
					//console.log(object);
				},
				error : function(){
					alert('error');
				},
				dataType:'json'
			});
		});
		
		//////////////////////////////////////////////////////////////////////////////////////
		$('#btn-update-yes').on('click', function(){
			var stock = {
					id : $('#id-update').val(),
					code : $('#transaction-code-edit-souvenir-stock').val(),
					receivedBy : {
						id : $('#received-by-edit-souvenir-stock option:selected').val(),
					},
					receivedDate : new Date($('#received-date-edit-souvenir-stock').val()),
					note : $('#note-edit-souvenir-stock').val(),
					transactionSouvenirItem : []
				};
			
			_readTableData1(stock.transactionSouvenirItem);
			
			//console.log(stock);
			$.ajax({
				url : '${pageContext.request.contextPath}/souvenirstock/update',
				type : 'POST',
				data : JSON.stringify(stock),
				contentType : 'application/json',
				success: function(data){
					console.log(data);
					window.location = '${pageContext.request.contextPath}/souvenirstock';
				}, error : function(){
					alert('error');
				}
			});			
		});
		
		function _readTableData1(transactionSouvenirItem){
			$('#edit-item-table > tbody > tr').each(function(index, value){
				var transactionitem ={
						id : $(value).find('td').eq(4).find('input').val(),
						mSouvenirId : {
							id : parseInt($(value).find('td').eq(0).find('select option:selected').val())
						},
						qty : $(value).find('td').eq(1).find('input').val(),
						note : $(value).find('td').eq(2).find('input').val()
				};
				console.log(transactionitem);
				transactionSouvenirItem.push(transactionitem);
			});
		}
		
		$('#edit-item-btn').on('click', function(){
			var aTable3 = $('#edit-item-table');
			var tBody3 = aTable3.find('tbody');
					
			var appendString3 = "<tr>";
			
				appendString3 += "<td>";
					appendString3 += '<select class="form-control"><option>- List Souvenir -</option><c:forEach items="${listSouvenir}" var="souvenir"><option value="${souvenir.id}">${souvenir.name}</option></c:forEach></select>';
				appendString3 += "</td>";
				
				appendString3 += "<td width=60px;>";
					appendString3 += '<input type="text" name="reciveddate" placeholder="Qty" class="form-control">';
				appendString3 += "</td>";
				
				appendString3 += "<td>";
					appendString3 += '<input type="text" name="Note" placeholder="Note" class="form-control">';
				appendString3 += "</td>";
				
				appendString3 += "<td>";
					appendString3 += '<a href="#" class="edit" id="${product.id}" style="color:inherit;"><i class="fas fa-pencil-alt"></i></a><a href="#" class="delete-append-update" id="${product.id}" style="color:inherit;"><i class="fas fa-trash"></i></a>';
				appendString3 += "</td>";
		
			appendString3 += "</tr>";	
			
			tBody3.append(appendString3);
			
			$('.delete-append-update').on('click', function(){
				$(this).closest("tr").remove();
			}); 
		});
		//////////////////////////////////////////////////////////////////////////////////////
		
		$('.view').on('click', function(){
			$('#modalView').modal();
			var viewId = $(this).attr('id');
			//console.log(viewId);
			$.ajax({
				url : '${pageContext.request.contextPath}/souvenirstock/getTransactionSouvenir?id='+viewId,
				type : 'GET',
				success : function(object){
					//object pada transaksi souvenir
					$('#transaction-code-view-souvenir-stock').val(object.code);
					//var firstname = (object.receivedBy.firstName);
					//var lastname = (object.receivedBy.lastName);
					//var name = firstname + " " + lastname;
					//var name = (object.receivedBy.firstName) + " " + (object.receivedBy.lastName);
					//$('#received-by-view-souvenir-stock').val((object.receivedBy.firstName) + " " + (object.receivedBy.lastName));
					$('#received-by-view-souvenir-stock').val(object.receivedBy.id);
					//$('#received-by-view-souvenir-stock').val(object.receivedBy.lastName);
					$('#received-date-view-souvenir-stock').val(object.receivedDate);
					$('#note-view-souvenir-stock').val(object.note);
					//object pada transaksi souvenir item
					var aTable1 = $('#view-item-table');
					var tBody1 = aTable1.find('tbody');
					tBody1.find('tr').remove();
					$.each(object.transactionSouvenirItem, function(index, value){
						console.log(index, value);
							
							var appendString1 = "<tr>";
							
								appendString1 += "<td>";
									appendString1 += '<input type="text" value="'+value.mSouvenirId.name+'" class="form-control" disabled>';
								appendString1 += "</td>";
								
								appendString1 += "<td width=60px;>";
									appendString1 += '<input type="text" class="form-control" value="'+value.qty+'" disabled>';
								appendString1 += "</td>";
								
								appendString1 += "<td>";
									appendString1 += '<input type="text" value="'+value.note+'" class="form-control" disabled>';
								appendString1 += "</td>";
						
							appendString1 += "</tr>";	
							
							tBody1.append(appendString1);
					});
					//console.log(object);
				},
				error : function(){
					alert('error');
				},
				dataType:'json'
			});
		});	
		
		$('#btn-search').on('click', function(){
			var lala = $("#form-search");
			var data = lala.serialize();
			console.log(data);
			window.location = '${pageContext.request.contextPath}/souvenirstock/search?'+data;
		});
		
		$('#datetime').datetimepicker({
			format: 'd-M-y'
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
    	
    	 <div id="container">
	
		<div id="header">
			<h5>LIST SOUVENIR STOCK<h5>
		</div>
		
		<div id="body">
		
			<div id="body1">
			  <ol class="breadcrumb">
				<li><a href="#">Home </a>/</li>
				<li><a href="#">Master </a>/</li>
				<li><a href="#">List Souvenir Stock</a></li>
			  </ol>
				
			<a href="#" class="btn btn-sm btn-primary" id="btn-add">Add</a><br><br>
			
			<form id="form-search">
			  <div class="form-row">
				<div class="col-auto">
				  <input type=text name="code" id="Transaction_Code" class="form-control" placeholder="Transaction Code">
				</div>
				<div class="col-auto">
				  <input type=text name="received_by" id="Received_By" class="form-control" placeholder="Received By">
				</div>
				<div class="col-auto">
				  <input name="received_date" id="Received_Date" class="form-control" onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="Received Date">
				</div>
				<div class="col">
				  <input type=date name="createDate" id="create_Date" class="form-control" onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="Recived Date">
				</div>
				<div class="col-auto">		
				  <input type=text name="createBy" id="created_By" class="form-control" placeholder="Created Date">
				</div>
				<div class="col-auto">		
				  <a href="#" class="btn btn-sm btn-warning" id="btn-search" data-toggle="modal" data-target="#exampleModalCenter" >Search</a>
				</div>
				<div class="col-auto">		
				  <input id="datetime">
				</div>			
			  </div>
			 </form>			
			</div>
			
			<div id="body2">
			  <table class="table" id="table-id-stock">
				<thead>
				  <tr>
					<th scope="col">No</th>
					<th scope="col">Transaction Code</th>
					<th scope="col">Recieved By</th>
					<th scope="col">Received Date</th>
					<th scope="col">Create Date</th>
					<th scope="col">Create By</th>
					<th scope="col">Action</th>
				  </tr>
				</thead>
				  <tbody>
					<c:forEach items="${listTransactionSouvenir}" var="ts">
					<tr>
					  <td class="counterCell"></td>
					  <td>${ts.code}</td>
					  <td>${ts.receivedBy.firstName} ${ts.receivedBy.lastName}</td>
				  	  <td>${ts.receivedDate}</td>
					  <td>${ts.createdDate}</td>
					  <td><%-- ${ts.createBy} --%></td>
					  <td>
					  	<a href="#" class="edit" editid="${ts.id}" style="color:inherit;"><i class="fas fa-pencil-alt"></i></a>
					  	<a href="#" class="view" id="${ts.id}" style="color:inherit;"><i class="fas fa-search"></i></a>
					  </td>
					</tr>
					</c:forEach>
				</tbody>
		   	  </table>
		   	  
		</div>
	  </div>
	</div>
	
	<!--/////////////////////////////// Modal Add \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
	<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div class="modal-atas" style="border-radius:5px;">
	        	<input type="hidden" id="id-create-by">
	        	<div style="width:98%;margin:auto;border:solid 1px aqua;padding:1px;border-radius:5px;padding-top:15px;">
					<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>*Transaction code :</p>
		        	  </div>
		        	  <div class="col-sm-6">
		        		<input type="text" name="souvenir-name" placeholder="${hasil}" class="form-control" id="transaction-code-save-souvenir-stock" value="${hasil}" disabled>
		        	  </div>
		        	</div>
		        	
		        	<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>*Recieved By :</p>
		        	  </div>
		        	  <div class="col-sm-6">
		        		<select class="form-control" style="margin-bottom:5px;" id="recived-by-save-souvenir-stock">
		        		  <option>- Recived By -</option>
	        			 <c:forEach items="${listEmployee}" var="employee">
	        			  <option value="${employee.id}">${employee.firstName} ${employee.lastName}</option>
	        			 </c:forEach>
	        			</select>
		        	  </div>
		        	</div>
		        	
		        	<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>*Recived Date : </p>
		        	  </div>
		        	  <div class="col-sm-6">
		        		<input type="date" name="recive-date" placeholder="Recive Date" class="form-control" onfocus="(this.type='date')" onblur="(this.type='text')" id="received-date-save-souvenir-stock">
		        	  </div>
		        	</div>
		        	
		        	<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>Note : </p>
		        	  </div>
		        	  <div class="col-sm-6">
		        		<textarea name="note" placeholder="Type Note" class="form-control" style="margin-bottom:5px;" id="note-save-souvenir-stock"></textarea>
		        	  </div>
		        	</div>
		        </div>	
	        </div>
	        <div style="clear:both;"></div>
	        <div class="modal-bawah" style="margin-top:5px;">
		        <div style="float:left;margin-top:5px;"><button type="button" class="btn btn-primary" id="add-item-btn">Add Item</button></div>
		        <div style="clear:both;"></div>
		        <div>		        	
		        	<table style="text-align:center;" id="add-item-table">
		        	  <thead>
		        	    <tr>
		        		  <th>Souvenir Name</th>
		        		  <th width=60px;>Qty</th>
		        		  <th>Note</th>
		        		  <th></th>
		        		</tr>
		        	  </thead>
		        	  <tbody>
		        	    <tr>
		        	      <td>
		        	        <select class="form-control">
		        	        	<option>- List Souvenir -</option>
		        	          <c:forEach items="${listSouvenir}" var="souvenir">
		        	            <option value="${souvenir.id}">${souvenir.name}</option>
		        	          </c:forEach>
		        	        </select>
		        	      </td>
		        	      <td width=60px;><input type="text" name="reciveddate" placeholder="Qty" class="form-control"></td>
		        	      <td><input type="text" name="Note" placeholder="Note" class="form-control"></td>
		        	      <td>
		        	      	<a href="#" class="edit" id="${product.id}" style="color:inherit;"><i class="fas fa-pencil-alt"></i></a>
					  		<a href="#" class="delete" id="${product.id}" style="color:inherit;"><i class="fas fa-trash"></i></a>
		        	      <td>
		        	   </tr>
		        	 </tbody>
		          </table>
		        </div>
		    </div>
	 	  </div>
	 	  <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="save-btn-add-souvenir-stock">Save</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	 	</div>
	  </div>
	</div>
	
	<!-- /////////////////////////////// Modal Edit \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
	<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div class="modal-atas" style="border-radius:5px;">
	        	<input type="hidden" id="id-update">
	        	<div style="width:98%;margin:auto;border:solid 1px aqua;padding:1px;border-radius:5px;padding-top:7px;">
					<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>*Transaction code :</p>
		        	  </div>
		        	  <div class="col-sm-6">
		        		<input type="text" name="souvenir-name" placeholder="Souvenir Name" class="form-control" id="transaction-code-edit-souvenir-stock">
		        	  </div>
		        	</div>
		        	
		        	<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>*Recieved By :</p>
		        	  </div>
		        	  <div class="col-sm-6">
		        		<select class="form-control" style="margin-bottom:5px;" id="received-by-edit-souvenir-stock">
		        		  <option>- Recived By -</option>
	        			 <c:forEach items="${listEmployee}" var="employee">
	        			  <option value="${employee.id}">${employee.firstName} ${employee.lastName}</option>
	        			 </c:forEach>
	        			</select>
		        	  </div>
		        	</div>
		        	
		        	<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>*Recived Date : </p>
		        	  </div>
		        	  <div class="col-sm-6">
		        		<input type="date" name="recive-date" placeholder="Recive Date" class="form-control" onfocus="(this.type='date')" onblur="(this.type='text')" id="received-date-edit-souvenir-stock">
		        	  </div>
		        	</div>
		        	
		        	<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>Note : </p>
		        	  </div>
		        	  <div class="col-sm-6">
		        		<textarea name="note" placeholder="Type Note" class="form-control" style="margin-bottom:5px;" id="note-edit-souvenir-stock"></textarea>
		        	  </div>
		        	</div>
		        </div>	
	        </div>
	        <div style="clear:both;"></div>
	        <div class="modal-bawah" style="margin-top:5px;">
		        <div style="float:left;margin-top:5px;"><button type="button" class="btn btn-primary" id="edit-item-btn">Add Item</button></div>
		        <div style="clear:both;"></div>
		        <div>		        	
		        	<table style="text-align:center;" id="edit-item-table">
		        	  <thead>
		        	    <tr>
		        		  <th>Souvenir Name</th>
		        		  <th width=60px;>Qty</th>
		        		  <th>Note</th>
		        		  <th></th>
		        		</tr>
		        	  </thead>
		        	  <tbody>
		        	    <tr>
		        	      <td>
		        	        <select class="form-control">
		        	          <c:forEach items="${listSouvenir}" var="souvenir">
		        	          	<option>- List Souvenir -</option>
		        	            <option value="${souvenir.id}">${souvenir.name}</option>
		        	          </c:forEach>
		        	        </select>
		        	      </td>
		        	      <td width=60px;><input type="text" name="reciveddate" placeholder="Qty" class="form-control"></td>
		        	      <td><input type="text" name="Note" placeholder="Note" class="form-control"></td>
		        	      <td>
		        	      	<a href="#" class="edit" id="${product.id}" style="color:inherit;"><i class="fas fa-pencil-alt"></i></a>
					  		<a href="#" class="delete" id="${product.id}" style="color:inherit;"><i class="fas fa-trash"></i></a>
		        	      <td>
		        	   </tr>
		        	 </tbody>
		          </table>
		        </div>
		    </div>
	 	  </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="btn-update-yes">Update</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
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
	        <button type="button" class="btn btn-warning" data-dismiss="modal" id="btn-delete-yes">Yes</button>
	        <button type="button" class="btn btn-primary">No</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--/////////////////////////////// Modal View \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
	<div class="modal fade" id="modalView" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Veiw List</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div class="modal-atas" style="border-radius:5px;">
	        	<div style="width:98%;margin:auto;border:solid 1px aqua;padding:1px;border-radius:5px;padding-top:7px;">
					<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>*Transaction code :</p>
		        	  </div>
		        	  <div class="col-sm-6">
		        		<input type="text" name="souvenir-name" placeholder="Souvenir Name" class="form-control" id="transaction-code-view-souvenir-stock" disabled>
		        	  </div>
		        	</div>
		        	
		        	<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>*Recieved By :</p>
		        	  </div>
		        	  <div class="col-sm-6">
		        	  	<select id="received-by-view-souvenir-stock" style="margin-bottom:5px;" class="form-control" disabled>
		        	  	  <option>- Recived By -</option>
	        			 <c:forEach items="${listEmployee}" var="employee">
	        			  <option value="${employee.id}">${employee.firstName} ${employee.lastName}</option>
	        			 </c:forEach>
	        			</select>
		        	  </div>
		        	</div>
		        	
		        	<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>*Recived Date : </p>
		        	  </div>
		        	  <div class="col-sm-6">
		        		<input type="date" name="receive-date" placeholder="Receive Date" class="form-control" id="received-date-view-souvenir-stock" disabled>
		        	  </div>
		        	</div>
		        	
		        	<div class="row" style="margin-bottom:5px;">
		        	  <div class="col-sm-5" style="text-align:right;">
		        		<p>Note : </p>
		        	  </div>
		        	  <div class="col-sm-6">
		        		<textarea name="note" placeholder="Type Note" class="form-control" style="margin-bottom:5px;" id="note-view-souvenir-stock" disabled></textarea>
		        	  </div>
		        	</div>
		        </div>	
	        </div>
	        <div style="clear:both;"></div>
	        <div class="modal-bawah" style="margin-top:5px;">
		        <div style="clear:both;"></div>
		        <div>		        	
		        	<table style="text-align:center;" id="view-item-table">
		        	  <thead>
		        	    <tr>
		        		  <th>Souvenir Name</th>
		        		  <th width=60px;>Qty</th>
		        		  <th>Note</th>
		        		  <th></th>
		        		</tr>
		        	  </thead>
		        	  <tbody>
		        	   <%--  <tr>
		        	      <td>
		        	        <select class="form-control" disabled>
		        	          <c:forEach items="${listSouvenir}" var="souvenir">
		        	            <option value="${souvenir.id}">${souvenir.name}</option>
		        	          </c:forEach>
		        	        </select>
		        	      </td>
		        	      <td width=60px;><input type="text" name="reciveddate" placeholder="Qty" class="form-control" disabled></td>
		        	      <td><input type="text" name="Note" placeholder="Note" class="form-control" disabled></td>
		        	      <td>
		        	      	<a href="#" class="edit" id="${product.id}" style="color:inherit;"><i class="fas fa-pencil-alt"></i></a>
					  		<a href="#" class="delete" id="${product.id}" style="color:inherit;"><i class="fas fa-trash"></i></a>
		        	      <td>
		        	   </tr> --%>
		        	 </tbody>
		          </table>
		        </div>
		    </div>
	 	  </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
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
   var t = $('#table-id-stock').DataTable({
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
