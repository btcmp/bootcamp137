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
	  <!-- css fontawesome -->
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
select.parsley-error
{
	color: #B94A48 !important;
	background-color: #F2DEDE !important;
	border: 1px solid #EED3D7 !important;
}
#container{
	max-width: 1300px; min-height : 650px; margin: auto; border : 1px solid #007bff; border-radius: 5px;
}
@media (min-width: 992px) {
  .modal-lg {
    max-width: 1200px;
  }
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
	var delObj = null;
	
	$(document).ready(function(){
		var statusAdmin = <%= request.isUserInRole("ROLE_ADMIN") %>;
		var statusStaff = <%= request.isUserInRole("ROLE_STAFF") %>;
		if(statusAdmin||statusStaff){
			document.getElementById('btn-add-modal').style.display = 'none';
		}
		/* Modal Add */	
		$('#btn-add-modal').on('click', function(){
			$('#modalAddRequest').modal();
		});
		
		/* Add design item */
		$('#btn-add-item').on('click', function(){
			_addRowDesignItem();
		});
		function _addRowDesignItem(){
			var oTable = $('#dt-designItem');
			var tBody = oTable.find('tbody');
			var appendString = "<tr>";
				appendString += "<td>";
					appendString += "<select class='form-control product-name' style='font-size: 12px;'> <option disabled selected>-Select Product-</option> <c:forEach items='${listProduct }' var='product'> <option value-desc='${product.description }' value='${product.id }'>${product.name }</option> </c:forEach></select>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='product description' disabled>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input type='text' class='form-control titleItemAdd' style='font-size: 12px;' placeholder='Type Title' >";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='PIC'>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input class='form-control' type='date' style='font-size: 12px;' placeholder='Due Date'>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input placeholder='Start Date' style='font-size: 12px' class='form-control' type='text' disabled>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input placeholder='End Date' style='font-size: 12px' class='form-control' type='text' disabled>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Note'>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<a href='#'><i class='fas fa-pencil-alt'></i></a> <a href='#' class='btn-delete-item'><i class='fas fa-trash'></i></a>";
				appendString += "</td>";
			appendString += "</tr>"
			tBody.append(appendString);
		};
		
		/* automatic product description in Add Item */
		$(document).on('change','.product-name', function(){
			var element = $(this);
			var elementDesc = element.parent().parent().find('td').eq(1).find('input'); 
			var datadesc = $(this[this.selectedIndex]).attr('value-desc');
			elementDesc.val(datadesc);
		});
		
		/* Delete design item by each row (Add Modal) */
		$(document).on('click','.btn-delete-item', function(){
			delObj = $(this).parent().parent();
			$('#modalDeleteItem').modal();
		});
		$(document).on('click', '.delete-item-design', function(){
			delObj.remove();
			$('#modalDeleteItem').modal('hide');
		});
		
		/* submit save design */
		$(document).on('click','#btn-save-design-request', function(){
			/* membaca list design item */
			
			var listDesignItem = []
			$('#dt-designItem > tbody > tr').each(function(index, value){
				listDesignItem.push({
					mProductId : {
						id : parseInt($(value).find('td').eq(0).find('select option:selected').val())
					},
					titleItem : $(value).find('td').eq(2).find('input').val(),
					requestPic : {
						id : parseInt($(value).find('td').eq(3).find('input').val())
					},
					requestDueDate : $(value).find('td').eq(4).find('input').val(),
					note : $(value).find('td').eq(7).find('input').val()
				}); 
			});
			/* membaca list design */
			var design = {
				code : $('#transactionCode').val(),
				tEventId : {
					id : $('#dataEvent option:selected').val()
				},
				titleHeader : $('#designTitle').val(),
				requestBy : {
					id :  1 //$('#requestBy').val()	
				},
				requestDate : new Date ($('#requestDate').val()),
				createdBy : {
					id : 0 //$('#createdBy').val(),
				},
				//createdDate : $('createdDate').val(),
				note : $('#note').val(),
				status : 1,
				listDesignItem : listDesignItem
			};
			console.log(design);
			
			function getValid(validate){
				validate.validate();	
				return validate.isValid();
			}
			
			/* validasi add design */
			var validateEventAdd = $('#validEvent').parsley({
				required : true,
				requiredMessage : 'cant be Empty'
			});
			var valid = getValid(validateEventAdd);
			
			var validateTitleAdd = $('#designTitle').parsley( {
				required : true,
				requiredMessage : 'cant be Empty'
			} );	
			valid = getValid(validateTitleAdd);
			
			/* validasi untuk form title */
			var validateTitleItemAdd = $('.titleItemAdd').parsley( {
				required : true,
				requiredMessage : 'cant be Empty'
			} );  
			for(i=0; i<=validateTitleItemAdd.length; i++){
				valid = getValid(validateTitleItemAdd[i]);
			}
			
			if(valid){
				alert('success');
				$.ajax({
					url : '${pageContext.request.contextPath}/design/save',
					type : 'POST',
					data : JSON.stringify(design),	//convert objek ke string
					contentType : 'application/json',
					success : function(data){
						console.log(data),
						alert('success'),
						window.location = '${pageContext.request.contextPath}/design'
					}, error : function(){
						alert('failed')
					}
				});  
			} else{
				alert('Please Complete the Blank Field(s)');
			} 
		
		});
		
		/* Search event */
		$('#btn-search').on('click', function(){
			var form = $('#formSearch');
			var data = form.serialize();	//untuk mengambil semua data yang ada di tabel
			console.log(data)
			window.location = '${pageContext.request.contextPath}/design/search?'+data;		//data diambil dari form.serialize() 
		});
		
		
		
		/* Penentuan Role */
		$(document).on('click', '.btn-edit-modal', function(){
			var statusAdmin = $(this).attr('data-role-admin');
			var statusRequester = $(this).attr('data-role-requester');
			var statusStaff = $(this).attr('data-role-staff');
			//console.log(id);
			/* Modal edit */
			if(statusRequester=="true"){
				if($(this).attr('data-status')==1){
					var id = $(this).attr('design-id');
					$.ajax({
						url : '${pageContext.request.contextPath }design/getById?id='+id,
						type : 'GET',
						dataType : 'json',
						success : function(obj){
							//menampilkan data design berdasarkan id design 
							$('#idDesignEdit').val(obj.id);
							$('#design-code-edit').val(obj.code);
							$('#event-code-edit').val(obj.tEventId.id);
							$('#design-title-edit').val(obj.titleHeader);
							$('#design-status-edit').val(obj.status);
							$('#design-requestDate-edit').val(obj.requestDate);
							$('#design-note-edit').val(obj.note);
							console.log(obj);
							var oTable = $('#dt-designItemEdit');
							var tBody = oTable.find('tbody');
							oTable.find('tr').remove();
							$.each(obj.listDesignItem, function(index, value) {
								var product = value.mProductId;
								var appendString = "<tr>";
									appendString += "<td>";
										appendString += "<select class='form-control product-name' id='prod_"+product.id+"' style='font-size: 12px;' value='"+product.name+"'><c:forEach items='${listProduct }' var='product' > <option value-desc='${product.description }' value='${product.id }'>${product.name }</option> </c:forEach></select>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' value='"+product.description+"' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Type Title' value='"+value.titleItem+"'>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='PIC'>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input placeholder='Due Date' class='form-control' type='date' style='font-size: 12px;' placeholder='Due Date' value='"+value.requestDueDate+"'>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input placeholder='Start Date' style='font-size: 12px' class='form-control' type='text' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input placeholder='End Date' style='font-size: 12px' class='form-control' type='text' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Note' value='"+value.note+"'>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<a href='#'><i class='fas fa-pencil-alt'></i></a> <a href='#' class='btn-delete-item'><i class='fas fa-trash'></i></a>";
									appendString += "</td>"; 
									appendString += "<td>";
										appendString += "<input type='hidden' value='"+value.id+"'>";
									appendString += "</td>"; 
								appendString += "</tr>"
								tBody.append(appendString);
								$('#prod_'+product.id).val(product.id);		//menampilkan data product berdasarkan id product yang telah disimpan 
							}); 
						}, error : function(){
							alert('failed');
						}
					});
					$('#modalEditRequest').modal();
				} 
			/* Modal Approval */	
			} else if(statusAdmin=="true"){
				if($(this).attr('data-status')==1){
					var id = $(this).attr('design-id');
					//console.log(id);
					$.ajax({
						url : '${pageContext.request.contextPath }design/getById?id='+id,
						type : 'GET',
						dataType : 'json',
						success : function(data){
							//console.log(data);
							$('#idDesignApproval').val(data.id);
							$('#design-code-approval').val(data.code);
							$('#event-code-approval').val(data.tEventId.code);
							$('#design-title-approval').val(data.titleHeader);
							$('#design-status-approval').val(data.status);
							$('#design-requestDate-approval').val(data.requestDate);
							$('#design-note-approval').val(data.note);
							
							var oTable = $('#dt-designItemApproval');
							var tBody = oTable.find('tbody');
							tBody.find('tr').remove();
							
							$.each(data.listDesignItem, function(index, value){ 		
								var appendString = "<tr>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Type Title' value='"+value.mProductId.name+"' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='product description' value='"+value.mProductId.description+"' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Type Title' value='"+value.titleItem+"' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='PIC' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input placeholder='Select Date' class='form-control' type='text' style='font-size: 12px;' placeholder='Due Date' value='"+value.requestDueDate+"' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input placeholder='Start Date' style='font-size: 12px' class='form-control' type='text' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input placeholder='End Date' style='font-size: 12px' class='form-control' type='text' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Note' value='"+value.note+"' disabled>";
									appendString += "</td>";
								appendString += "</tr>"
								tBody.append(appendString);
							});
						}, error : function(){
							alert('failed');
						}
					});
					$('#modalApprovalRequest').modal();
					
				} 
			} else if(statusStaff=="true"){
				if($(this).attr('data-status')==2){
					var id = $(this).attr('design-id');
					//console.log(id);
					$.ajax({
						url : '${pageContext.request.contextPath }design/getById?id='+id,
						type : 'GET',
						dataType : 'json',
						success : function(data){
							console.log(data);
							$('#idDesignClose').val(data.id);
							$('#design-code-close').val(data.code);
							$('#event-code-close').val(data.tEventId.code);
							$('#design-title-close').val(data.titleHeader);
							$('#design-status-close').val(data.status);
							$('#design-assignTo-close').val(data.assignTo);
							$('#design-requestDate-close').val(data.requestDate);
							$('#design-note-close').val(data.note);
							
							var oTable = $('#dt-designItemClose');
							var tBody = oTable.find('tbody');
							tBody.find('tr').remove();
							
							$.each(data.listDesignItem, function(index, value){ 		
								var appendString = "<tr>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Type Title' value='"+value.mProductId.name+"' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='product description' value='"+value.mProductId.description+"' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Type Title' value='"+value.titleItem+"' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='PIC' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input placeholder='Due Date' class='form-control' type='text' style='font-size: 12px;' value='"+value.requestDueDate+"' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input placeholder='Start Date' style='font-size: 12px' class='form-control' type='date' enabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input placeholder='End Date' style='font-size: 12px' class='form-control' type='date' enabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Note' value='"+value.note+"' disabled>";
									appendString += "</td>";
									appendString += "<td>";
										appendString += "<input type='hidden' value='"+value.id+"'>";
									appendString += "</td>";
								appendString += "</tr>"
								tBody.append(appendString);
							});
						}, error : function(){
							alert('failed');
						}
					});
					$('#modalCloseRequest').modal();
				} 
			}
		});
		
		/* Add design item in Edit Modal */
		$('#btn-add-item-edit').on('click', function(){
			_addRowDesignItemEdit();
		});
		function _addRowDesignItemEdit(){
			var oTable = $('#dt-designItemEdit');
			var tBody = oTable.find('tbody');
			var appendString = "<tr>";
				appendString += "<td>";
					appendString += "<select class='form-control product-name' style='font-size: 12px;'> <option disabled selected>-Select Product-</option> <c:forEach items='${listProduct }' var='product'> <option value-desc='${product.description }' value='${product.id }'>${product.name }</option> </c:forEach></select>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='product description' disabled>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Type Title'>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='PIC'>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input class='form-control' type='date' style='font-size: 12px;' placeholder='Due Date'>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input placeholder='Start Date' style='font-size: 12px' class='form-control' type='date' disabled>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input placeholder='End Date' style='font-size: 12px' class='form-control' type='date' disabled>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Note'>";
				appendString += "</td>";
				appendString += "<td>";
					appendString += "<a href='#'><i class='fas fa-pencil-alt'></i></a> <a href='#' class='btn-delete-item-edit'><i class='fas fa-trash'></i></a>";
				appendString += "</td>";
			appendString += "</tr>"
			tBody.append(appendString);
		};
		
		/* Delete design item by each row (Edit Modal) */
		$(document).on('click','.btn-delete-item-edit', function(){
			delObj = $(this).parent().parent();
			$('#modalDeleteItemEdit').modal();
		});
		$(document).on('click', '.delete-item-design-edit', function(){
			delObj.remove();
			$('#modalDeleteItemEdit').modal('hide');
		});
		
		/* submit update */
		$('#btn-update').on('click', function(){
			/* membaca list design item */
			var listDesignItemEdit = []
			$('#dt-designItemEdit > tbody > tr').each(function(index, value){
				listDesignItemEdit.push({
					mProductId : {
						id : parseInt($(value).find('td').eq(0).find('select option:selected').val())
					},
					titleItem : $(value).find('td').eq(2).find('input').val(),
					requestPic : {
						id : parseInt($(value).find('td').eq(3).find('input').val())
					},
					requestDueDate : $(value).find('td').eq(4).find('input').val(),
					note : $(value).find('td').eq(7).find('input').val(),
					id : $(value).find('td').eq(9).find('input').val()
				}); 
			}); 
			//console.log(listDesignItemEdit);
			var design = {
				id : $('#idDesignEdit').val(),
				code : $('#design-code-edit').val(),
				tEventId : {
					id : $('#codeEventEdit option:selected').val()
				},
				titleHeader : $('#design-title-edit').val(),
				note : $('#design-note-edit').val(),
				updatedDate : $('#design-updatedDate-edit').val(),
				listDesignItem : listDesignItemEdit
			};
			//console.log(design);
			/* kirim ke server */
			$.ajax({
				url : '${pageContext.request.contextPath}/design/update',
				type : 'POST',
				data : JSON.stringify(design),
				contentType : 'application/json',
				success : function(data){
					console.log(data),
					alert('updated success'),
					window.location = '${pageContext.request.contextPath}/design' 
				}, error : function(){
					alert('failed')
				}
			});
		});
			
		/* submit Approved */
		$('#btn-approved').on('click', function(){
			var design = {
				id : $('#idDesignApproval').val(),
				status : 2,
				approvedDate : $('#design-approvedDate-edit').val(),
				assignTo : {
					id : $('#design-assign-to option:selected').val()
				}
			};
			console.log(design);
			$.ajax({
				url : '${pageContext.request.contextPath}/design/approved',
				type : 'POST',
				data : JSON.stringify(design),
				contentType : 'application/json',
				success : function(data){
					
					alert('approved success'),
					
					//window.location = '${pageContext.request.contextPath}/design', 
						console.log(data)
				}, error : function(){
					alert('failed')
				}
			}); 
		});
		
		/* Rejected Confirmation */
		$(document).on('click','#btn-rejected', function(){
			$('#modalRejected').modal();
		});
		
		/* submit Rejected */
		$(document).on('click', '#btn-rejected-agree', function(){
			var design = {
				id : $('#idDesignApproval').val(),
				rejectReason : $('#rejectReason').val(),
				status : 0
			};
			console.log(design);
			$.ajax({
				url : '${pageContext.request.contextPath}/design/rejected',
				type : 'POST',
				data : JSON.stringify(design),
				contentType : 'application/json',
				success : function(data){
					console.log(data),
					alert('rejected success'),
					window.location = '${pageContext.request.contextPath}/design' 
				}, error : function(){
					alert('failed')
				}
			}); 
		});
		
				
		/* submit Close Request */
		$('#btn-close-request').on('click', function(){
			var listDesignItemClose = []
			$('#dt-designItemClose > tbody > tr').each(function(index, value){
				listDesignItemClose.push({
					startDate : $(value).find('td').eq(5).find('input').val(),
					endDate : $(value).find('td').eq(6).find('input').val(),
					id : $(value).find('td').eq(8).find('input').val()
				}); 
			}); 
			var design = {
				id : $('#idDesignClose').val(),
				status : 3,
				closeDate : $('#design-closedDate-edit').val(),
				listDesignItem : listDesignItemClose
			};
			console.log(design);
			$.ajax({
				url : '${pageContext.request.contextPath}/design/closerequest',
				type : 'POST',
				data : JSON.stringify(design),
				contentType : 'application/json',
				success : function(data){
					console.log(data),
					alert('close request success'),
					window.location = '${pageContext.request.contextPath}/design' 
				}, error : function(){
					alert('failed')
				}
			});
		});
		
		/* Modal view */
		$(document).on('click', '.btn-view-modal', function(){
			var id = $(this).attr('design-id');
			$.ajax({
				url : '${pageContext.request.contextPath }design/getById?id='+id,
				type : 'GET',
				dataType : 'json',
				success : function(obj){
					$('#design-code-view').val(obj.code);
					$('#event-code-view').val(obj.tEventId.code);
					$('#design-title-view').val(obj.titleHeader);
					$('#design-status-view').val(obj.status);
					$('#design-requestDate-view').val(obj.requestDate);
					$('#design-note-view').val(obj.note);
					
					var oTable = $('#dt-designItemView');
					var tBody = oTable.find('tbody');
					tBody.find('tr').remove();
					
					$.each(obj.listDesignItem, function(index, value){ 		
						var appendString = "<tr>";
							appendString += "<td>";
								appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Type Title' value='"+value.mProductId.name+"' disabled>";
							appendString += "</td>";
							appendString += "<td>";
								appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='product description' value='"+value.mProductId.description+"' disabled>";
							appendString += "</td>";
							appendString += "<td>";
								appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Type Title' value='"+value.titleItem+"' disabled>";
							appendString += "</td>";
							appendString += "<td>";
								appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='PIC' disabled>";
							appendString += "</td>";
							appendString += "<td>";
								appendString += "<input placeholder='Select Date' class='form-control' type='text' style='font-size: 12px;' placeholder='Due Date' value='"+value.requestDueDate+"' disabled>";
							appendString += "</td>";
							appendString += "<td>";
								appendString += "<input placeholder='Start Date' style='font-size: 12px' class='form-control' type='text' disabled>";
							appendString += "</td>";
							appendString += "<td>";
								appendString += "<input placeholder='End Date' style='font-size: 12px' class='form-control' type='text' disabled>";
							appendString += "</td>";
							appendString += "<td>";
								appendString += "<input type='text' class='form-control' style='font-size: 12px;' placeholder='Note' value='"+value.note+"' disabled>";
							appendString += "</td>";
						appendString += "</tr>"
						tBody.append(appendString);
					});
				}, error : function(){
					alert('failed');
				}
			});
			
			$('#modalViewRequest').modal();
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
            <a href="${pageContext.request.contextPath }/design" class="nav-link">
              <i class="nav-icon fa fa-circle-o text-info"></i>
              <p>Design</p>
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
			
			<div id="container" >
				<div style="height:40px;background-color:#0069D9;margin-bottom:10px">
					<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List Design Request</h5>
				</div>
				
				<div style="width:98%;margin:auto;">
					<ol class="breadcrumb">
			  			<li><a href="#">Home </a>/ </li>
			  			<li><a href="#"> Master </a>/ </li>
			 		 	<li class="active"> List Design Request</li>
					</ol>
					<%-- <input type="hidden" role-requester="<%= request.isUserInRole("ROLE_REQUESTER") %>" role-admin="<%= request.isUserInRole("ROLE_ADMIN") %>" role-staff="<%= request.isUserInRole("ROLE_STAFF") %>"/> --%>
			    	<button type="button" class="btn btn-primary" id="btn-add-modal" style="width:70px;float:right;">Add</button><br/><br/>
			    	<form id="formSearch"> 
			    		<div class="form-row" style="overflow: auto">
				    		<div class="col-auto">
				    			<input type="text" style="font-size: 12px" class="form-control" name="designCode" placeholder="Transaction Code">
				    		</div>
				    		<div class="col-auto">
				    			<input type="text" style="font-size: 12px" class="form-control" placeholder="Request By">
				    		</div>
				    		<div class="col-auto">
				    			<input placeholder="Request Date" style="font-size: 12px" class="form-control" name="requestDate" type="text" onfocus="(this.type='date')" onblur="(this.type='text')"><!-- <input type="text" name="date" id="requestDatepicker" placeholder="Request Date"> -->	
				    		</div>
				    		<div class="col">
				    			<select id="eventCode" class="form-control" style="font-size: 12px;">
				       				<option disabled selected>-Assign To-</option>
				       				<c:forEach items="${listEmployee }" var="employee">
										<option value="${employee.id }">${employee.firstName } ${employee.lastName }</option>
									</c:forEach>
				       			</select>	
				    		</div>
				    		<div class="col">
				    			<input type="text" style="font-size: 12px" class="form-control" id="status" placeholder="Status">
				    		</div>
				    		<div class="col-auto">
				    			<input placeholder="Created Date" style="font-size: 12px" class="form-control" name="createdDate" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="created">	
				    		</div>
				    		<div class="col-auto" >
				    			<input type="text" style="font-size: 12px" class="form-control" id="created-by" placeholder="Created By">
				    		</div>
				    		<div class="col-auto">
				    			<button type="button" class="btn btn-warning" id="btn-search" style="width:70px;color:white;">Search</button>
				    		</div>	
				    	</div>
			    	</form>
			    	
			    	<div style="overflow: auto">
			    		<table class="table" id="data-tables" style="font-size: 12px">
							<thead>
						    	<tr>
						      		<th scope="col">No</th>
									<th scope="col">Transaction Code</th>
									<th scope="col">Request By</th>
									<th scope="col">Request Date</th>
									<th scope="col">Assign To</th>
									<th scope="col">Status</th>
									<th scope="col">Created Date</th>
									<th scope="col">Create By</th>
									<th scope="col">Actions</th>
						    	</tr>
						  	</thead>
							<tbody>
							<br/>
								<c:forEach items="${listDesign }" var="design">
		
								<tr>
									<td>1</td>
									<td>${design.code }</td>
									<td>${design.requestBy.firstName } ${design.requestBy.lastName }</td>
									<td>${design.requestDate }</td>
									<td>${design.assignTo.firstName } ${design.assignTo.lastName }</td>
									<td>
										<c:choose>
											<c:when test = "${design.status == 1 }">Submitted</c:when>
											<c:when test = "${design.status == 2 }">In Progress</c:when>
											<c:when test = "${design.status == 3 }">Done</c:when>
											<c:when test = "${design.status == 0 }">Rejected</c:when>
										</c:choose>
									</td>
									<td>${design.createdDate }</td>
									<td>${design.createdBy.firstName } ${design.createdBy.lastName }</td>
									<td>
										<a href="#" val class="btn-view-modal" title="View Design Request" design-id="${design.id }" ><i class="fas fa-search"></i></a> 
										| 
										<a href="#" class="btn-edit-modal" title="Edit Design Request" design-id="${design.id }" data-role-requester="<%= request.isUserInRole("ROLE_REQUESTER") %>" data-role-admin="<%= request.isUserInRole("ROLE_ADMIN") %>" data-role-staff="<%= request.isUserInRole("ROLE_STAFF") %>"data-status="${design.status }"><i class="fas fa-pencil-alt"></i></a>
										
									</td>
								</tr>	
								</c:forEach>
							</tbody>
						</table>
			    	</div>
				</div>
			</div>
			
			<%@ include file="modal/modal-design.jsp" %>
    	 
		
		
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
   var t = $('#data-tables').DataTable({
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
