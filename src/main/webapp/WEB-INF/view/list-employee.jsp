<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Employee</title>
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>

<style type="text/css">
	table{
		counter-reset: tableCount;
	}
	.counterCell:before {
		content : counter(tableCount);
		counter-increment: tableCount;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		//ADD
		$('#btn-add').on('click', function(){
			$('#modal-add').modal();
		});
		//SUBMIT ADD
		$('#btn-submit-add').click(function(){
			var employee = {
				code : $('#codeEmployee').val(),
				mCompanyId : {
					id : $('#mCompanyId option:selected').val()
				},
				firstName : $('#firstName').val(),
				lastName : $('#lastName').val(),
				email : $('#email').val()
			}
			console.log(employee);
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
		}); 
		
		//SEARCH
		$('#btn-search').click(function() {
		 var search = {
					code : $('#codeSearch').val()
				}
			console.log(search);
		 
			
			var employee1 = search.code;
				    $("#emp tr").filter(function() {
				      $(this).toggle($(this).text().toLowerCase().indexOf(employee1) > -1)
		    });
			 
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
			  $.ajax({
					url : '${pageContext.request.contextPath}/employee/getemployee?id='+id,
					type: 'GET',
					success : function(obj){
						$('#idEdit').val(obj.id);
						$('#codeEdit').val(obj.code);
						$('#m-company-id-edit').val(obj.mCompanyId.id);
						$('#firstNameEdit').val(obj.firstName);
						$('#lastNameEdit').val(obj.lastName);
						$('#emailEdit').val(obj.email);
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
					id : $('#m-company-id-edit option:selected').val()
				},
				firstName : $('#firstNameEdit').val(),
				lastName : $('#lastNameEdit').val(),
				email : $('#emailEdit').val()
			}
			console.log(employee);
			$.ajax({
				url : '${pageContext.request.contextPath}/employee/update',
				type : 'PUT',
				data : JSON.stringify(employee),
				contentType : 'application/json',
				success : function(data){
					window.location="${pageContext.request.contextPath}/employee";
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
	});
</script>
</head>
<body>
	
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

    	<div class="form-row">
    		<div class="col-auto">
    			<input type="text" class="form-control" id="codeSearch" placeholder="Employee ID Number" style="font-size: 13px">
    		</div>
    		<div class="col">
    			<input type="text" class="form-control" id="nameSearch" placeholder="Employee Name" style="font-size: 13px">
    		</div>
    		<div class="form-group">
    			<div class="col-auto" id="companySearch">
	  				<select class="form-control" id="exampleFormControlSelect1" style="font-size: 13px">
	      				<option>- Select Company Name -</option>
	      				<c:forEach items="${listCompany}" var="company">
						<option value="${company.id}">${company.name}</option>
						</c:forEach>
	    			</select> 
	    		</div>
  			</div>
    		
    		<div class="col-auto">
    			<input placeholder="Created" class="form-control" type="text" onfocus="(this.type='date')" onblur="(this.type='text')" id="createdDateSearch" style="font-size: 13px">	
    		</div>
    		<div class="col-auto">
    			<input type="text" class="form-control" id="createdBySearch" placeholder="Created By" style="font-size: 13px">
    		</div>
    		<div class="col-auto">
    			<a href="#" class="btn btn-warning" id="btn-search" style="width:70px;color:white;">Search</a>
    		</div>	
    	</div>
    	
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
							<a href="#" id="btn-edit" data-id='${employee.id}'><i class="fas fa-pencil-alt"></i></a>
							<a href="#" id="btn-delete" data-id='${employee.id}'><i class="fas fa-trash"></i></a>
						</td>
					</tr>	
				</c:forEach>
		  	</tbody>
		</table>    		
	</div>
	<%@ include file="modal/modal-employee.jsp" %>
 </body>
</html>