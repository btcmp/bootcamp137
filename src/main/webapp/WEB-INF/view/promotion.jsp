<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Promotion</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/asset/bootstrap-filestyle/src/bootstrap-filestyle.min.js" type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript">

	var designSelectOption = null;

	$(document).ready(function(){		

		$('#add').on('click', function (){
			$('#modalAdd').modal();
		})
		
		$('#event-select-option').on('click', function(){
			var selectedValue1 = $('#event-select-option option:selected').attr('value');
			
			if(selectedValue1 != undefined){
				
				$.ajax({
					url :'${pageContext.request.contextPath }/promotion/getdesign?id=' + selectedValue1,
					type : 'GET',
					dataType : 'json',
					success : function(data){
				  		var addSelectDesign = $('#designAdd2');
		  				var selectDiv = addSelectDesign.find('select');
						selectDiv.find('option').not(document.getElementById('selectOption')).remove();
		  				
		  				$.each(data.listDesign, function(index, value){
		  					var addSelectDesign = $('#designAdd2');
			  				var selectDiv = addSelectDesign.find('select');
			  		
							var	appendString0 = '<option value="' + value.id + '" value-design-code="'+ value.code+'"> '+ value.code +' - '+ value.titleHeader +'</option>';
														
							selectDiv.append(appendString0);	
						
		  				})
		  				
					},
					error : function(){
						alert('error');
					}
				})
			}
			
		})
		
	
		$('#design-select-option').change(function(){
			designSelectOption = $('#design-select-option option:selected').val();
			
			if (designSelectOption == 1){
				$('#designAddDiv').show();
			} else if (designSelectOption == 0){
				$('#designAddDiv').hide();
			}
		})
		
		$('#next-btn').on('click', function(){
			
			if(designSelectOption == 1){
				$('#modalFromDesign').modal();
				$('#modalAdd').modal('hide');

///////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////// Get Design Header By Id if designSelectOption == 1 ///////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

				var idDesign = $('#design-select option:selected').val();
				
				$.ajax({
					url : '${pageContext.request.contextPath}/promotion/getall?id=' + idDesign,
					type : 'GET',
					success : function(obj){
					 	$('#titleHeaderDesignSave').val(obj.titleHeader);
						$('#requestByDesignSave').val(obj.requestBy);
						$('#requestDateDesignSave').val(obj.requestDate); 
						$('#noteDesignHeaderSave').val(obj.note); 
					
					var oTabel1 = $('#listDesignItemSave');
					var tBody1 = oTabel1.find('tbody');
					
					tBody1.find('tr').remove();
					$.each(obj.listDesignItem, function(index,value){
						var	prependString1 = '<tr value-dsi-id = "'+ value.id +'" value-pic-id = "'+ value.requestPic +'" >';
								prependString1 += '<td>';
									prependString1 += '<input type="text" value-id="' + value.mProductId.id +'" value="' + value.mProductId.name +'" class="form-control" disabled>';
								prependString1 += '</td>';
								
								prependString1 += '<td>';
									prependString1 += '<input type="text" value="'+ value.mProductId.description +'" class="form-control" disabled>';
								prependString1 += '</td>';
														
								prependString1 += '<td>';
									prependString1 += '<input type="text" value="' + value.titleItem + '" class="form-control" disabled>';
								prependString1 += '</td>';
														
								prependString1 += '<td>';
									prependString1 += '<input class = "form-control" type="text" placeholder = "Qty" >';
								prependString1 += '</td>';
							
								prependString1 += '<td>';
									prependString1 += '<select class = "form-control select-todo-promoItem"> <option>- Select Todo-</option> <option>Print</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option> <option>Other</option> </select>';
								prependString1 += '</td>';
														
								prependString1 += '<td>';
									prependString1 += '<input type="date" class = "form-control" placeholder="Select Date">';
								prependString1 += '</td>';
														
								prependString1 += '<td>';
									prependString1 += '<input class = "form-control" type="date" disabled>';
								prependString1 += '</td>';
							
								prependString1 += '<td>';
									prependString1 += '<input type="date" class = "form-control"  disabled>';
								prependString1 += '</td>';
														
								prependString1 += '<td>';
									prependString1 += '<input class = "form-control" type="text" placeholder="Note" >';
								prependString1 += '</td>';
														
								prependString1 += '<td>';
									prependString1 += '<a><span><i class="fas fa-arrow-circle-down fa-2x"></i></span></a>';
								prependString1 += '</td>';
						
						
						tBody1.append(prependString1);
						
					})
					},
					error : function(){
						alert('access error');
					}
				})
				
			} else if (designSelectOption == 0){
				$('#modalNotFromDesign').modal();
				$('#modalAdd').modal('hide');
			} else {
				alert('Choose Design Select');
				$('#modalAdd').modal('show');
			}
		})
		
		$('.addItem').on('click', function(){
			if(designSelectOption == 1){
				_addRowItem();
			} else if (designSelectOption == 0){
				_addRowItemNot();
			}	
		})

/////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////// Add Item in Modal From Design /////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
		
		function _addRowItem (){
			
			var oTable = $('#tabelItem');
			var tBody = oTable.find('tbody');
			var appendString = "<tr>";
					appendString += "<td>";
						appendString +="<input type='file' class='filestyle uploadFile' data-buttonBefore='true'>";
					appendString += "</td>";
					
					appendString += "<td>";
						appendString +="<input type='text' class='form-control qtyFile' placeholder='Qty'> ";
					appendString += "</td>";
				
					appendString += "<td>";
						appendString += "<select class = 'form-control selectOption'> <option>- Select Todo-</option> <option>Print</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option> <option>Other</option></select>" ;
					appendString += "</td>";
					
					appendString += "<td>";
						appendString += "<input type='date' class = 'form-control' place='Due Date'>" ;
					appendString += "</td>";
					
					appendString += "<td>";
						appendString += "<input type='date' class = 'form-control' placeholder='Start Date' disabled>" ;
					appendString += "</td>";
					
					appendString += "<td>";
						appendString += "<input type='date' class = 'form-control' placeholder='End Date' disabled>";
					appendString += "</td>";
					
					appendString += "<td>";
						appendString += "<input type='text' class='form-control note' placeholder='Note'>";
					appendString += "</td>";
				
					appendString += "<td>";
						appendString += "<a href='#' class = 'deleteItem'><span style='color:red;'><i class='fas fa-window-close fa-2x'></i></span></a>" ;
					appendString += "</td>";
				appendString += "</tr>";
			tBody.prepend(appendString);
			
			$('.deleteItem').on('click',function(){	
				$(this).closest("tr").remove();
			})
		}

///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////// Add Item in Modal NOT from Design ///////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

		function _addRowItemNot (){
			var ooTable = $('#tabelItemNot');
			var ttBody = ooTable.find('tbody');
			var aappendString = "<tr>";
					aappendString += "<td>";
						aappendString +="<input type='file' class='filestyle uploadFileNot' data-buttonBefore='true'>";
					aappendString += "</td>";
					
					aappendString += "<td>";
						aappendString +="<input type='text' class='form-control qty-file-not' placeholder='Qty'> ";
					aappendString += "</td>";
				
					aappendString += "<td>";
						aappendString += "<select class = 'form-control select-todo-upfile-not-design'> <option>- Select Todo-</option> <option>Print</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option> <option>Other</option></select>" ;
					aappendString += "</td>";
					
					aappendString += "<td>";
						aappendString += "<input type='date' class = 'form-control due-date-file-not' placeholder='Due Date'>" ;
					aappendString += "</td>";
					
					aappendString += "<td>";
						aappendString += "<input type='date' class = 'form-control' placeholder='Start Date' disabled>" ;
					aappendString += "</td>";
					
					aappendString += "<td>";
						aappendString += "<input type='date' class = 'form-control' placeholder='End Date' disabled>";
					aappendString += "</td>";
					
					aappendString += "<td>";
						aappendString += "<input type='text' class='form-control note-file-not' placeholder='Note'>";
					aappendString += "</td>";
				
					aappendString += "<td>";
						aappendString += "<a href='#' class = 'deleteItemNot'><span style='color:red;'><i class='fas fa-window-close fa-2x'></i></span></a>" ;
					aappendString += "</td>";
				aappendString += "</tr>";
			ttBody.append(aappendString);
			
			$('.deleteItemNot').on('click',function(){	
				$(this).closest("tr").remove();
			})
		}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////// Save Item FROM DESIGN //////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////

		$(document).on('click', '#saveDesign', function(){
			var promoHeader = {
				//Promotion and Design Header 
				titleHeader : $('#titleHeaderSave').val(),
				note : $('#noteTitleHeader').val(),
				code : $('#transCodeSave').val(),
				event : {
					id : $('#event-select-option option:selected').val()
				},
				design : {
					id : $('#design-select option:selected').val()
				},
				flagDesign :$ ('#design-select-option option:selected').val(),
				/* requestBy : {
					id : 0
					//firstName : $('#requestBySave').val()	
				},  */
				status : 1,
				requestDate : new Date($('#requestDateSave').val()),
				createdDate : new Date(),
				
				//Promotion Design Item
				listPromotionItem : [],
				listPromotionItemFile : []				
			}
			
			_readListPromotionItem (promoHeader.listPromotionItem);
			_readTableData (promoHeader.listPromotionItemFile);
			
			
			$.ajax({
				url : '${pageContext.request.contextPath}/promotion/save',
				type : 'POST',
				contentType: 'application/json',
				data: JSON.stringify(promoHeader),
				success: function(data){
					window.location = '${pageContext.request.contextPath}/promotion';
				},
				error: function(){
					alert('error')
				}
			})
		})
		
		function _readListPromotionItem (listPromotionItem){
			$('#listDesignItemSave > tbody > tr').each(function(index,value){
				var listDsi = {
					product : {
						id : $(value).find('td').eq(0).find('input').attr('value-id'),
						name :$(value).find('td').eq(0).find('input').val(),
						description : $(value).find('td').eq(1).find('input').val()
					},
					designItem : {
						id : $(value).attr('value-dsi-id'),
						titleItem : $(value).find('td').eq(2).find('input').val()	
					},
					/* requestPic : {
						id : $(value).attr('value-pic-id')
					}, */
					qty : $(value).find('td').eq(3).find('input').val(),
					todo : $(value).find('td').eq(4).find('select option:selected').val(),
					requestDueDate : $(value).find('td').eq(5).find('input').val(),
					startDate : $(value).find('td').eq(6).find('input').val(),
					endDate : $(value).find('td').eq(7).find('input').val(),
					note : $(value).find('td').eq(8).find('input').val()
				}
				listPromotionItem.push(listDsi);
			})
		}
		
		function _readTableData(listPromotionItemFile){
			$('#tabelItem > tbody > tr').each(function(index,value){
				var upFile = {
					//fileName  : $(value).find('td').eq(0).find('input').val(),
					note : $(value).find('td').eq(6).find('input').val(),
					qty : $(value).find('td').find('input').eq(1).val(),
					requestDueDate : $(value).find('td').eq(3).find('input').val(),
					todo : $(value).find('td').eq(2).find('select').val()
				}
				listPromotionItemFile.push(upFile)
			})	
		}
		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////// Save Item NOT FROM DESIGN///////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		$(document).on('click','#saveNotDesign' ,function(){
			var promoHeaderNot = {
				titleHeader : $('#titleHeaderNot').val(),
				note : $('#noteTitleHeaderNot').val(),
				code : $('#transCodeNot').val(),
				event : {
					id : $('#event-select-option option:selected').val()
				},
				flagDesign :$ ('#design-select-option option:selected').val(),
				status : 1,
				requestDate : new Date($('#requestDateSave').val()),
				createdDate : new Date(),
				listPromotionItemFile : []
			}
			
			_readTableDataNoteDesign(promoHeaderNot.listPromotionItemFile);
			
			$.ajax ({
				url:'${pageContext.request.contextPath}/promotion/save',
				type:'POST',
				data:JSON.stringify(promoHeaderNot),
				contentType:'application/json',
				success : function (data){
					window.location = "${pageContext.request.contextPath}/promotion"
				},
				error : function (){
					alert('error')
				}
		  	})
		})
		
		function _readTableDataNoteDesign(listPromotionItemFile){
			$('#tabelItemNot > tbody > tr').each(function(index,value){
				var upFileNot = {
					//fileName  : $(value).find('td').eq(0).find('input').val(),
					note : $(value).find('td').eq(6).find('input').val(),
					qty : $(value).find('td').find('input').eq(1).val(),
					requestDueDate : $(value).find('td').eq(3).find('input').val(),
					todo : $(value).find('td').eq(2).find('select').val()
				}
				listPromotionItemFile.push(upFileNot)
			})	
		}

