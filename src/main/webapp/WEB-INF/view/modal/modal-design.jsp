<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<%
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	%>
	
<!-- Delete item in Add Design -->
<div class="modal fade bd-example-modal-sm" style="z-index: 9992;" id="modalDeleteItem" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
    <div class="modal-content" style="width: 200px; margin:auto;">
    	<div style="float:right; clear:right;">
    		<button type="button" style="background-color: red;" class="close" data-dismiss="modal" aria-label="Close">
    			<span aria-hidden="true">&times;</span>
    		</button>
		</div>
		<div class="modal-body">
			<p style="text-align: center;">Delete item ?</p>
		</div>
		<div style="margin: auto; padding-bottom: 5px;">
			<button type="button" class="btn btn-sm btn-primary btn-delete-item-agree delete-item-design" >Delete</button>
			<button type="button" class="btn btn-sm btn-warning btn-delete-item-cancel" style="color: #fff;" data-dismiss="modal">Cancel</button>
		</div>
    </div>
  </div>
</div>

<!-- Delete item in Edit Design -->
<div class="modal fade bd-example-modal-sm" style="z-index: 9992;" id="modalDeleteItemEdit" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
    <div class="modal-content" style="width: 200px; margin:auto;">
    	<div style="float:right; clear:right;">
    		<button type="button" style="background-color: red;" class="close" data-dismiss="modal" aria-label="Close">
    			<span aria-hidden="true">&times;</span>
    		</button>
		</div>
		<div class="modal-body">
			<p style="text-align: center;">Delete item ?</p>
		</div>
		<div style="margin: auto; padding-bottom: 5px;">
			<button type="button" class="btn btn-sm btn-primary delete-item-design-edit" >Delete</button>
			<button type="button" class="btn btn-sm btn-warning btn-delete-item-cancel" style="color: #fff;" data-dismiss="modal">Cancel</button>
		</div>
    </div>
  </div>
</div>

<!-- Modal Add -->
<div class="modal fade" id="modalAddRequest">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" >
      <div class="modal-header" style="background-color: #007bff; color:#fff">
        <h5 class="modal-title" id="exampleModalLabel">Add Design Request</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<div id="request" style="height: 200px; font-size: 12px;">
       		<div style="width:25%; float: left; height: auto;">
       			<div style="height:40px;">
       				<div style="float: left; width:50%; text-align: right">
	       				<label>*Transaction Code</label>
	       			</div>
	       			<div style="float: left; width:50%">
	       				<input type="text" class="form-control" style="font-size: 12px;" value="${hasil }" id="transactionCode" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
       			<div style="height:50px;">
	       			<div style="float: left; width:50%; text-align: right">
	       				<label>*Event Code</label>
	       			</div>
	       			<div id="dataEvent" style="float: left; width:50%">
	       				<select class="form-control" style="font-size: 12px;" >
	       					<option disabled selected value="">-Select Event-</option>
	       					<c:forEach items="${listEvent }" var="event">	
	       						<option value="${event.id }">${event.code }</option>
	       					</c:forEach>
	       				</select>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:50%; text-align: right">
	       				<label>*Design Title</label>
	       			</div>
	       			<div style="float: left; width:50%">
	       				<input type="text" class="form-control" style="font-size: 12px;" placeholder="Type Title" id="designTitle">
	       			</div>
	       		</div>
       		</div>
       		<div style="width:25%; float: left; height: auto;">
       			<div style="height:40px;">
       				<div style="float: left; width:50%; text-align: right">
	       				<label>*Request By</label>
	       			</div>
	       			<div style="float: left; width:50%">
	       				<input type="text" class="form-control" style="font-size: 12px;" placeholder="Request By" id="requestBy" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
       			<div style="height:40px;">
	       			<div style="float: left; width:50%; text-align: right">
	       				<label>*Request Date</label>
	       			</div>
	       			<div style="float: left; width:50%">
	       				<input value="<%= format.format(date) %>" style="font-size: 12px;" class="form-control" type="text" id="requestDate" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:50%; text-align: right">
	       				<label>Note</label>
	       			</div>
	       			<div style="float: left; width:50%">
	       				<textarea class="form-control" style="font-size: 12px;" placeholder="Type Note" id="note"></textarea>
	       			</div>
	       		</div>
       		</div>
       	</div>
       	<div style="clear: both;"></div>
       	<div style="float:left; height: 50px;">
       		<button type="button" class="btn btn-sm btn-primary" id="btn-add-item" style="float:left; width:70px;">Add Item</button>
       	</div>
       	<div style="clear: both;"></div>
       	<div style="height: 200px; overflow:auto; font-size: 12px;">
       		<table id="dt-designItem" class="display" style="width:100%;">
				<thead>
					<tr>
						<th>Product</th>
						<th style="width:140px">Product Description</th>
						<th style="width:120px">Title</th>
						<th style="width:120px">Request PIC</th>
						<th>Due Date</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th style="width:120px">Note</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
							
				</tbody>
			</table>
       	</div>
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-sm btn-primary" id="btn-save-design-request" style="width:70px;">Save</button>
    	<button type="button" class="btn btn-sm btn-warning" data-dismiss="modal" style="width:70px; color:#fff;">Cancel</button>
	</div>
  </div>
