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
						<h2>Tax List</h2>
					</div>
					<spring:url value="/addTax" var="urlAddTax" />
					<div class="col-sm-4">
						<ul class="nav navbar-nav navbar-right">
							<%-- <li class="active"><a href="${urlAddTax}" class="btn btn-primary" role="button">Add Tax</a></li> --%>
							<li class="active"><button
									onclick="document.getElementById('addorUpdateTax').style.display='block'"
									style="width: auto;">Add Tax</button></li>
						</ul>
					</div>
				</div>
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Tax Name</th>
						<th>Percentage</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tax" items="${taxList}">
						<tr>
							<td>${tax.name}</td>
							<td>${tax.value}</td>
							<spring:url value="/tax/${tax.id}/delete" var="deleteTaxUrl" />
							<spring:url value="/tax/${tax.id}/update" var="updateTaxUrl" />
							<td>
								<!-- <a href="" class="add" title="Add" data-toggle="tooltip"><i
										class="material-icons">&#xE03B;</i></a> --> <a
								href="${updateTaxUrl}" class="edit" title="Edit"
								data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
								<a href="${deleteTaxUrl}" class="delete" title="Delete"
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
	<div id="addorUpdateTax" class="modal">

		<form:form class="modal-content animate" method="POST"
			modelAttribute="taxForm" action="${contextPath}/getTax">
			<div class="imgcontainer">
				<span
					onclick="document.getElementById('addorUpdateTax').style.display='none'"
					class="close" title="Close Modal">&times;</span>
			</div>
			<div class="container">
				<h2 class="form-signin-heading">Create Tax</h2>
				<spring:bind path="name">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<form:input type="text" path="name" class="form-control"
							placeholder="Tax Name" autofocus="true" required="true"></form:input>
						<form:errors path="name"></form:errors>
					</div>
				</spring:bind>

				<spring:bind path="value">
					<div class="form-group ${status.error ? 'has-error' : ''}">
						<form:input type="number" id="price" step="0.01" min="0.00"
							path="value" class="form-control" placeholder="0.00"
							autofocus="true" onblur="validateAmountFormat()" onfocus="onFocus()" required="true"></form:input>
						<form:errors path="value"></form:errors>
					</div>
				</spring:bind>

				<button type="submit" class="saveTax">Save</button>
				<button type="button"
					onclick="document.getElementById('addorUpdateTax').style.display='none'"
					class="cancelbtn">Cancel</button>
			</div>

		</form:form>
	</div>
</body>
</html>
