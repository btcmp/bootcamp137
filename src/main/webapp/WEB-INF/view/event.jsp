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
	  $( function() {
		    $( "#dueDateSearchId" ).datepicker();
		    $( "#requestDateSearchId" ).datepicker();
		    $( "#createdSearchId" ).datepicker();
		   
		   
		  } );
$(document).ready(function(){
	
	$('#StartDate').datepicker({ dateFormat: 'yy-mm-dd' }).val();
	$('#EndDate').datepicker({ dateFormat: 'yy-mm-dd' }).val();
	var isd = <%= request.isUserInRole("ROLE_ADMIN") %>;
	if(isd==true){
		//alert('tes');
		document.getElementById('btn-add').style.display = 'none';
	}
		console.log(isd);
	//alert('tes');
/////////save or insert////////////////////////////////////////////////////////////////////////////
		$('#btn-add').on('click', function(){
			$('#modalSave').modal();
		});
		//save function
		$('#btnsave').on('click',function(){
			
			var event = {
					code:$('#codeS').val(),
					eventName:$('#EventNameS').val(),
					eventPlace:$('#EventPlaceS').val(),
					startDate:$('#StartDate').val(),
					endDate:$('#EndDate').val(), 
					budget:$('#Budget').val(),
					requestDate:$('#RequestDate').val(),
					status:$('#statusS').val(),
					note:$('#Note').val(),
					createBy:$('#createBy').val()
				}
				console.log(event);
			///////////////////////////=======================================///////////////////////////////
			///////////////////////////=======================================//////////////////////////////
			///////////////////////////=======================================//////////////////////////////
			//////////////////////////////////////////////////////////////validasi pada saat save
			var oCode1 = $('#EventNameS').parsley( {
				required : true,
				requiredMessage : ' name !!',
				minlengthMessage: ' must more than 5 character',
				typeMessage: ' must be email character'
				
			} );
			
			var oCode2 = $('#EventPlaceS').parsley( {
				required : true,
				requiredMessage : ' place !!',
				minlengthMessage: ' must more than 5 character',
				typeMessage: ' must be email character'
				
				
			} );
			
			 var oCode3 = $('#StartDate').parsley( {
				required : true,
				requiredMessage : ' Start Date !!',
				minlengthMessage: ' must more than 5 character',
				typeMessage: ' must be email character'
				
			} );
			
			var oCode4 = $('#EndDate').parsley( {
				required : true,
				requiredMessage : ' End Date !!',
				minlengthMessage: ' must more than 5 character',
				typeMessage: ' must be email character'
				
			} );
			
			var oCode5 = $('#Budget').parsley( {
				required : true,
				requiredMessage : ' Budget !!',
				minlengthMessage: ' must more than 5 character',
				typeMessage: ' must be email character'
				
			} ); 
		var valid = getValid(oCode1);
			valid = getValid(oCode2);
		 	valid = getValid(oCode3);
			valid = getValid(oCode4);
			valid = getValid(oCode5); 
			
			
			
			if(valid){
				$.ajax({
					url:'${pageContext.request.contextPath}/event/save',
					type:'POST',
					data:JSON.stringify(event),
					contentType:'application/json',
					success:function(data){
						console.log(data);
						alert('save ok');
						window.location = '${pageContext.request.contextPath}/event'
					},error:function(){
						alert('gagal save');
					}
				});
			}else{
				alert('not complete');
			}
			
			function getValid(validate){
				validate.validate();	
				return validate.isValid();
			}
			///////////////////////////=======================================///////////////////////////////
			///////////////////////////=======================================//////////////////////////////
			///////////////////////////=======================================//////////////////////////////
			//ajax contohnya
			/* var status1=0;
			if($('#EventNameS').val() == ''){
			      alert('Event name can not be left blank');
			  		status1=0;
				}else{
				    status1=1;
			   	}
			
			var status2=0;
			if($('#EventPlaceS').val() == ''){
			      alert('Event Place can not be left blank');
			  		status2=0;
				}else{
				    status2=1;
			   	}
			
			var status3=0;
			if($('#StartDate').val() == ''){
			      alert('Start Date can not be left blank');
			  		status3=0;
				}else{
				    status3=1;
			   	}
			
			var status4=0;
			if($('#EndDate').val() == ''){
			      alert('End Date can not be left blank');
			  		status4=0;
				}else{
				    status4=1;
			   	}
			
			var status5=0;
			if($('#Budget').val() == ''){
			      alert('Budget can not be left blank');
			  		status5=0;
				}else{
				    status5=1;
			   	} */
				
					
				//if(status1 == 1 && status2 == 1 && status3 == 1 && status4 == 1 && status5 == 1){
					/* $.ajax({
						url:'${pageContext.request.contextPath}/event/save',
						type:'POST',
						data:JSON.stringify(event),
						contentType:'application/json',
						success:function(data){
							console.log(data);
							alert('save ok');
							window.location = '${pageContext.request.contextPath}/event'
						},error:function(){
							alert('gagal save');
						}
					}); */
				//}
			});
//////////view/////////////////////////////////////////////////////////////////////////////////////////////////////
		//view even listener
		$(document).on('click','.view',function(){	
			var id = $(this).attr('id');
			
			$.ajax({
				url : '${pageContext.request.contextPath}/event/getevent/'+ id,
				type : 'GET',
				success : function(data){
					var fullName = data.requestBy.firstName + ' ' + data.requestBy.lastName;
					console.log(data);
					$('#codeV').val(data.code);
					$('#EventNameV').val(data.eventName);
					$('#EventPlaceV').val(data.eventPlace);
					$('#StartDateV').val(data.startDate);
					$('#EndDateV').val(data.endDate);
					$('#BudgetV').val(data.budget);
					$('#RequestByV').val(fullName);
					$('#RequestDateV').val(data.requestDate);
					$('#statusV').val(data.status);
					$('#NoteV').val(data.note);
					$('#EmployeeNameV').val(data.employee.firstName);
					
				},
				error : function(){
					alert('data company tidak ada');
				},
				dataType: 'json'
			});
			
			
			
			$('#modalView').modal();
			if($(this).attr('data-status')==1){
				
				document.getElementById('colLabelV').style.display = 'none';
				document.getElementById('idEmployeeNameV').style.display = 'none';
			}
			if($(this).attr('data-status')==2){
				$("#EmployeeNameV").prop('disabled', true);
				document.getElementById('colLabelV').style.display = 'block';
				document.getElementById('idEmployeeNameV').style.display = 'block';
			}
			if($(this).attr('data-status')==3){
				$("#EmployeeNameV").prop('disabled', true);
				document.getElementById('colLabelV').style.display = 'block';
				document.getElementById('idEmployeeNameV').style.display = 'block';
			}
			if($(this).attr('data-status')==0){
				$("#EmployeeNameV").prop('disabled', true);
				document.getElementById('colLabelV').style.display = 'block';
				document.getElementById('idEmployeeNameV').style.display = 'block';
			}
			
		});
		
		
///////////edit even listener///////////////////////////////////////////////////////////////////////////////////
		//$('.edit').on('click', function(){
		var statusSubmit;
		var idBB;
		$(document).on('click','.edit',function(){	
			idBB = $(this).attr('id');
			var statusUser = $(this).attr('data-role-user');
			var statusAdmin = $(this).attr('data-role-admin');
			//console.log(abc);
			$.ajax({
				url : '${pageContext.request.contextPath}/event/getevent/'+ idBB,
				type : 'GET',
				success : function(data){
					var fullName = data.requestBy.firstName + ' ' + data.requestBy.lastName;
					$('#id').val(data.id);
					$('#codeE').val(data.code);
					$('#EventNameE').val(data.eventName);
					$('#EventPlaceE').val(data.eventPlace);
					$('#StartDateE').val(data.startDate);
					$('#EndDateE').val(data.endDate);
					$('#BudgetE').val(data.budget);
					$('#RequestByE').val(fullName);
					$('#RequestDateE').val(data.requestDate);
					$('#statusE').val(data.status);
					$('#NoteE').val(data.note);
					$('#EmployeeName').val(data.employee.firstName);
					
					//$('#assignTOE').val(data.employee.firstName);
					//document.getElementById("valueAssign").value = data.employee.id;
					

					console.log(data.employee.firstName);
				 
				},
				error : function(){
					alert('data Event tidak ada');
				},
				dataType: 'json'
			});
//ini klo user===================================================================================================
			if(statusUser=="true"){
				if($(this).attr('data-status')==1){
					//alert('hore bisa');
					$("#statusES").prop('disabled', true);
					$("#EventNameE").prop('disabled', false);
					$("#EventPlaceE").prop('disabled', false);
					$("#StartDateE").prop('disabled', false);
					$("#BudgetE").prop('disabled', false);
					$("#RequestByE").prop('disabled', false);
					$("#RequestDateE").prop('disabled', true);
					$("#NoteE").prop('disabled', false);
					$("#EndDateE").prop('disabled', false);
					
					document.getElementById('req').style.display = 'none';
					document.getElementById('RequestByE').style.display = 'none';
					
					document.getElementById('btnedit').style.display = 'block';
					document.getElementById('CloseRequest').style.display = 'none';
					document.getElementById('approved').style.display = 'none';
					document.getElementById('rejected').style.display = 'none';
					
					document.getElementById('colLabel').style.display = 'none';
					document.getElementById('assignTOE').style.display = 'none';
					document.getElementById('idEmployeeName').style.display = 'none';
					
					
					var a = document.getElementById("statusES");
					a.value = "Submited";  
					
					
				}else if($(this).attr('data-status')==2){
					//alert('hore bisa');
					$("#statusES").prop('disabled', true);
					$("#EventNameE").prop('disabled', true);
					$("#EventPlaceE").prop('disabled', true);
					$("#StartDateE").prop('disabled', true);
					$("#BudgetE").prop('disabled', true);
					$("#RequestByE").prop('disabled', true);
					$("#RequestDateE").prop('disabled', true);
					$("#NoteE").prop('disabled', true);
					$("#EndDateE").prop('disabled', true);
					$("#EmployeeName").prop('disabled', true);
					
					
					
					document.getElementById('req').style.display = 'block';
					document.getElementById('RequestByE').style.display = 'block';
					
					document.getElementById('btnedit').style.display = 'none';
					document.getElementById('CloseRequest').style.display = 'block';
					document.getElementById('approved').style.display = 'none';
					document.getElementById('rejected').style.display = 'none';
					
					document.getElementById('colLabel').style.display = 'block';
					document.getElementById('assignTOE').style.display = 'none';
					document.getElementById('idEmployeeName').style.display = 'block';
					
					
					
					var a = document.getElementById("statusES");
					a.value = "In Progress";  
					
					
				}else if($(this).attr('data-status')==3){
					$("#statusES").prop('disabled', true);
					$("#EventNameE").prop('disabled', true);
					$("#EventPlaceE").prop('disabled', true);
					$("#StartDateE").prop('disabled', true);
					$("#BudgetE").prop('disabled', true);
					$("#RequestByE").prop('disabled', true);
					$("#RequestDateE").prop('disabled', true);
					$("#NoteE").prop('disabled', true);
					$("#EndDateE").prop('disabled', true);
					document.getElementById('req').style.display = 'block';
					document.getElementById('RequestByE').style.display = 'block';
					$("#EndDateE").prop('RequestByE', true);
					$("#EmployeeName").prop('disabled', true);
					
					document.getElementById('btnedit').style.display = 'none';
					document.getElementById('CloseRequest').style.display = 'none';
					document.getElementById('approved').style.display = 'none';
					document.getElementById('rejected').style.display = 'none';
					
					document.getElementById('colLabel').style.display = 'block';
					document.getElementById('assignTOE').style.display = 'none';
					document.getElementById('idEmployeeName').style.display = 'block';
					
					var a = document.getElementById("statusES");
					a.value = "Done"; 
				
				}else if($(this).attr('data-status')==0){
					$("#statusES").prop('disabled', true);
					$("#EventNameE").prop('disabled', true);
					$("#EventPlaceE").prop('disabled', true);
					$("#StartDateE").prop('disabled', true);
					$("#BudgetE").prop('disabled', true);
					$("#RequestByE").prop('disabled', true);
					$("#RequestDateE").prop('disabled', true);
					$("#NoteE").prop('disabled', true);
					$("#EndDateE").prop('disabled', true);
					document.getElementById('req').style.display = 'block';
					document.getElementById('RequestByE').style.display = 'block';
					$("#EndDateE").prop('RequestByE', true);
					
					document.getElementById('btnedit').style.display = 'none';
					document.getElementById('CloseRequest').style.display = 'none';
					document.getElementById('approved').style.display = 'none';
					document.getElementById('rejected').style.display = 'none';
					document.getElementById('assignTOE').style.display = 'none';
					
					var a = document.getElementById("statusES");
					a.value = "Rejected"; 
				}
			}
			
//ini klo Admin===================================================================================================
			if(statusAdmin=="true"){
				if($(this).attr('data-status')==1){
					//alert('hore bisa');
					$("#statusES").prop('disabled', true);
					$("#EventNameE").prop('disabled', true);
					$("#EventPlaceE").prop('disabled', true);
					$("#StartDateE").prop('disabled', true);
					$("#BudgetE").prop('disabled', true);
					$("#RequestByE").prop('disabled', true);
					$("#RequestDateE").prop('disabled', true);
					$("#NoteE").prop('disabled', true);
					$("#EndDateE").prop('disabled', true);
					document.getElementById('btnedit').style.display = 'none';
					
					document.getElementById('CloseRequest').style.display = 'none';
					document.getElementById('approved').style.display = 'block';
					document.getElementById('rejected').style.display = 'block';
					document.getElementById('assignTOE').style.display = 'block';
					document.getElementById('idEmployeeName').style.display = 'none';
					
					var a = document.getElementById("statusES");
					a.value = "Submited";  
					
					
				}else if($(this).attr('data-status')==2){
					//alert('hore bisa');
					$("#statusES").prop('disabled', true);
					$("#EventNameE").prop('disabled', true);
					$("#EventPlaceE").prop('disabled', true);
					$("#StartDateE").prop('disabled', true);
					$("#BudgetE").prop('disabled', true);
					$("#RequestByE").prop('disabled', true);
					$("#RequestDateE").prop('disabled', true);
					$("#NoteE").prop('disabled', true);
					$("#EndDateE").prop('disabled', true);
					$("#assignTOE").prop('disabled', true);
					$("#EmployeeName").prop('disabled', true);
					
					document.getElementById('btnedit').style.display = 'none';
					document.getElementById('CloseRequest').style.display = 'none';
					document.getElementById('approved').style.display = 'none';
					document.getElementById('rejected').style.display = 'none';
					document.getElementById('assignTOE').style.display = 'none';
					document.getElementById('idEmployeeName').style.display = 'block';
					
					var a = document.getElementById("statusES");
					a.value = "In Progress";  
					
					
				}else if($(this).attr('data-status')==3){
					$("#statusES").prop('disabled', true);
					$("#EventNameE").prop('disabled', true);
					$("#EventPlaceE").prop('disabled', true);
					$("#StartDateE").prop('disabled', true);
					$("#BudgetE").prop('disabled', true);
					$("#RequestByE").prop('disabled', true);
					$("#RequestDateE").prop('disabled', true);
					$("#NoteE").prop('disabled', true);
					$("#EndDateE").prop('disabled', true);
					$("#EmployeeName").prop('disabled', true);
					
					document.getElementById('btnedit').style.display = 'none';
					document.getElementById('CloseRequest').style.display = 'none';
					document.getElementById('approved').style.display = 'none';
					document.getElementById('rejected').style.display = 'none';
					document.getElementById('assignTOE').style.display = 'none';
					document.getElementById('idEmployeeName').style.display = 'block';
					
					var a = document.getElementById("statusES");
					a.value = "Done"; 
				
				}else if($(this).attr('data-status')==0){
					$("#statusES").prop('disabled', true);
					$("#EventNameE").prop('disabled', true);
					$("#EventPlaceE").prop('disabled', true);
					$("#StartDateE").prop('disabled', true);
					$("#BudgetE").prop('disabled', true);
					$("#RequestByE").prop('disabled', true);
					$("#RequestDateE").prop('disabled', true);
					$("#NoteE").prop('disabled', true);
					$("#EndDateE").prop('disabled', true);
					
					document.getElementById('btnedit').style.display = 'none';
					document.getElementById('CloseRequest').style.display = 'none';
					document.getElementById('approved').style.display = 'none';
					document.getElementById('rejected').style.display = 'none';
					document.getElementById('assignTOE').style.display = 'none';
					
					var a = document.getElementById("statusES");
					a.value = "Rejected"; 
				}
			}
			$('#modalEdit').modal();
		});

//aprove request/////////////////////////////////////////////////////////////////////////////////////////////////		
		$('#approved').on('click',function(){
			//window.location="${pageContext.request.contextPath}/event/aprove/"+ idBB;
			var event = {
					id:$('#id').val(),
					employee: {
						id : $('#assignTOE option:selected').val()
					},
					updateBy:$('#updateBy').val()
				}
			//console.log(event);
			var statusvalue;
			
			if( !$('#valueAssign').val() ) { 
				statusvalue=0;
				alert("assign is empty");
			}else{
				statusvalue=1;
			}
			
			if(statusvalue==1){
			   	$.ajax({
					url:'${pageContext.request.contextPath}/event/aprove',
					type:'POST',
					data:JSON.stringify(event),
					contentType:'application/json',
					success:function(data){
						alert('update ok');
						
						window.location = '${pageContext.request.contextPath}/event'
					},error:function(){
						alert('gagal update');
					}
				});
			}
		});
		
//close request//////////////////////////////////////////////////////////////////////////////////////////////////		
		$('#CloseRequest').on('click',function(){
			$('#modalCloseDate').modal();
		});
		
		$('#btnClsDt').on('click',function(){
			var event = {
					id:$('#id').val(),
					updateBy:$('#updateBy').val()
				}
			//console.log(event);
		   	$.ajax({
				url:'${pageContext.request.contextPath}/event/updatecls',
				type:'POST',
				data:JSON.stringify(event),
				contentType:'application/json',
				success:function(data){
					alert('update ok');
					
					window.location = '${pageContext.request.contextPath}/event'
				},error:function(){
					alert('gagal update');
				}
			});
		
		});
//rejected event/////////////////////////////////////////////////////////////////////////////////////////////////		
		$('#rejected').on('click',function(){
			$('#modalRejected').modal();
		});
		
		$('#BtnRejected').on('click',function(){
			var event = {
					id:$('#id').val(),
					updateBy:$('#updateBy').val(),
					rejectReason:$('#reason').val()
				}
			var statusreason;
			if($('#reason').val() == ''){
			      	alert('Reason cannot blank');
			     	statusreason=0;
				}else{
					statusreason=1;
			   	}
			
			//console.log(event);
			if(statusreason==1){
				$.ajax({
					url:'${pageContext.request.contextPath}/event/rejected',
					type:'POST',
					data:JSON.stringify(event),
					contentType:'application/json',
					success:function(data){
						alert('update ok');
						
						window.location = '${pageContext.request.contextPath}/event'
					},error:function(){
						alert('gagal update');
					}
				});
			}
		});
		
		
////////pada saat submit/////////////////////////////////////////////////////////////////////////////////////////
		$('#btnedit').on('click',function(){
				var event = {
					id:$('#id').val(),
					code:$('#codeE').val(),
					eventName:$('#EventNameE').val(),
					eventPlace:$('#EventPlaceE').val(),
					startDate:$('#StartDateE').val(),
					endDate:$('#EndDateE').val(), 
					budget:$('#BudgetE').val(),
					requestDate:$('#RequestDateE').val(),
					note:$('#NoteE').val(),
					updateBy:$('#updateBy').val()
				}
			console.log(event);
			//ajax contohnya
			$.ajax({
				url:'${pageContext.request.contextPath}/event/update',
				type:'POST',
				data:JSON.stringify(event),
				contentType:'application/json',
				success:function(data){
					alert('update ok');
					
					window.location = '${pageContext.request.contextPath}/event'
				},error:function(){
					alert('gagal update');
				}
			});
				
		});
		
///search///////////////////////////////////////////////////////////////////////////////////////////////////////		
		$('#btnSearch').on('click', function(){
			var form = $("#formrole");
			var data = form.serialize(); //untuk mengambil semua data yang ada di table
			console.log(data);
			window.location = '${pageContext.request.contextPath}/event/search?'+data;
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

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			
		


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
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div style="height:40px;background-color:#0069D9;margin-bottom:10px">
			<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List Event</h5>
		</div>
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
       <c:url value="/j_spring_security_logout" var="logoutUrl" />
	<div id="container">
		
		
		<div style="width:98%;margin:auto;">
			<ol class="breadcrumb">
	  			<li><a href="#">Home </a>/</li>
	  			<li><a href="#"> Master </a>/</li>
	 		 	<li class="active"> List Event Request</li>
			</ol>
	    
	<!-- <p>Date: <input type="text" id="datepicker"></p> -->
	    	<a href="#" class="btn btn-primary" id="btn-add" style="width:70px;float:right;">Add</a><br/><br/>
	    	<a href="#" id="btnSearch" class="btn btn-warning" style="width:70px;color:white;float:right;">Search</a>
	    	<form id="formrole">
	    	<div class="form-row" >
	    		<div class="col-auto">
	    			<input placeholder="Transaction Code" class="form-control" type="text" name="tcodeSearch">	
	    		</div>
	    		<div class="col-auto">
	    			<input placeholder="Request By" class="form-control" type="text" name="requestSearch">	
	    		</div>
	    		<div class="col-auto">
	    			<input placeholder="Request Date" class="form-control" type="text" name="requestDateSearch" id="requestDateSearchId">	
	    		</div>
	    		<div class="col">
	    			<input placeholder="Due Date" class="form-control" type="text" name="dueDateSearch" id="dueDateSearchId">	
	    		</div>
	    		<div class="col-auto">
	    			<input placeholder="Status" class="form-control" type="text" name="statusSearch">	
	    		</div>
	    		<div class="col">
	    			<input placeholder="Created" class="form-control" type="text" name="createdSearch" id="createdSearchId">	
	    		</div>
	    		<div class="col">
	    			<input placeholder="Created By" class="form-control" type="text" name="createdBysearch">	
	    		</div>
	    		<div class="col-auto">
	    			
	    			
	    		</div>
	    	</div>
    	</form>
	
	    	
	    	
	    	<table id="dataEvent" class="table table-striped table-bordered" style="width:100%">
				<thead>
			    	<tr>
			      		<th scope="col">No</th>
						<th scope="col">Transaction Code</th>
						<th scope="col">Request By</th>
						<th scope="col">Request Date</th>
						<th scope="col">Due Date</th>
						<th scope="col">Status</th>
						<th scope="col">Create Date</th>
						<th scope="col">Create By</th>
						<th scope="col">Action</th>
			    	</tr>
			  	</thead>
			  	<tbody>
						<c:forEach items="${ listEvent}" var="event">
							<tr>
								<td></td>
								<td>${event.code }</td>
								<td>${event.requestBy.firstName} ${event.requestBy.lastName}</td>
								<td>${event.requestDate }</td>
								<td>${event.endDate }</td>
								<td>
									<c:choose>
									    <c:when test="${event.status == 1}">
									        Submited 
									    </c:when> 
									    <c:when test="${event.status == 0}">
									        Rejected 
									    </c:when>
									    <c:when test="${event.status == 2}">
									        In Progress 
									    </c:when>
									    <c:when test="${event.status == 3}">
									        Done 
									    </c:when>   
									</c:choose>
								</td>
								<td>${event.createDate }</td>
								<td>${event.createBy }</td>
								<td><a class="edit" data-role-admin="<%= request.isUserInRole("ROLE_ADMIN") %>" data-role-user="<%= request.isUserInRole("ROLE_REQUESTER") %>" data-status="${event.status }" id="${event.id }" href="#"><i class="fas fa-pencil-alt"></i></a> | 
								<a class="view" data-status="${event.status }" id="${event.id }" href="#"><i class="fas fa-search"></i></a>
								</td>
							</tr>
						</c:forEach>
						</tbody>
			</table>
	 	</div>
		
		
		
		
		<!-- Modal Save-->
		<div class="modal fade bd-example-modal-lg" id="modalSave" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add Event</h5>
		      </div>
		      <div class="modal-body">
		      <!-- bagian kiri -->
		      		<div class="row">
						  <div class="col">
							<div class="row">  	
							  	<div class="col">
							      <label>* Transaction Code</label>
							    </div>
							    <div class="col">
							       <input type="text" class="form-control" id="codeS" aria-describedby="emailHelp" value="${hasil}" placeholder="${hasil}"  disabled>
							       <input type="hidden" id="statusS" value="1" />
							       <input type="hidden" id="createBy" value="${pageContext.request.userPrincipal.name}"/>
							      
							       
							    </div>
							</div>
							
							<div class="row">  	
							  	<div class="col">
							      <label>* Event Name</label>
							    </div>
							    <div class="col">
							       <input data-parsley-required="true" type="text" class="form-control" id="EventNameS" aria-describedby="emailHelp" placeholder="Type Event Name">
							    </div>
							</div>
							
							<div class="row">  
							  	<div class="col">
							      <label>* Event Place</label>
							    </div>
							    <div class="col">
							       <input data-parsley-required="true" type="text" class="form-control" id="EventPlaceS" aria-describedby="emailHelp" placeholder="Type Event Place">
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>* Event Start Date</label>
							    </div>
							    <div class="col">
							       <input data-parsley-required="true" placeholder="Start Date" class="form-control" type="text" id="StartDate">	
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>* Event End Date</label>
							    </div>
							    <div class="col">
							       <input data-parsley-required="true" placeholder="End Date" class="form-control" type="text" id="EndDate">	
							    </div>
							  </div>
							  
							 <div class="row">  
							  	<div class="col">
							      <label>* Budget (Rp.)</label>
							    </div>
							    <div class="col">
							       <input data-parsley-required="true" type="number" class="form-control" id="Budget" aria-describedby="emailHelp" placeholder="Event Budget">
							    </div>
							  </div>
						  </div>
						 
						  <!-- bagian kanan -->
						  <div class="col">
							  <div class="row">  
							  	<div class="col">
							      <label>* Request by</label>
							    </div>
							    <div class="col">
							    	<input type="text" class="form-control" id="RequestBy" aria-describedby="emailHelp"  value="${pageContext.request.userPrincipal.name}" placeholder="${pageContext.request.userPrincipal.name}" disabled>
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>* Request Date</label>
							    </div>
							    <div class="col">
							       <%
									      Date dNow = new Date( );
									      SimpleDateFormat ft = 
									      new SimpleDateFormat ("yyyy-MM-dd");
									     
									%>
							       <input type="text" class="form-control" id="RequestDate" aria-describedby="emailHelp" placeholder="<% out.print( ft.format(dNow)); %>" value="<% out.print( ft.format(dNow)); %>" disabled>
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>Note</label>
							    </div>
							    <div class="col">
							      <textarea class="form-control" id="Note" rows="3" placeholder="Type Note"></textarea>
							    </div>
							  </div>
						 </div>
						 
					</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="btnsave">Save</button>
		        <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Cancel</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	
	<!-- MODEL VIEW -->
	<div class="modal fade bd-example-modal-lg" id="modalView" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add Event</h5>
		      </div>
		      <div class="modal-body">
		      <!-- bagian kiri -->
		      		<div class="row">
						  <div class="col">
							<div class="row">  	
							  	<div class="col">
							      <label>* Transaction Code</label>
							    </div>
							    <div class="col">
							       <input type="text" class="form-control" id="codeV" aria-describedby="emailHelp"   disabled>
							    </div>
							</div>
							
							<div class="row">  	
							  	<div class="col">
							      <label>* Event Name</label>
							    </div>
							    <div class="col">
							       <input type="text" class="form-control" id="EventNameV" aria-describedby="emailHelp" placeholder="Type Event Name" disabled>
							    </div>
							</div>
							
							<div class="row">  
							  	<div class="col">
							      <label>* Event Place</label>
							    </div>
							    <div class="col">
							       <input type="text" class="form-control" id="EventPlaceV" aria-describedby="emailHelp" placeholder="Type Event Place" disabled>
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>* Event Start Date</label>
							    </div>
							    <div class="col">
							       <input placeholder="Start Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="StartDateV" disabled>	
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>* Event End Date</label>
							    </div>
							    <div class="col">
							       <input placeholder="End Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="EndDateV" disabled>	
							    </div>
							  </div>
							  
							 <div class="row">  
							  	<div class="col">
							      <label>* Budget (Rp.)</label>
							    </div>
							    <div class="col">
							       <input type="number" class="form-control" id="BudgetV" aria-describedby="emailHelp" placeholder="Event Budget" disabled>
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col" id="colLabelV">
							      <label>* Assign To</label>
							    </div>
							  	
							  	 <div class="col" id="idEmployeeNameV">
							       <input type="text" class="form-control" id="EmployeeNameV" aria-describedby="emailHelp" placeholder="Type Event Name">
							    </div>  
							  </div>
							  
						  </div>
						 
						  <!-- bagian kanan -->
						  <div class="col">
							  <div class="row">  
							  	<div class="col">
							      <label>* Request by</label>
							    </div>
							    <div class="col">
							    	<input type="text" class="form-control" id="RequestByV" aria-describedby="emailHelp" placeholder="" disabled>
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>* Request Date</label>
							    </div>
							    <div class="col">
							       <input type="text" class="form-control" id="RequestDateV" aria-describedby="emailHelp" disabled>
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>Note</label>
							    </div>
							    <div class="col">
							      <textarea class="form-control" id="NoteV" rows="3" placeholder="Type Note" disabled></textarea>
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
	
	
	<!-- Modal Edit-->
		<div class="modal fade bd-example-modal-lg" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add Event</h5>
		      </div>
		      <div class="modal-body">
		      <!-- bagian kiri -->
		      		<div class="row">
						  <div class="col">
							<div class="row">  	
							  	<div class="col">
							      <label>* Transaction Code</label>
							    </div>
							    <div class="col">
							       <input type="text" class="form-control" id="codeE" aria-describedby="emailHelp" value="${hasil}" placeholder="${hasil}"  disabled>
							       <input type="hidden" id="id" />
							        <input type="hidden" id="updateBy" value="${pageContext.request.userPrincipal.name}" />
							    </div>
							</div>
							
							<div class="row">  	
							  	<div class="col">
							      <label id="LabelCodeE">* Event Name</label>
							    </div>
							    <div class="col">
							       <input type="text" class="form-control" id="EventNameE" aria-describedby="emailHelp" placeholder="Type Event Name">
							    </div>
							</div>
							
							<div class="row">  
							  	<div class="col">
							      <label>* Event Place</label>
							    </div>
							    <div class="col">
							       <input type="text" class="form-control" id="EventPlaceE" aria-describedby="emailHelp" placeholder="Type Event Place">
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>* Event Start Date</label>
							    </div>
							    <div class="col">
							       <input placeholder="Start Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="StartDateE">	
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>* Event End Date</label>
							    </div>
							    <div class="col">
							       <input placeholder="End Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="EndDateE">	
							    </div>
							  </div>
							  
							 <div class="row">  
							  	<div class="col">
							      <label>* Budget (Rp.)</label>
							    </div>
							    <div class="col">
							       <input type="number" class="form-control" id="BudgetE" aria-describedby="emailHelp" placeholder="Event Budget">
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col" id="colLabel">
							      <label>* Assign To</label>
							    </div>
							  	
							  	 <div class="col" id="idEmployeeName">
							       <input type="text" class="form-control" id="EmployeeName" aria-describedby="emailHelp" placeholder="Type Event Name">
							    </div>  
							  	  
							    
							    
							    <div class="col" id="assignTOE">
							      <select class="custom-select" id="valueAssign">
									 	 	<option selected value="">Select Employee</option>
										 <c:forEach items="${listEmployee}" var="employee">
											<option value="${employee.id }">${employee.firstName} ${employee.lastName}</option>
										</c:forEach>
									</select>
							    </div>
							  
							  
							  </div>
						  </div>
						 
						  <!-- bagian kanan -->
						  <div class="col">
							  <div class="row">  
							  	<div class="col">
							      <label id="req">* Request by</label>
							    </div>
							    <div class="col">
							    	<input type="text" class="form-control" id="RequestByE" aria-describedby="emailHelp" placeholder="" disabled>
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>* Request Date</label>
							    </div>
							    <div class="col">
							       <input type="text" class="form-control" id="RequestDateE" aria-describedby="emailHelp" placeholder="" disabled>
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>Note</label>
							    </div>
							    <div class="col">
							      <textarea class="form-control" id="NoteE" rows="3" placeholder="Type Note"></textarea>
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label id="status">status</label>
							    </div>
							    <div class="col">
							    	<input type="text" class="form-control" id="statusES" aria-describedby="emailHelp" placeholder="" disabled>
							    	   
									
							    </div>
							  </div>
							  
						 </div>
						 
					</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" style="color:white;" id="approved">Approved</button>
		       	<button type="button" class="btn btn-primary" id="rejected">Rejected</button>
		        <button type="button" class="btn btn-primary" id="btnedit">Edit</button>
		        <button type="button" class="btn btn-primary" id="CloseRequest">Close Request</button>
		        <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Cancel</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	<!-- Modal Rejected-->
			 <div class="modal fade" id="modalRejected" role="dialog">
			    <div class="modal-dialog modal-dialog-centered modal-sm">
			      <div class="modal-content">
			        <div class="modal-header">
			          
			         	<h4 class="modal-title">Rejected Reason</h4>
			        </div>
			        <div class="modal-body">
			         	 	<textarea class="form-control" id="reason" rows="3" placeholder="Type Reason"></textarea>
			        </div>
			         <div class="modal-footer">
				        <center>
				          	<button type="button" class="btn btn-lg"  data-dismiss="modal">Close</button>
				            <button type="button" class="btn btn-lg"  data-dismiss="modal" id="BtnRejected">Reject</button>
				        </center>
				   	</div>
			      </div>
			    </div>
			  </div>
	
	<!-- Modal Close Date-->
			 <div class="modal fade" id="modalCloseDate" role="dialog">
			    <div class="modal-dialog modal-dialog-centered modal-sm">
			      <div class="modal-content">
			        <div class="modal-header">
			          
			         	<h4 class="modal-title">Close Request</h4>
			        </div>
			        <div class="modal-body">
			         	  <center>
				          	<button type="button" class="btn btn-lg"  data-dismiss="modal">Cancel</button>
				            <button type="button" class="btn btn-lg"  data-dismiss="modal" id="btnClsDt">Yes</button>
				        </center>
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
</c:if>

<script>
 $(function () {
    
   var t = $('#dataEvent').DataTable({
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