/////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// Generate Event and Design Code /////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

		//get event code by option selected
		$(document).on('change', '#event-select-option', function(){
			var selectedValue = $('#event-select-option option:selected').attr('value-event-code');
			$('#eventSelectSave').val(selectedValue);
			$('#eventSelectSaveNot').val(selectedValue);
		})
		
		
		//get design code by option selected
		$(document).on('change', '#designAddDiv', function(){
			var selectedValue1 = $('#design-select option:selected').attr('value-design-code');
			$('#designCodeSave').val(selectedValue1);	
		})
		
		//give number in row table
		$('#tablePromotion > tbody > tr').each(function(index){
			$(this).find('td').eq(0).html(index+1);
		})

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////// Modal View ///////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		$('.tombolDetail').on('click', function(){
			
			var promoId = $(this).attr('value-promo-id-detail');
			var flagDsg = $(this).attr('value-flag-design')
			
///////////////////////////////////////////// VIEW from Design ///////////////////////////////////////////////
			
			if (flagDsg == 1){
				
				$.ajax({
					url:'${pageContext.request.contextPath}/promotion/getdetail?id=' + promoId,
					type: 'GET',
					dataType: 'json',
					success : function(data){
						//promotion header
						$('#transCodeSaveView').val(data.code);
						$('#eventSelectSaveView').val(data.event.code);
						$('#titleHeaderSaveView').val(data.titleHeader);
						$('#requestDateSaveView').val(data.requestDate);
						$('#noteTitleHeaderView').val(data.note);
						var status = "";
						if(data.status == 0){
							status = "Rejected";
						} else if (data.status == 1){
							status = "Submitted";
						} else if(data.status == 2){
							status = "In Progress";
						} else if (data.status == 3){
							status = "Done";
						}
						$('#statusBySaveView').val(status);
						
						//design header
						$('#designCodeSaveView').val(data.design.code);
						$('#titleHeaderDesignSaveView').val(data.design.titleHeader);
						$('#requestByDesignSaveView').val(data.design.requestBy);
						$('#requestDateDesignSaveView').val(data.design.requestDate);
						$('#noteDesignHeaderSaveView').val(data.design.note);
					
						//promotion item
						var oTabel2 = $('#listDesignItemSaveView');
						var tBody2 = oTabel2.find('tbody');
						tBody2.find('tr').remove();
						
						$.each(data.listPromotionItem, function(index, value){
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							var appendString2 = '<tr>';
									appendString2 += '<td>';
										appendString2 += '<input type="text" value-id="' + value.product.id +'" value="' + value.product.name +'" class="form-control" disabled>';
									appendString2 += '</td>';
						
									appendString2 += '<td>';
										appendString2 += '<input type="text" value="'+ value.product.description +'" class="form-control" disabled>';
									appendString2 += '</td>';
						
									appendString2 += '<td>';
										appendString2 += '<input type="text" value="' + value.designItem.titleItem + '" class="form-control" disabled>';
									appendString2 += '</td>';
								
									appendString2 += '<td>';
										appendString2 += '<input class = "form-control" type="text" value="'+ value.qty +'" disabled>';
									appendString2 += '</td>';
							
									appendString2 += '<td>';
										appendString2 += '<select class = "form-control select-todo-promoItem" disabled> <option>'+ value.todo +'</option> <option>- Select Todo-</option> <option>Print</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option> <option>Other</option> </select>';
									appendString2 += '</td>';
							
									appendString2 += '<td>';
										appendString2 += '<input type="date" class = "form-control" value="'+ value.requestDueDate +'" disabled>';
									appendString2 += '</td>';
						
									appendString2 += '<td>';
										appendString2 += '<input class = "form-control" type="date" value="'+ value.startDate +'" disabled>';
									appendString2 += '</td>';
										
									appendString2 += '<td>';
										appendString2 += '<input type="date" class = "form-control" value ="'+ value.endDate +'" disabled>';
									appendString2 += '</td>';
						
									appendString2 += '<td>';
										appendString2 += '<input class = "form-control" type="text" value="'+ value.note +'" disabled>';
									appendString2 += '</td>';
							
									appendString2 += '<td>';
										appendString2 += '<a><span><i class="fas fa-arrow-circle-down fa-2x"></i></span></a>';
									appendString2 += '</td>';
								
								appendString2 += '</tr>';
							tBody2.append(appendString2);
						})
						
						
						var oTable3 = $('#tabelItemView');
						var tBody3 = oTable3.find('tbody');
						tBody3.find('tr').remove();
						$.each(data.listPromotionItemFile, function(index,value){
							
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							
							var appendString3 = "<tr>";
									appendString3 += "<td>";
										appendString3 +="<input type='file' class='filestyle uploadFile' data-buttonBefore='true' disabled>";
									appendString3 += "</td>";
									
									appendString3 += "<td>";
										appendString3 +="<input type='text' class='form-control qtyFile' value = '"+ value.qty +"' disabled> ";
									appendString3 += "</td>";
								
									appendString3 += "<td>";
										appendString3 += "<select class = 'form-control selectOption' disabled> <option> "+ value.todo +" </option> <option>- Select Todo-</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option><option>Other</option></select>" ;
									appendString3 += "</td>";
									
									appendString3 += "<td>";
										appendString3 += "<input type='date' class = 'form-control' value='"+ value.requestDueDate +"' disabled>" ;
									appendString3 += "</td>";
									
									appendString3 += "<td>";
										appendString3 += "<input type='date' class = 'form-control' disabled>" ;
									appendString3 += "</td>";
									
									appendString3 += "<td>";
										appendString3 += "<input type='date' class = 'form-control' disabled>";
									appendString3 += "</td>";
									
									appendString3 += "<td>";
										appendString3 += "<input type='text' class='form-control note' value = '"+ value.note +"' disabled>";
									appendString3 += "</td>";
								
									appendString3 += "<td>";
										appendString3 += "<a href='#' class = 'deleteItem' ><span style='color:red;'><i class='fas fa-window-close fa-2x'></i></span></a>" ;
									appendString3 += "</td>";
								appendString3 += "</tr>";
							tBody3.prepend(appendString3);
							
						})
						
					},
					error : function(){
						alert('error');
					}
				})
				
				$('#modalFromDesignView').modal();
				
			} 
			
