<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.css"> --%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>P.R.O.D.U.C.T</title>
</head>


<script type="text/javascript">
	$(document).ready(function(){
		$('#btn-add').on('click', function(){
			$('#modalAdd').modal();
		});
		
		$('#save').on('click', function(){
			var product = {
					code : $('#cde').val(),
					name : $('#nme').val(),
					description : $('#des').val()
			}
			
			console.log(product);
			
			$.ajax({
				url: '${pageContext.request.contextPath}/product/save',
				type: 'POST',
				contentType : 'application/json',
				data : JSON.stringify(product),
				success : function(data){
					$('.alert').alert()
					window.location = '${pageContext.request.contextPath}/product'
				},
				error : function(){
					alert('Error Update');
				}
			});
		});
		
		var deleteid;
		$('.delete').on('click', function(){
			deleteid = $(this).attr('id');
			$('#modalDelete').modal();
		});
		
		$('#btn-delete-yes').on('click', function(){
			//console.log(deleteid);
			//window.location='${pageContext.request.contextPath}/product/delete/'+deleteid;
		});
		
		$('.edit').on('click', function(){
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/product/getproduct?id='+id,
				type : 'GET',
				success : function(object){
					$('#id').val(object.id);
					$('#editcode').val(object.code);
					$('#editname').val(object.name);
					$('#editdescription').val(object.description);
					console.log(object);
				}
			});
			$('#modalEdit').modal();
		});
		
		$('#editsave').on('click', function(){
			var product = {
				id : $('#id').val(),
				code : $('#editcode').val(),
				name : $('#editname').val(),
				description : $('#editdescription').val(),
			}
			
			console.log(product);
			
			$.ajax({
				url : '${pageContext.request.contextPath}/product/edit',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(product),
				success : function(data){
					alert('update oke');
					console.log(data);
					window.location = '${pageContext.request.contextPath}/product'
				},
				error : function(){
					alert('Error Update');
				}
			});
		});
		
		$('.view').on('click', function(){
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/product/getproduct?id='+id,
				type : 'GET',
				success : function(object){
					$('#viewcode').val(object.code);
					$('#viewname').val(object.name);
					$('#viewdescription').val(object.description);
					console.log(object);
				}
			});
			$('#modalView').modal();
		});
		
		$('#btn-search').on('click', function(){
			var form = $("#form-search");
			var data = form.serialize();
			console.log(data);
			window.location = '${pageContext.request.contextPath}/product/search?'+data;
		});
	});
</script>