</div>
</div>

<!-- Modal Edit -->
<div class="modal fade" id="modalEditRequest" style="z-index: 9991;">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" >
      <div class="modal-header" style="background-color: #007bff; color:#fff">
        <h5 class="modal-title" id="exampleModalLabel">Edit Design Request - </h5><h5 class="modal-title" id="design-edit-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<div id="request" style="height: 200px; font-size: 12px;">
       		<div style="width:25%; float: left; height: auto;">
       			<div style="height:40px;">
       				<div style="float: left; width:50%; text-align: right">
	       				<label>*Transaction Code</label>
	       			</div>
	       			<div style="float: left; width:50%">
	       				<input type="hidden" id="idDesignEdit">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-code-edit" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
       			<div style="height:40px;">
	       			<div style="float: left; width:50%; text-align: right">
	       				<label>*Event Code</label>
	       			</div>
	       			<div id="codeEventEdit" style="float: left; width:50%">
	       				<select id="event-code-edit" class="form-control" style="font-size: 12px;">
	       					<c:forEach items="${listEvent }" var="event">	
	       						<option value="${event.id }">${event.code }</option>
	       					</c:forEach>	
	       				</select>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:50%; text-align: right">
	       				<label>*Design Title</label>
	       			</div>
	       			<div style="float: left; width:50%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-title-edit">
	       			</div>
	       		</div>
	       		<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:50%; text-align: right">
	       				<label>Status</label>
	       			</div>
	       			<div style="float: left; width:50%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-status-edit" disabled>
	       			</div>
	       		</div>
       		</div>
       		<div style="width:25%; float: left; height: auto;">
       			<div style="height:40px;">
       				<div style="float: left; width:50%; text-align: right">
	       				<label>*Request By</label>
	       			</div>
	       			<div style="float: left; width:50%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-requestBy-edit" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
       			<div style="height:40px;">
	       			<div style="float: left; width:50%; text-align: right">
	       				<label>*Request Date</label>
	       			</div>
	       			<div style="float: left; width:50%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-requestDate-edit" disabled>
	       				<input value="<%= format.format(date) %>" type="hidden" id="design-updatedDate-edit" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:50%; text-align: right">
	       				<label>Note</label>
	       			</div>
	       			<div style="float: left; width:50%">
	       				<textarea class="form-control" style="font-size: 12px;" id="design-note-edit"></textarea>
	       			</div>
	       		</div>
       		</div>
       	</div>
       	<div style="clear: both;"></div>
       	<div style="float:left; height:50px;">
       		<button type="button" class="btn btn-sm btn-primary" id="btn-add-item-edit" style="float:left; width:70px;">Add Item</button> 
       	</div>
       	<div style="clear: both;"></div>
       	<div style="height: 200px; overflow:auto; font-size: 12px;">
       		<table id="dt-designItemEdit" class="display" style="width:100%;">
				<thead>
					<tr>
						<th>Product</th>
						<th style="width:140px">Product Description</th>
						<th style="width:120px">Title</th>
						<th style="width:120px">Request PIC</th>
						<th>Due Date</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th style="width:120px">Note</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
							
				</tbody>
			</table>
       	</div>
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-sm btn-primary" id="btn-update" style="width:70px;">Update</button>
    	<button type="button" class="btn btn-sm btn-warning" data-dismiss="modal" style="width:70px; color:#fff;">Cancel</button>
	</div>
  </div>