////////////////////////////////////////// View NOT from design //////////////////////////////////////////
			
			else if (flagDsg == 0){
				
				$.ajax({
					url : '${pageContext.request.contextPath}/promotion/getdetail?id=' + promoId,
					type : 'GET',
					dataType : 'json',
					success : function (data){
						
						///////////Promotion Header
						$('#transCodeNotView').val(data.code),
						$('#eventSelectSaveNotView').val(data.event.code),
						$('#titleHeaderNotView').val(data.titleHeader),
						$('#requestByNotView').val(data.reqeustBy),
						$('#requestDateNotView').val(data.requestDate),
						$('#noteTitleHeaderNotView').val(data.note)
						
						var status1 = "";
						if(data.status == 0){
							status1 = "Rejected";
						} else if (data.status == 1){
							status1 = "Submitted";
						} else if(data.status == 2){
							status1 = "In Progress";
						} else if (data.status == 3){
							status1 = "Done";
						}
						$('#statusBySaveNotView').val(status1);
						
						var oTable4 = $('#tabelItemNotView');
						var tBody4 = oTable4.find('tbody');
						tBody4.find('tr').remove();
						$.each(data.listPromotionItemFile, function(index,value){
							
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							var appendString4 = '<tr>';
									appendString4 += '<td>';
										appendString4 += '<input type="file" class="filestyle uploadFile" data-buttonBefore="true" disabled>' ;
									appendString4 += '</td>';
							
									appendString4 += '<td>';
										appendString4 += '<input type="text" class="form-control qtyFile" value = "'+ value.qty +'" disabled>' ;
									appendString4 += '</td>';
							
									appendString4 += '<td>';
										appendString4 += '<select class = "form-control selectOption" disabled> <option> '+ value.todo +' </option> <option>- Select Todo-</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option><option>Other</option></select>' ;
									appendString4 += '</td>';
							
									appendString4 += '<td>';
										appendString4 += '<input type="date" class = "form-control" value="'+ value.requestDueDate +'" disabled>' ;
									appendString4 += '</td>';
							
									appendString4 += '<td>';
										appendString4 += '<input type="date" class = "form-control" disabled>' ;
									appendString4 += '</td>';
							
									appendString4 += '<td>';
										appendString4 += '<input type="date" class = "form-control" disabled>' ;
									appendString4 += '</td>';
							
									appendString4 += '<td>';
										appendString4 += '<input type="text" class="form-control note" value = "'+ value.note +'" disabled>' ;
									appendString4 += '</td>';
							
									appendString4 += '<td>';
										appendString4 += '<a href="#" class = "deleteItem" ><span style="color:red;""><i class="fas fa-window-close fa-2x"></i></span></a>' ;
									appendString4 += '</td>';
							
								appendString4 += '</tr>';
							
							tBody4.append(appendString4);
						})
						
					},
					error : function (data){
						alert ('error');
					}
				})
				
				$('#modalNotFromDesignVIEW').modal('show')
			}
			
			
		})


