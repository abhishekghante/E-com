<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>This is AdminUser</title>
<%@include file="/resources/Component_css_js.jsp"%>

<style type="text/css">
.admin .card {
	border: 2px solid red;
}

.admin .card :hover {
	background-color: #e2e2e2;
	cursor: pointer;
}
</style>

<script type="text/javascript" src="script.js"></script>



</head>
<body>
	<%@include file="/resources/navbar.jsp"%>


	<div class="container admin">

		<!-- to give message  -->
		<div>
			<%-- <%@ include file="/resources/message.jsp"%> --%>
		</div>
		<!-- to end message  -->


		<div class="row mt-3">
			<!--1st column  -->
			<div class="col-md-4">
				<!-- 1st box -->
				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/group.png">
						</div>

						<h1>56142</h1>
						<h1 class="text-uppercase text-muted">Users</h1>

					</div>
				</div>



			</div>



			<!--2nd column  -->
			<div class="col-md-4">
				<!-- 2nd box -->
				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/categorylist.png">
						</div>


						<h1>8768</h1>
						<h1 class="text-uppercase text-muted">Categories</h1>

					</div>
				</div>


			</div>



			<!--3rd column  -->
			<div class="col-md-4">
				<!-- 3rd box -->
				<div class="card">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/shipping.png">
						</div>


						<h1>9796</h1>
						<h1 class="text-uppercase text-muted">Products</h1>

					</div>
				</div>


			</div>




		</div>
		<!--1st row end here  -->

<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->

		<!-- 2nd row -->
		<div class="row mt-4">

			<!--2nd row 1 col -->
			<div class="col md-6">

				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/keys.png">
						</div>


						<a  href="${pageContext.request.contextPath}/category" class="mt-2">Click Here to Add New Categories</a>
						
						<h1 class="text-uppercase text-muted">Add Categories</h1>

					</div>
				</div>
			</div>



			<!--2nd row 2 col   -->
			<div class="col md-6">

				<div class="card" data-toggle="modal" data-target="#add-product-modal">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/plus.png">
						</div>


						<a  href="${pageContext.request.contextPath}/product" class="mt-2">Click Here To Add New Products</a>
						<h1 class="text-uppercase text-muted">Add Product</h1>

					</div>
				</div>
			</div>

		</div>
		<!--2nd row end here  -->

	</div>


<!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  -->

	<!--add category modal  -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<!-- modal form start here-->
					<form action="ProductOperationServlet" method="post">


						<input type="hidden" name="operation" value="addCategory">

						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required />

						</div>

						<div class="form-group">
							<textarea style="height: 250px" class="form-control"
								name="catDescription"
								placeholder="Enter your category description" required></textarea>
						</div>

						<!-- button - addcategory and close-->

						<div class="container">
							<button class="btn btn-outline-success">Add Category</button>
							<button class="btn btn-secondary" data-dismiss="modal">Close</button>

						</div>


					</form>
					<!--form close here  -->
				</div>
				<!--modal body end here  -->

			</div>
		</div>
	</div>


</body>
</html>