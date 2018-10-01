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
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Create Tax</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<div class="container">

		<form:form method="POST" modelAttribute="productForm" class="form-signin" action="${contextPath}/updateProduct">
			<h2 class="form-signin-heading">Update Product</h2>
			<form:input type="hidden" path="id" value="${product.id}"></form:input>
			
			<spring:bind path="code">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="code" class="form-control"
						placeholder="Product Code" autofocus="true" required="true" value="${product.code}"></form:input>
					<form:errors path="code"></form:errors>
				</div>
			</spring:bind>
			
			<spring:bind path="name">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="name" class="form-control"
						placeholder="Product Name" autofocus="true" required="true" value="${product.name}"></form:input>
					<form:errors path="name"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="price">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="number" id="price" step="100.0" min="0.00"
						path="price" class="form-control" placeholder="0.00" required="true"
						autofocus="true" onblur="validateAmountFormat()" onfocus="onFocus()" value="${product.price}"></form:input>
					<form:errors path="price"></form:errors>
				</div>
			</spring:bind>
			
			<spring:bind path="totalCount">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="number" id="totalCount" step="1" min="0"
						path="totalCount" class="form-control" placeholder="0"
						autofocus="true" required="true" value="${product.totalCount}"></form:input>
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

			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</form:form>

	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/validate_colorsapparels.js"></script>
</body>
</html>