/////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////// Edit Modal ///////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////

	$('.tombolEdit').on('click', function(){
		var promoIdEdit = $(this).attr('value-promo-id-edit');
		var flagDsgEdit = $(this).attr('value-flag-edit');
		
		var roleRequester = $(this).attr('data-role-requester');
		var roleAdmin = $(this).attr('data-role-admin');
		var roleStaff = $(this).attr('data-role-staff');
		
		var statusPromo = $(this).attr('status-id');
		console.log(statusPromo);
////////////////////////////////////////////////////////////////////Edit from Design REQUESTER ////////////////////////////////////////////////////////////////////

		if(roleRequester == 'true'){		
			if(flagDsgEdit == 1){
								
				$.ajax({
					url:'${pageContext.request.contextPath}/promotion/getdetail?id=' + promoIdEdit,
					type: 'GET',
					dataType: 'json',
					success : function(data){
						
						//promotion header
						$('#transCodeUpdate').val(data.code);
						$('#eventSelectUpdate').val(data.event.code);
						$('#idEdit').val(data.id);
						$('#titleHeaderUpdate').val(data.titleHeader);
						$('#requestDateUpdate').val(data.requestDate);
						$('#noteTitleHeaderUpdate').val(data.note);
						$('#flagDesignEdit').val(data.flagDesign);
						var status = "";
						if(data.status == 0){
							status = "Rejected";
						} else if (data.status == 1){
							status = "Submitted";
						}
						$('#statusByUpdate').val(status);
						
						//design header
						$('#designCodeUpdate').val(data.design.code);
						$('#titleHeaderDesignUpdate').val(data.design.titleHeader);
						$('#requestByDesignUpdate').val(data.design.requestBy);
						$('#requestDateDesignUpdate').val(data.design.requestDate);
						$('#noteDesignHeaderUpdate').val(data.design.note);
						
						//promotion item
						var oTabel5 = $('#listDesignItemUpdate');
						var tBody5 = oTabel5.find('tbody');
						tBody5.find('tr').remove();
						
						$.each(data.listPromotionItem, function(index, value){
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							var appendString5 = '<tr value-dsi-id = "'+ value.id +'" value-pic-id = "'+ value.requestPic +'">';
									appendString5 += '<td>';
										appendString5 += '<input type="text" value-id="' + value.product.id +'" value="' + value.product.name +'" class="form-control" disabled>';
									appendString5 += '</td>';
						
									appendString5 += '<td>';
										appendString5 += '<input type="text" value="'+ value.product.description +'" class="form-control" disabled>';
									appendString5 += '</td>';
						
									appendString5 += '<td>';
										appendString5 += '<input type="text" value="' + value.designItem.titleItem + '" class="form-control" disabled>';
									appendString5 += '</td>';
								
									appendString5 += '<td>';
										appendString5 += '<input class = "form-control" type="text" value="'+ value.qty +'" >';
									appendString5 += '</td>';
							
									appendString5 += '<td>';
										appendString5 += '<select class = "form-control select-todo-promoItem" > <option> '+ value.todo +' </option> <option>- Select Todo-</option> <option>Print</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option> <option>Other</option> </select>';
									appendString5 += '</td>';
							
									appendString5 += '<td>';
										appendString5 += '<input type="date" class = "form-control" value="'+ value.requestDueDate +'" >';
									appendString5 += '</td>';
						
									appendString5 += '<td>';
										appendString5 += '<input class = "form-control" type="date" value="'+ value.startDate +'" disabled>';
									appendString5 += '</td>';
										
									appendString5 += '<td>';
										appendString5 += '<input type="date" class = "form-control" value ="'+ value.endDate +'" disabled>';
									appendString5 += '</td>';
						
									appendString5 += '<td>';
										appendString5 += '<input class = "form-control" type="text" value="'+ value.note +'" >';
									appendString5 += '</td>';
							
									appendString5 += '<td>';
										appendString5 += '<a><span><i class="fas fa-arrow-circle-down fa-2x"></i></span></a>';
									appendString5 += '</td>';
								
								appendString5 += '</tr>';
							tBody5.append(appendString5);
						})
						
						
						var oTable6 = $('#tabelItemUpdate');
						var tBody6 = oTable6.find('tbody');
						tBody6.find('tr').remove();
						$.each(data.listPromotionItemFile, function(index,value){
						
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							
							var appendString6 = "<tr value-pif-id = '"+ value.id +"'>";
									appendString6 += "<td>";
										appendString6 +="<input type='file' class='filestyle uploadFile' data-buttonBefore='true' >";
									appendString6 += "</td>";
									
									appendString6 += "<td>";
										appendString6 +="<input type='text' class='form-control qtyFile' value = '"+ value.qty +"' > ";
									appendString6 += "</td>";
								
									appendString6 += "<td>";
										appendString6 += "<select class = 'form-control selectOption' > <option> "+ value.todo +" </option> <option>- Select Todo-</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option><option>Other</option></select>" ;
									appendString6 += "</td>";
									
									appendString6 += "<td>";
										appendString6 += "<input type='date' class = 'form-control' value='"+ value.requestDueDate +"' >" ;
									appendString6 += "</td>";
									
									appendString6 += "<td>";
										appendString6 += "<input type='date' class = 'form-control' disabled>" ;
									appendString6 += "</td>";
									
									appendString6 += "<td>";
										appendString6 += "<input type='date' class = 'form-control' disabled>";
									appendString6 += "</td>";
									
									appendString6 += "<td>";
										appendString6 += "<input type='text' class='form-control note' value = '"+ value.note +"' >";
									appendString6 += "</td>";
								
									appendString6 += "<td>";
										appendString6 += "<a href='#' class = 'deleteItem' ><span style='color:red;'><i class='fas fa-window-close fa-2x'></i></span></a>" ;
									appendString6 += "</td>";
								appendString6 += "</tr>";
							tBody6.prepend(appendString6);
							
						})
						
					},
					error : function(){
						alert('error');
					}
				})
			
				$('#modalFromDesignUpdate').modal('show');
			} 
			
	////////////////////////////////////////////////////////////////////Edit NOT from Design ////////////////////////////////////////////////////////////////////
			
			else if (flagDsgEdit == 0){
				
				
				$.ajax({
					url : '${pageContext.request.contextPath}/promotion/getdetail?id=' + promoIdEdit,
					type : 'GET',
					dataType : 'json',
					success : function (data){
						
						///////////Promotion Header
						$('#transCodeNotUpdate').val(data.code),
						$('#flagDesignEditNot').val(data.flagDesign),
						$('#idEditNot').val(data.id),
						$('#eventSelectUpdateNot').val(data.event.code),
						$('#titleHeaderNotUpdate').val(data.titleHeader),
						$('#requestByNotUpdate').val(data.reqeustBy),
						$('#requestDateNotUpdate').val(data.requestDate),
						$('#noteTitleHeaderNotUpdate').val(data.note)
						
						var status2 = "";
						if(data.status == 0){
							status2 = "Rejected";
						} else if (data.status == 1){
							status2 = "Submitted";
						}
						$('#statusByNotUpdate').val(status2);
						
						
						var oTable7 = $('#tabelItemNotUpdate');
						var tBody7 = oTable7.find('tbody');
						tBody7.find('tr').remove();
						$.each(data.listPromotionItemFile, function(index,value){
							
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							var appendString7 = '<tr value-pif-id = "'+ value.id +'">';
									appendString7 += '<td>';
										appendString7 += '<input type="file" class="filestyle uploadFile" data-buttonBefore="true" >' ;
									appendString7 += '</td>';
							
									appendString7 += '<td>';
										appendString7 += '<input type="text" class="form-control qtyFile" value = "'+ value.qty +'" >' ;
									appendString7 += '</td>';
							
									appendString7 += '<td>';
										appendString7 += '<select class = "form-control selectOption" > <option> '+ value.todo +' </option> <option>- Select Todo-</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option><option>Other</option></select>' ;
									appendString7 += '</td>';
							
									appendString7 += '<td>';
										appendString7 += '<input type="date" class = "form-control" value="'+ value.requestDueDate +'" >' ;
									appendString7 += '</td>';
							
									appendString7 += '<td>';
										appendString7 += '<input type="date" class = "form-control" disabled>' ;
									appendString7 += '</td>';
							
									appendString7 += '<td>';
										appendString7 += '<input type="date" class = "form-control" disabled>' ;
									appendString7 += '</td>';
							
									appendString7 += '<td>';
										appendString7 += '<input type="text" class="form-control note" value = "'+ value.note +'" >' ;
									appendString7 += '</td>';
							
									appendString7 += '<td>';
										appendString7 += '<a href="#" class = "deleteItem" ><span style="color:red;""><i class="fas fa-window-close fa-2x"></i></span></a>' ;
									appendString7 += '</td>';
							
								appendString7 += '</tr>';
							
							tBody7.append(appendString7);
						})
						
					},
					error : function (data){
						alert ('error');
					}
				})
				
				
				$('#modalNotFromDesignUpdate').modal('show');
			}

		} //end of if requester
////////////////////////////////////////////////////////////////////Edit from Design ADMIN ////////////////////////////////////////////////////////////////////
		
		else if (roleAdmin == 'true'){
			if(flagDsgEdit == 1){
				$.ajax({
					url:'${pageContext.request.contextPath}/promotion/getdetail?id=' + promoIdEdit,
					type: 'GET',
					dataType: 'json',
					success : function(data){
						
						//promotion header
						$('#transCodeAdmin').val(data.code);
						$('#eventSelectAdmin').val(data.event.code);
						$('#idEditAdmin').val(data.id);
						$('#titleHeaderAdmin').val(data.titleHeader);
						$('#requestDateAdmin').val(data.requestDate);
						$('#noteTitleHeaderAdmin').val(data.note);
						$('#flagDesignEditAdmin').val(data.flagDesign);
						var status5 = "";
						if(data.status == 0){
							status5 = "Rejected";
						} else if (data.status == 1){
							status5 = "Submitted";
						} else if (data.status == 2){
							status5 = "In Progress";
						} else if (data.status == 2){
							status5 = "Done";
						}
						$('#statusByAdmin').val(status5);
						
						//design header
						$('#designCodeAdmin').val(data.design.code);
						$('#titleHeaderDesignAdmin').val(data.design.titleHeader);
						$('#requestByDesignAdmin').val(data.design.requestBy);
						$('#requestDateDesignAdmin').val(data.design.requestDate);
						$('#noteDesignHeaderAdmin').val(data.design.note);
						
						//promotion item
						var oTabel11 = $('#listDesignItemAdmin');
						var tBody11 = oTabel11.find('tbody');
						tBody11.find('tr').remove();
						
						$.each(data.listPromotionItem, function(index, value){
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							var appendString11 = '<tr value-dsi-id = "'+ value.id +'" value-pic-id = "'+ value.requestPic +'">';
									appendString11 += '<td>';
										appendString11 += '<input type="text" value-id="' + value.product.id +'" value="' + value.product.name +'" class="form-control" disabled>';
									appendString11 += '</td>';
						
									appendString11 += '<td>';
										appendString11 += '<input type="text" value="'+ value.product.description +'" class="form-control" disabled>';
									appendString11 += '</td>';
						
									appendString11 += '<td>';
										appendString11 += '<input type="text" value="' + value.designItem.titleItem + '" class="form-control" disabled>';
									appendString11 += '</td>';
								
									appendString11 += '<td>';
										appendString11 += '<input class = "form-control" type="text" value="'+ value.qty +'" disabled>';
									appendString11 += '</td>';
							
									appendString11 += '<td>';
										appendString11 += '<select class = "form-control select-todo-promoItem" disabled> <option> '+ value.todo +' </option> <option>- Select Todo-</option> <option>Print</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option> <option>Other</option> </select>';
									appendString11 += '</td>';
							
									appendString11 += '<td>';
										appendString11 += '<input type="date" class = "form-control" value="'+ value.requestDueDate +'" disabled>';
									appendString11 += '</td>';
						
									appendString11 += '<td>';
										appendString11 += '<input class = "form-control" type="date" value="'+ value.startDate +'" disabled>';
									appendString11 += '</td>';
										
									appendString11 += '<td>';
										appendString11 += '<input type="date" class = "form-control" value ="'+ value.endDate +'" disabled>';
									appendString11 += '</td>';
						
									appendString11 += '<td>';
										appendString11 += '<input class = "form-control" type="text" value="'+ value.note +'" disabled>';
									appendString11 += '</td>';
							
									appendString11 += '<td>';
										appendString11 += '<a><span><i class="fas fa-arrow-circle-down fa-2x"></i></span></a>';
									appendString11 += '</td>';
								
								appendString11 += '</tr>';
							tBody11.append(appendString11);
						})
						
						
						var oTable12 = $('#tabelItemAdmin');
						var tBody12 = oTable12.find('tbody');
						tBody12.find('tr').remove();
						$.each(data.listPromotionItemFile, function(index,value){
						
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							
							var appendString12 = "<tr value-pif-id = '"+ value.id +"'>";
									appendString12 += "<td>";
										appendString12 +="<input type='file' class='filestyle uploadFile' data-buttonBefore='true' disabled>";
									appendString12 += "</td>";
									
									appendString12 += "<td>";
										appendString12 +="<input type='text' class='form-control qtyFile' value = '"+ value.qty +"' disabled> ";
									appendString12 += "</td>";
								
									appendString12 += "<td>";
										appendString12 += "<select class = 'form-control selectOption' disabled> <option> "+ value.todo +" </option> <option>- Select Todo-</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option><option>Other</option></select>" ;
									appendString12 += "</td>";
									
									appendString12 += "<td>";
										appendString12 += "<input type='date' class = 'form-control' value='"+ value.requestDueDate +"' disabled>" ;
									appendString12 += "</td>";
									
									appendString12 += "<td>";
										appendString12 += "<input type='date' class = 'form-control' disabled>" ;
									appendString12 += "</td>";
									
									appendString12 += "<td>";
										appendString12 += "<input type='date' class = 'form-control' disabled>";
									appendString12 += "</td>";
									
									appendString12 += "<td>";
										appendString12 += "<input type='text' class='form-control note' value = '"+ value.note +"' disabled>";
									appendString12 += "</td>";
								
									appendString12 += "<td>";
										appendString12 += "<a href='#' class = 'deleteItem' ><span style='color:red;'><i class='fas fa-window-close fa-2x'></i></span></a>" ;
									appendString12 += "</td>";
								appendString12 += "</tr>";
							tBody12.prepend(appendString12);
							
						})
						
					},
					error : function(){
						alert('error');
					}
				})
			
				
				$('#modalFromDesignAdmin').modal();					
			}
			else if (flagDsgEdit == 0){
				$.ajax({
					url : '${pageContext.request.contextPath}/promotion/getdetail?id=' + promoIdEdit,
					type : 'GET',
					dataType : 'json',
					success : function (data){
						
						///////////Promotion Header
						$('#transCodeAdminNot').val(data.code),
						$('#flagDesignEditNotAdmin').val(data.flagDesign),
						$('#idEditNotAdmin').val(data.id),
						$('#eventSelectAdminNot').val(data.event.code),
						$('#titleHeaderAdminNot').val(data.titleHeader),
						$('#requestByAdminNot').val(data.reqeustBy),
						$('#requestDateAdminNot').val(data.requestDate),
						$('#noteTitleHeaderAdminNot').val(data.note)
						
						var status6 = "";
						if(data.status == 0){
							status6 = "Rejected";
						} else if (data.status == 1){
							status6 = "Submitted";
						} else if (data.status == 2){
							status6 = "In Progress";
						} else if (data.status == 3){
							status6 = "Dones";
						}
						$('#statusByNotAdminView').val(status6);
						
						
						var oTable13 = $('#tabelItemNotAdmin');
						var tBody13 = oTable13.find('tbody');
						tBody13.find('tr').remove();
						$.each(data.listPromotionItemFile, function(index,value){
							
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							var appendString13 = '<tr value-pif-id = "'+ value.id +'">';
									appendString13 += '<td>';
										appendString13 += '<input type="file" class="filestyle uploadFile" data-buttonBefore="true" disabled>' ;
									appendString13 += '</td>';
							
									appendString13 += '<td>';
										appendString13 += '<input type="text" class="form-control qtyFile" value = "'+ value.qty +'" disabled>' ;
									appendString13 += '</td>';
							
									appendString13 += '<td>';
										appendString13 += '<select class = "form-control selectOption" disabled> <option> '+ value.todo +' </option> <option>- Select Todo-</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option><option>Other</option></select>' ;
									appendString13 += '</td>';
							
									appendString13 += '<td>';
										appendString13 += '<input type="date" class = "form-control" value="'+ value.requestDueDate +'" disabled>' ;
									appendString13 += '</td>';
							
									appendString13 += '<td>';
										appendString13 += '<input type="date" class = "form-control" disabled>' ;
									appendString13 += '</td>';
							
									appendString13 += '<td>';
										appendString13 += '<input type="date" class = "form-control" disabled>' ;
									appendString13 += '</td>';
							
									appendString13 += '<td>';
										appendString13 += '<input type="text" class="form-control note" value = "'+ value.note +'" disabled>' ;
									appendString13 += '</td>';
							
									appendString13 += '<td>';
										appendString13 += '<a href="#" class = "deleteItem" ><span style="color:red;""><i class="fas fa-window-close fa-2x"></i></span></a>' ;
									appendString13 += '</td>';
							
								appendString13 += '</tr>';
							
							tBody13.append(appendString13);
						})
						
					},
					error : function (data){
						alert ('error');
					}
				})
				
				$('#modalNotFromDesignAdmin').modal();
			}
			
			$('#rejectedDesign').on('click', function(){
				$('#modalRejected').modal();
			})
			
			$('#rejectedAdminNotDesign').on('click', function(){
				$('#modalRejectedNotDesign').modal();
			})
		}

		
////////////////////////////////////////////////////////////////////Edit from Design STAFF ////////////////////////////////////////////////////////////////////

		else if (roleStaff == 'true'){
			if(flagDsgEdit == 1){
				$.ajax({
					url:'${pageContext.request.contextPath}/promotion/getdetail?id=' + promoIdEdit,
					type: 'GET',
					dataType: 'json',
					success : function(data){
						
						//promotion header
						$('#transCodeStaff').val(data.code);
						$('#eventSelectStaff').val(data.event.code);
						$('#idEditStaff').val(data.id);
						$('#titleHeaderStaff').val(data.titleHeader);
						$('#requestDateStaff').val(data.requestDate);
						$('#noteTitleHeaderStaff').val(data.note);
						$('#flagDesignEditStaff').val(data.flagDesign);
						var status5 = "";
						if(data.status == 0){
							status5 = "Rejected";
						} else if (data.status == 1){
							status5 = "Submitted";
						} else if (data.status == 2){
							status5 = "In Progress";
						} else if (data.status == 3){
							status5 = "Done";
						}
						$('#statusByStaff').val(status5);
						
						//design header
						$('#designCodeStaff').val(data.design.code);
						$('#titleHeaderDesignStaff').val(data.design.titleHeader);
						$('#requestByDesignStaff').val(data.design.requestBy);
						$('#requestDateDesignStaff').val(data.design.requestDate);
						$('#noteDesignHeaderStaff').val(data.design.note);
						
						//promotion item
						var oTabel14 = $('#listDesignItemStaff');
						var tBody14 = oTabel14.find('tbody');
						tBody14.find('tr').remove();
						
						$.each(data.listPromotionItem, function(index, value){
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							var appendString14 = '<tr value-dsi-id = "'+ value.id +'" value-pic-id = "'+ value.requestPic +'">';
									appendString14 += '<td>';
										appendString14 += '<input type="text" value-id="' + value.product.id +'" value="' + value.product.name +'" class="form-control" disabled>';
									appendString14 += '</td>';
						
									appendString14 += '<td>';
										appendString14 += '<input type="text" value="'+ value.product.description +'" class="form-control" disabled>';
									appendString14 += '</td>';
						
									appendString14 += '<td>';
										appendString14 += '<input type="text" value="' + value.designItem.titleItem + '" class="form-control" disabled>';
									appendString14 += '</td>';
								
									appendString14 += '<td>';
										appendString14 += '<input class = "form-control" type="text" value="'+ value.qty +'" disabled>';
									appendString14 += '</td>';
							
									appendString14 += '<td>';
										appendString14 += '<select class = "form-control select-todo-promoItem" disabled> <option> '+ value.todo +' </option> <option>- Select Todo-</option> <option>Print</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option> <option>Other</option> </select>';
									appendString14 += '</td>';
							
									appendString14 += '<td>';
										appendString14 += '<input type="date" class = "form-control" value="'+ value.requestDueDate +'" disabled>';
									appendString14 += '</td>';
						
									appendString14 += '<td>';
										appendString14 += '<input class = "form-control" type="date" value="'+ value.startDate +'" >';
									appendString14 += '</td>';
										
									appendString14 += '<td>';
										appendString14 += '<input type="date" class = "form-control" value ="'+ value.endDate +'" >';
									appendString14 += '</td>';
						
									appendString14 += '<td>';
										appendString14 += '<input class = "form-control" type="text" value="'+ value.note +'" disabled>';
									appendString14 += '</td>';
							
									appendString14 += '<td>';
										appendString14 += '<a><span><i class="fas fa-arrow-circle-down fa-2x"></i></span></a>';
									appendString14 += '</td>';
								
								appendString14 += '</tr>';
							tBody14.append(appendString14);
						})
						
						
						var oTable15 = $('#tabelItemStaff');
						var tBody15 = oTable15.find('tbody');
						tBody15.find('tr').remove();
						$.each(data.listPromotionItemFile, function(index,value){
						
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							
							var appendString15 = "<tr value-pif-id = '"+ value.id +"'>";
									appendString15 += "<td>";
										appendString15 +="<input type='file' class='filestyle uploadFile' data-buttonBefore='true' disabled>";
									appendString15 += "</td>";
									
									appendString15 += "<td>";
										appendString15 +="<input type='text' class='form-control qtyFile' value = '"+ value.qty +"' disabled> ";
									appendString15 += "</td>";
								
									appendString15 += "<td>";
										appendString15 += "<select class = 'form-control selectOption' disabled> <option> "+ value.todo +" </option> <option>- Select Todo-</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option><option>Other</option></select>" ;
									appendString15 += "</td>";
									
									appendString15 += "<td>";
										appendString15 += "<input type='date' class = 'form-control' value='"+ value.requestDueDate +"' disabled>" ;
									appendString15 += "</td>";
									
									appendString15 += "<td>";
										appendString15 += "<input type='date' class = 'form-control' value = '"+ value.startDate +"'>" ;
									appendString15 += "</td>";
									
									appendString15 += "<td>";
										appendString15 += "<input type='date' class = 'form-control' value = '"+ value.endDate +"'>";
									appendString15 += "</td>";
									
									appendString15 += "<td>";
										appendString15 += "<input type='text' class='form-control note' value = '"+ value.note +"' disabled>";
									appendString15 += "</td>";
								
									appendString15 += "<td>";
										appendString15 += "<a href='#' class = 'deleteItem' ><span style='color:red;'><i class='fas fa-window-close fa-2x'></i></span></a>" ;
									appendString15 += "</td>";
								appendString15 += "</tr>";
							tBody15.prepend(appendString15);
							
						})
						
					},
					error : function(){
						alert('error');
					}
				})
			
				
				$('#modalFromDesignStaff').modal();					
			}
			else if (flagDsgEdit == 0){
				
				$.ajax({
					url : '${pageContext.request.contextPath}/promotion/getdetail?id=' + promoIdEdit,
					type : 'GET',
					dataType : 'json',
					success : function (data){
						
						///////////Promotion Header
						$('#transCodeStaffNot').val(data.code),
						$('#flagDesignEditNotStaff').val(data.flagDesign),
						$('#idEditNotStaff').val(data.id),
						$('#eventSelectStaffNot').val(data.event.code),
						$('#titleHeaderStaffNot').val(data.titleHeader),
						$('#requestByStaffNot').val(data.reqeustBy),
						$('#requestDateStaffNot').val(data.requestDate),
						$('#noteTitleHeaderStaffNot').val(data.note)
						
						var status7 = "";
						if(data.status == 0){
							status7 = "Rejected";
						} else if (data.status == 1){
							status7 = "Submitted";
						} else if (data.status == 2){
							status7 = "In Progress";
						} else if (data.status == 3){
							status7 = "Done";
						}
						$('#statusByNotStaffView').val(status7);
						
						
						var oTable16 = $('#tabelItemNotStaff');
						var tBody16 = oTable16.find('tbody');
						tBody16.find('tr').remove();
						$.each(data.listPromotionItemFile, function(index,value){
							
							if(value.note == null){
								value.note = " ";
							} else {
								value.note
							}
							
							var appendString16 = '<tr value-pif-id = "'+ value.id +'">';
									appendString16 += '<td>';
										appendString16 += '<input type="file" class="filestyle uploadFile" data-buttonBefore="true" disabled>' ;
									appendString16 += '</td>';
							
									appendString16 += '<td>';
										appendString16 += '<input type="text" class="form-control qtyFile" value = "'+ value.qty +'" disabled>' ;
									appendString16 += '</td>';
							
									appendString16 += '<td>';
										appendString16 += '<select class = "form-control selectOption" disabled> <option> '+ value.todo +' </option> <option>- Select Todo-</option> <option>Post to Social Media</option> <option>Post to Company Profile website</option> <option>Post to Xsis Academy website</option><option>Other</option></select>' ;
									appendString16 += '</td>';
							
									appendString16 += '<td>';
										appendString16 += '<input type="date" class = "form-control" value="'+ value.requestDueDate +'" disabled>' ;
									appendString16 += '</td>';
							
									appendString16 += '<td>';
										appendString16 += '<input type="date" class = "form-control" value="'+ value.startDate +'">' ;
									appendString16 += '</td>';
							
									appendString16 += '<td>';
										appendString16 += '<input type="date" class = "form-control" value = "'+ value.endDate +'">' ;
									appendString16 += '</td>';
							
									appendString16 += '<td>';
										appendString16 += '<input type="text" class="form-control note" value = "'+ value.note +'" disabled>' ;
									appendString16 += '</td>';
							
									appendString16 += '<td>';
										appendString16 += '<a href="#" class = "deleteItem" ><span style="color:red;""><i class="fas fa-window-close fa-2x"></i></span></a>' ;
									appendString16 += '</td>';
							
								appendString16 += '</tr>';
							
							tBody16.append(appendString16);
						})
						
					},
					error : function (data){
						alert ('error');
					}
				})

				
				$('#modalNotFromDesignStaff').modal();
			}
		}
		
	})

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
/////////////////////////////// Update from flagDesign == 1 //////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

