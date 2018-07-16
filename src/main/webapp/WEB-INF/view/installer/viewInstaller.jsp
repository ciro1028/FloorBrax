<%-- 
    Document   : InstallerView
    Created on : May 18, 2018, 9:52:44 AM
    Author     : Ciro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>FloorBrax - System Management</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/javascript.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body onload="getStatus()">
	<div class="container" id="zero">
		<h1 class="display-3 text-center text-white my-4 bg-primary">
			<a class="text-white" href="${pageContext.request.contextPath}/">FloorBrax</a>
		</h1>
	</div>
	<div class="container mb-4" id="one" hidden="true" id="one">
		<div class="text-center">
			<h4>2924 Wilson dr NW</h4>
			<h5>Huntsville, AL 35816</h5>
			<h5>255-651-7493</h5>
		</div>
		<hr>
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
				<small><label>User: </label> <security:authentication
						property="principal.username" /></small>
			</div>
		</div>
	</div>
	<div class="container my-4" id="two">
		<form:form action="saveInstaller" modelAttribute="installer" method="post">
			<div class="row">
				<div class="col-sm">
					<label>Name</label> 
					<form:input path="name" class="form-control mr-2" type="text" id="name" name="name" value="${installer.name}" />
				</div>
				<div class="col-sm">
					<label>Phone</label> 
					<form:input path="phone" class="form-control mr-2" type="text" id="phone" name="phone" value="${installer.phone}" />
				</div>
				<div class="col-sm" id="buttons">
					<button 
						class="btn btn-danger float-right mt-4  ml-4" 
						type="button" 
						data-toggle="modal" 
						data-target="#deleteModal">Delete Installer</button>
					<button class="btn btn-primary float-right mt-4" type="submit">Save</button>
				</div>
			</div>
		</form:form>
	</div>
	<div class="container" id="three">
		<h4 class="bg-primary p-2 w-100 text-center text-white">List of orders</h4>
	</div>
	<div class="container">
	<form:form action="searchOrderByDate?installerId=${installer.id}" method="post">
			<div class="p-3 mb-2 bg-light border border-primary">
				<div class="row">
						<div class="col-4">
							<input class="form-control mr-2 text-right" type="text" id="reportrange" name="reportrange">Select Range
						</div>
						<div class="col-4">
							<button type="submit" class="btn btn-primary">Get Orders</button>
						</div>
						<div class="col-4">
						</div>
				</div>
			</div>
	</form:form>
	</div>
	<div class="container" id="four">
		<div class="row">
			<div class="col-sm mt-4">
				Range Selected: <label>${rangeSelected}</label>
			</div>
			<div class="col-sm"></div>
			<div class="col-sm">
				<div class="input-group mt-2">
					<button class="btn btn-primary mr-4 mb-2" onclick="printFunctionInstaller()" id="printButton">Print</button>
					<span class="input-group-addon bg-primary text-white mb-2">TOTAL</span>
					<input class="form-control text-right mb-2" readonly type="text" value="$${totalToPay}.00">
				</div>
			</div>
		</div>
	</div>
	<div class="container" id="five">
		<div style="overflow-x: auto;">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th class="text-center">Order Number</th>
						<th class="text-center">Date</th>
						<th class="text-center">Installer</th>
						<th class="text-center">Subdivision</th>
						<th class="text-center">Services</th>
						<th class="text-center">Status</th>
						<th class="text-center">To be Paid</th>
						<th class="text-center">View Order</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach items="${orders}" var="order" varStatus="loop">
							<c:url var="goToOrder" value="/order/goToOrder">
								<c:param name="orderNum" value="${order.orderNum}" />
							</c:url>
							<c:url var="updateStatusInstaller" value="/installer/updateStatusInstaller">
								<c:param name="orderNum" value="${order.orderNum}"></c:param>
								<c:param name="installerId" value="${installer.id}"></c:param>
								<c:param name="dates" value="${rangeSelected}"></c:param>
							</c:url>
							<tr>
								<th scope="row" class="align-middle">${loop.index}</th>
								<td id="${order.orderNum}" class="text-center align-middle">${order.orderNum}</td>
								<td class="text-center align-middle">${order.date}</td>
								<td class="text-center align-middle">${installers[loop.index]}</td>
								<td class="text-center align-middle">${subs[loop.index]}</td>
								<td class="text-center align-middle">${services[loop.index]}</td>
								<td class="text-center align-middle">
									<label id="${order.orderNum}&">${order.status}</label><br> 
									<small>
										<a id="${order.orderNum}*" href="${updateStatusInstaller}"></a>
									</small>
								</td>
								<td class="text-center align-middle">$${order.toPay}.00</td>
								<td class="text-center align-middle">
									<a class="btn btn-primary" href="${goToOrder}">View</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
			</table>
			<input id="orders_num" type="text" value="${ordersNumList}" hidden="true"/>
		</div>
	</div>
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

