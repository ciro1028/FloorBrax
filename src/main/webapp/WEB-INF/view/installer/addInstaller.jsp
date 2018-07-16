<%-- 
    Document   : addInstaller
    Created on : May 14, 2018, 6:48:28 PM
    Author     : Ciro Amaral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>FloorBrax - System Management</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<h1 class="display-3 text-center text-white my-4 bg-primary">
			<a class="text-white" href="${pageContext.request.contextPath}/">FloorBrax</a>
		</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="dropdown">
					<button class="btn btn-primary btn-block dropdown-toggle"
						type="button" data-toggle="dropdown">Orders</button>
					<div class="dropdown-menu">
						<a href="${pageContext.request.contextPath}/order/addOrder" class="dropdown-item">Add Order</a> 
						<a href="${pageContext.request.contextPath}/order/searchOrdersBy" class="dropdown-item">Search Orders</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="dropdown">
					<button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">Services</button>
					<div class="dropdown-menu">
						<a href="${pageContext.request.contextPath}/service/addService" class="dropdown-item">Add Service</a> 
						<a href="${pageContext.request.contextPath}/service/searchService" class="dropdown-item">Search Service</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="dropdown">
					<button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">Installers</button>
					<div class="dropdown-menu">
						<a href="${pageContext.request.contextPath}/installer/addInstaller" class="dropdown-item">Add Installer</a> 
						<a href="${pageContext.request.contextPath}/installer/searchInstaller" class="dropdown-item">Search Installer</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="dropdown">
					<button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">Subdivisions</button>
					<div class="dropdown-menu">
						<a href="${pageContext.request.contextPath}/subdivision/addSubdivision" class="dropdown-item">Add Subdivision</a> 
						<a href="${pageContext.request.contextPath}/subdivision/searchSubdivision" class="dropdown-item">Search Subdivision</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="container">
			<div class="row float-right mt-2">
				<small><label>User: </label> <security:authentication property="principal.username" /></small>
			</div>
		</div>
	</div>
	<c:if test="${param.added != null}">
		<div class="container mt-4">
			<div class="alert alert-success text-center">Installer Added Successfuly!</div>
		</div>
	</c:if>
	<c:if test="${param.deleted != null}">
		<div class="container mt-4">
			<div class="alert alert-danger text-center">Installer Deleted Successfuly!</div>
		</div>
	</c:if>
	<div class="container mt-4">
		<form:form action="saveInstaller" modelAttribute="installer" method="post">
			<div class="row">
				<div class="col-sm">
					<label>Name</label>
					<form:input class="form-control mr-2" path="name" required="true"/>
				</div>
				<div class="col-sm">
					<label>Phone</label>
					<form:input class="form-control mr-2" path="phone" />
				</div>
				<div class="col-sm">
					<c:if test="${param.installerId != null}">
						<button 
							class="btn btn-danger mt-4 ml-3 float-right" 
							type="button"
							data-toggle="modal" 
							data-target="#deleteModal">Delete</button>
					</c:if>
					<button class="btn btn-primary mt-4 float-right" type="submit">Save Installer</button>
				</div>
			</div>
		</form:form>
		<div class="modal" id="deleteModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirm</h5>
                    <button class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this installer?
                </div>
                <div class="modal-footer">
	                    <c:url var="deleteLink" value="/installer/deleteInstaller">
							<c:param name="installerId" value="${installer.id}" />
						</c:url>
                        <a class="btn btn-danger" href="${deleteLink}">Delete</a>
                    <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>

</body>
</html>