//ROLE REQUESTER
	$('#updateDesign').on('click', function(){
		var updatePromo = {
			id : $('#idEdit').val(),
			code : $('#transCodeUpdate').val(),
			titleHeader : $('#titleHeaderUpdate').val(),
			requestBy : $('#requestByUpdate').val(),
			requestDate : $('#requestDateUpdate').val(),
			note : $('#noteTitleHeaderUpdate').val(),
			status : 1,
			flagDesign : $('#flagDesignEdit').val(),
			listPromotionItem : [],
			listPromotionItemFile : []
		}
		
		_readTableDataDesignUpdate(updatePromo.listPromotionItem);
		_readTableDataNotDesignUpdate(updatePromo.listPromotionItemFile);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/promotion/update',
			type : 'POST',
			data : JSON.stringify(updatePromo),
			contentType : 'application/json',
			success : function (data){
				window.location = '${pageContext.request.contextPath}/promotion';
			},
			error : function (){
				alert('error');
			}
		})
		
	})
	
	function _readTableDataDesignUpdate(listPromotionItem){
		$('#listDesignItemUpdate > tbody > tr').each(function(index, value){
			var updateListPromo = {
					id : $(value).attr('value-dsi-id'),
					product : {
						id : $(value).find('td').eq(0).find('input').attr('value-id'),
						name :$(value).find('td').eq(0).find('input').val(),
						description : $(value).find('td').eq(1).find('input').val()
					},
					designItem : {
						id : $(value).attr('value-dsi-id'),
						titleItem : $(value).find('td').eq(2).find('input').val()	
					},
					/* requestPic : {
						id : $(value).attr('value-pic-id')
					}, */
					qty : $(value).find('td').eq(3).find('input').val(),
					todo : $(value).find('td').eq(4).find('select option:selected').val(),
					requestDueDate : $(value).find('td').eq(5).find('input').val(),
					startDate : $(value).find('td').eq(6).find('input').val(),
					endDate : $(value).find('td').eq(7).find('input').val(),
					note : $(value).find('td').eq(8).find('input').val()
			}
			
			listPromotionItem.push(updateListPromo);
		})
	
	}
	
	function _readTableDataNotDesignUpdate(listPromotionItemFile) {
		$('#tabelItemUpdate > tbody > tr').each(function(index, value){
			var updateFile = {
				id : $(value).attr('value-pif-id'),
				note : $(value).find('td').eq(6).find('input').val(),
				qty : $(value).find('td').find('input').eq(1).val(),
				requestDueDate : $(value).find('td').eq(3).find('input').val(),
				todo : $(value).find('td').eq(2).find('select').val()
			}
			
			listPromotionItemFile.push(updateFile);
		})
	}