</div>
</div>

<!-- Modal View -->
<div class="modal fade" id="modalViewRequest">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" >
      <div class="modal-header" style="background-color: #007bff; color:#fff">
        	<h5 class="modal-title" id="exampleModalLabel">View Design Request</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<div id="request" style="height: 200px; font-size: 12px;">
       		<div style="width:25%; float: left; height: auto;">
       			<div style="height:40px;">
       				<div style="float: left; width:40%; text-align: right">
	       				<label>*Transaction Code</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-code-view" disabled >
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
       			<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>*Event Code</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="event-code-view" disabled >
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>*Design Title</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-title-view" disabled >
	       			</div>
	       		</div>
	       		<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>Status</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-status-view" disabled>
	       			</div>
	       		</div>
       		</div>
       		<div style="width:25%; float: left; height: auto;">
       			<div style="height:40px;">
       				<div style="float: left; width:40%; text-align: right">
	       				<label>*Request By</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-requestBy-view" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
       			<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>*Request Date</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-requestDate-view" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>Note</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<textarea class="form-control" style="font-size: 12px;" id="design-note-view" disabled></textarea>
	       			</div>
	       		</div>
       		</div>
       	</div>
       	<div style="clear: both;"></div>
       	<div style="height: 200px; overflow:auto; font-size: 12px;">
       		<table id="dt-designItemView" class="display" style="width:100%;">
				<thead>
					<tr>
						<th>Product</th>
						<th style="width:140px">Product Description</th>
						<th style="width:120px">Title</th>
						<th style="width:120px">Request PIC</th>
						<th>Due Date</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th style="width:120px">Note</th>
					</tr>
				</thead>
				<tbody>
										
				</tbody>
			</table>
       	</div>
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-sm btn-warning" data-dismiss="modal" style="width:70px; color:#fff;">Close</button>
	</div>
  </div>
</div>
</div>

<!-- Rejected confirmation -->
<div class="modal fade bd-example-modal-sm" style="z-index: 9992;" id="modalRejected" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
    <div class="modal-content" style="width: 200px; margin:auto;">
    	<div style="float:right; clear:right;">
    		<button type="button" style="background-color: red;" class="close" data-dismiss="modal" aria-label="Close">
    			<span aria-hidden="true">&times;</span>
    		</button>
		</div>
		<div class="modal-body">
			<p style="text-align: center;">Reject Reason</p>
			<textarea placeholder="Input Reject Reason" id="rejectReason"></textarea>
		</div>
		<div style="margin: auto; padding-bottom: 5px;">
			<button type="button" class="btn btn-sm btn-danger" id="btn-rejected-agree">Reject</button>
			<button type="button" class="btn btn-sm btn-warning" id="btn-rejected-cancel" style="color: #fff;" data-dismiss="modal">Cancel</button>
		</div>
    </div>
  </div>
</div>
	
