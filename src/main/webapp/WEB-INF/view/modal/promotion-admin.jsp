<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!----------------------------------------------------------------------------------------------------------------------------------------------->
		<!----------------------------------------------------- Modal From Design ADMIN-------------------------------------------------------------->
		<!------------------------------------------------------------------------------------------------------------------------------------------->


		<!------------------------------------------------------- Modal Add/Insert/Save ----------------------------------------------------------------->
		
	<div class="modal fade" id="modalFromDesignAdmin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px; ">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Approval</span> Marketing Promotion</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
				<div class="modal-body" style = "height-modal-add" style="height:750px;">
					
				<!-- Marketing Header Promotion -->
					
						<span style="color:green;"><h6>Marketing Header Promotion</h6></span>
					<div>
						<div class = "float-left" style="width:30%;">
						  <div>
						  	<span class = "float-left " style="width:35%; text-align:right;">* Transaction Code :</span>
						    <div>
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeAdmin" disabled>
							    <input type="hidden" id="idEditAdmin" >
							    <input type="hidden" id="flagDesignEditAdmin" >
						    </div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   	<input class = "float-left form-control eventSelectSave" style="width:65%;" type = "text" id="eventSelectAdmin" disabled>
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header : </span>
						    <input class = "float-left form-control " style="width:65%; " type="text" id="titleHeaderAdmin" placeholder="Type Title">
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByAdmin" disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateAdmin" value = "${tanggal}" placeholder = "${tanggal}" disabled>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;"> Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control" type="text" id="noteTitleHeaderAdmin" style="width:247px;" placeholder="Type Note"></textarea>
							    </div>
							  </div>
						  </div>
						  
						  <div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">Status : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="statusByAdmin" disabled>
							    </div>
							    
							  </div>
						  </div>
						  
						<div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;"> * Assign To : </span>
							    <div class = "float-left" style="width:65%;">
							    	<select class="form-control">
							    			<option><i>- Select Employee -</i></option>
							    			
							    	<c:forEach items="${listEmployee }" var = "employee">
							    		<option value = "${employee.id }"> ${employee.firstName } ${employee.lastName }</option>
							    	</c:forEach>
								    </select>
							    </div>
							    
							  </div>
						  </div>
						
						  
						  <div style="clear:both;"></div>
						  
						   
					</div>	
					
					<hr/>
					
					<!-- Design header information -->
					<div class = "designHeader">
					
					<span style="color:green;"><h6>Design Header Promotion</h6></span>
					<div>
						<div class="float-left" style="width:30%;">
						
						  <div class="form-group" >
						    <span class="float-left" style="width:35%; text-align:right;">* Design Code :</span>
						    <div class="float-left" style="width:65%;">
						    <input class="form-control " type="text" id="designCodeAdmin" disabled>
						    </div>
						  </div>
					
						<div class="form-group">
						    <span class="float-left" style="width:35%; text-align:right;">* Title Header :</span>
						    <div class="float-left"  style="width:65%;">
						    <input class="form-control" type = "text" id="titleHeaderDesignAdmin" disabled>
						    </div>
						    
						  </div>
						  
						   <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request By : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestByDesignAdmin" disabled>
						   </div>
						  </div>
						  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request Date : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestDateDesignAdmin" disabled>
						   </div>
						  </div>
						  
						</div>
						
						 <div class="float-left" style="width:30%;">
							  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;"> Note : </span>
						   <div class="float-left" style="width:65%;">
						   <textarea class="form-control" type="text" id="noteDesignHeaderAdmin" style="width:247px;" disabled value=""></textarea>
						   </div>
						  </div> 
						
						<div style="clear:both;"></div>  
						 </div>
						<div style="clear:both;"></div>   
					</div>	
					
					<hr/>
					</div>
						  
					
						  
					<!-- Design Item information -->
					
					<div class="designHeader">
					
					<span style="color:green;"><h6>Design Item Promotion</h6></span>
					<div>
						<table class = "display" style="width:100%; border:none;" id="listDesignItemAdmin">
							<thead>
								<tr>
									<th>Product Name</th>
									<th>Product Description</th>
									<th>Title</th>
									<th style="width:5%;">Qty</th>
									<th style="width:150px;">Todo</th>
									<th>Due Date</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th style="width:150px;">Note</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
												
							</tbody>
						</table>
					</div>
					<hr/>
					</div>
					
					
					
					<!-- Upload File -->
					<span style="color:green;"><h6>Upload File</h6></span>
					<div>
					<div>
						<button class = "btn btn-primary addItem">Add Item</button>
					</div>
						<table class="display" style="width:100%; border:none;" id="tabelItemAdmin">
							<thead>
								<tr>
									<th style="padding-left:110px; width:252px;">Filename</th>
									<th style="width:63px;">Qty</th>
									<th style="width:150px;">Todo</th>
									<th>Due Date</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th style="width:150px;">Note</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>
					
					
		        </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="approvedDesign">Approved</button>
		        <button type="button" class="btn btn-danger" id="rejectedDesign">Rejected</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		      </div>
 
		    </div>
		  </div>
		</div> 
		
		
		
		<!--------------------------------------------------------------- Modal VIEW  ------------------------------------------------------------------------->
	
	<div class="modal fade" id="modalFromDesignAdminView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px; ">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Approval</span> Marketing Promotion</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
				<div class="modal-body" style = "height-modal-add" style="height:750px;">
					
				<!-- Marketing Header Promotion -->
					
						<span style="color:green;"><h6>Marketing Header Promotion</h6></span>
					<div>
						<div class = "float-left" style="width:30%;">
						  <div>
						  	<span class = "float-left " style="width:35%; text-align:right;">* Transaction Code :</span>
						    <div>
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeAdminView" disabled>
							    <input type="hidden" id="idEditAdminView" >
							    <input type="hidden" id="flagDesignEditAdminView" >
						    </div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   	<input class = "float-left form-control" style="width:65%;" type = "text" id="eventSelectAdminView" disabled>
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header : </span>
						    <input class = "float-left form-control " style="width:65%; " type="text" id="titleHeaderAdminView" disabled>
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByAdminView" disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateAdminView" disabled>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;"> Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control" type="text" id="noteTitleHeaderAdminView" style="width:247px;" disabled></textarea>
							    </div>
							  </div>
						  </div>
						  
						  <div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">Status : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="statusByAdminView" disabled>
							    </div>
							    
							  </div>
						  </div>
						  
						<div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;"> * Assign To : </span>
							    <div class = "float-left" style="width:65%;">
							       	<input class="form-control" type="text" id="AssignToAdmin" disabled>
							    </div>
							    
							  </div>
						  </div>
						
						  
						  <div style="clear:both;"></div>
						  
						   
					</div>	
					
					<hr/>
					
					<!-- Design header information VIEW -->
					<div class = "designHeader">
					
					<span style="color:green;"><h6>Design Header Promotion</h6></span>
					<div>
						<div class="float-left" style="width:30%;">
						
						  <div class="form-group" >
						    <span class="float-left" style="width:35%; text-align:right;">* Design Code :</span>
						    <div class="float-left" style="width:65%;">
						    <input class="form-control " type="text" id="designCodeAdminView" disabled>
						    </div>
						  </div>
					
						<div class="form-group">
						    <span class="float-left" style="width:35%; text-align:right;">* Title Header :</span>
						    <div class="float-left"  style="width:65%;">
						    <input class="form-control" type = "text" id="titleHeaderDesignAdminView" disabled>
						    </div>
						    
						  </div>
						  
						   <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request By : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestByDesignAdminView" disabled>
						   </div>
						  </div>
						  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request Date : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestDateDesignAdminView" disabled>
						   </div>
						  </div>
						  
						</div>
						
						 <div class="float-left" style="width:30%;">
							  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;"> Note : </span>
						   <div class="float-left" style="width:65%;">
						   <textarea class="form-control" type="text" id="noteDesignHeaderAdminView" style="width:247px;" disabled></textarea>
						   </div>
						  </div> 
						
						<div style="clear:both;"></div>  
						 </div>
						<div style="clear:both;"></div>   
					</div>	
					
					<hr/>
					</div>
						  
					
						  
					<!-- Design Item information VIEW-->
					
					<div class="designHeader">
					
					<span style="color:green;"><h6>Design Item Promotion</h6></span>
					<div>
						<table class = "display" style="width:100%; border:none;" id="listDesignItemAdminView">
							<thead>
								<tr>
									<th>Product Name</th>
									<th>Product Description</th>
									<th>Title</th>
									<th style="width:5%;">Qty</th>
									<th style="width:150px;">Todo</th>
									<th>Due Date</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th style="width:150px;">Note</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
												
							</tbody>
						</table>
					</div>
					<hr/>
					</div>
					
					
					
					<!-- Upload File VIEW-->
					<span style="color:green;"><h6>Upload File</h6></span>
					<div>
					<div>
						<button class = "btn btn-primary addItem">Add Item</button>
					</div>
						<table class="display" style="width:100%; border:none;" id="tabelItemAdminView">
							<thead>
								<tr>
									<th style="padding-left:110px; width:252px;">Filename</th>
									<th style="width:63px;">Qty</th>
									<th style="width:150px;">Todo</th>
									<th>Due Date</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th style="width:150px;">Note</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>
					
					
		        </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		      </div>
 
		    </div>
		  </div>
		</div> 
		
		<!--------------------------------------------------------------------------------------------------------------------------------------------------->
		<!--------------------------------------------------------- Modal NOT From Design ------------------------------------------------------------------->
		<!--------------------------------------------------------------------------------------------------------------------------------------------------->
		

		<!----------------------------------------------------------- Modal Add/Insert/Save ----------------------------------------------------------------->

	<div class="modal fade" id="modalNotFromDesignAdmin" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px;">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Approval</span> Marketing Promotion</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
				<div class="modal-body" style = "height-modal-add" style="height:750px;">
					
				<!-- Marketing Header Promotion -->
					
						<span style="color:green;"><h6>Marketing Header Promotion</h6></span>
					<div>
						<div class = "float-left" style="width:30%;">
						  <div>
						  	<span class = "float-left" style="width:35%; text-align:right;">* Transaction Code : </span>
						    <div>
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeAdminNot" disabled>
								<input type="hidden" id="idEditNotAdmin" >
							    <input type="hidden" id="flagDesignEditNotAdmin" >						
							</div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   <input class = "float-left form-control" style="width:65%; " type = "text" id="eventSelectAdminNot" disabled >
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header :</span>
						    <input class = "float-left form-control " style="width:65%;" type="text" id="titleHeaderAdminNot" placeholder="Type Title">
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By :</span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByAdminNot" disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateAdminNot" value = "${tanggal}" placeholder = "${tanggal}" disabled/>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;"> Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control"  type="text" id="noteTitleHeaderAdminNot" style="width:247px;" placeholder = "Type Note"></textarea>
							    </div>
							  </div>
						  </div>
						  
						    <div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">Status : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="statusByNotAdmin" disabled>
							    </div>
							    
							  </div>
						  </div>
						  
						<div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;"> * Assign To : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="AssignToNotAdmin">
							    </div>
							    
							  </div>
						  </div>
						
						  
						  <div style="clear:both;"></div>
						  
						   
					</div>	
					
					<hr/>
					
					<!-- Upload File -->
					<span style="color:green;"><h6>Upload File</h6></span>
					<div class = 'modalUploadFileNot'>
					<div>
						<button class = "btn btn-primary addItem"><strong>Add Item</strong></button>
					</div>
						<table class="display" style="width:100%; border:none;" id="tabelItemNotAdmin">
							<thead>
								<tr>
									<th style="padding-left:110px; width:252px;">Filename</th>
									<th style="width:63px;">Qty</th>
									<th style="width:150px;">Todo</th>
									<th>Due Date</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th style="width:150px;">Note</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>
					
					
		        </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" id="approvedAdminNotDesign">Approved</button>
		        <button type="button" class="btn btn-danger" id="rejectedAdminNotDesign">Rejected</button>
		         <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		      </div>
 
		    </div>
		  </div>
		</div> 



	<!-------------------------------------------------------------------------- Modal View ------------------------------------------------------------------->

	<div class="modal fade" id="modalNotFromDesignAdminVIEW" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px;">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Approval</span> Marketing Promotion</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
				<div class="modal-body" style = "height-modal-add" style="height:750px;">
					
				<!-- Marketing Header Promotion -->
					
						<span style="color:green;"><h6>Marketing Header Promotion</h6></span>
					<div>
						<div class = "float-left" style="width:30%;">
						  <div>
						  	<span class = "float-left" style="width:35%; text-align:right;">* Transaction Code : </span>
						    <div>
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeNotAdminView" disabled>
								<input type="hidden" id="idEditNotAdminView">
							    <input type="hidden" id="flagDesignEditNotAdminView" >						
							</div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   <input class = "float-left form-control" style="width:65%; " type = "text" id="eventSelectAdminNotView" disabled >
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header :</span>
						    <input class = "float-left form-control " style="width:65%;" type="text" id="titleHeaderAdminNotView" placeholder="Type Title">
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By :</span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByAdminNotView"  disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateAdminNotView" disabled/>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;">* Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control"  type="text" id="noteTitleHeaderAdminNotView" style="width:247px;" placeholder = "Type Note"></textarea>
							    </div>
							  </div>
						  </div>
						  
						      <div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">Status : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="statusByNotAdminView" disabled>
							    </div>
							    
							  </div>
						  </div>
						  
						<div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;"> * Assign To : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="AssignToNotAdminView" disabled>
							    </div>
							    
							  </div>
						  </div>
						
						  
						  <div style="clear:both;"></div>
						  
						   
					</div>	
					
					<hr/>
					
					<!-- Upload File -->
					<span style="color:green;"><h6>Upload File</h6></span>
					<div class = 'modalUploadFileNot'>
					<div>
						<button class = "btn btn-primary addItem"><strong>Add Item</strong></button>
					</div>
						<table class="display" style="width:100%; border:none;" id="tabelItemNotAdminView">
							<thead>
								<tr>
									<th style="padding-left:110px; width:252px;">Filename</th>
									<th style="width:63px;">Qty</th>
									<th style="width:150px;">Todo</th>
									<th>Due Date</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th style="width:150px;">Note</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>
					
					
		        </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		      </div>
 
		    </div>
		  </div>
		</div> 


		<!-- Modal Rejected From Design-->
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
					<textarea placeholder="Input Reject Reason" id="rejectReasonAdminPromo"></textarea>
				</div>
				<div style="margin: auto; padding-bottom: 5px;">
					<button type="submit" class="btn btn-sm btn-danger" id="rejectPromotAdmin">Reject</button>
					<button type="submit" class="btn btn-sm btn-warning" id="btn-rejected-cancel" style="color: #fff;" data-dismiss="modal">Cancel</button>
				</div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal Rejected NOT From Design-->
		<div class="modal fade bd-example-modal-sm" style="z-index: 9992;" id="modalRejectedNotDesign" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-dialog modal-sm" role="document">
		    <div class="modal-content" style="width: 200px; margin:auto;">
		    	<div style="float:right; clear:right;">
		    		<button type="button" style="background-color: red;" class="close" data-dismiss="modal" aria-label="Close">
		    			<span aria-hidden="true">&times;</span>
		    		</button>
				</div>
				<div class="modal-body">
					<p style="text-align: center;">Reject Reason</p>
					<textarea placeholder="Input Reject Reason" id="rejectReasonAdminPromoNotDesign"></textarea>
				</div>
				<div style="margin: auto; padding-bottom: 5px;">
					<button type="submit" class="btn btn-sm btn-danger" id="rejectPromotAdminNotDesign">Reject</button>
					<button type="submit" class="btn btn-sm btn-warning" id="btn-rejected-cancel" style="color: #fff;" data-dismiss="modal">Cancel</button>
				</div>
		    </div>
		  </div>
		</div>
</body>
</html>