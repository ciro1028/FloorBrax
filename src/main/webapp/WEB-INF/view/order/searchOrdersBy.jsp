<%-- 
    Document   : home
    Created on : May 14, 2018, 6:48:28 PM
    Author     : Ciro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FloorBrax - System Management</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" /> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/javascript.js"></script>
</head>
<body onload="selectSearch()">
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
    <div class="container mt-4">
        <div class="alert alert-info text-center">
            Search Orders
        </div>
    </div>
    <input type="text" id="selectCheck" hidden="true" value="${param.result}"/>
    <div class="container">
        <form action="getOrders" method="get">
			<div class="p-3 mb-2 bg-light border border-primary">
				<div class="row">
			        <div class="col-sm-9">
			            <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label id="ordernumber" class="btn btn-outline-danger">
								<input id="num" type="radio" name="searchValue" onchange="selectFieldForSearch(this.value)" value="num" required>Order Number
							</label>
							<label id="rang" class="btn btn-outline-danger" >
								<input id="range" type="radio" name="searchValue" onchange="selectFieldForSearch(this.value)" value="range">Date Range
							</label>
							<label class="btn btn-outline-danger" id="inst">
								<input id="installer" type="radio" name="searchValue" onchange="selectFieldForSearch(this.value)" value="installer">Installer
							</label>
							<label id="svc" class="btn btn-outline-danger d-none d-xs-block d-md-block">
								<input id="service" type="radio" name="searchValue" onchange="selectFieldForSearch(this.value)" value="service">Service
							</label>
							<label id="svc" class="btn btn-outline-danger d-block d-lg-none d-md-none">
								<input id="service" type="radio" name="searchValue" onchange="selectFieldForSearch(this.value)" value="service">Svc
							</label>
							<label id="sub" class="btn btn-outline-danger d-none d-xs-block d-md-block">
								<input id="subdivision" type="radio" name="searchValue" onchange="selectFieldForSearch(this.value)" value="subdivision">Subdivision<br>
							</label>
							<label id="sub" class="btn btn-outline-danger d-block d-lg-none d-md-none">
								<input id="subdivision" type="radio" name="searchValue" onchange="selectFieldForSearch(this.value)" value="subdivision">Sub
							</label>
						</div>
			        </div>
			    </div>
    			<br/>
                <div class="row">
                    <div class="col-sm mt-3">
						<div id="dateRangeField" hidden="true">
							<input class="form-control mr-2 text-right" type="text" id="reportrange" name="reportrange" value="${dateRange}" required/>Select Range
						</div>
                        <input class="form-control mr-2 text-right" type="text" id="valueToPass" name="valueToPass" required/>
                    </div>
                    <div class="col-sm mt-3">
                        <button class="btn btn-primary" type="submit">Get Orders</button>
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>
        </form>
        <c:if test="${param.noResult != null}">
    		<div class="container mt-4" id="two">
		        <div class="alert alert-danger text-center">
		            Installer not found!
		        </div>
		    </div>
    	</c:if>
    </div>
    
    <div class="container">
		<div class="container border border-primary mt-4">
			<hr>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>


