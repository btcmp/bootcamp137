<%@page import="com.newminiproject.model.User"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.newminiproject.service.UserService"%>
<%@page import="com.newminiproject.dao.UserDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Requester-Save</title>
</head>
<body>


		<!----------------------------------------------------------------------------------------------------------------------------------------------->
		<!--------------------------------------------------------- Modal From Design ------------------------------------------------------------------->
		<!----------------------------------------------------------------------------------------------------------------------------------------------->


		<!------------------------------------------------------- Modal Add/Insert/Save ----------------------------------------------------------------->
		
	<div class="modal fade" id="modalFromDesign" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px; ">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Add</span> Marketing Promotion</h5>
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
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeSave"  value = "${hasil}" placeholder="${hasil}" disabled>
							    <input type="hidden" id="idEdit" >
						    </div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   	<input class = "float-left form-control eventSelectSave" style="width:65%;" type = "text" id="eventSelectSave" disabled>
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header : </span>
						    <input class = "float-left form-control " style="width:65%; " type="text" id="titleHeaderSave" placeholder="Type Title">
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By : </span>
							    <div class = "float-left" style="width:65%;">
							    <input class="form-control" type="text" id="requestBySave" disabled>
								<input hidden id="idRequestBy">
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateSave" value = "${tanggal}" placeholder = "${tanggal}" disabled>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;"> Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control" type="text" id="noteTitleHeader" style="width:247px;" placeholder="Type Note"></textarea>
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
						    <input class="form-control " type="text" id="designCodeSave" disabled>
						    </div>
						  </div>
					
						<div class="form-group">
						    <span class="float-left" style="width:35%; text-align:right;">* Title Header :</span>
						    <div class="float-left"  style="width:65%;">
						    <input class="form-control" type = "text" id="titleHeaderDesignSave" disabled>
						    </div>
						    
						  </div>
						  
						   <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request By : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestByDesignSave" disabled>
						   </div>
						  </div>
						  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request Date : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestDateDesignSave" disabled>
						   </div>
						  </div>
						  
						</div>
						
						 <div class="float-left" style="width:30%;">
							  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;"> Note : </span>
						   <div class="float-left" style="width:65%;">
						   <textarea class="form-control" type="text" id="noteDesignHeaderSave" style="width:247px;" disabled value=""></textarea>
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
						<table class = "display" style="width:100%; border:none;" id="listDesignItemSave">
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
						<table class="display" style="width:100%; border:none;" id="tabelItem">
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
		        <button type="button" class="btn btn-primary" id="saveDesign">Save</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		      </div>
 
		    </div>
		  </div>
		</div> 
		
		
		
		<!--------------------------------------------------------------- Modal VIEW  ------------------------------------------------------------------------->
	
	<div class="modal fade" id="modalFromDesignView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px; ">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">View</span> Marketing Promotion</h5>
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
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeSaveView" disabled>
							    <input type="hidden" id="idEdit" >
						    </div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   	<input class = "float-left form-control" style="width:65%;" type = "text" id="eventSelectSaveView" disabled>
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header : </span>
						    <input class = "float-left form-control " style="width:65%; " type="text" id="titleHeaderSaveView" disabled>
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestBySaveView" value = "Noe"disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateSaveView" disabled>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;"> Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control" type="text" id="noteTitleHeaderView" style="width:247px;" disabled></textarea>
							    </div>
							  </div>
						  </div>
						  
						  <div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">Status : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="statusBySaveView" disabled>
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
						    <input class="form-control " type="text" id="designCodeSaveView" disabled>
						    </div>
						  </div>
					
						<div class="form-group">
						    <span class="float-left" style="width:35%; text-align:right;">* Title Header :</span>
						    <div class="float-left"  style="width:65%;">
						    <input class="form-control" type = "text" id="titleHeaderDesignSaveView" disabled>
						    </div>
						    
						  </div>
						  
						   <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request By : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestByDesignSaveView" disabled>
						   </div>
						  </div>
						  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;">* Request Date : </span>
						   <div class="float-left" style="width:65%;">
						   <input class="form-control" type="text" id="requestDateDesignSaveView" disabled>
						   </div>
						  </div>
						  
						</div>
						
						 <div class="float-left" style="width:30%;">
							  
						  <div class="form-group">
						   <span class="float-left" style="width:35%; text-align:right;"> Note : </span>
						   <div class="float-left" style="width:65%;">
						   <textarea class="form-control" type="text" id="noteDesignHeaderSaveView" style="width:247px;" disabled></textarea>
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
						<table class = "display" style="width:100%; border:none;" id="listDesignItemSaveView">
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
						<table class="display" style="width:100%; border:none;" id="tabelItemView">
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

	<div class="modal fade" id="modalNotFromDesign" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px;">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">Add</span> Marketing Promotion</h5>
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
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeNot"  value = "${hasil }" placeholder="${hasil}" disabled>
							</div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   <input class = "float-left form-control" style="width:65%; " type = "text" id="eventSelectSaveNot" disabled >
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header :</span>
						    <input class = "float-left form-control " style="width:65%;" type="text" id="titleHeaderNot" placeholder="Type Title">
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By :</span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByNot" disabled>
							    	<input hidden id="idRequestByNot">
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control date-picker" type = "text" id="requestDateNot" value = "${tanggal}" placeholder = "${tanggal}" disabled/>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;"> Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control"  type="text" id="noteTitleHeaderNot" style="width:247px;" placeholder = "Type Note"></textarea>
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
						<table class="display" style="width:100%; border:none;" id="tabelItemNot">
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
		        <button type="button" class="btn btn-primary" id='saveNotDesign'>Save</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
		      </div>
 
		    </div>
		  </div>
		</div> 



	<!-------------------------------------------------------------------------- Modal View ------------------------------------------------------------------->

	<div class="modal fade" id="modalNotFromDesignVIEW" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-size:13px;">
		  <div class="modal-dialog modal-lg" style = "max-width:1300px;"role="document" >
		    <div class="modal-content">
		      <div class="modal-header btn-primary">
		        <h5 class="modal-title" id="exampleModalLabel"><span id="editJudul">View</span> Marketing Promotion</h5>
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
							    <input class = "form-control float-left" style="width:65%;" type="text" id="transCodeNotView" disabled>
							    <input type="hidden" id="idEdit" >
						    </div>
						    
						  </div>
						  <div style="clear:both;"></div>
						  
						  <div>
						   <span class = "float-left" style="width:35%; text-align:right;">* Event Code  : </span>
						   <input class = "float-left form-control" style="width:65%; " type = "text" id="eventSelectSaveNotView" disabled >
						  </div>
						  <div style="clear:both;"></div>
						  
						  
						   <div id="designAddDiv" >
						    <span class = "float-left" style="width:35%; text-align:right;" >* Title Header :</span>
						    <input class = "float-left form-control " style="width:65%;" type="text" id="titleHeaderNotView" placeholder="Type Title" disabled>
						   </div>
						
						</div>
						
						  <div class = "float-left" style="width:30%;">
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request By :</span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="requestByNotView"  disabled>
							    </div>
							    
							  </div>
							  
							  <div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">* Request Date :</span>
							    <div class = "float-left" style="width:65%;">
							    <input  class = " form-control" type = "date" id="requestDateNotView" disabled/>
							    </div>
							  </div>
							  
							<div style="clear:both;"></div>
							  
							   <div class="form-group">
							    <span class="float-left" style="width:35%; text-align:right;"> Note :</span>
							    <div class="float-left" style="width:65%;">
							     <textarea class="form-control"  type="text" id="noteTitleHeaderNotView" style="width:247px;" disabled></textarea>
							    </div>
							  </div>
						  </div>
						  
						  <div class = "float-left" style="width:30%;">
						  	<div class="form-group">
							    <span class = "float-left" style="width:35%; text-align:right;">Status : </span>
							    <div class = "float-left" style="width:65%;">
							    	<input class="form-control" type="text" id="statusBySaveNotView" disabled>
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
						<table class="display" style="width:100%; border:none;" id="tabelItemNotView">
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