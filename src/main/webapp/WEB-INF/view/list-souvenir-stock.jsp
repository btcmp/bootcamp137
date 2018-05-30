<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<title>L.I.S.T S.O.U.V.E.N.I.R</title>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css"> --%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btn-add').on('click', function(){
			$('#modalAdd').modal();
		});
		
	$(document).on(('click'), '#save-btn-add-souvenir-stock', function(){
		var stock = {
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
					$.each(object.transactionSouvenirItem, function(index, value){
						//console.log(index, value);
							var souvenir = value.mSouvenirId;
							//console.log(souvenir);
							var appendString2 = "<tr>";
							
								appendString2 += "<td>";
									appendString2 += '<select id="souvenir_'+souvenir.id+'" value="'+souvenir.name+'" class="form-control"><option>- List Souvenir -</option><c:forEach items="${listSouvenir}" var="souvenir"><option value="${souvenir.id}">${souvenir.name}</option></c:forEach></select>';
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
							$('#souvenir_'+souvenir.id).val(souvenir.id);
							console.log(souvenir.id);
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
					//window.location = '${pageContext.request.contextPath}/souvenir';
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
	});
</script>
</head>
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
	
	table{
		counter-reset:tableCount;
	}
	
	.counterCell:before{
		content: counter(tableCount);
		counter-increment: tableCount;
	}
</style>

<body>

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
				
			  <div class="form-row">
				<div class="col-auto">
				  <input type=text name="code" id="Transaction_Code" class="form-control" placeholder="Transaction Code">
				</div>
				<div class="col-auto">
				  <input type=text name="received_by" id="Received_By" class="form-control" placeholder="Received By">
				</div>
				<div class="col-auto">
				  <input type=date name="received_date" id="Received_Date" class="form-control" onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="Received Date">
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
			  </div>			
			</div>
			
			<div id="body2">
			  <table class="table">
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
						<a href="#" class="delete" deleteid="${ts.id}" style="color:inherit;"><i class="fas fa-trash"></i></a>
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
		        <div style="float:left;margin-top:5px;"><button type="button" class="btn btn-primary" id="add-item-btn">Add Item</button></div>
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
	
</body>
</html>