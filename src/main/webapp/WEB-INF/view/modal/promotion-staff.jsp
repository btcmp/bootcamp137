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
		<!----------------------------------------------------- Modal From Design Staff-------------------------------------------------------------->
		<!------------------------------------------------------------------------------------------------------------------------------------------->


		<!------------------------------------------------------- Modal Add/Insert/Save ----------------------------------------------------------------->
		
	<div class="modal fade" id="modalFromDesignStaff" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px; ">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Close</span> Marketing Promotion</h5>
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
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeStaff" disabled>
							    <input type="hidden" id="idEditStaff" >
							    <input type="hidden" id="flagDesignEditStaff" >
						    </div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   	<input class = "float-left form-control eventSelectSave" style="width:65%;" type = "text" id="eventSelectStaff" disabled>
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header : </span>
						    <input class = "float-left form-control " style="width:65%; " type="text" id="titleHeaderStaff" placeholder="Type Title" disabled>
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByStaff" disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateStaff" value = "${tanggal}" placeholder = "${tanggal}" disabled>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;"> Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control" type="text" id="noteTitleHeaderStaff" style="width:247px;" placeholder="Type Note" disabled></textarea>
							    </div>
							  </div>
						  </div>
						  
						  <div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">Status : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="statusByStaff" disabled>
							    </div>
							    
							  </div>
						  </div>
						  
						<div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;"> * Assign To : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="AssignToStaff" disabled>
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
						    <input class="form-control " type="text" id="designCodeStaff" disabled>
						    </div>
						  </div>
					
						<div class="form-group">
						    <span class="float-left" style="width:35%; text-align:right;">* Title Header :</span>
						    <div class="float-left"  style="width:65%;">
						    <input class="form-control" type = "text" id="titleHeaderDesignStaff" disabled>
						    </div>
						    
						  </div>
						  
						   <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request By : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestByDesignStaff" disabled>
						   </div>
						  </div>
						  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request Date : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestDateDesignStaff" disabled>
						   </div>
						  </div>
						  
						</div>
						
						 <div class="float-left" style="width:30%;">
							  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;"> Note : </span>
						   <div class="float-left" style="width:65%;">
						   <textarea class="form-control" type="text" id="noteDesignHeaderStaff" style="width:247px;" disabled ></textarea>
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
						<table class = "display" style="width:100%; border:none;" id="listDesignItemStaff">
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
						<table class="display" style="width:100%; border:none;" id="tabelItemStaff">
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
		        <button type="button" class="btn btn-primary" id="closeRequestStaff">Close Request</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		      </div>
 
		    </div>
		  </div>
		</div> 
		
		
		
		<!--------------------------------------------------------------- Modal VIEW  ------------------------------------------------------------------------->
	
	<div class="modal fade" id="modalFromDesignStaffView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px; ">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Close</span> Marketing Promotion</h5>
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
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeStaffView" disabled>
							    <input type="hidden" id="idEditStaffView" >
							    <input type="hidden" id="flagDesignEditStaffView" >
						    </div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   	<input class = "float-left form-control" style="width:65%;" type = "text" id="eventSelectStaffView" disabled>
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header : </span>
						    <input class = "float-left form-control " style="width:65%; " type="text" id="titleHeaderStaffView" disabled>
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByStaffView" disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateStaffView" disabled>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;"> Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control" type="text" id="noteTitleHeaderStaffView" style="width:247px;" disabled></textarea>
							    </div>
							  </div>
						  </div>
						  
						  <div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">Status : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="statusByStaffView" disabled>
							    </div>
							    
							  </div>
						  </div>
						  
						<div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;"> * Assign To : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="AssignToStaff" disabled>
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
						    <input class="form-control " type="text" id="designCodeStaffView" disabled>
						    </div>
						  </div>
					
						<div class="form-group">
						    <span class="float-left" style="width:35%; text-align:right;">* Title Header :</span>
						    <div class="float-left"  style="width:65%;">
						    <input class="form-control" type = "text" id="titleHeaderDesignStaffView" disabled>
						    </div>
						    
						  </div>
						  
						   <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request By : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestByDesignStaffView" disabled>
						   </div>
						  </div>
						  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request Date : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestDateDesignStaffView" disabled>
						   </div>
						  </div>
						  
						</div>
						
						 <div class="float-left" style="width:30%;">
							  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;"> Note : </span>
						   <div class="float-left" style="width:65%;">
						   <textarea class="form-control" type="text" id="noteDesignHeaderStaffView" style="width:247px;" disabled></textarea>
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
						<table class = "display" style="width:100%; border:none;" id="listDesignItemStaffView">
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
						<table class="display" style="width:100%; border:none;" id="tabelItemStaffView">
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

	<div class="modal fade" id="modalNotFromDesignStaff" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px;">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Close</span> Marketing Promotion</h5>
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
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeStaffNot"  disabled>
								<input type="hidden" id="idEditNotStaff" >
							    <input type="hidden" id="flagDesignEditNotStaff" >						
							</div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   <input class = "float-left form-control" style="width:65%; " type = "text" id="eventSelectStaffNot" disabled >
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header :</span>
						    <input class = "float-left form-control " style="width:65%;" type="text" id="titleHeaderStaffNot" placeholder="Type Title">
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By :</span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByStaffNot" disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateStaffNot" value = "${tanggal}" placeholder = "${tanggal}" disabled/>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;"> Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control"  type="text" id="noteTitleHeaderStaffNot" style="width:247px;" placeholder = "Type Note"></textarea>
							    </div>
							  </div>
						  </div>
						  
						    <div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">Status : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="statusByNotStaff" disabled>
							    </div>
							    
							  </div>
						  </div>
						  
						<div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;"> * Assign To : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="AssignToNotStaff" disabled>
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
						<table class="display" style="width:100%; border:none;" id="tabelItemNotStaff">
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
		        <button type="button" class="btn btn-primary" id="closeRequestStaffNotDesign">Close Request</button>
		         <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		      </div>
 
		    </div>
		  </div>
		</div> 



	<!-------------------------------------------------------------------------- Modal View ------------------------------------------------------------------->

	<div class="modal fade" id="modalNotFromDesignStaffVIEW" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px;">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Close</span> Marketing Promotion</h5>
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
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeNotStaffView" disabled>
								<input type="hidden" id="idEditNotStaffView">
							    <input type="hidden" id="flagDesignEditNotStaffView" >						
							</div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   <input class = "float-left form-control" style="width:65%; " type = "text" id="eventSelectStaffNotView" disabled >
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header :</span>
						    <input class = "float-left form-control " style="width:65%;" type="text" id="titleHeaderStaffNotView" placeholder="Type Title" disabled>
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By :</span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByStaffNotView"  disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateStaffNotView" disabled/>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;">* Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control"  type="text" id="noteTitleHeaderStaffNotView" style="width:247px;" placeholder = "Type Note" disabled></textarea>
							    </div>
							  </div>
						  </div>
						  
						      <div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">Status : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="statusByNotStaffView" disabled>
							    </div>
							    
							  </div>
						  </div>
						  
						<div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;"> * Assign To : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="AssignToNotStaffView" disabled>
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
						<table class="display" style="width:100%; border:none;" id="tabelItemNotStaffView">
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
</body>
</html>