///ROLE ADMIN
	$('#approvedDesign').on('click', function(){
		var approveData = {
			id	: $('#idEditAdmin').val(),
			status : 2
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/promotion/approved',
			type : 'POST',
			data : JSON.stringify(approveData),
			contentType : 'application/json',
			success : function (data){
				window.location = "${pageContext.request.contextPath}/promotion";
			},
			error : function (){
				alert ('error');	
			}
			
		})
	})
	
	$('#rejectPromotAdmin').on('click', function(){
		var rejectPromo = {
			id	: $('#idEditAdmin').val(),
			status : 0,
			rejectReason : $('#rejectReasonAdminPromo').val()
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/promotion/rejected',
			type : 'POST',
			data : JSON.stringify(rejectPromo),
			contentType : 'application/json',
			success : function (data){
				window.location = "${pageContext.request.contextPath}/promotion";
			},
			error : function (){
				alert ('error');	
			}
			
		})
	})
	
/// ROLE STAFF
	$('#closeRequestStaff').on('click', function(){
		var promoStaff = {
			id : $('#idEditStaff').val(),
			status : 3,
			listPromotionItem : [],
			listPromotionItemFile : []
		}
		_closeRequestItem(promoStaff.listPromotionItem);
		_closeRequestItemFile(promoStaff.listPromotionItemFile);
	
		$.ajax({
			url:'${pageContent.request.contextPath}/promotion/closerequest',
			type : 'POST',
			data : JSON.stringify(promoStaff),
			contentType : 'application/json',
			success : function(data){
				window.location = '${pageContext.request.contextPath}/promotion';
			},
			error : function(){
				alert('error');
			}
		})
	
	})

	function _closeRequestItem(listPromotionItem){
		$('#listDesignItemStaff > tbody > tr').each(function(index,value){
			var promoItemStaff = {
				id : $(value).attr('value-dsi-id'),
				startDate : $(value).find('td').eq(6).find('input').val(),
				endDate : $(value).find('td').eq(7).find('input').val()
			}
			listPromotionItem.push(promoItemStaff);
		})
	}
	
	function _closeRequestItemFile(listPromotionItemFile){
		$('#tabelItemStaff > tbody > tr').each(function(index,value){
			var promoItemFileStaff = {
				id : $(value).attr('value-pif-id'),
				startDate : $(value).find('td').eq(4).find('input').val(),
				endDate : $(value).find('td').eq(5).find('input').val()
			}
			listPromotionItemFile.push(promoItemFileStaff);
		})
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Update from flagDesign == 0 //////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/// ROLE_REQUESTER
	$('#updateNotDesign').on('click', function(){
		
		var updatePromoNot = {
			id : $('#idEditNot').val(),
			code : $('#transCodeNotUpdate').val(),
			titleHeader : $('#titleHeaderNotUpdate').val(),
			requestBy : $('#requestByNotUpdate').val(),
			requestDate : $('#requestDateNotUpdate').val(),
			note : $('#noteTitleHeaderNotUpdate').val(),
			status : 1,
			flagDesign : $('#flagDesignEditNot').val(),
			listPromotionItemFile : []
		}
		
		_readTableDataNotDesignUpdate(updatePromoNot.listPromotionItemFile);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/promotion/update',
			type : 'POST',
			data : JSON.stringify(updatePromoNot),
			contentType : 'application/json',
			success : function (data){
				window.location = '${pageContext.request.contextPath}/promotion';
			},
			error : function (){
				alert('error');
			}
		})
		 
	})

	
	function _readTableDataNotDesignUpdate(listPromotionItemFile) {
		$('#tabelItemNotUpdate > tbody > tr').each(function(index, value){
			var updateFileNot = {
				id : $(value).attr('value-pif-id'),
				note : $(value).find('td').eq(6).find('input').val(),
				qty : $(value).find('td').find('input').eq(1).val(),
				requestDueDate : $(value).find('td').eq(3).find('input').val(),
				todo : $(value).find('td').eq(2).find('select').val()
			}
			
			listPromotionItemFile.push(updateFileNot);
		})
	}

