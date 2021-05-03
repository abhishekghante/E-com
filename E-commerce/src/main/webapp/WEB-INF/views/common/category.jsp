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
			<h3 class="panel-title">Add Category</h3>
		</div>
		<div class="panel-body">
			<form novalidate id="product_form"  class="form-horizontal">
				<!-- action = "create_product" modelAttribute = "product_details" onsubmit = "return accountValidate()"> -->
				<div class="box-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-md-4 control-label" for="category_name">Category
									Name <span class="text-danger">*</span>
								</label>
								<div class="col-md-8">
									<input type="text" required placeholder="Name"
										id="category_name" class="form-control" name="category_name">
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<br> <br>

							<br> <br> <br> <br>

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
                            <button class="btn btn-info" id="CategoryDetails" onclick = "addCategoryDetails()" type="button">Add Product</button>
                            <a href="${pageContext.request.contextPath}/index"><center>Click here to view all saved Category</center></a>
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
		function addCategoryDetails() {
		var category_name = $('#category_name').val();

		
		var ErrorFlag = 0;
		
		if(category_name == "")
		{
			
			toastr.error("Category Name cannot be blank ");
			ErrorFlag =1;	
			
		}
			
		
	  if(ErrorFlag == 1)
	  return false;
			  
			 
		     $.ajax({
		    	 
		    	 type : "POST",
		    	 url  : "addCategory",
		    	 data : {
		    		     "category_name":category_name	
		    			 },       
		 	            success : function(msg) {
			                if(msg == "****") 
			                {
			                	
				                    window.location.href = "${pageContext.request.contextPath}/admin";
				                    toastr.success('Category added Successfully');
			                }
			                else
			                {
			                	toastr.error('Error adding Category.');
			                }
			            }
		     });
		     
	}
		
		
		

</script>
</html>