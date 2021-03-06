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
  <title>List Transaction Souvenir</title>
  	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">


<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
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
	border-color:#843534;
    box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #ce8483
	/* color: #B94A48 !important;
	background-color: #F2DEDE !important;
	border: 1px solid #EED3D7 !important; */
}
select.parsley-error
{
	border-color:#843534;
    box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #ce8483
	/* color: #B94A48 !important;
	background-color: #F2DEDE !important;
	border: 1px solid #EED3D7 !important; */
}
  </style>
  
<!-- 	validasi -->
  	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/parsley.min.js"></script>
<!-- 	validasi -->
  	
  	
  	 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <!-- <script src = "https://code.jquery.com/jquery-1.10.2.js"></script> -->
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  	
  	<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>


<script type="text/javascript">
	var delObj = null;
 
	 $(function() {
         $( "#requestdate" ).datepicker({
        	 dateFormat:"yy-mm-dd"
         });
         $( "#due-date" ).datepicker({
        	 dateFormat:"yy-mm-dd"
         });
         $( "#created" ).datepicker({
        	 dateFormat:"yy-mm-dd"
         });
         $( "#duedate" ).datepicker({
        	 dateFormat:"yy-mm-dd"
         }); 
         $( "#duedateedit" ).datepicker({
        	 dateFormat:"yy-mm-dd"
         });
      });
	
	$(document).ready(function(){
		
		var viewByAdmin = <%= request.isUserInRole("ROLE_ADMIN") %>;
		if (viewByAdmin) {
			document.getElementById('btn-add').style.display = 'none';
		}
		
		
		  $("#success-alert").hide();
		
		$('#cancel-btn').click(function(){
			$('#modal-delete').modal('toggle');
		});
		
		$('#close').click(function(){
			$('#modal-delete').modal('toggle');
		});
		
		$('#add-item').on('click', function(){
			_addRowItem();
		});
		
		$(document).on('click','#save-btn-request', function(){
			var request = {
					code : $('#code').val(),
					tEventId : {
						id : $('#event-code option:selected').val()
					},
					requestBy : {
						id : 1 //$('#requestby').val()
					}, 
					requestDate : new Date($('#requestdate').val()),
					requestDueDate : new Date($('#duedate').val()),
					note : $('#note').val(),
					//status : 1,
					transactionSouvenirItem : []
			};
			
			//validasi field di  modal add
			
			var validateEvent = $('#event-code').parsley({
				required : true,
				requiredMessage : 'The Field cant be Empty'
			});
			var validateDueDate = $('#duedate').parsley({
				required : true,
				requiredMessage : 'The Field cant be Empty'
			});
			
			
			//validate function
			function getValid(validate){
				validate.validate();
				return validate.isValid();
			}
			
			var valid = getValid(validateEvent);
				valid = getValid(validateDueDate);
				
				var validateSouvenirItem = $('.validatesouvenir').parsley({
					required : true,
					requiredMessage : 'The Field cant be Empty'
				});
				for(i = 0; i < validateSouvenirItem.length; i++){
					valid = getValid(validateSouvenirItem[i]);
				}
				
				var validateQtyItem = $('.validateqty').parsley({
					required : true,
					requiredMessage : 'The Field cant be Empty'
				});
				for(i = 0; i < validateQtyItem.length; i++){
					valid = getValid(validateQtyItem[i]);
				}
			
			_readTableData(request.transactionSouvenirItem);
			console.log(request);
			
			if(valid){
				$.ajax({
					url : '${pageContext.request.contextPath}/souvenirrequest/save',
					type : 'POST',
					data : JSON.stringify(request),
					contentType : 'application/json',
					success: function(data){
						console.log(data);
						window.location = '${pageContext.request.contextPath}/souvenirrequest'
					}, error : function(){
						alert('error');
					}
					
				});
			} else {
				alert('Please Complete the Blank Field(s)');
			}
			
			$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
			    $("#success-alert").slideUp(500);
			});
			
		});
		
		
		function _readTableData(transactionSouvenirItem){
			$('#data-add-item > tbody > tr').each(function(index, value){
				var transactionItem = {
							mSouvenirId : {
								id : parseInt($(value).find('td').eq(0).find('select option:selected').val())
							}, 
							qty : $(value).find('td').eq(1).find('input').val(),
							note : $(value).find('td').eq(2).find('input').val()
				}; 
				transactionSouvenirItem.push(transactionItem);
			});
		};
		
		function _addRowItem(){
			var oTable = $('#data-add-item');
			var tBody = oTable.find('tbody');
			
			var appendString = "<tr>";
			appendString += "<td>";
				appendString += "<select class='form-control validatesouvenir' id='souvenir-item'><option selected value=''>- Select Souvenir -</option><c:forEach items='${listSouvenirItem }' var='item'><option value='${item.id }'>${item.name }</option></c:forEach></select>";
			appendString += "</td>";
			appendString += "<td>";
				appendString += "<input style='width:60px;' type='text' id='qty' placeholder='Qty' class='form-control validateqty'>";
			appendString += "</td>";
			appendString += "<td>";
				appendString += "<input type='text' id='note' placeholder='Note' class='form-control'>";
			appendString += "</td>";
			appendString += "<td>";
				appendString += "<a data-id='${souvenir.id }' id='btn-edit' href='#' style='color:inherit;'><i class='fas fa-pencil-alt'></i></a> <a class='btn-delete' href='#' style='color:inherit;'><i class='fas fa-trash'></i></a>";
			appendString += "</td>";
		appendString += "</tr>";
		
		tBody.append(appendString);
		};
		
		//milih row yg mau di delete
		$(document).on('click','.btn-delete', function(){
			delObj = $(this).parent().parent();
			$('#modal-delete').modal();
		});
		
		//delete row
		$(document).on('click','.btn-delete-item', function(){
			delObj.remove();
			$('#modal-delete').modal('hide');
		});
		
		
		//view
		$(document).on('click', '#btn-view-transaksi', function(){
			var id = $(this).attr('data-id');
			$.ajax({
				url : '${pageContext.request.contextPath}/souvenirrequest/gettransactionsouvenir?id=' + id,
				type : 'GET',
				success : function(obj){
					var fullName = obj.requestBy.firstName + ' ' + obj.requestBy.lastName;
					$('#id-view').val(obj.id);
					$('#code-view').val(obj.code);
					$('#event-code-view').val(obj.tEventId.id);
					$('#requestbyview').val(fullName);
					$('#requestdateview').val(obj.requestDate);
					$('#duedateview').val(obj.requestDueDate);
					$('#noteview').val(obj.note);
					
					var oTable1 = $('#dataitem');
					var tBody1 = oTable1.find('tbody');
					tBody1.find('tr').remove();
					$.each(obj.transactionSouvenirItem, function(index, value){
						console.log(index,value);
						
						var souvenir = value.mSouvenirId;
						var appendString1 = "<tr>";
								appendString1 += "<td>";
									appendString1 += "<input class='form-control' id='qty-item' value='"+souvenir.name+"' disabled>";
								appendString1 += "</td>";
								appendString1 += "<td>";
									appendString1 += "<input class='form-control' id='qty-item' value='"+value.qty+"' disabled>";
								appendString1 += "</td>";
								appendString1 += "<td>";
									appendString1 += "<input class='form-control' id='note-item' value='"+value.note+"' disabled>";
								appendString1 += "</td>";
							appendString1 += "</tr>";
							
							
						tBody1.append(appendString1);
						$('#souvenir_'+souvenir.id).val(souvenir.id);
					});
				}, error : function(){
					alert('error');
					
				},
				dataType : 'json'
				
			});
			
			if($(this).attr('data-status') == 1){
				var status = document.getElementById('statusview');
				status.value = "Submitted";
			} else if($(this).attr('data-status') == 2){
				var status = document.getElementById('statusview');
				status.value = "In Progress";
			} else if($(this).attr('data-status') == 3){
				var status = document.getElementById('statusview');
				status.value = "Received By Requester";
			} else if($(this).attr('data-status') == 4){
				var status = document.getElementById('statusview');
				status.value = "Settlement";
			} else if($(this).attr('data-status') == 5){
				var status = document.getElementById('statusview');
				status.value = "Approved Settlement";
			} else if($(this).attr('data-status') == 6){
				var status = document.getElementById('statusview');
				status.value = "Close Request";
			} else if($(this).attr('data-status') == 0){
				var status = document.getElementById('statusview');
				status.value = "Rejected";
			}
			
			$('#modal-view-transaksi').modal();
		});
		
		//search listener
		$('.search').on('click', function(){
			var form = $('#form-transaction-souvenir');
			var data = form.serialize();
			
			console.log(data);
			
			window.location='${pageContext.request.contextPath }/souvenirrequest/search?'+data;
		});
		
		//edit
		$(document).on('click', '#btn-edit-transaksi', function(){
			var id = $(this).attr('data-id');
			var statusRequester = $(this).attr("data-role-requester");
			var statusAdmin = $(this).attr("data-role-admin");
			$.ajax({
				url : '${pageContext.request.contextPath}/souvenirrequest/gettransactionsouvenir?id=' + id,
				type : 'GET',
				success : function(obj){
					var fullName = obj.requestBy.firstName + ' ' + obj.requestBy.lastName;
					$('#id-edit').val(obj.id);
					$('#id-admin').val(obj.id);
					$('#id-received').val(obj.id);
					$('#id-set').val(obj.id);
					$('#id-apset').val(obj.id);
					$('#id-close').val(obj.id);
					$('#code-edit').val(obj.code);
					$('#code-admin').val(obj.code);
					$('#code-received').val(obj.code);
					$('#code-set').val(obj.code);
					$('#code-apset').val(obj.code);
					$('#code-close').val(obj.code);
					$('#event-code-edit').val(obj.tEventId.id);
					$('#event-code-admin').val(obj.tEventId.id);
					$('#event-code-received').val(obj.tEventId.id);
					$('#event-code-set').val(obj.tEventId.id);
					$('#event-code-apset').val(obj.tEventId.id);
					$('#event-code-close').val(obj.tEventId.id);
					$('#requestbyedit').val(fullName);
					$('#requestbyadmin').val(fullName);
					$('#requestbyreceived').val(fullName);
					$('#requestbyset').val(fullName);
					$('#requestbyapset').val(fullName);
					$('#requestbyclose').val(fullName);
					$('#requestdateedit').val(obj.requestDate);
					$('#requestdateadmin').val(obj.requestDate);
					$('#requestdatereceived').val(obj.requestDate);
					$('#requestdateset').val(obj.requestDate);
					$('#requestdateapset').val(obj.requestDate);
					$('#requestdateclose').val(obj.requestDate);
					$('#duedateedit').val(obj.requestDueDate);
					$('#duedateadmin').val(obj.requestDueDate);
					$('#duedatereceived').val(obj.requestDueDate);
					$('#duedateset').val(obj.requestDueDate);
					$('#duedateapset').val(obj.requestDueDate);
					$('#duedateclose').val(obj.requestDueDate);
					$('#noteedit').val(obj.note);
					$('#noteadmin').val(obj.note);
					$('#notereceived').val(obj.note);
					$('#noteset').val(obj.note);
					$('#noteapset').val(obj.note);
					$('#noteclose').val(obj.note);
					$('#rejectreasonrequester').val(obj.rejectReason);
					
/* ---------------------------ketika status 1 (Requester)--------------------------------- */					
					var oTable2 = $('#dataitemedit');
					var tBody2 = oTable2.find('tbody');
					tBody2.find('tr').remove();
					$.each(obj.transactionSouvenirItem, function(index, value){
						//console.log(index,value);
						
						var souvenir = value.mSouvenirId;
						var appendString2 = "<tr>";
								appendString2 += "<td>";
									appendString2 += "<select class='form-control' id='souveniredit_"+souvenir.id+"' value='"+souvenir.name+"'><c:forEach items='${listSouvenirItem }' var='item'><option value='${item.id }'>${item.name }</option></c:forEach></select>";
								appendString2 += "</td>";
								appendString2 += "<td>";
									appendString2 += "<input class='form-control' id='qty-item-edit' value='"+value.qty+"'>";
								appendString2 += "</td>";
								appendString2 += "<td>";
									appendString2 += "<input class='form-control' id='note-item-edit' value='"+value.note+"'>";
								appendString2 += "</td>";
								appendString2 += "<td>";
									appendString2 += "<a data-id='${souvenir.id }' id='btn-edit-edit' href='#' style='color:inherit;'><i class='fas fa-pencil-alt'></i></a> <a class='btn-delete-edit' href='#' style='color:inherit;'><i class='fas fa-trash'></i></a>";
								appendString2 += "</td>";
								appendString2 += "<td>";
									appendString2 += "<input type='hidden' id='id-edit-item' value='"+value.id+"'>";
								appendString2 += "</td>";
							appendString2 += "</tr>";
							
							
						tBody2.append(appendString2);
						$('#souveniredit_'+souvenir.id).val(souvenir.id);
					});
					
/* ---------------------------ketika status 1 (Admin)--------------------------------- */					
					var oTable2 = $('#dataitemadmin');
					var tBody2 = oTable2.find('tbody');
					tBody2.find('tr').remove();
					$.each(obj.transactionSouvenirItem, function(index, value){
						//console.log(index,value);
						
						var souvenir = value.mSouvenirId;
						var appendString2 = "<tr>";
								appendString2 += "<td>";
									appendString2 += "<select class='form-control' id='souveniredit_"+souvenir.id+"' value='"+souvenir.name+"' disabled><c:forEach items='${listSouvenirItem }' var='item'><option value='${item.id }'>${item.name }</option></c:forEach></select>";
								appendString2 += "</td>";
								appendString2 += "<td>";
									appendString2 += "<input class='form-control' id='qty-item-edit' value='"+value.qty+"' disabled>";
								appendString2 += "</td>";
								appendString2 += "<td>";
									appendString2 += "<input class='form-control' id='note-item-edit' value='"+value.note+"' disabled>";
								appendString2 += "</td>";
								appendString2 += "<td>";
									appendString2 += "<input type='hidden' id='id-edit-item' value='"+value.id+"'>";
								appendString2 += "</td>";
							appendString2 += "</tr>";
							
							
						tBody2.append(appendString2);
						$('#souveniredit_'+souvenir.id).val(souvenir.id);
					});
					

/* ---------------------------ketika status 2 (Requester)--------------------------------- */					
					var oTable2 = $('#dataitemreceived');
					var tBody2 = oTable2.find('tbody');
					tBody2.find('tr').remove();
					$.each(obj.transactionSouvenirItem, function(index, value){
						//console.log(index,value);
						
						var souvenir = value.mSouvenirId;
						var appendString2 = "<tr>";
								appendString2 += "<td>";
									appendString2 += "<input class='form-control' value='"+souvenir.name+"' disabled />";
								appendString2 += "</td>";
								appendString2 += "<td>";
									appendString2 += "<input class='form-control' id='qty-item-edit' value='"+value.qty+"' disabled>";
								appendString2 += "</td>";
								appendString2 += "<td>";
									appendString2 += "<input class='form-control' id='note-item-edit' value='"+value.note+"' disabled>";
								appendString2 += "</td>";
								appendString2 += "<td>";
									appendString2 += "<input type='hidden' id='id-edit-item' value='"+value.id+"'>";
								appendString2 += "</td>";
							appendString2 += "</tr>";
							
							
						tBody2.append(appendString2);
						$('#souveniredit_'+souvenir.id).val(souvenir.id);
					});
					
/* --------------------ketika status 3--------------------------------- */
					var oTable1 = $('#dataitemset');
					var tBody1 = oTable1.find('tbody');
					tBody1.find('tr').remove();
					console.log(obj);
					$.each(obj.transactionSouvenirItem, function(index, value){
						console.log(value);
						
						var souvenir = value.mSouvenirId;
						var appendString1 = "<tr>";
								appendString1 += "<td>";
									appendString1 += "<input class='form-control' id='nameSouvenirItem' value='"+value.mSouvenirId.name+"' disabled>";
								appendString1 += "</td>";
								appendString1 += "<td>";
									appendString1 += "<input class='form-control' id='qtySouvenirItem' value='"+value.qty+"'disabled> " ;
								appendString1 += "</td>";
								appendString1 += "<td>";
									appendString1 += "<input class='form-control' id='qtySettlementItem' value='"+value.qtySettlement+"'> ";
								appendString1 += "</td>"; 
								appendString1 += "<td>";
									appendString1 += "<input class='form-control' id='noteSouvenirItem' value='"+value.note+"'disabled > ";
								appendString1 += "</td>";
								appendString1 += "<td>";
									appendString1 += "<input type='hidden' lass='form-control' value='"+value.id+"' disabled>";
								appendString1 += "</td>";
								
							appendString1 += "</tr>";
						tBody1.append(appendString1);
					});
					
/* --------------------ketika status 4--------------------------------- */
					var oTable1 = $('#dataitemapset');
					var tBody1 = oTable1.find('tbody');
					tBody1.find('tr').remove();
					console.log(obj);
					$.each(obj.transactionSouvenirItem, function(index, value){
						console.log(value);
						var souvenir = value.mSouvenirId;
						var appendString1 = "<tr>";
								appendString1 += "<td>";
									appendString1 += "<input class='form-control' id='nameSouvenirItem' value='"+value.mSouvenirId.name+"' disabled>";
								appendString1 += "</td>";
								appendString1 += "<td>";
									appendString1 += "<input class='form-control' id='qtySouvenirItem' value='"+value.qty+"'disabled> " ;
								appendString1 += "</td>";
								appendString1 += "<td>";
									appendString1 += "<input class='form-control' id='qtySettlementItem' value='"+value.qtySettlement+"' disabled> ";
								appendString1 += "</td>"; 
								appendString1 += "<td>";
									appendString1 += "<input class='form-control' id='noteSouvenirItem' value='"+value.note+"'disabled > ";
								appendString1 += "</td>";
								appendString1 += "<td>";
									appendString1 += "<input type='hidden' lass='form-control' value='"+value.id+"' disabled>";
								appendString1 += "</td>";
								
							appendString1 += "</tr>";
						tBody1.append(appendString1);
					});
					
/* --------------------ketika status 5--------------------------------- */
						var oTable1 = $('#dataclose');
						var tBody1 = oTable1.find('tbody');
						tBody1.find('tr').remove();
						console.log(obj);
						$.each(obj.transactionSouvenirItem, function(index, value){
						console.log(value);
						var souvenir = value.mSouvenirId;
						var appendString1 = "<tr>";
							appendString1 += "<td>";
								appendString1 += "<input class='form-control' id='nameSouvenirItem' value='"+value.mSouvenirId.name+"' disabled>";
							appendString1 += "</td>";
							appendString1 += "<td>";
								appendString1 += "<input class='form-control' id='qtySouvenirItem' value='"+value.qty+"'disabled> " ;
							appendString1 += "</td>";
							appendString1 += "<td>";
								appendString1 += "<input class='form-control' id='qtySettlementItem' value='"+value.qtySettlement+"' disabled> ";
							appendString1 += "</td>"; 
							appendString1 += "<td>";
								appendString1 += "<input class='form-control' id='noteSouvenirItem' value='"+value.note+"'disabled > ";
							appendString1 += "</td>";
							appendString1 += "<td>";
								appendString1 += "<input type='hidden' lass='form-control' value='"+value.id+"' disabled>";
							appendString1 += "</td>";
						appendString1 += "</tr>";
						tBody1.append(appendString1);
					});
				}, error : function(){
					alert('Error');
				},
		dataType : 'json'
		});

			
			
/* --------------Status sebagai penentu tampilan modal------------- */			
			if($(this).attr('data-status') == 1 && statusRequester=="true"){
				var status = document.getElementById('statusedit');
				status.value = "Submitted";
				$('#modal-edit-transaksi').modal();
			} else if($(this).attr('data-status') == 1 && statusAdmin=="true"){
				var status = document.getElementById('statusadmin');
				status.value = "Submitted";
				$('#modal-admin-transaksi').modal();
			} else if($(this).attr('data-status') == 2 && statusRequester=="true"){
				var status = document.getElementById('statusreceived');
				status.value = "In Progress";
				$('#modal-received-transaksi').modal();
			} else if($(this).attr('data-status') == 3  && statusRequester=="true"){
				var status = document.getElementById('statusset');
				status.value = "Received By Requester";
				$('#modal-settlement-transaksi').modal();
			} else if($(this).attr('data-status') == 4 && statusAdmin=="true" ){
				var status = document.getElementById('statusapset');
				status.value = "Settlement";
				$('#modal-approvement-settlement').modal();
			} else if($(this).attr('data-status') == 5 && statusRequester=="true"){
				var status = document.getElementById('statusclose');
				status.value = "Approved Settlement";
				$('#modal-close-request').modal();
			} else if($(this).attr('data-status') == 6){
				var status = document.getElementById('statusedit');
				status.value = "Close Request";
			} else if($(this).attr('data-status') == 0 && statusRequester=="true"){
				var status = document.getElementById('statusedit');
				status.value = "Rejected";
				$('#modal-reject-reason-requester').modal();
			}
		
		});
		
		//add Item di modal edit
		function _addRowItemEdit(){
			var oTable3 = $('#dataitemedit');
			var tBody3 = oTable3.find('tbody');
			
			var appendString3 = "<tr>";
			appendString3 += "<td>";
				appendString3 += "<select class='form-control' id='souvenir-item-item'><option>- Select Souvenir -</option><c:forEach items='${listSouvenirItem }' var='item'><option value='${item.id }'>${item.name }</option></c:forEach></select>";
			appendString3 += "</td>";
			appendString3 += "<td>";
				appendString3 += "<input style='width:60px;' type='text' id='qty-item' placeholder='Qty' class='form-control'>";
			appendString3 += "</td>";
			appendString3 += "<td>";
				appendString3 += "<input type='text' id='note-item' placeholder='Note' class='form-control'>";
			appendString3 += "</td>";
			appendString3 += "<td>";
				appendString3 += "<a data-id='${souvenir.id }' id='btn-edit-edit' href='#' style='color:inherit;'><i class='fas fa-pencil-alt'></i></a> <a class='btn-delete-edit' href='#' style='color:inherit;'><i class='fas fa-trash'></i></a>";
			appendString3 += "</td>";
		appendString3 += "</tr>";
		
		tBody3.append(appendString3);
		};
		
		//add item listener (di modal edit)
		$('#add-item-edit').on('click', function(){
			_addRowItemEdit();
		});
		
		//DELETE EDIT DI ITEM - milih row yg mau di delete
		$(document).on('click','.btn-delete-edit', function(){
			delObj = $(this).parent().parent();
			$('#modal-delete-edit').modal();
		});
		
		//DELETE EDIT DI ITEM delete row
		$(document).on('click','.btn-delete-item-edit', function(){
			delObj.remove();
			$('#modal-delete-edit').modal('hide');
		});
		
		//EDIT MASTER
		$(document).on('click', '#update-btn', function(){
			var requestEdit = {
					id : $('#id-edit').val(),
					code : $('#code-edit').val(),
					tEventId : {
						id : $('#event-code-edit option:selected').val()
					},
					requestBy : {
						id : 1 //$('#requestby').val()
					}, 
					requestDate : new Date($('#requestdateedit').val()),
					requestDueDate : new Date($('#duedateedit').val()),
					//updatedDate : new Date($('#updateddate').val()),
					note : $('#noteedit').val(),
					//status : 1,
					transactionSouvenirItem : []
			};
			//console.log(requestEdit);
			
			//validate di modal edit
			var validateEventEdit = $('#event-code-edit').parsley({
				required : true,
				requiredMessage : 'The Field cant be Empty'
			});
			var validateDueDateEdit = $('#duedateedit').parsley({
				required : true,
				requiredMessage : 'The Field cant be Empty'
			});
			
			//validate function
			function getValid(validate){
				validate.validate();
				return validate.isValid();
			}
			
			var validEdit = getValid(validateEventEdit);
				validEdit = getValid(validateDueDateEdit);
			
			_readTableDataEdit(requestEdit.transactionSouvenirItem);
			
			//do ajax
			if(validEdit){
				$.ajax({
					url : '${pageContext.request.contextPath}/souvenirrequest/update',
					type : 'PUT',
					data : JSON.stringify(requestEdit),
					contentType : 'application/json',
					success : function(data){
						console.log(data);
						window.location = '${pageContext.request.contextPath}/souvenirrequest'
					}, error : function(){
						alert('failed');
					}
				});
			} else {
				alert('Please Complete the Blank Field(s)');
			}
			
		});
		
		//EDIT di DETAIL
		function _readTableDataEdit(transactionSouvenirItem){
			$('#dataitemedit > tbody > tr').each(function(index, value){
				var transactionItem = {
							mSouvenirId : {
								id : parseInt($(value).find('td').eq(0).find('select option:selected').val())
							}, 
							qty : $(value).find('td').eq(1).find('input').val(),
							note : $(value).find('td').eq(2).find('input').val(),
							id : $(value).find('td').eq(4).find('input').val()
				}; 
				transactionSouvenirItem.push(transactionItem);
				
				console.log(transactionItem);
			});
		};
	});
	
	//APPROVED REQUEST BY ADMIN
	$(document).on('click','#btn-approved', function(){

		var approved = {
			id : $('#id-admin').val(),
			code : $('#code-admin').val(),
			requestBy : {
				id : 1 //$('#requestby').val()
			},
			requestDate : new Date($('#requestdateadmin').val()),
			requestDueDate : new Date($('#duedateadmin').val()),
			note : $('#noteadmin').val(),
			status : 2,
			transactionSouvenirItem : []
		};

		$.ajax({
			url : '${pageContext.request.contextPath}/souvenirrequest/approved',
			type : 'PUT',
			data : JSON.stringify(approved),
			contentType : 'application/json',
			success: function(data){
			console.log(data);
			window.location = '${pageContext.request.contextPath}/souvenirrequest'
				}, error : function(){
					alert('error');
			},
			dataType:'json'
			});		
		});
	
	//RECEIVED BY REQUESTER
	$(document).on('click','#btn-received', function(){

		var received = {
			id : $('#id-received').val(),
			code : $('#code-received').val(),
			requestBy : {
				id : 1 //$('#requestby').val()
			},
			requestDate : new Date($('#requestdatereceived').val()),
			requestDueDate : new Date($('#duedatereceived').val()),
			note : $('#notereceived').val(),
			status : 3,
			transactionSouvenirItem : []
		};
		console.log(received);
		$.ajax({
			url : '${pageContext.request.contextPath}/souvenirrequest/received',
			type : 'PUT',
			data : JSON.stringify(received),
			contentType : 'application/json',
			success: function(data){
			console.log(data);
			window.location = '${pageContext.request.contextPath}/souvenirrequest'
				}, error : function(){
					alert('error');
			},
			dataType:'json'
			});	 
		});
	
	
	//REJECTED BY ADMIN
	$(document).on('click','#btn-rejected', function(){
		$('#modal-reject-reason').modal();			
	});
	
	$(document).on('click','.btn-reject-reason', function(){
		var rejected = {
				id : $('#id-admin').val(),
				code : $('#code-admin').val(),
				requestBy : {
					id : 1 //$('#requestby').val()
				},
				requestDate : new Date($('#requestdateadmin').val()),
				requestDueDate : new Date($('#duedateadmin').val()),
				note : $('#noteadmin').val(),
				status : 0,
				rejectReason : $('#rejectreason').val(),
				transactionSouvenirItem : []
			};
			console.log(rejected);
			$.ajax({
				url : '${pageContext.request.contextPath}/souvenirrequest/rejected',
				type : 'PUT',
				data : JSON.stringify(rejected),
				contentType : 'application/json',
				success: function(data){
				console.log(data);
				window.location = '${pageContext.request.contextPath}/souvenirrequest'
					}, error : function(){
						alert('error');
				},
				dataType:'json'
				});
	});
	
	//
	
	//SUBMIT settlement
	$(document).on('click','#submit-btn-settlement', function(){
		
		
		var settlement = {
			id : $('#id-set').val(),
			code : $('#code-set').val(),
			requestBy : {
				id : 1 //$('#requestby').val()
			},
			requestDate : new Date($('#requestdateset').val()),
			requestDueDate : new Date($('#duedateset').val()),
			note : $('#noteset').val(),
			status : 4,
			transactionSouvenirItem : []
		};
				
		_readTableDataSettlement(settlement.transactionSouvenirItem);
		console.log(settlement);

		$.ajax({
			url : '${pageContext.request.contextPath}/souvenirrequest/settlement',
			type : 'PUT',
			data : JSON.stringify(settlement),
			contentType : 'application/json',
			success: function(data){
			console.log(data);
			window.location = '${pageContext.request.contextPath}/souvenirrequest'
				}, error : function(){
					alert('error');
			},
			dataType:'json'
			});
		
		});
			
		function _readTableDataSettlement(transactionSouvenirItem){
			$('#dataitemset > tbody > tr').each(function(index, value){
				var transactionItem = {
					qtySettlement : $(value).find('td').eq(2).find('input').val(),
					id :$(value).find('td').eq(4).find('input').val(),
					mSouvenirId:{
						id : $(value).find('td').eq(4).find('input').val()
					},
					qty :  $(value).find('td').eq(1).find('input').val(),
					note :  $(value).find('td').eq(3).find('input').val()
				}; 
					transactionSouvenirItem.push(transactionItem);
				});
			};
			
			
	//SUBMIT approveval settlement
	$(document).on('click','#approveSettlement', function(){

		var settlement = {
			id : $('#id-apset').val(),
			code : $('#code-apset').val(),
			requestBy : {
				id : 1 //$('#requestby').val()
			},
			requestDate : new Date($('#requestdateapset').val()),
			requestDueDate : new Date($('#duedateapset').val()),
			note : $('#noteapset').val(),
			status : 5,
			transactionSouvenirItem : []
		};
				
		_readTableDataSettlement(settlement.transactionSouvenirItem);
		console.log(settlement);

		$.ajax({
			url : '${pageContext.request.contextPath}/souvenirrequest/approveset',
			type : 'PUT',
			data : JSON.stringify(settlement),
			contentType : 'application/json',
			success: function(data){
			console.log(data);
			window.location = '${pageContext.request.contextPath}/souvenirrequest'
				}, error : function(){
					alert('error');
			},
			dataType:'json'
			});		
		});
	
	
	//REJECT settlement
	
	$(document).on('click','#rejectSettlement', function(){
		
		$('#modal-rejectsett-reason').modal();
	});
	
	$(document).on('click','#btn-settreject-reason', function(){
		var settlement = {
			id : $('#id-apset').val(),
			code : $('#code-apset').val(),
			requestBy : {
				id : 1 //$('#requestby').val()
			},
			requestDate : new Date($('#requestdateapset').val()),
			requestDueDate : new Date($('#duedateapset').val()),
			note : $('#noteapset').val(),
			status : 0,
			rejectReason : $('rejectsetreason').val(),
			transactionSouvenirItem : []
		};
				
		_readTableDataSettlement(settlement.transactionSouvenirItem);
		console.log(settlement);

		$.ajax({
			url : '${pageContext.request.contextPath}/souvenirrequest/approved',
			type : 'PUT',
			data : JSON.stringify(settlement),
			contentType : 'application/json',
			success: function(data){
			console.log(data);
			window.location = '${pageContext.request.contextPath}/souvenirrequest'
				}, error : function(){
					alert('error');
			},
			dataType:'json'
			});
		
		});

	//Close Request
	$(document).on('click','#closerequest', function(){

		var settlement = {
			id : $('#id-close').val(),
			code : $('#code-close').val(),
			requestBy : {
				id : 1 //$('#requestby').val()
			},
			requestDate : new Date($('#requestdateclose').val()),
			requestDueDate : new Date($('#duedateclose').val()),
			note : $('#noteclose').val(),
			status : 6,
			transactionSouvenirItem : []
		};
				
		_readTableDataSettlement(settlement.transactionSouvenirItem);
		console.log(settlement);

		$.ajax({
			url : '${pageContext.request.contextPath}/souvenirrequest/closerequest',
			type : 'PUT',
			data : JSON.stringify(settlement),
			contentType : 'application/json',
			success: function(data){
			console.log(data);
			window.location = '${pageContext.request.contextPath}/souvenirrequest'
				}, error : function(){
					alert('error');
			},
			dataType:'json'
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
    	

	<%
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");		
	%>
	
	
	<div style="height:40px;background-color:#0069D9;margin-bottom:10px">
		<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List Souvenir Request</h5>
	</div>
	
	<div style="width:98%;margin:auto;">
		<ol class="breadcrumb">
  			<li><a href="#">Home </a>/</li>
  			<li><a href="#"> Master </a>/</li>
 		 	<li class="active"> List Souvenir Request</li>
		</ol>
    

    	<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#modal-add" id="btn-add" style="width:70px;float:right;">Add</a><br/><br/>

		<form id="form-transaction-souvenir">
    	<div class="form-row">
    		<div class="col-auto">
    		
    			<input type="text" class="form-control" id="transaction-code" name="transactioncode" placeholder="Transaction Code">
    		</div>
    		<div class="col">
    			<input type="text" class="form-control" id="request-by" name="requestby" placeholder="Request By">
    		</div>
    		<div class="col">
    			<input placeholder="Request Date" class="form-control" type="text" name="requestdate" id="requestdate">	
    		</div>
    		<div class="col-auto">
    			<input placeholder="Due Date" class="form-control" type="text" name="duedate" id="due-date">	
    		</div>
    		<div class="col-auto">
    			<input type="text" class="form-control" id="status" name="status" placeholder="Status">
    		</div>
    		<div class="col-auto">
    			<input placeholder="Created" name="createddate" class="form-control" type="text" id="created">	
    		</div>
    		<div class="col-auto">
    			<input type="text" class="form-control" id="created-by" name="createdby" placeholder="Created By">
    		</div>
    		
    		<div class="col-auto">
    			<input type="text" class="form-control" id="searchall" name="searchall" placeholder="Search...">
    		</div>
    		
    		<div class="col-auto">
    			<a href="#" class="btn btn-warning search" style="width:70px;color:white;">Search</a>
    		</div>	
    	</div>
    	</form>
    	
    	<table class="table" id="table-transaction">
			<thead>
		    	<tr>
		      		<th scope="col">No</th>
					<th scope="col">Transaction Code</th>
					<th scope="col">Request By</th>
					<th scope="col">Request Date</th>
					<th scope="col">Due Date</th>
					<th scope="col">Status</th>
					<th scope="col">Created Date</th>
					<th scope="col">Create By</th>
					<th scope="col">Actions</th>
		    	</tr>
		  	</thead>
		  	<tbody>
		    	<c:forEach items="${listTransactionSouvenir }" var="transaction">
					<tr>
						<td scope="col"></td>
						<td scope="col">${transaction.code }</td>
						<td scope="col">${transaction.requestBy.firstName } ${transaction.requestBy.lastName }</td>
						<td scope="col">${transaction.requestDate }</td>
						<td scope="col">${transaction.requestDueDate }</td>
						<td scope="col">
							<c:choose>
								<c:when test="${transaction.status == 1}">Submitted</c:when>
								<c:when test="${transaction.status == 2}">In Progress</c:when>
								<c:when test="${transaction.status == 3}">Received By Requester</c:when>
								<c:when test="${transaction.status == 4}">Settlement</c:when>
								<c:when test="${transaction.status == 5}">Approved Settlement</c:when>
								<c:when test="${transaction.status == 6}">Close Request</c:when>
								<c:when test="${transaction.status == 0}">Rejected</c:when>
							</c:choose>
						</td>
						<td scope="col">${transaction.createdDate }</td>
						<td scope="col">
							<c:choose>
								<c:when test="${transaction.status == 1}">${transaction.requestBy.firstName } ${transaction.requestBy.lastName }</c:when>
								<c:when test="${transaction.status == 2}">Administrator</c:when>
								<c:when test="${transaction.status == 3}">${transaction.receivedBy.firstName } ${transaction.receivedBy.lastName }</c:when>
								<c:when test="${transaction.status == 4}">${transaction.requestBy.firstName } ${transaction.requestBy.lastName }</c:when>
								<c:when test="${transaction.status == 5}">Administrator</c:when>
								<c:when test="${transaction.status == 6}">${transaction.requestBy.firstName } ${transaction.requestBy.lastName }</c:when>
								<c:when test="${transaction.status == 0}">Administrator</c:when>
							</c:choose>
						</td>
						<td scope="col">
							<a data-id="${transaction.id }"  data-status="${transaction.status }" id="btn-view-transaksi" href="#" style="color:inherit;"><i class="fas fa-search"></i></a>
		  					<a data-role-admin="<%= request.isUserInRole("ROLE_ADMIN") %>" data-role-requester="<%= request.isUserInRole("ROLE_REQUESTER") %>" data-id="${transaction.id }" data-status="${transaction.status }" id="btn-edit-transaksi" href="#" style="color:inherit;"><i class="fas fa-pencil-alt"></i></a>
						</td>
					</tr>
				</c:forEach>
		  	</tbody>
		</table>
    		
	</div>
	
	
	<!--/////////////////////////////// Modal Add \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
	<div class="modal fade bd-example-modal-lg" id="modal-add" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">Add Souvenir Request</h5>
	      </div>
	      	<div class="modal-body">
		    	  	
		      <div class="body-top" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<form>
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;margin-top:5px;">
		      					<label>*Transaction Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;margin-top:5px;">
		      					<input type="text" id="code" name="code" placeholder="${hasil }" value="${hasil }" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Event Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<select class="form-control" id="event-code">
				      				<option selected value = "">- Select Event -</option>
				      				<c:forEach items="${listEvent }" var="event">
										<option value="${event.id }">${event.code } - ${event.eventName }</option>
									</c:forEach>
				    			</select>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request By</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input type="text" id="requestby" name="request-by" placeholder="${requester }" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input value="<%= format.format(date) %>" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="requestdate" disabled>	
		      					
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Due Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input placeholder="Select Date" class="form-control" type="text" id="duedate">	
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Note</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<textarea style="height:100px;" id="note" placeholder="Type Note" class="form-control"></textarea>
		      				</div>
		      			</div>
		      		</div>
		      	</form>	     	
	        	
		      </div>
		      
		      <div class="body-bottom" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<div style="margin-left:10px;margin-top:10px;">
		      		<a class="btn btn-primary" id="add-item" href="#">Add Item</a>
		      		
		      		<table id="data-add-item" class="display" style="width:100%;text-align:center;">
						<thead>
							<tr>
								<th>Souvenir Name</th>
								<th style="width:60px;">Qty</th>
								<th>Note</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
		      	</div>
		      </div>
		      
	      <div class="modal-footer">
	        <button type="button" id="save-btn-request" class="btn btn-primary">Save</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal" style="color:white;">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	
	
	<!--/////////////////////////////// Modal View Requester \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
	<div class="modal fade bd-example-modal-lg" id="modal-view-transaksi" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">View Souvenir Request</h5>
	      </div>
	      	<div class="modal-body">
		    	  	
		      <div class="body-top" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<form>
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;margin-top:5px;">
		      					<label>*Transaction Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;margin-top:5px;">
		      					<input type="hidden" id="id-view">
		      					<input type="text" id="code-view" name="code" placeholder="${hasil }" value="${hasil }" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Event Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<select class="form-control" id="event-code-view" disabled>
				      				<c:forEach items="${listEvent }" var="event">
										<option value="${event.id }">${event.code } - ${event.eventName }</option>
									</c:forEach>
				    			</select>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request By</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input type="text" id="requestbyview" name="request-by" placeholder="Request By" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input value="<%= format.format(date) %>" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="requestdateview" disabled>	
		      					
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Due Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input placeholder="Select Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="duedateview" disabled>	
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Note</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<textarea style="height:100px;" id="noteview" placeholder="Type Note" class="form-control" disabled></textarea>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Status</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input id="statusview" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      	</form>	     	
	        	
		      </div>
		      
		      <div class="body-bottom" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<div style="margin-left:10px;margin-top:10px;">
		      		
		      		<table id="dataitem" class="display" style="width:100%;text-align:center;">
						<thead>
							<tr>
								<th>Souvenir Name</th>
								<th style="width:60px;">Qty</th>
								<th>Note</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
		      	</div>
		      </div>
		      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-warning" data-dismiss="modal" style="color:white;">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	
	
	<!--/////////////////////////////// Modal Received Requester \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
	<div class="modal fade bd-example-modal-lg" id="modal-received-transaksi" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">View Souvenir Request</h5>
	      </div>
	      	<div class="modal-body">
		    	  	
		      <div class="body-top" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<form>
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;margin-top:5px;">
		      					<label>*Transaction Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;margin-top:5px;">
		      					<input type="hidden" id="id-received">
		      					<input type="text" id="code-received" name="code" placeholder="${hasil }" value="${hasil }" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Event Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<select class="form-control" id="event-code-received" disabled>
				      				<c:forEach items="${listEvent }" var="event">
										<option value="${event.id }">${event.code } - ${event.eventName }</option>
									</c:forEach>
				    			</select>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request By</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input type="text" id="requestbyreceived" name="request-by" placeholder="Request By" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input value="<%= format.format(date) %>" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="requestdatereceived" disabled>	
		      					
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Due Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input placeholder="Select Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="duedatereceived" disabled>	
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Note</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<textarea style="height:100px;" id="notereceived" placeholder="Type Note" class="form-control" disabled></textarea>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Status</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input id="statusreceived" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      	</form>	     	
	        	
		      </div>
		      
		      <div class="body-bottom" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<div style="margin-left:10px;margin-top:10px;">
		      		
		      		<table id="dataitemreceived" class="display" style="width:100%;text-align:center;">
						<thead>
							<tr>
								<th>Souvenir Name</th>
								<th style="width:60px;">Qty</th>
								<th>Note</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
		      	</div>
		      </div>
		      
	      <div class="modal-footer">
	        <button id="btn-received" type="button" class="btn btn-primary" data-dismiss="modal" style="color:white;">Received</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal" style="color:white;">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	
	
	<!--/////////////////////////////// Modal APPROVED-REJECTED Admin\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
	<div class="modal fade bd-example-modal-lg" id="modal-admin-transaksi" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">View Souvenir Request</h5>
	      </div>
	      	<div class="modal-body">
		    	  	
		      <div class="body-top" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<form>
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;margin-top:5px;">
		      					<label>*Transaction Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;margin-top:5px;">
		      					<input type="hidden" id="id-admin">
		      					<input type="text" id="code-admin" name="code" placeholder="${hasil }" value="${hasil }" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Event Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<select class="form-control" id="event-code-admin" disabled>
				      				<c:forEach items="${listEvent }" var="event">
										<option value="${event.id }">${event.code } - ${event.eventName }</option>
									</c:forEach>
				    			</select>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request By</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input type="text" id="requestbyadmin" name="request-by" placeholder="Request By" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input value="<%= format.format(date) %>" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="requestdateadmin" disabled>	
		      					
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Due Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input placeholder="Select Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="duedateadmin" disabled>	
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Note</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<textarea style="height:100px;" id="noteadmin" placeholder="Type Note" class="form-control" disabled></textarea>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Status</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input id="statusadmin" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      	</form>	     	
	        	
		      </div>
		      
		      <div class="body-bottom" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<div style="margin-left:10px;margin-top:10px;">
		      		
		      		<table id="dataitemadmin" class="display" style="width:100%;text-align:center;">
						<thead>
							<tr>
								<th>Souvenir Name</th>
								<th style="width:60px;">Qty</th>
								<th>Note</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
		      	</div>
		      </div>
		      
	      <div class="modal-footer">
	        <button id="btn-approved" type="button" class="btn btn-primary" data-dismiss="modal" style="color:white;">Approved</button>
	        <button id="btn-rejected" type="button" class="btn btn-danger" data-dismiss="modal" style="color:white;">Rejected</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal" style="color:white;">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	
	
	<!--/////////////////////////////// Modal Edit Requester \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
	<div class="modal fade bd-example-modal-lg" id="modal-edit-transaksi" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">View Souvenir Request</h5>
	      </div>
	      	<div class="modal-body">
		    	  	
		      <div class="body-top" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<form>
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;margin-top:5px;">
		      					<label>*Transaction Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;margin-top:5px;">
		      					<input type="hidden" id="id-edit">
		      					<input type="text" id="code-edit" name="code" value="${hasil }" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Event Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<select class="form-control" id="event-code-edit">
				      				<option selected value = "">- Select Event -</option>
				      				<c:forEach items="${listEvent }" var="event">
										<option value="${event.id }">${event.code } - ${event.eventName }</option>
									</c:forEach>
				    			</select>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request By</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input type="text" id="requestbyedit" name="request-by" placeholder="Request By" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input value="<%= format.format(date) %>" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="requestdateedit" disabled>	
		      					<input value="<%= format.format(date) %>" class="form-control" type="hidden" onfocus="(this.type='date')" onblur="(this.type='text')" id="updateddate" disabled>	
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Due Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input placeholder="Select Date" class="form-control" type="text" id="duedateedit">	
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Note</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<textarea style="height:100px;" id="noteedit" placeholder="Type Note" class="form-control"></textarea>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Status</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input id="statusedit" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      	</form>	     	
	        	
		      </div>
		      
		      <div class="body-bottom" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<div style="margin-left:10px;margin-top:10px;">
		      		<a class="btn btn-primary" id="add-item-edit" href="#">Add Item</a>
		      		
		      		<table id="dataitemedit" class="display" style="width:100%;text-align:center;">
						<thead>
							<tr>
								<th>Souvenir Name</th>
								<th style="width:60px;">Qty</th>
								<th>Note</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
		      	</div>
		      </div>
		      
	      <div class="modal-footer">
	      <button type="button" class="btn btn-primary" id="update-btn">Update</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal" style="color:white;">Cancel</button>
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
	        <button id="close" style="background-color:red;" data-dismiss="modal" type="button" class="close" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p style="text-align:center;">Delete Data?</p>
	      </div>
	      <div style="margin:auto;padding-bottom:5px;">
	        <button type="button" class="btn btn-primary btn-delete-item">Delete</button>
	        <button id="cancel-btn" type="button" data-dismiss="modal" class="btn btn-warning" style="color:white;">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	
	<!-- Modal Delete Edit -->
	<div class="modal fade bd-example-modal-sm" id="modal-delete-edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div style="float:right;clear:right;">
	        <button id="close" style="background-color:red;" type="button" data-dismiss="modal" class="close" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p style="text-align:center;">Delete Data?</p>
	      </div>
	      <div style="margin:auto;padding-bottom:5px;">
	        <button type="button" class="btn btn-primary btn-delete-item-edit">Delete</button>
	        <button id="cancel-btn" type="button" data-dismiss="modal" class="btn btn-warning" style="color:white;">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- Modal Reject Reason -->
	<div class="modal fade bd-example-modal-sm" id="modal-reject-reason" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div style="float:right;clear:right;">
	        <button id="close" style="background-color:red;" type="button" data-dismiss="modal" class="close" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p style="text-align:center;">Reject Reason</p>
	        <textarea style="height:100px;" id="rejectreason" placeholder="Input Reject Reason" class="form-control"></textarea>
	      </div>
	      <div style="margin:auto;padding-bottom:5px;">
	        <button type="button" class="btn btn-danger btn-reject-reason">Reject</button>
	        <button id="cancel-btn" type="button" data-dismiss="modal" class="btn btn-warning" style="color:white;">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- Modal Reject Reason Requester -->
	<div class="modal fade bd-example-modal-sm" id="modal-reject-reason-requester" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div style="float:right;clear:right;">
	        <button id="close" style="background-color:red;" type="button" data-dismiss="modal" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p style="text-align:center;">Reject Reason</p>
	        <textarea style="height:100px;" id="rejectreasonrequester" placeholder="Input Reject Reason" class="form-control" disabled></textarea>
	      </div>
	      <div style="margin:auto;padding-bottom:5px;">
	        <button id="cancel-btn" type="button" class="btn btn-warning" data-dismiss="modal" style="color:white;">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<!-- ALERT -->
	<div class="alert alert-primary" id="success-alert" role="alert">
	  This is a primary alert with <a href="#" class="alert-link">an example link</a>. Give it a click if you like.
	</div>
	
	
	
	<!------------------------------------------------- Modal SETTLEMENT Requester----------------------------------------------------->
	<div class="modal fade bd-example-modal-lg" id="modal-settlement-transaksi" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">Settlement Souvenir Request</h5>
	      </div>
	      	<div class="modal-body">
		    	  	
		      <div class="body-top" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<form>
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;margin-top:5px;">
		      					<label>*Transaction Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;margin-top:5px;">
		      					<input type="hidden" id="id-set">
		      					<input type="text" id="code-set" name="code"  class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Event Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      						<input type="text" id="event-code-set" name="code"  class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request By</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input type="text" id="requestbyset" name="request-by" placeholder="Request By" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input value="<%= format.format(date) %>" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="requestdateset" disabled>	
		      					
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Due Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input placeholder="Select Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="duedateset" disabled>	
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Note</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<textarea style="height:100px;" id="noteset" placeholder="Type Note" class="form-control" disabled></textarea>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Status</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input id=statusset class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      	</form>	     	
	        	
		      </div>
		      
		      <div class="body-bottom" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<div style="margin-left:10px;margin-top:10px;">
		      		
		      		<table id="dataitemset" class="display" style="width:100%;text-align:center;">
						<thead>
							<tr>
								<th>Souvenir Name</th>
								<th style="width:60px;">Qty</th>
								<th style="width:60px;" id="label-qty-act">Qty Actual</th>
								<th>Note</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
		      	</div>
		      </div>
		      
	      <div class="modal-footer">
	        <button type="button" id="submit-btn-settlement" class="btn btn-primary">Save</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal" style="color:white;">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	
	
		<!------------------------------------------------- Modal SETTLEMENT Approvement----------------------------------------------------->
	<div class="modal fade bd-example-modal-lg" id="modal-approvement-settlement" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">Approval Souvenir Request</h5>
	      </div>
	      	<div class="modal-body">
		    	  	
		      <div class="body-top" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<form>
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;margin-top:5px;">
		      					<label>*Transaction Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;margin-top:5px;">
		      					<input type="hidden" id="id-apset">
		      					<input type="text" id="code-apset" name="code"  class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Event Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      						<input type="text" id="event-code-apset" name="code"  class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request By</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input type="text" id="requestbyapset" name="request-by" placeholder="Request By" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input value="<%= format.format(date) %>" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="requestdateapset" disabled>	
		      					
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Due Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input placeholder="Select Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="duedateapset" disabled>	
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Note</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<textarea style="height:100px;" id="noteapset" placeholder="Type Note" class="form-control" disabled></textarea>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Status</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input id=statusapset class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      	</form>	     	
	        	
		      </div>
		      
		      <div class="body-bottom" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<div style="margin-left:10px;margin-top:10px;">
		      		
		      		<table id="dataitemapset" class="display" style="width:100%;text-align:center;">
						<thead>
							<tr>
								<th>Souvenir Name</th>
								<th style="width:60px;">Qty</th>
								<th style="width:60px;" id="label-qty-act">Qty Actual</th>
								<th>Note</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
		      	</div>
		      </div>
		      
	      <div class="modal-footer">
	        <button type="button" id="approveSettlement" class="btn btn-primary">Approved</button>
	         <button type="button" id="rejectSettlement" class="btn btn-danger" data-dismiss="modal">Reject</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal" style="color:white;">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	
	
		<!-- Modal Settlement Reject Reason -->
	<div class="modal fade bd-example-modal-sm" id="modal-rejectsett-reason" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div style="float:right;clear:right;">
	        <button id="close" style="background-color:red;" type="button" class="close" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p style="text-align:center;">Reject Reason</p>
	        <textarea style="height:100px;" id="rejectsetreason" placeholder="Input Reject Reason" class="form-control"></textarea>
	      </div>
	      <div style="margin:auto;padding-bottom:5px;">
	        <button type="button" class="btn btn-primary" id="btn-settreject-reason" data-dismiss="modal">Reject</button>
	        <button id="cancel-btn" type="button" class="btn btn-warning" data-dismiss="modal" style="color:white;">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	

		<!------------------------------------------------- Modal Close Request---------------------------------------------------->
	<div class="modal fade bd-example-modal-lg" id="modal-close-request" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header" style="background-color:#0069D9;color:white;">
	        <h5 class="modal-title" id="exampleModalLongTitle">Approval Souvenir Request</h5>
	      </div>
	      	<div class="modal-body">
		    	  	
		      <div class="body-top" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<form>
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;margin-top:5px;">
		      					<label>*Transaction Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;margin-top:5px;">
		      					<input type="hidden" id="id-close">
		      					<input type="text" id="code-close" name="code"  class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Event Code</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      						<input type="text" id="event-code-close" name="code"  class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request By</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input type="text" id="requestbyclose" name="request-by" placeholder="Request By" class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Request Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input value="<%= format.format(date) %>" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="requestdateclose" disabled>	
		      					
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>*Due Date</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input placeholder="Select Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="duedateclose" disabled>	
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Note</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<textarea style="height:100px;" id="noteclose" placeholder="Type Note" class="form-control" disabled></textarea>
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-sm-3">
		      				<div style="text-align:right;">
		      					<label>Status</label>
		      				</div>
		      			</div>
		      			<div class="col-sm-6">
		      				<div style="margin-bottom:5px;">
		      					<input id=statusclose class="form-control" disabled>
		      				</div>
		      			</div>
		      		</div>
		      	</form>	     	
	        	
		      </div>
		      
		      <div class="body-bottom" style="width:95%;margin:auto auto 5px auto;border:1px;border-style:solid;border-color:#E9ECEF;border-radius:5px;">
		      	<div style="margin-left:10px;margin-top:10px;">
		      		
		      		<table id="dataclose" class="display" style="width:100%;text-align:center;">
						<thead>
							<tr>
								<th>Souvenir Name</th>
								<th style="width:60px;">Qty</th>
								<th style="width:60px;" id="label-qty-act">Qty Actual</th>
								<th>Note</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
		      	</div>
		      </div>
		       
	      <div class="modal-footer">
	        <button type="button" id="closerequest" class="btn btn-primary" data-dismiss="modal">Close Request</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal" style="color:white;">Cancel</button>
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
   var t = $('#table-transaction').DataTable({
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