///ROLE ADMIN
	$('#approvedAdminNotDesign').on('click', function(){
		var approveData = {
			id	: $('#idEditNotAdmin').val(),
			status : 2
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/promotion/approved',
			type : 'POST',
			data : JSON.stringify(approveData),
			contentType : 'application/json',
			success : function (data){
				window.location = "${pageContext.request.contextPath}/promotion";
			},
			error : function (){
				alert ('error');	
			}
			
		})
	})
	
	$('#rejectPromotAdminNotDesign').on('click', function(){
		var rejectPromoNotDesign = {
			id	: $('#idEditNotAdmin').val(),
			status : 0,
			rejectReason : $('#rejectReasonAdminPromoNotDesign').val()
		}
		$.ajax({
			url : '${pageContext.request.contextPath}/promotion/rejected',
			type : 'POST',
			data : JSON.stringify(rejectPromoNotDesign),
			contentType : 'application/json',
			success : function (data){
				window.location = "${pageContext.request.contextPath}/promotion";
			},
			error : function (){
				alert ('error');	
			}
			
		})
	})
	
/////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////// Upload File //////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
		
		//untuk upload file
		/* var fd = new FormData();    
		fd.append( 'theFile', $('#myTheFile')[0].files[0]);
		
		$.ajax({
		  url: '/doupload',
		  data: fd,
		  enctype: 'multipart/form-data',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			alert(data);
		  }
		}); */
	
	})
	
	
	</script>
