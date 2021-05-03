<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>



<html>
<head>
<title>MyCart2 : Home</title>

<%@include file="/resources/Component_css_js.jsp"%>  
<script type="text/javascript" src="js/script.js"></script>
<style type="text/css">
@charset "ISO-8859-1";

.custom-bg{
	background : #673ab7;
}

.admin .card {
	border: 2px solid #1976D2;
}

.admin .card :hover {
	background-color: #e2e2e2;
	cursor: pointer;
}
.img .card .card-img-top{
	height: 250px;
	width: auto;
} 

.list-group-item.active {
	background : #673ab7;
	border-color : #673ab7;
}

.discount-label{
	font-size : 10px;
	font-style : italic;
}


.span {
  content: "\20B9";
}


</style>

</head>

<body>
<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">

<div class="container">
  <a class="navbar-brand" href="${pageContext.request.contextPath}/index">MyCart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/index">Home <span class="sr-only">(current)</span></a>
      </li>
      

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
     </li>

    </ul>
    
    <ul class="navbar-nav ml-auto">
    
    		<li class="nav-item active"><a class="nav-link"
					href="#" data-toggle="modal" data-target = "#cart"><i class="fa fa-cart-plus" style="font-size :20px"></i><span class ="ml-1" style="font-size:20px" cart-items >(4)</span></a></li>
    
   <%--  <%
				if (user1 == null) {
			%> --%>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/">Register</a></li>
			</ul>



			<%-- <%
				} else{
			%> --%>

			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><%-- <%=user1.getUserName() %> --%></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/login">Logout</a></li>
			</ul>

		<%-- 	<%
				}
			%>
     --%>
    
  </div>
  </div>
</nav>

	
	<!--row  -->
	<div class = "container-fluid">
	<div class="row mt-3 mx-2">

		<!--we will fetch all products here  -->
<%-- 		<%
			
			/* to fetch product by category wise from line no 52 */
			String cat =request.getParameter("category");
		
			ProductDao dao = new ProductDao(FactoryProvider.getFactory());
			List<Product> list=null;
			
			
			
			 if(cat==null ||cat.trim().equals("all")){
				
				 list = dao.getAllProducts();
				
			}
			else {
				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);
			}
			
			

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategories();
		%> --%>

		<!--show categories in home page  -->
		<div class="col-md-2">
			<div class="list-group mt-4">

				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
					ALL Products </a>

				
			

		<%-- 	<%
				for (Category c : clist) {
					
					
			%>		
					<a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
					
					
			<% 		
				}
			%> --%>
			</div>
		</div>
		
		<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->
		
		<!--show products in home page  -->
		<div class="col-md-10">
			
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="card-columns">
					
						<!-- traversing products -->
						<%-- <%
						for(Product p : list){
						%> --%>
						
						<!-- product card -->
						<div class="card">
						
						<div class="container text-center">
						<img  class=" img-fluid card-img-top m-2" style="max-height : 200px; max-width : 100%; width : auto;" alt="" src="img/products/<%-- <%=p.getpPhoto() %> --%>">
						</div>
							<div class="card-body">
								<h5 class ="card-title"><%-- <%= p.getpName() %> --%></h5>
								
								<p class="card-text">
								<!-- for few descriptions we will use helper class  in mycart.helper(package) -->
									<%-- <%= Helper.get10Words(p.getpDesc()) %> --%>
								</p>
								
							
							
							
							<div class="card-footer">
							
							<button class ="btn custom-bg text-white" onclick = "add_to_cart("<%-- <%= p.getpId() %>,<%= p.getpName() %>,<%= p.getpPrice() %>,<%= p.getPriceAfterApplyingDiscount() %> --%>")>Add to Cart</button>
							<button class="btn btn-outline-primary"><img src="http://i.stack.imgur.com/nGbfO.png"width="8"height="10"><%-- <%=p.getPriceAfterApplyingDiscount() %> --%>/-<span class="text-secondary discount-label"><%-- <%=p.getpPrice() %>,<%=p.getpDiscount() %> --%>% off</span></button>
				<!-- if &#8377; doesnit work use----<img src="http://i.stack.imgur.com/nGbfO.png" width="8" height="10"> -->
							
							</div>
						
							</div>
						</div>
						
						
						
						<%-- <%}
						
							if(list.size()==0){
								out.println("<h1>No Products In this Category</h1>");
							}
						%> --%>		
						
					
					</div>
				
				
				
				</div>
			
			
			</div>
			
			
			
					</div>


	</div>

</div>
	<%@include file="/resources/common_modals.jsp"%> 

</body>
</html>
