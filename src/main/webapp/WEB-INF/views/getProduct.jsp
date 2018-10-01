<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Colors Apparels</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/validate_colorsapparels.js"></script>
<script src="${contextPath}/resources/js/operations.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<jsp:include page="menu.jsp" />

	<div class="container">
		<c:if test="${not empty msg}">
			<div class="alert alert-${css} alert-dismissible">
				<a href="#" class="close" data-dismiss="alert" aria-label="Close">&times;</a>
				<strong>${msg}</strong>
			</div>
		</c:if>
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-8">
						<h2>Product List</h2>
					</div>
					<spring:url value="/addProduct" var="urlAddProduct" />
					<div class="col-sm-4">
						<ul class="nav navbar-nav navbar-right">
							<li class="active"><button
									onclick="document.getElementById('addorUpdateProduct').style.display='block'"
									style="width: auto;">Add Product</button></li>
						</ul>
					</div>
				</div>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Product Code</th>
						<th>Product Name</th>
						<th>Price</th>
						<th>TotalCount</th>
						<th>Tax</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${productList}">
						<tr>
						<td>${product.code}</td>
							<td>${product.name}</td>
							<td>${product.price}</td>
							<td>${product.totalCount}</td>
							<td>${product.taxName}</td>
							<spring:url value="/product/${product.id}/delete" var="deleteProductUrl" />
							<spring:url value="/product/${product.id}/update" var="updateProductUrl" />
							<td><a href="${updateProductUrl}" class="edit" title="Edit"
								data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
								<a href="${deleteProductUrl}" class="delete" title="Delete"
								data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tr>
				</tr>
			</table>
		</div>
	</div>
	<!-- /container -->
	<div id="addorUpdateProduct" class="modal">

		<form:form class="modal-content animate" method="POST"
			modelAttribute="productForm" action="${contextPath}/getProduct">
			<div class="imgcontainer">
				<span
					onclick="document.getElementById('addorUpdateProduct').style.display='none'"
					class="close" title="Close Modal">&times;</span>
			</div>
			<div class="container">
				<h2 class="form-signin-heading">Create Product</h2>
				
				<spring:bind path="code">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<form:input type="text" path="code" class="form-control"
							placeholder="Product Code" autofocus="true" required="true"></form:input>
						<form:errors path="code"></form:errors>
					</div>
				</spring:bind>
				
				<spring:bind path="name">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<form:input type="text" path="name" class="form-control"
							placeholder="Product Name" autofocus="true" required="true"></form:input>
						<form:errors path="name"></form:errors>
					</div>
				</spring:bind>

				<spring:bind path="price">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<form:input type="number" id="price" step="100.00" min="0.00"
							path="price" class="form-control" placeholder="0.00"
							autofocus="true" onblur="validateAmountFormat()" onfocus="onFocus()" required="true"></form:input>
						<form:errors path="price"></form:errors>
					</div>
				</spring:bind>
				
				<spring:bind path="totalCount">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<form:input type="number" id="totalCount" step="1" min="0"
							path="totalCount" class="form-control" placeholder="0"
							autofocus="true" required="true"></form:input>
						<form:errors path="totalCount"></form:errors>
					</div>
				</spring:bind>
				
				<spring:bind path="taxId">
					<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:select path="taxId">
					<c:forEach var="tax" items="${taxList}">
					   <form:option value="${tax.id}" label="${tax.name}"/>
					   </c:forEach>
					 </form:select>
					</div>
				</spring:bind>

				<button type="submit" class="saveProduct">Save</button>
				<button type="button"
					onclick="document.getElementById('addorUpdateProduct').style.display='none'"
					class="cancelbtn">Cancel</button>
			</div>

		</form:form>
	</div>
</body>
</html>
