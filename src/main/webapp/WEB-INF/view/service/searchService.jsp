<%-- 
    Document   : searchService
    Created on : May 14, 2018, 6:48:28 PM
    Author     : Ciro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>FloorBrax - System Management</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/javascript.js"></script>
</head>
<body>
  <div class="container">
    <h1 class="display-3 text-center text-white my-4 bg-primary">
		<a class="text-white" href="${pageContext.request.contextPath}/">FloorBrax</a>
	</h1>
  </div>
  <div class="container">
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
	</div>
    <div class="container">
        <div class="container">
            <div class="row float-right mt-2">
				<small><label>User: </label> <security:authentication property="principal.username" /></small>
			</div>
        </div>
    </div> 
    <div class="container">
        <form:form action="getService" method="post" modelAttribute="service">
            <div class="input-group mt-4">
                <form:input path="name" class="form-control" type="text" name="name" placeholder="Enter Service Name" required="true" />
                <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit">Search</button>
                </span>
            </div>
        </form:form>        
    </div>
    <c:if test="${param.noResult != null}">
    	<div class="container mt-4" id="two">
			<div class="alert alert-danger text-center">
		    	Service not found!
		    </div>
		</div>
    </c:if>
    <c:if test="${param.withResult != null}">
    	<div class="container">
        <div style="overflow-x:auto;">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class="text-center">#</th>
                  <th class="text-center">Id</th>
                  <th class="text-center">Title</th>
                  <th class="text-center">Description</th>
                  <th class="text-center">View Service</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th  class="text-center" scope="row">1</th>
                  <td class="text-center">${svc.id}</td>
                  <td class="text-center">${svc.name}</td>
                  <td class="text-center">${svc.description}</td>
                  <td class="text-center">
                  	<c:url var="viewServiceLink" value="/service/viewService">
						<c:param name="serviceId" value="${svc.name}"></c:param>
					</c:url> <a class="btn btn-primary" href="${viewServiceLink}">View</a>
                  </td>
                </tr>
              </tbody>
            </table>
        </div>
  </div>
    </c:if>
    <div class="container">
        <div class="row">
            <button class="btn btn-link" type="submit" onclick="showAll()">Show all services</button>
        </div>
    </div>
    <div class="container" id="allServices" hidden="true">
        <div style="overflow-x:auto;">
            <table class="table table-striped">
                    <thead>
                      <tr>
                        <th class="text-center">#</th>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>View Service</th>
                      </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${services}" var="service" varStatus="loop">
	                        <tr>
	                            <th scope="row">${loop.index}</th>
	                            <td>${service.id}</td>
	                            <td>${service.name}</td>
	                            <td>${service.description}</td>
	                            <td>
	                                <c:url var="viewServiceLink" value="/service/viewService">
										<c:param name="serviceId" value="${service.name}"></c:param>
									</c:url> <a class="btn btn-primary" href="${viewServiceLink}">View</a>
	                            </td>
	                      	</tr>
                        </c:forEach>
                    </tbody>
                </table>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    </body>
</html>
