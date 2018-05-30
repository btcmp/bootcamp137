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
		<!--------------------------------------------------------- Modal From Design EDIT -------------------------------------------------------------->
		<!----------------------------------------------------------------------------------------------------------------------------------------------->


		<!------------------------------------------------------------ Modal Update --------------------------------------------------------------------->
		
	<div class="modal fade" id="modalFromDesignUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px; ">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Edit</span> Marketing Promotion</h5>
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
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeUpdate" disabled>
							    <input type="hidden" id="idEdit" >
							    <input type="hidden" id="flagDesignEdit" >
						    </div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   	<input class = "float-left form-control eventSelectSave" style="width:65%;" type = "text" id="eventSelectUpdate" disabled>
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header : </span>
						    <input class = "float-left form-control " style="width:65%; " type="text" id="titleHeaderUpdate" placeholder="Type Title">
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByUpdate" value = "Noe"disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateUpdate" disabled>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;"> Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control" type="text" id="noteTitleHeaderUpdate" style="width:247px;" placeholder="Type Note"></textarea>
							    </div>
							  </div>
						  </div>
						  
						  <div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">Status : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="statusByUpdate" disabled>
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
						    <input class="form-control " type="text" id="designCodeUpdate" disabled>
						    </div>
						  </div>
					
						<div class="form-group">
						    <span class="float-left" style="width:35%; text-align:right;">* Title Header :</span>
						    <div class="float-left"  style="width:65%;">
						    <input class="form-control" type = "text" id="titleHeaderDesignUpdate" disabled>
						    </div>
						    
						  </div>
						  
						   <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request By : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestByDesignUpdate" disabled>
						   </div>
						  </div>
						  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request Date : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestDateDesignUpdate" disabled>
						   </div>
						  </div>
						  
						</div>
						
						 <div class="float-left" style="width:30%;">
							  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;"> Note : </span>
						   <div class="float-left" style="width:65%;">
						   <textarea class="form-control" type="text" id="noteDesignHeaderUpdate" style="width:247px;" disabled value=""></textarea>
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
						<table class = "display" style="width:100%; border:none;" id="listDesignItemUpdate">
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
						<table class="display" style="width:100%; border:none;" id="tabelItemUpdate">
							<thead>
								<tr>
									<th style="padding-left:110px; width:252px;">Filename</th>
									<th style="width:63;">Qty</th>
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
		        <button type="button" class="btn btn-primary" id="updateDesign">Update</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		      </div>
 
		    </div>
		  </div>
		</div> 
		
		
		<!--------------------------------------------------------------------------------------------------------------------------------------------------->
		<!--------------------------------------------------------- Modal NOT From Design ------------------------------------------------------------------->
		<!--------------------------------------------------------------------------------------------------------------------------------------------------->
		

		<!----------------------------------------------------------- Modal Edit ---------------------------------------------------------------------------->

	<div class="modal fade" id="modalNotFromDesignUpdate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px;">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Edit</span> Marketing Promotion</h5>
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
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeNotUpdate" disabled>
								<input type="hidden" id="idEditNot" >
							    <input type="hidden" id="flagDesignEditNot" >
							
							</div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   <input class = "float-left form-control" style="width:65%; " type = "text" id="eventSelectUpdateNot" disabled >
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header :</span>
						    <input class = "float-left form-control " style="width:65%;" type="text" id="titleHeaderNotUpdate" placeholder="Type Title">
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By :</span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByNotUpdate" disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateNotUpdate" disabled/>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;">* Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control"  type="text" id="noteTitleHeaderNotUpdate" style="width:247px;" placeholder = "Type Note"></textarea>
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
						<table class="display" style="width:100%; border:none;" id="tabelItemNotUpdate">
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
		        <button type="button" class="btn btn-primary" id='updateNotDesign'>Update</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		      </div>
 
		    </div>
		  </div>
		</div> 
</body>
</html>