<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="/resources/Component_css_js.jsp"%>

<style type="text/css">
</style>

</head>
<body>
	<div class="panel panel-primary" style="margin: 20px;">
		<div class="panel-heading">
			<h3 class="panel-title">Add Product</h3>
		</div>
		<div class="panel-body">
			<form novalidate id="product_form"  class="form-horizontal">
				<!-- action = "create_product" modelAttribute = "product_details" onsubmit = "return accountValidate()"> -->
				<div class="box-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-md-4 control-label" for="product_name">Product
									Name <span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
									<input type="text" required placeholder="Name"
										id="product_name" class="form-control" name="product_name">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" for="description">Description</label>
								<div class="col-md-8">
									<textarea name="description" id="description"
										class="form-control" rows="3"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" for="sellingPrice">Selling
									Price <span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
									<input type="number" id="sellingPrice" class="form-control"
										name="sellingPrice">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" for="availableQuantity">Available
									Quantity <span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
									<input type="number" id="availableQuantity" class="form-control"
										name="availableQuantity">
								</div>
							</div>
							   <div class="form-group level_div">
                                 <label class="col-md-4 control-label" for="account_type">Category <span class="text-danger">*</span></label>
                                 <div class="col-md-8">
                              <select name="category" id="category" class="form-control selecter_1" tabindex="-1" required>
                    			<option value="-1" selected disabled>Select</option>
                					<%-- <%
                					     if(cDetails != null){ 
                					     for(CategoryDetails categoryDetailLists : cDetails){
                					 %>
                                     <option value="<%=categoryDetailLists.getCategoryId() %>" ><%=categoryDetailLists.getCategoryName()%></option>
                					    	 
                					   <% 	 
                					     } }
                					%> --%>
                			  </select>
               				 </div>
            			  </div>
						</div>
						<div class="col-md-6">
							<br> <br>
							<div class="form-group">
								<label class="col-md-4 control-label" for="Weight">Weight(in
									Kg) <span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
									<input type="number" required maxlength="15" id="Weight"
										class="form-control" name="Weight">
								</div>
							</div>
							<br> <br> <br> <br>
							<div class="form-group">
								<label class="col-md-4 control-label" for="Length">Length(in
									Cm) <span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
									<input type="number" name="Length" id="Length"
										class="form-control">
								</div>
							</div>

							<div class="form-group">
								<label class="col-md-4 control-label" for="Width">Width(in
									Cm) <span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
									<input type="number" name="Width" id="Width" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-4 control-label" for="Height">Height(in
									Cm) <span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
									<input type="number" name="Height" id="Height"
										class="form-control">
								</div>
							</div>
							<%--                <div class="form-group">
                <label class="col-md-4 control-label">Image</label>
                <div class="col-md-8">
                  <a href="javascript:void(0);">
                    <img src="${pageContext.request.contextPath}/resources/img/upload_img.png" 
                    	id="img_userimage" style="height:160px;width: auto;" data-src="#"> <br />
                    <input type='file' id="input_userimage" accept="image/*" style = "display:none"
                    	onchange="displayUploadImg(this, 'img_userimage');">
                  </a>
                  <input type="hidden" id="userimage" name="userimage">
                </div>
              </div> --%>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<div class="col-md-offset-2 col-md-10">
						<!-- <button class="btn btn-info" id="addProductDetails" onclick = "return addProductDetails();" type="button">Add
							Product</button> -->
							 <%-- <input type="hidden" value="<%=user_details.getUserID() %>" id="user_id" name="user_id"> --%>
                            <button class="btn btn-info" id="ProductDetails" onclick = "addProductDetails()" type="button">Add Product</button>
                            <a href="${pageContext.request.contextPath}/index"><center>Click here to view all saved products</center></a>
					</div>
				</div>
			</form>
		</div>
</body>

<!-- <script type="text/javascript">
$(document).ready(function(){
});


}
</script> -->

<script>
		function addProductDetails() {
		var product_name = $('#product_name').val();
		var desc         = $('#description').val();
		var category     =$('#category').val();
		var sellingPrice  = $('#sellingPrice').val();
		var availableQuantity  = $('#availableQuantity').val();
		//var rType  = $("input[type='radio'][name='rType']:checked").val();
		var Weight  = $('#Weight').val();
		var Length  = $('#Length').val();
		var Width  = $('#Width').val();
		var Height  = $('#Height').val();
	/* 	var PhysicalProductShippingCost  = Weight * 50 ;
	    var	ShippingCost = (Length * Width * Height)/5000
	    var description = desc.substring(0, 100); */
		
		var ErrorFlag = 0;
		
		if(product_name == "")
		{
			
			toastr.error("Product Name cannot be blank ");
			ErrorFlag =1;	
			
		}
		
        if(description == '')
        {
			
			toastr.error("Description cannot be blank");
			ErrorFlag =1;	
			
		}
        if(category == '')
        {
			
			toastr.error("category cannot be blank");
			ErrorFlag =1;	
			
		}
        
	/* 	if(sku == '')
		{
			
			toastr.error("SKU cannot be blank ");
			ErrorFlag =1;	
			
		} */
		
		if(sellingPrice == '')
		{
			
			toastr.error("Selling Price cannot be blank ");
			ErrorFlag =1;	
			
		}
		
	   if(availableQuantity == '')
	   {
	
		 toastr.error("Available Quantity cannot be blank ");
		 ErrorFlag =1;	
	
		}
	  
	/* 	if(rType == '')
		{
	
		toastr.error("Type cannot be blank ");
		ErrorFlag =1;	
	
		} */
		
	   if(Weight == '')
	   {
	
		toastr.error("Weightcannot be blank ");
		ErrorFlag =1;	
	
		}
	
	   if(Length == '')
	   {
	
		toastr.error("Length cannot be blank ");
			ErrorFlag =1;	
	
		}
	
		if(Width == '')
		{
	
		toastr.error("Width cannot be blank ");
		ErrorFlag =1;	
	
		}
		
		if(Height == '')
		{
	
		 toastr.error("Height cannot be blank ");
		 ErrorFlag =1;	
	
    	}
		
		
		
	  if(ErrorFlag == 1)
	  return false;
			  
			 
		     $.ajax({
		    	 
		    	 type : "POST",
		    	 url  : "addProduct",
		    	 data : {
		    		     "product_name"      :product_name,
		    			 "description"       :description,
		    			 "category"          :category,		    
		    			 "sellingPrice"      :sellingPrice,
		    			 "availableQuantity" :availableQuantity		    		
		    			 "Weight"            :Weight,
		    			 "Length"            :Length,
		    		     "Width"             :Width,
		    			 "Height"            :Height,
		    			 "ShippingCost"      :ShippingCost
		    			 },       
		 	            success : function(msg) {
			                if(msg == "****") 
			                {
			                	
				                    window.location.href = "${pageContext.request.contextPath}/admin";
				                    toastr.success('Product added Successfully');
			                }
			                else
			                {
			                	toastr.error('Error adding product.');
			                }
			            }
		     });
		     
	}
		
		
		

</script>
</html>