<style>
/* *{
	padding:5px;
} */
	#container{
		/* border-radius:10px; */
		padding:0px;
	}
	
		#header{
			background-color:#0069D9;
			margin-bottom:10px;
			height:40px;
		}
		
		#header h5{
		font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;
		padding-top:8px;
		padding-left:8px;
		color:white;
		}
		
		#body{
			width:96%;
			color:white;
			background-color:white;
			margin:auto;
		}
			
			#body1{
			margin:auto;
			margin-bottom:20px;
			}
		
		#btn-add{
			float:right;
			width:70px;
			margin-right:5px;
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
			<h5>LIST PRODUCT<h5>
		</div>
		<div id="body">
		  <div id="body1">
			<ol class="breadcrumb">
			  <li><a href="#">Home </a>/</li>
			  <li><a href="#">Master </a>/</li>
			  <li><a href="#">List Souvenir Stock</a></li>
			</ol>
			
			<a href="#" class="btn btn-sm btn-primary" id="btn-add" data-toggle="modal" data-target="#exampleModalCenter">Add</a><br><br>
		  <form id="form-search">
			<div class="form-row">
				<div class="col-auto">
				  <input type=text name="code" id="Product_Code" class="form-control" placeholder="Product Code">
				</div>
				<div class="col-auto">
				  <input type=text name="name" id="Product_Name" class="form-control" placeholder="Product Name">
				</div>
				<div class="col-auto">
				  <input type=text name="description" id="Description" class="form-control" placeholder="Description">
				</div>
				<div class="col">
				  <input type=date name="createdDate" id="Date_Created" class="form-control" placeholder="Date_Created" onfocus="(this.type='date')" onblur="(this.type='text')">
				</div>
				<div class="col-auto">
				  <input type=text name="createdBy" id="Created_By" class="form-control" placeholder="Created_By">
				</div>
				<div class="col-auto">
				  <a href="#" class="btn btn-sm btn-warning" id="btn-search" data-toggle="modal" data-target="#exampleModalCenter">Search</a>
				</div>
			</div>
			</form>
		  </div>
		  <div id="body2">
			  <table class="table">
				<thead>
				  <tr>
					<th>No</th>
					<th>Product Code</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>Created Date</th>
					<th>Created By</th>
					<th>Action</th>
				  </tr>
				</thead>
			   <c:forEach items="${listDll}" var="product">
			    <tbody>
				  <tr>
				    <td class="counterCell"></td>
				    <td>${product.code}</td>
				    <td>${product.name}</td>
				    <td>${product.description}</td>
				    <td>${product.createdDate}</td>
				    <td>${product.createdBy}</td>
				    <td>
					  <a href="#" class="delete" id="${product.id}" style="color:inherit;"><i class="fas fa-trash"></i></a>
					  <a href="#" class="edit" id="${product.id}" style="color:inherit;"><i class="fas fa-pencil-alt"></i></a>
					  <a href="#" class="view" id="${product.id}" style="color:inherit;"><i class="fas fa-search"></i></a></td>
				  </tr>
			    </tbody>
			   </c:forEach>
		  	</table>
		  </div>					
		</div>					
	  </div>
	
	<!-- /////////////////////////////////// Modal Add \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
	<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Add Product</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div id="add-container">
	        	<div class="row">
		      		<div class="col-sm-4" style="text-align:right;">
		      			<p>*Product Code</p>
		      		</div>
		      		<div class="col-sm-6">
		      			<input type="text" name="code" placeholder="${hasil}" value="${hasil}" class="form-control" id="cde" disabled>
		      		</div>
		      	</div>
		      	
		      	<div class="row">
		      		<div class="col-sm-4" style="text-align:right;">
		      			<p>*Product Name</p>
		      		</div>
		      		<div class="col-sm-6">
		      			<input type="text" name="name" placeholder="Type Product Name" class="form-control" id="nme">
		      		</div>
		      	</div>
		      	
		      	<div class="row">
		      		<div class="col-sm-4" style="text-align:right;">
		      			<p>Description</p>
		      		</div>
		      		<div class="col-sm-6">
		      			<input type="text" name="description" placeholder="Type Description" class="form-control" id="des">
		      		</div>
		      	</div>
		      	
	        </div>
	        
	      </div>
	      	<div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="save">Save</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		    </div>
	    </div>
	  </div>
	</div>
	
	<!--/////////////////////////////// Alert Save \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\-->
	<div class="alert alert-success" aria-hidden="true">
	  <strong>Success!</strong> This alert box could indicate a successful or positive action.
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
	        <button type="button" class="btn btn-warning" id="btn-delete-yes">Yes</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- /////////////////////////////////// Modal Edit \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
	<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Add Product</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div id="add-container">
	        	<input type="hidden" id="id">
	        	<div class="row">
	        		<div class="col-sm-4" style="text-align:right;">
	        			<p>*Product Code</p>
	        		</div>
	        		<div class="col-sm-6">
	        			<input type="text" name="code" placeholder="Auto Generate" class="form-control" id="editcode" disabled>
	        		</div>
	        	</div>
	        	
	        	<div class="row">
	        		<div class="col-sm-4" style="text-align:right;">
	        			<p>*Product Name</p>
	        		</div>
	        		<div class="col-sm-6">
	        			<input type="text" name="name" placeholder="Type Product Name" class="form-control" id="editname">
	        		</div>
	        	</div>
	        	
	        	<div class="row">
	        		<div class="col-sm-4" style="text-align:right;">
	        			<p>Description</p>
	        		</div>
	        		<div class="col-sm-6">
	        			<input type="text" name="description" placeholder="Type Description" class="form-control" id="editdescription">
	        		</div>
	        	</div>
	        </div>
	      </div>
	      	<div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="editsave">Save</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		    </div>
	    </div>
	  </div>
	</div>
	
	<!-- /////////////////////////////////// Modal View \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ -->
	<div class="modal fade" id="modalView" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Add Product</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div id="add-container">
	        	<div class="row">
	        		<div class="col-sm-4" style="text-align:right;">
	        			<p>*Product Code</p>
	        		</div>
	        		<div class="col-sm-6">
	        			<input type="text" name="code" placeholder="Auto Generate" class="form-control" id="viewcode" disabled >
	        		</div>
	        	</div>
	        	<div class="row">
	        		<div class="col-sm-4" style="text-align:right;">
	        			<p>*Product Name</p>
	        		</div>
	        		<div class="col-sm-6">
	        			<input type="text" name="name" placeholder="Type Product Name" class="form-control" id="viewname" disabled>
	        		</div>
	        	</div>
	        	<div class="row">
	        		<div class="col-sm-4" style="text-align:right;">
	        			<p>Description</p>
	        		</div>
	        		<div class="col-sm-6">
	        			<input type="text" name="description" placeholder="Type Description" class="form-control" id="viewdescription" disabled>
	        		</div>
	        	</div>		
	        </div>
	       	
	     </div>
	     	<div class="modal-footer">
		       <button type="button" class="btn btn-warning" id="close" data-dismiss="modal">Close</button>
		 	</div>
	    </div>
	   </div>
	  </div>
	</div>

</body>
</html>