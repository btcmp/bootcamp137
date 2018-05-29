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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Event</title>
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script> -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">

<script type="text/javascript">
	$(document).ready(function(){
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
					requestBy:$('#RequestBy').val(),
					requestDate:$('#RequestDate').val(),
					status:$('#statusS').val(),
					note:$('#Note').val(),
					requestBy:$('#RequestBy').val(),
					createBy:$('#createBy').val()
				}
				console.log(event);
					//ajax contohnya
			var status1=0;
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
			   	}
				
					
				if(status1 == 1 && status2 == 1 && status3 == 1 && status4 == 1 && status5 == 1){
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
				}
			});
//////////view/////////////////////////////////////////////////////////////////////////////////////////////////////
		//view even listener
		$(document).on('click','.view',function(){	
			var id = $(this).attr('id');
			
			$.ajax({
				url : '${pageContext.request.contextPath}/event/getevent/'+ id,
				type : 'GET',
				success : function(data){
					console.log(data);
					$('#codeV').val(data.code);
					$('#EventNameV').val(data.eventName);
					$('#EventPlaceV').val(data.eventPlace);
					$('#StartDateV').val(data.startDate);
					$('#EndDateV').val(data.endDate);
					$('#BudgetV').val(data.budget);
					$('#RequestByV').val(data.requestBy);
					$('#RequestDateV').val(data.requestDate);
					$('#statusV').val(data.status);
					$('#NoteV').val(data.note);
					
				},
				error : function(){
					alert('data company tidak ada');
				},
				dataType: 'json'
			});
			$('#modalView').modal();
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
					$('#id').val(data.id);
					$('#codeE').val(data.code);
					$('#EventNameE').val(data.eventName);
					$('#EventPlaceE').val(data.eventPlace);
					$('#StartDateE').val(data.startDate);
					$('#EndDateE').val(data.endDate);
					$('#BudgetE').val(data.budget);
					$('#RequestByE').val(data.requestBy);
					$('#RequestDateE').val(data.requestDate);
					$('#statusE').val(data.status);
					$('#NoteE').val(data.note);
					//$('#assignTOE').val(data.employee.firstName);
					//document.getElementById("valueAssign").value = data.employee.id;
					

					console.log(data);
				 
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
					document.getElementById('assignTOE').style.display = 'none';
					
					
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
					document.getElementById('req').style.display = 'block';
					document.getElementById('RequestByE').style.display = 'block';
					$("#EndDateE").prop('RequestByE', true);
					
					document.getElementById('btnedit').style.display = 'none';
					document.getElementById('CloseRequest').style.display = 'block';
					document.getElementById('approved').style.display = 'none';
					document.getElementById('rejected').style.display = 'none';
					document.getElementById('assignTOE').style.display = 'none';
					
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
					
					document.getElementById('btnedit').style.display = 'none';
					document.getElementById('CloseRequest').style.display = 'none';
					document.getElementById('approved').style.display = 'none';
					document.getElementById('rejected').style.display = 'none';
					document.getElementById('assignTOE').style.display = 'none';
					
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
					
					document.getElementById('btnedit').style.display = 'none';
					document.getElementById('CloseRequest').style.display = 'none';
					document.getElementById('approved').style.display = 'none';
					document.getElementById('rejected').style.display = 'none';
					//document.getElementById('assignTOE').style.display = 'none';
					
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
					
					document.getElementById('btnedit').style.display = 'none';
					document.getElementById('CloseRequest').style.display = 'none';
					document.getElementById('approved').style.display = 'none';
					document.getElementById('rejected').style.display = 'none';
					document.getElementById('assignTOE').style.display = 'none';
					
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
			console.log(event);
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
					requestBy:$('#RequestByE').val(),
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
		
	});
</script>

</head>
<body>

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
	
	
	
	<div id="container">
		<div style="height:40px;background-color:#0069D9;margin-bottom:10px">
			<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List Event Request</h5>
		</div>
		
		<div style="width:98%;margin:auto;">
			<ol class="breadcrumb">
	  			<li><a href="#">Home </a>/</li>
	  			<li><a href="#"> Master </a>/</li>
	 		 	<li class="active"> List Event Request</li>
			</ol>
	    
	
	    	<a href="#" class="btn btn-primary" id="btn-add" style="width:70px;float:right;">Add</a><br/><br/>
	    	
	
	    	
	    	
	    	<table class="table">
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
			    	</tr>
			  	</thead>
			  	<tbody>
						<c:forEach items="${ listEvent}" var="event">
							<tr>
								<td></td>
								<td>${event.code }</td>
								<td>${event.requestBy }</td>
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
								<td><a class="edit" data-role-admin="<%= request.isUserInRole("ROLE_ADMIN") %>" data-role-user="<%= request.isUserInRole("ROLE_REQUESTER") %>" data-status="${event.status }" id="${event.id }" href="#">Edit</a> | 
								<a class="view" id="${event.id }" href="#">View</a>
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
							       <input type="text" class="form-control" id="EventNameS" aria-describedby="emailHelp" placeholder="Type Event Name">
							    </div>
							</div>
							
							<div class="row">  
							  	<div class="col">
							      <label>* Event Place</label>
							    </div>
							    <div class="col">
							       <input type="text" class="form-control" id="EventPlaceS" aria-describedby="emailHelp" placeholder="Type Event Place">
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>* Event Start Date</label>
							    </div>
							    <div class="col">
							       <input placeholder="Start Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="StartDate">	
							    </div>
							  </div>
							  
							  <div class="row">  
							  	<div class="col">
							      <label>* Event End Date</label>
							    </div>
							    <div class="col">
							       <input placeholder="End Date" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="EndDate">	
							    </div>
							  </div>
							  
							 <div class="row">  
							  	<div class="col">
							      <label>* Budget (Rp.)</label>
							    </div>
							    <div class="col">
							       <input type="number" class="form-control" id="Budget" aria-describedby="emailHelp" placeholder="Event Budget">
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
							  	<div class="col">
							      <label>* Assign To</label>
							    </div>
							    <div class="col" id="assignTOE">
							      <select class="custom-select" id="valueAssign">
									 	 	<option selected>Select Employee</option>
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
	</c:if>
</body>
</html>