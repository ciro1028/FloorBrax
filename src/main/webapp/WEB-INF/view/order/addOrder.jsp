<%-- 
    Document   : addOrders
    Created on : May 14, 2018, 6:48:28 PM
    Author     : Ciro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FloorBrax - System Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/javascript.js"></script>
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
                <small><label>User: </label> <label id="user"><security:authentication property="principal.username"/></label></small>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <div class="alert alert-info text-center">
            Add new Order
        </div>
    </div>
    <form:form 
    	action="submitOrder?${_csrf.parameterName}=${_csrf.token}" 
    	method="post" 
    	enctype="multipart/form-data"
    	modelAttribute="order">
        <div class="container">
            <div class="container border border-primary">
                <div class="row mt-2">
                    <div class="col-sm">
                        <label>Order Number</label>
                        <form:input 
                        	path="orderNum"
                        	id="orderNum"
                        	class="form-control mr-2" 
                        	type="text"
                        	name="orderNum" 
                        	onkeyup="enablePicUpload()"
                        	required="required" />
                        <label class="mt-3">Date</label>
                        <input 
                        	class="form-control" 
                        	id="datepicker" 
                        	name="datepicker" 
                        	placeholder="MM/DD/YYYY" 
                        	type="text" 
                        	required="required"
                        	onchange="formatDate()"
                        	readonly="readonly"/>
                        <form:input 
                        	path="date"
                        	type="text"
                        	id="date"
                        	hidden="true"
                        	/>
                        <label class="mt-3">Status</label>
                        <form:select 
                        	path="status"
                        	class="form-control" 
                        	id="status" 
                        	name="status" 
                        	required="required" >
	                            <option></option>
	                            <option value="Pending">Pending</option>
	                            <option value="Completed">Completed</option>
                        </form:select>
                        <h3 class="display-5 bg-primary text-white text-center mt-4 rounded">Details</h3>
                        <form:textarea 
                        	path="description"
                        	class="form-control" 
                        	rows="5" 
                        	id="details" 
                        	name="details"
                        	></form:textarea>
                    </div>
                    <div class="form-group col-sm mt-2">
	                    <div id="serviceWrap" class="bg-light border border rounded p-2">
	                        <label for="service">Service</label>
	                        <select 
	                        	class="form-control" 
	                        	id="service" 
	                        	onchange="onChangeSelect()">
	                            <option id="option0"></option>
	                            <c:forEach items="${services}" var="service" varStatus="loop">
	                                <option id="${service.name}">${service.name}</option>
	                            </c:forEach>
	                        </select>
	                        <div class="form-inline mt-3">
		                        <div id="sqftDiv" hidden="true">
		                            <form:input 
		                            	path="squareFootage"
		                                class="form-control mr-2 text-right" 
		                                value="0" 
		                                type="text" 
		                                id="sqf" 
		                                name="sqf" 
		                                disabled="disabled" 
		                                onkeypress="return isNumberKey(event)" />Sqft
		                        </div>
		                        <div id="sqfDitraDiv" hidden="true" >
		                            <form:input
		                            	path="squareFootageDitra" 
		                                class="form-control mr-2 text-right" 
		                                value="0" 
		                                type="text" 
		                                id="sqfDitra" 
		                                name="sqfDitra" 
		                                disabled="disabled" 
		                                onkeypress="return isNumberKey(event)" /> Sqft w/ ditra
		                        </div>
	                        </div>
	                        <div id="showerExtras" hidden="true">
		                        <div class="form-check form-check-inline">
		                            <input 
		                                class="form-check-input" 
		                                type="checkbox" 
		                                onchange="checkNiche()" 
		                                id="soapniche" 
		                                value="niche" />
		                            <label class="form-check-label" for="niche">Soap Niche +$100</label>
		                        </div>
		                        <div class="form-check form-check-inline">
		                            <input 
		                                class="form-check-input" 
		                                type="checkbox" 
		                                onchange="checkBench()" 
		                                id="bench" 
		                                value="bench">
		                            <label class="form-check-label" for="bench">Bench +$100</label>
		                        </div>
	                        </div>
                        </div>
                        <div class="form-row mt-3">
                            <div class="col">
                                <form:input 
                                	path="extras"
                                	class="form-control text-right" 
                                	type="text" 
                                	id="addedExtraDesc" 
                                	name="addedExtraDesc" />
                                <label>Add Extra</label>
                            </div>
                            <div class="col">
                                <input 
                                	class="form-control text-right" 
                                	type="text" 
                                	id="addedExtraCost" 
                                	name="addedExtraCost" 
                                	value="0" 
                                	onkeypress="return isNumberKey(event)" 
                                	onblur="addExtraLeave()" 
                                	onclick="addExtraEntry()" />
                                <label>Cost</label>
                            </div>
                            <div class="input-group mb-3">
							  <div class="input-group-prepend">
							    <span class="input-group-text">$</span>
							  </div>
							  <form:input 
                            	path="extraPrice"
                            	class="form-control text-right" 
                            	value="0" 
                            	type="text" 
                            	id="extraCost" 
                            	name="extraCost" 
                            	disabled="disabled" 
                            	onkeypress="return isNumberKey(event)" />
							  <div class="input-group-append">
							    <span class="input-group-text">.00</span>
							  </div>
							</div>
                            Extra Cost Total
                            <select class="form-control mt-2" name="services" id="listOfServices" multiple>
                          		<option></option>
                        	</select>
                        	<label>List of services</label>
                        </div>
                        
                        <div class="row">
                        	<div class="col-6">
                        		<button class="btn btn-primary mt-4 float-right " type="button" onclick="getService()">Add Service</button>
                        	</div>
                        	<div class="col-6">
                        		<button class="btn btn-danger mt-4 float-right" type="button" onclick="removeService()">Remove</button>
                        	</div>
                        	
                        </div>
                    </div>
                    <div class="form-group col-sm">
                        <label for="subdivision">Subdivision</label>
                        <select
                        	class="form-control" 
                        	id="subdivision" 
                        	name="subdivision" 
                        	required="required"
                        	onchange="selectSubId()">
                            <option></option>
                            <c:forEach items="${subdivisions}" var="sub" varStatus="loop">
                                <option>${sub.id} - ${sub.name}</option>
                            </c:forEach>
                        </select>
                        <form:input 
                        	path="subdivisionId" 
                        	id="subId" 
                        	type="text" 
                        	hidden="true"/>
                        <label for="installer">Installer</label>
                        <select
                        	class="form-control" 
                        	id="installer" 
                        	name="installer" 
                        	required="required"
                        	onchange="selectInstallerId()">
                            <option></option>
                            <c:forEach items="${installers}" var="installer">
                                <option>${installer.id} - ${installer.name}</option>
                            </c:forEach>
                        </select>
                        <form:input 
                        	path="installerId"
                        	id="installerId" 
                        	type="text"
                        	hidden="true"/>
                        <label class="mt-4" for="pic">Original Order</label>                         
                    	<input 
                    		class="form-control-file mt-3 rounded" 
                    		type="file" 
                    		id="file" 
                    		name="file" 
                    		accept="image/*" 
                    		multiple required disabled>
                    	<button class="btn btn-success float-right align-bottom mt-4" type="submit">Submit Order</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm">
                			
                    </div>  
                </div>
            </div>
        </div>
        <div class="col-sm" hidden="true">
            <form:input 
            	path="squareFootage"
            	type="text" 
            	value="0" 
            	id="sftPH" 
            	name="sftPH"
            	/>
            <form:input 
            	path="squareFootageDitra"
            	type="text" 
            	value="0" 
            	id="sftDPH" 
            	name="sftDPH" />
            <form:input 
            	path="squareFootageHarwood"
            	type="text" 
            	value="0" 
            	id="sftHPH" 
            	name="sftHPH" />
            <form:input 
            	path="services"
            	type="text" 
            	id="servicesPlaceholder" 
            	name="servicesPlaceholder" />
            <form:input
            	path="userId"
            	type="text"
            	id="userId"
            	name="userId" 
            	/>
            <input type="text" name="editOrder" id="editOrder" hidden="true" value="false"/>	
        </div> 
    </form:form>
    <div class="container">
        <footer class="footer bg-primary"></footer>
    </div>                               
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
