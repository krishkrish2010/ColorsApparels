<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<form id="logoutForm" method="POST" action="${contextPath}/logout">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Colors Apparels</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${contextPath}/welcome">Home</a></li>
      <li><a href="${contextPath}/billing">Billing</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Master <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="${contextPath}/getTax">Tax</a></li>
          <li><a href="${contextPath}/getProduct">Products</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
					<li><a><span class="glyphicon glyphicon-user"></span>Welcome
								<b>${pageContext.request.userPrincipal.name}</b></a></li>
					<li><a href="#"
						onclick="document.forms['logoutForm'].submit()"><span
							class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
  </div>
</nav>
	</c:if>
</body>
</html>