<!-- Modal Approval -->
<div class="modal fade" id="modalApprovalRequest">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" >
      <div class="modal-header" style="background-color: #007bff; color:#fff">
        	<h5 class="modal-title" id="exampleModalLabel">Approval Design Request</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<div id="request" style="height: 200px; font-size: 12px;">
       		<div style="width:25%; float: left; height: auto;">
       			<div style="height:40px;">
       				<div style="float: left; width:40%; text-align: right">
	       				<label>*Transaction Code</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="hidden" id="idDesignApproval">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-code-approval" disabled >
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
       			<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>*Event Code</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="event-code-approval" disabled >
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>*Design Title</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-title-approval" disabled >
	       			</div>
	       		</div>
	       		<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>Status</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-status-approval" disabled>
	       			</div>
	       		</div>
	       		<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>*Assign To</label>
	       			</div>
	       			<div style="float: left; width:60%" id="design-assign-to">
	       				<select class="form-control" style="font-size: 12px;" >
	       					<option disabled selected>-Select Employee-</option>
	       					<c:forEach items="${listEmployee }" var="emp">
	       						<option value="${emp.id }" >${emp.firstName } ${emp.lastName }</option>
	       					</c:forEach>
	       				</select>
	       			</div>
	       		</div>
       		</div>
       		<div style="width:25%; float: left; height: auto;">
       			<div style="height:40px;">
       				<div style="float: left; width:40%; text-align: right">
	       				<label>*Request By</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-requestBy-approval" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
       			<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>*Request Date</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-requestDate-approval" disabled>
	       				<input value="<%= format.format(date) %>" type="hidden" id="design-approvedDate-edit" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>Note</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<textarea class="form-control" style="font-size: 12px;" id="design-note-approval" disabled></textarea>
	       			</div>
	       		</div>
       		</div>
       	</div>
       	<div style="clear: both;"></div>
       	<div style="height: 200px; overflow:auto; font-size: 12px;">
       		<table id="dt-designItemApproval" class="display" style="width:100%;">
				<thead>
					<tr>
						<th>Product</th>
						<th style="width:140px">Product Description</th>
						<th style="width:120px">Title</th>
						<th style="width:120px">Request PIC</th>
						<th>Due Date</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th style="width:120px">Note</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
       	</div>
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-sm btn-primary" id="btn-approved" style="width:80px; color:#fff;">Approved</button>
    	<button type="button" class="btn btn-sm btn-danger" id="btn-rejected" style="width:80px; color:#fff;">Rejected</button>
    	<button type="button" class="btn btn-sm btn-warning" data-dismiss="modal" style="width:70px; color:#fff;">Cancel</button>
	</div>
  </div>
</div>
</div>

<!-- Modal Close Request -->
<div class="modal fade" id="modalCloseRequest">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" >
      <div class="modal-header" style="background-color: #007bff; color:#fff">
        	<h5 class="modal-title" id="exampleModalLabel">Close Design Request</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<div id="request" style="height: 200px; font-size: 12px;">
       		<div style="width:25%; float: left; height: auto;">
       			<div style="height:40px;">
       				<div style="float: left; width:40%; text-align: right">
	       				<label>*Transaction Code</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="hidden" id="idDesignClose">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-code-close" disabled >
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
       			<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>*Event Code</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="event-code-close" disabled >
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>*Design Title</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-title-close" disabled >
	       			</div>
	       		</div>
	       		<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>Status</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-status-close" disabled>
	       			</div>
	       		</div>
	       		<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>*Assign To</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-assignTo-close" disabled>
	       			</div>
	       		</div>
       		</div>
       		<div style="width:25%; float: left; height: auto;">
       			<div style="height:40px;">
       				<div style="float: left; width:40%; text-align: right">
	       				<label>*Request By</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-requestBy-close" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
       			<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>*Request Date</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<input type="text" class="form-control" style="font-size: 12px;" id="design-requestDate-close" disabled>
	       				<input value="<%= format.format(date) %>" type="hidden" id="design-closedDate-edit" disabled>
	       			</div>
       			</div>
       			<div style="clear: both;"></div>
	       		<div style="height:40px;">
	       			<div style="float: left; width:40%; text-align: right">
	       				<label>Note</label>
	       			</div>
	       			<div style="float: left; width:60%">
	       				<textarea class="form-control" style="font-size: 12px;" id="design-note-close" disabled></textarea>
	       			</div>
	       		</div>
       		</div>
       	</div>
       	<div style="clear: both;"></div>
       	<div style="height: 200px; overflow:auto; font-size: 12px;">
       		<table id="dt-designItemClose" class="display" style="width:100%;">
				<thead>
					<tr>
						<th>Product</th>
						<th style="width:140px">Product Description</th>
						<th style="width:120px">Title</th>
						<th style="width:120px">Request PIC</th>
						<th>Due Date</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th style="width:120px">Note</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
       	</div>
    </div>
    <div class="modal-footer">
    	<button type="button" class="btn btn-sm btn-primary" id="btn-close-request" style="width:110px; color:#fff;">Close Request</button>
    	<button type="button" class="btn btn-sm btn-warning" data-dismiss="modal" style="width:70px; color:#fff;">Cancel</button>
	</div>
  </div>
</div>
</div>
</body>
</html>





