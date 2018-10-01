<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Billing</title>

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

    <form:form method="POST" modelAttribute="customerBillingForm" class="form-billing">
        <h2 class="form-signin-heading">Billing</h2>
        <c:if test="${not empty msg}">
			<div class="alert alert-${css} alert-dismissible">
				<a href="#" class="close" data-dismiss="alert" aria-label="Close">&times;</a>
				<strong>${msg}</strong>
			</div>
		</c:if>
	<div class="row">
        <div class="col-xs-2">
            <div class="input-group">
                <form:input type="text" class="form-control-billing" placeholder="Customer Name" path="name"></form:input>
            </div>
        </div>
        <div class="col-xs-2">
            <div class="input-group">
                <form:input type="text" class="form-control-billing" placeholder="Mobile" path="mobile"></form:input>
            </div>
        </div>
        <div class="col-xs-4">
            <div class="input-group">
                <form:input type="text" class="form-control-billing" placeholder="Mail Id" path="mailId"></form:input>
            </div>
        </div>
    </div> 
        <button class="btn-lg btn-primary" type="submit">Submit</button>
    </form:form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
