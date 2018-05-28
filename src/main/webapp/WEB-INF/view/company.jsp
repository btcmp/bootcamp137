<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Data Company</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

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


<style type="text/css">
table {
    counter-reset: tableCount;     
}
.counterCell:before {              
    content: counter(tableCount); 
    counter-increment: tableCount; 
}
</style>


<script type="text/javascript">
	$(document).ready(function(){
		
		//save even listener
		//$('#tabelCompany').DataTable();
		
		$('#btn-add').on('click', function(){
			
			$('#modalSave').modal();
			
		});
		
		
		
		//pada saat submit save
		$('#btnsave').on('click',function(){
			var company = {
				name:$('#nameA').val(),
				address:$('#addressA').val(),
				email:$('#emailA').val(),
				phone:$('#phoneA').val(),
				code:$('#codeA').val(),
				createBy:$('#createBy').val()
				//alert('oke jalan');	
			}
			var statusNama = 0;
			if($('#nameA').val() == ''){
			      alert('Company name can not be left blank');
			    	  statusNama = 0;  
			   	}else{
				   statusNama = 1;
			   	}
			$('#emailA').val(function() {
			    var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
			    if (!testEmail.test(this.value)){
			    	alert('Email not complete');
			    }
			});
			
			
			
			if(statusNama == 1){
				   console.log(company);
					//ajax contohnya
					$.ajax({
						url:'${pageContext.request.contextPath}/company/save',
						type:'POST',
						data:JSON.stringify(company),
						contentType:'application/json',
						success:function(data){
							alert('save ok');
							window.location = '${pageContext.request.contextPath}/company'
						},error:function(){
							alert('gagal save');
						}
					});
			   }
			
			
				
		});
		//delete
		var isi;
		$(document).on('click','.delete',function(){
			isi = $(this).attr('id');
			$('#modalDelete').modal();
		});
		
		$('#btnDelete').on('click',function(){
			//console.log(isi);
			//alert("masuk");
				window.location="${pageContext.request.contextPath}/company/delete/"+ isi;
			
		});
		
		
		
		//edit even listener
		//$('.edit').on('click', function(){
		$(document).on('click','.edit',function(){	
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/company/getcompany/'+ id,
				type : 'GET',
				success : function(data){
					console.log(data);
					$('#id').val(data.id);
					$('#name').val(data.name);
					$('#address').val(data.address);
					$('#email').val(data.email);
					$('#phone').val(data.phone);
					$('#code').val(data.code);
					
				},
				error : function(){
					alert('data company tidak ada');
				},
				dataType: 'json'
			});
			$('#modalEdit').modal();
		});
	
		//pada saat submit
		$('#btnedit').on('click',function(){
			var company = {
				id:$('#id').val(),
				name:$('#name').val(),
				address:$('#address').val(),
				email:$('#email').val(),
				phone:$('#phone').val(),
				code:$('#code').val(),
				updateBy:$('#updateBy').val()
				
				//alert('oke jalan');	
			}
			console.log(company);
			
			//ajax contohnya
			$.ajax({
				url:'${pageContext.request.contextPath}/company/update',
				type:'POST',
				data:JSON.stringify(company),
				contentType:'application/json',
				success:function(data){
					alert('update ok');
					
					window.location = '${pageContext.request.contextPath}/company'
				},error:function(){
					alert('gagal update');
				}
			});
				
		});
		
		//view even listener
		$(document).on('click','.view',function(){	
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/company/getcompany/'+ id,
				type : 'GET',
				success : function(data){
					console.log(data);
					$('#idV').val(data.id);
					$('#nameV').val(data.name);
					$('#addressV').val(data.address);
					$('#emailV').val(data.email);
					$('#phoneV').val(data.phone);
					$('#codeV').val(data.code);
					
					
				},
				error : function(){
					alert('data company tidak ada');
				},
				dataType: 'json'
			});
			$('#modalView').modal();
		});
		
		//search button 
		$('#btnSearch').on('click', function(){
			var form = $("#formCompanySearch");
			var data = form.serialize(); //untuk mengambil semua data yang ada di table
			console.log(data);
			
 			window.location = '${pageContext.request.contextPath}/company/search?'+data;

			
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
	</c:if>

	<div id="container">
		<div style="height:40px;background-color:#0069D9;margin-bottom:10px">
			<h5 style="font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;padding-top:8px;padding-left:8px;color:white;">List Company</h5>
		</div>
		
		 
		
		<div style="width:98%;margin:auto;">
			<ol class="breadcrumb">
	  			<li><a href="#">Home </a>/</li>
	  			<li><a href="#"> Master </a>/</li>
	 		 	<li class="active"> List Company</li>
			</ol>
		
		
		<a href="#" class="btn btn-primary" id="btn-add" style="width:70px;float:right;">Add</a><br/><br/>
		<form id="formCompanySearch">
	    	<div class="form-row" >
	    		<div class="col">
	    			<select id="dataCodeCompany" class="form-control" name="codeCompany">
	    				<option value="" selected>- Select Company Code -</option>
	    				<c:forEach items="${listCompanyFilter}" var="company">
	    					<option id="companyCodeSearch" value="${company.code}">${company.code}</option>
	    				</c:forEach>
	    			</select>
	    		</div>
	    		<div class="col">
	    			<select id="dataCompanyName" class="form-control" name="nameCompany">
	    				<option value="" selected>- Select Company Name -</option>
	    				<c:forEach items="${listCompanyFilter}" var="company">
	    					<option id="companyNameSearch" value="${company.name}">${company.name}</option>
	    				</c:forEach>
	    			</select>
	    		</div>
	    		<div class="col-auto">
	    			<input placeholder="Created" class="form-control" type="text" name="createDateCompany" onfocus="(this.type='date')" onblur="(this.type='text')" id="createDateSearch">	
	    		</div>
	    		<div class="col-auto">
	    			<input placeholder="Created By" class="form-control" type="text" name="createdByCompany" id="createBySearch">	
	    		</div>
	    		<div class="col-auto">
	    			<a href="#" id="btnSearch" class="btn btn-warning" style="width:70px;color:white;">Search</a>
	    		</div>
	    	</div>
    	</form>
		
		
			
				<table id="tabelCompany" class="table table-striped table-bordered" style="width:100%">
				<thead>
			    	<tr>
			      			<th scope="col">No</th>
							<th scope="col">Company Code</th>
							<th scope="col">Company Name</th>
							<th scope="col">Create Date</th>
							<th scope="col">Create By</th>
							<th scope="col">Action</th>
						
			    	</tr>
			  	</thead>
			  	<tbody>
					<c:forEach items="${ listCompany}" var="company">
						<tr>
							<td class="counterCell"></td>
							<td>${company.code }</td>
							<td>${company.name }</td>
							<td>${company.createDate }</td>
							<td>${company.createBy }</td>
							<td><a class="delete" id="${company.id }" href="#">Delete</a> |
							<a class="edit" id="${company.id }" href="#">Edit</a> | 
							<a class="view" id="${company.id }" href="#">View</a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
			</table>
		</div>
		
		<!-- Modal delete-->
		 <div class="modal fade" id="modalDelete" role="dialog">
		    <div class="modal-dialog modal-dialog-centered modal-sm">
		      <div class="modal-content">
		        <div class="modal-header">
		          
		         	<h4 class="modal-title">Delete Data</h4>
		        </div>
		        <div class="modal-body">
		          	<center>
		          	<button type="button" class="btn btn-lg"  data-dismiss="modal">Close</button>
		            <button type="button" class="btn btn-lg"  data-dismiss="modal" id="btnDelete">Delete</button>
		        	</center>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		
		
		<!-- Modal view-->
		<div class="modal fade bd-example-modal-lg" id="modalView" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add Company</h5>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
		      
			      	<div class="row">
					  <div class="col">
						<div class="row">  	
						  	<div class="col">
						      <label>* Company Code</label>
						    </div>
						    <div class="col">
						       	<input type="text" class="form-control"  id="codeV" aria-describedby="emailHelp" placeholder="Enter your name" disabled>
						   		
						    </div>
						</div>
						
						<div class="row">  	
						  	<div class="col">
						      <label>Email</label>
						    </div>
						    <div class="col">
						       <input type="email" class="form-control" id="emailV" aria-describedby="emailHelp" placeholder="Enter your name" disabled>
						    </div>
						</div>
						
						<div class="row">  
						  	<div class="col">
						      <label>Phone</label>
						    </div>
						    <div class="col">
						       <input type="number" class="form-control" id="phoneV" aria-describedby="emailHelp" placeholder="Enter your name" disabled>
						    </div>
						  </div>
					  
					  </div>
					  <div class="col">
						  <div class="row">  
						  	<div class="col">
						      <label>* Company Name</label>
						    </div>
						    <div class="col">
						       <input type="text" class="form-control" id="nameV" aria-describedby="emailHelp" placeholder="Enter your name" disabled>
						    </div>
						  </div>
						  
						  <div class="row">  
						  	<div class="col">
						      <label>Address</label>
						    </div>
						    <div class="col">
						      <textarea class="form-control" id="addressV" rows="3" disabled></textarea >
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
		
		<!-- Modal Edit-->
		<div class="modal fade bd-example-modal-lg" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add Company</h5>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
		      
			      	<div class="row">
					  <div class="col">
						<div class="row">  	
						  	<div class="col">
						      <label>* Company Code</label>
						    </div>
						    <div class="col">
						       	 <input type="text" class="form-control" id="code" aria-describedby="emailHelp" placeholder="Enter your name"  disabled>
						   		<input type="hidden" id="id" />
						   		<input type="hidden" id="updateBy" value="${pageContext.request.userPrincipal.name}" />
						    </div>
						</div>
						
						<div class="row">  	
						  	<div class="col">
						      <label>Email</label>
						    </div>
						    <div class="col">
						       <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter your name">
						    </div>
						</div>
						
						<div class="row">  
						  	<div class="col">
						      <label>Phone</label>
						    </div>
						    <div class="col">
						       <input type="number" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter your name">
						    </div>
						  </div>
					  
					  </div>
					  <div class="col">
						  <div class="row">  
						  	<div class="col">
						      <label>* Company Name</label>
						    </div>
						    <div class="col">
						       <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your name">
						    </div>
						  </div>
						  
						  <div class="row">  
						  	<div class="col">
						      <label>Address</label>
						    </div>
						    <div class="col">
						      <textarea class="form-control" id="address" rows="3"></textarea>
						    </div>
						  </div>
						  
						  
						  
						 </div>
					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		      <button type="button" class="btn btn-primary" value="testing" id="btnedit">Save</button>
		      <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Cancel</button>
			  	
		      </div>
		    </div>
		  </div>
		</div>
		
		
		<!-- Modal Save-->
		<div class="modal fade bd-example-modal-lg" id="modalSave" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header" style="background-color:#0069D9;color:white;">
		        <h5 class="modal-title" id="exampleModalLongTitle">Add Company</h5>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
		      
			      	<div class="row">
					  <div class="col">
						<div class="row">  	
						  	<div class="col">
						      <label>* Company Code</label>
						      <input type="hidden" id="createBy" value="${pageContext.request.userPrincipal.name}"/>
						      
						    </div>
						    <div class="col">
						       <input type="text" class="form-control" id="codeA" aria-describedby="emailHelp" value="${hasil}" placeholder="${hasil}"  disabled>
						    </div>
						</div>
						
						<div class="row">  	
						  	<div class="col">
						      <label>Email</label>
						    </div>
						    <div class="col">
						       <input type="email" class="form-control" id="emailA" aria-describedby="emailHelp" placeholder="Type Email">
						    </div>
						</div>
						
						<div class="row">  
						  	<div class="col">
						      <label>Phone</label>
						    </div>
						    <div class="col">
						       <input type="number" class="form-control" id="phoneA" aria-describedby="emailHelp" placeholder="Type Phone">
						    </div>
						  </div>
					  
					  </div>
					  <div class="col">
						  <div class="row">  
						  	<div class="col">
						      <label>* Company Name</label>
						    </div>
						    <div class="col">
						       <input type="text" class="form-control" id="nameA" aria-describedby="emailHelp" placeholder="Type Company Name">
						    </div>
						  </div>
						  
						  <div class="row">  
						  	<div class="col">
						      <label>Address</label>
						    </div>
						    <div class="col">
						      <textarea class="form-control" id="addressA" rows="3" placeholder="Type Address"></textarea>
						    </div>
						  </div>
						  
						  
						  
						 </div>
					</div>
				</div>
		      </div>
		      <div class="modal-footer">
		      <button type="button" class="btn btn-primary" value="testing" id="btnsave">Save</button>
		      <button type="button" class="btn btn-warning" style="color:white;" data-dismiss="modal">Cancel</button>
			  	
		      </div>
		    </div>
		  </div>
		</div>
		
	</div>
		
</body>

</html>