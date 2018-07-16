<%-- 
    Document   : home
    Created on : May 14, 2018, 6:48:28 PM
    Author     : Ciro
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/javascript.js"></script>
</head>
<body onload="getStatus()">
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
						<a href="order/addOrder" class="dropdown-item">Add Order</a> 
						<a href="order/searchOrdersBy" class="dropdown-item">Search Orders</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="dropdown">
					<button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">Services</button>
					<div class="dropdown-menu">
						<a href="service/addService" class="dropdown-item">Add Service</a> 
						<a href="service/searchService" class="dropdown-item">Search Service</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="dropdown">
					<button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">Installers</button>
					<div class="dropdown-menu">
						<a href="installer/addInstaller" class="dropdown-item">Add Installer</a> 
						<a href="installer/searchInstaller" class="dropdown-item">Search Installer</a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="dropdown">
					<button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">Subdivisions</button>
					<div class="dropdown-menu">
						<a href="subdivision/addSubdivision" class="dropdown-item">Add Subdivision</a> 
						<a href="subdivision/searchSubdivision" class="dropdown-item">Search Subdivision</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="container">
			<div class="row float-right mt-2">
				<small><label>User: </label> <security:authentication
						property="principal.username" /></small>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="container border border-primary mt-4">
			<hr>
			<div class="alert alert-danger text-center mt-3">Orders for today.</div>
			<div style="overflow-x: auto;">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="text-center">#</th>
							<th class="text-center">Order Number</th>
							<th class="text-center">Date</th>
							<th class="text-center">Installer</th>
							<th class="text-center">Subdivision</th>
							<th class="text-center">Services</th>
							<th class="text-center">Status</th>
							<th class="text-center">View Order</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order" varStatus="loop">
							<c:url var="goToOrder" value="/order/goToOrder">
								<c:param name="orderNum" value="${order.orderNum}" />
							</c:url>
							<c:url var="updateStatus" value="/order/updateStatus">
								<c:param name="orderNum" value="${order.orderNum}"></c:param>
								<c:param name="url" value="home"></c:param>
							</c:url>
							<tr>
								<th scope="row" class="align-middle">${loop.index}</th>
								<td id="${order.orderNum}" class="text-center align-middle">${order.orderNum}</td>
								<td class="text-center align-middle">${order.date}</td>
								<td class="text-center align-middle">${installersList[loop.index]}</td>
								<td class="text-center align-middle">${subdivisionsList[loop.index]}</td>
								<td class="text-center align-middle">${servicesList[loop.index]}</td>
								<td class="text-center align-middle">
									<label id="${order.orderNum}&">${order.status}</label><br> 
									<small>
										<a id="${order.orderNum}*" href="${updateStatus}"></a>
									</small>
								</td>
								<td class="text-center align-middle">
									<a class="btn btn-primary" href="${goToOrder}">View</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<input 
					id="orders_num" 
					type="text" 
					value="${ordersNumList}"
					hidden="true" />
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