</head>
<body>
	<!----------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	<!------------------------------------------------------------------------ MAIN MENU ------------------------------------------------------------------------------------>
	<!----------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	
	<div id="container" style="width :1340px; margin-right:auto; margin-left:auto;" >
	
	<div class="modal-header btn-primary">
	   <h5 class="modal-title" id="exampleModalLabel">List Marketing Promotion</h5>
	</div>
	<div style="padding:1px;"></div>
	<ol class="breadcrumb">
  		<li><a href="#">Home </a>/</li>
  		<li><a href="#"> Master </a>/</li>
 	 	<li class="active"> List Marketing Promotion</li>
	</ol>
	
	<div>
	<p></p> <!-- pemberi jeda -->
	</div>
	
	<div id = "add-container" style="text-align:right;">
		<input type="submit" value = "Add" class = "btn btn-primary btn-custom" id="add" style ="width:73px;">
	</div>
	
	<div id= "navigasi" class = "form-row">
			<div class = "col">
			<input type="text" name = "code" placeholder = "Transaction Code" class = "form-control">
			</div>
		
			<div class = "col">
			<input type="text" name = "requestBy" placeholder = "Request By" class = "form-control">
			</div>
			
			<div class = "col">
			<input type="text" name ="requestDate" placeholder = "Request Date" class = "form-control date-picker">
			</div>
			
			<div class = "col">
			<input type="text" name ="assignTo" placeholder = "-Assign To-" class = "form-control">
			</div>
			
			<div class = "col">
			<input type="text" name = "Status" placeholder = "Status" class = "form-control">
			</div>
			
			<div class = "col">
			<input type="text" name = "createdDate" placeholder = "Created Date" class = "form-control date-picker">
			</div>
			
			<div class = "col">
			<input type="text" name = "createdBy" placeholder = "Created By" class = "form-control"	>
			</div>
			
			<div class = "col-auto">
			<input type = "submit" value = "Search" class="btn btn-warning btn-custom float-right">
			</div>		
	</div>
	<div style="padding:2px;"></div>
		
	<div>
		<table id = "tablePromotion" class="table" >
			<thead>
				<tr>
					<th >No</th>
					<th >Transaction Code</th>
					<th >Request By</th>
					<th >Request Date</th>
					<th >Assign To</th>
					<th >Status</th>
					<th >Created Date</th>
					<th >Created By</th>
					<th >Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items = "${listPromotion }" var = "promotion">
					<tr value-promo-id = ${promotion.id }>
						<td></td>
						<td>${promotion.code }</td>
						<td>${promotion.requestBy }</td>
						<td>${promotion.requestDate }</td>
						<td>${promotion.assignTo }</td>
						<td>
							<c:choose>
								<c:when test="${promotion.status == 1 }">
									Submitted
								</c:when>
								
								<c:when test="${promotion.status == 2 }">
									In Progress
								</c:when>
								
								<c:when test="${promotion.status == 3 }">
									Done
								</c:when>
								
								<c:when test="${promotion.status == 0 }">
									Rejected
								</c:when>
							</c:choose>
						</td>
						<td>${promotion.createdDate }</td>
						<td>${promotion.createdBy }</td>
						<td>
							<a href="#" value-promo-id-detail = ${promotion.id } value-flag-design =${promotion.flagDesign } class="tombolDetail"><span class="float-left" style="padding:3px; color:grey;" ><i class="fas fa-search fa-lg"></i></span></a>
							<a href="#" status-id=${promotion.status }  value-promo-id-edit = ${promotion.id } value-flag-edit =${promotion.flagDesign } data-role-requester="<%= request.isUserInRole("ROLE_REQUESTER") %>"  data-role-admin = "<%= request.isUserInRole("ROLE_ADMIN") %>" data-role-staff="<%= request.isUserInRole("ROLE_STAFF") %>" class="tombolEdit"><span class="float-left" style="padding:3px; color:grey;"><i class="fas fa-pencil-alt fa-lg"></i></span></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>



		<!---------------------------------------------------------------- Modal Add --------------------------------------------------------------------------------------->

		<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title " id="exampleModalLabel">Add Marketing Promotion</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
				<div class="modal-body" style="height:150px;">
				  <div class="form-group">
				  	<div >
				  		<span class = "float-left" style="width:35%; text-align:right;">* Select Event :</span>
				  	</div>
				 	<div class="float-left" id="event-select" style="width:65%;">	
				 		<select id = "event-select-option" class="form-control" >
				 				<option>- Select Event -</option>
					 		<c:forEach items="${listEvent }" var="event">
					 	    	<option value="${event.id }" value-event-code="${event.code }"> ${event.code } - ${event.eventName } </option>
					 	    </c:forEach>
				 		</select>
				 	</div>
				  </div>
				  
				  <div style="clear:both;"></div>
				  
				  <div class="form-group">
				 	<span class = "float-left" style="width:35%; text-align:right;">* Select from Design :</span>
				 	<div class = "float-left" style="width:65%;">
					 	<select class="form-control" id="design-select-option">
					    	<option value = "2">- Please Select -</option>
					    	<option value = "1"> Yes </option>
					    	<option value = "0"> No </option>
					    </select>
				 	</div>
				  </div>
				  
				  <div style="clear:both;"></div>
				  
				  <div style="display:none;" id="designAddDiv" >
				  	<span id = "designAdd" class = "float-left" style="width:35%; text-align:right;">* Select Design : </span>
					  	<div id="designAdd2" style="width:65%;" class = "float-left">
					  		<select class="form-control" id='design-select' >
					  			<option id="selectOption">- Select Design-</option>
					  		</select>
					  	</div>
				  </div>
		      </div>
		      
		      <div class="modal-footer">
		        <button id="next-btn" type="button" class="btn btn-primary">Next</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		      </div>
 
		    </div>
		  </div>
		</div>
	<%@ include file="modal/promotion-requester-save.jsp" %>
	<%@ include file="modal/promotion-requester-update.jsp" %>
	<%@ include file="modal/promotion-admin.jsp" %>
	<%@ include file="modal/promotion-staff.jsp" %>
</body>
	


</html>