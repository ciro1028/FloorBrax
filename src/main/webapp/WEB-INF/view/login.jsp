<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!doctype html>
<html lang="en"  style="height: 100%;">

<head>
<title>Login Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<style>
	.vcenter {
    display: inline-block;
    vertical-align: middle;
    float: none;
}
</style>
<body style="height: 100%;">
	<div class="jumbotron" style="min-height: 100%; height: 100%;">
		<div class="container">
			<div id="loginbox" style="margin-top: 50px; " class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Sign In</div>
					</div>
					<div style="padding-top: 30px" class="panel-body">
						<div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>
						<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST" class="form-horizontal">
							<c:if test="${param.error != null}">
								<div class="alert alert-danger col-xs-offset-1 col-xs-10">
									Invalid username and password.</div>
							</c:if>
							<c:if test="${param.logout != null}">
								<div class="alert alert-success col-xs-offset-1 col-xs-10">
									You have been logged out.</div>
							</c:if>
							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
								<input type="text" class="form-control" name="username" placeholder="username">
							</div>
							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
								<input type="password" class="form-control" name="password" placeholder="password">
							</div>
							<div style="margin-top: 10px" class="form-group">
								<div class="col-sm-12 controls">
									<button class="btn btn-success" type="submit" class="success">Login</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
