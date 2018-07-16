<%-- 
    Document   : orderAdded
    Created on : May 16, 2018, 8:33:40 PM
    Author     : Ciro Amaral
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/javascript.js"></script>  
    <script>
        $( function() {
        $( "#datepicker" ).datepicker();
        } );
    </script>
</head>
<body onload="setPending()">
    <div class="container" id="zero">
        <h1 class="display-3 text-center text-white my-4 bg-primary"><a class="text-white" href="${pageContext.request.contextPath}/">FloorBrax</a></h1>
    </div>
    <div class="container mb-4" id="one" hidden="true">
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
                <small><label>User: </label> <security:authentication property="principal.username"/></small>
            </div>
        </div>
    </div> 
    	<c:set var="updated" value="updated"></c:set>
    	<c:set var="added" value="added"></c:set>
    	<c:if test="${param.status == added}">
    		<div class="container mt-4" id="two">
		        <div class="alert alert-success text-center">
		            Order added successfuly!
		        </div>
		    </div>
    	</c:if>
    	<c:if test="${param.status == updated}">
    		<div class="container mt-4" id="two">
		        <div class="alert alert-success text-center">
		            Order updated successfuly!
		        </div>
		    </div>
    	</c:if>
    	<c:if test="${param.status == null}">
    		<div class="container mt-4" id="two">
		        <div class="alert alert-success text-center">
		            View Order
		        </div>
    		</div>
    	</c:if>
    <form:form 
    	action="submitOrder?${_csrf.parameterName}=${_csrf.token}" 
    	modelAttribute="order" 
    	method="post" 
    	enctype="multipart/form-data">
        <div class="container mt-4" id="three">
            <div class="container border border-primary">
                <div class="row">
                    <div class="col-sm">
                        <label class="mt-2 text-dark">Order Number:</label><br>
                        <form:input 
                        	path="orderNum"
                            class="form-control font-weight-bold ml-2 text-primary text-right border border-dark pr-2" 
                            id="order_num" 
                            name="orderNum" 
                            value="${order.orderNum}" 
                            disabled="true" 
                            required="required" />
                        <label class="mt-2 text-dark">Date:</label><br>
                        <input
                            class="form-control font-weight-bold ml-2 text-primary text-right border border-dark pr-2" 
                            id="datepicker" 
                            name="datepicker" 
                            value="${order.date}" 
                            required="required"
                            onchange="formatDate()"
                            readonly="readonly"
                            disabled />  
                        <form:input 
                        	path="date"
                        	type="text"
                        	id="date"
                        	hidden="true"
                        	/>  
                        <label class="mt-2 text-dark">Subdivision:</label><br>
                        <input 
                            class="form-control font-weight-bold ml-2 text-primary text-right border border-dark pr-2" 
                            id="sub" 
                            name="sub" 
                            value="${sub}" disabled>
                        <select 
                        	class="form-control ml-2" 
                        	id="subdivision" 
                        	name="subdivision" 
                        	required 
                        	hidden="true"
                        	onchange="selectSubId()">
                            <option></option>
                            <c:forEach items="${subs}" var="sub">
                                <option value="${sub.name}">${sub.id} - ${sub.name}</option>
                            </c:forEach>
                        </select>
                        <form:input 
                        	path="subdivisionId" 
                        	id="subId" 
                        	type="text" 
                        	hidden="true"
                        	/>
                        <label class="mt-2 text-dark">Installer:</label><br>
                        <input 
                            class="form-control font-weight-bold ml-2 text-primary text-right border border-dark pr-2" 
                            id="installerDis" 
                            name="installerDis" 
                            value="${installer}" disabled>
                        <select 
                        	class="form-control ml-2" 
                        	id="installer" 
                        	name="installer" 
                        	required 
                        	hidden="true"
                        	onchange="selectInstallerId()">
                            <option></option>
                            <c:forEach items="${installers}" var="installer">
                                <option value="${installer.name}">${installer.id} - ${installer.name}</option>
                            </c:forEach>
                        </select> 
                        <form:input 
                        	path="installerId"
                        	id="installerId" 
                        	type="text"
                        	hidden="true"
                        	/>   
                        <label class="mt-2 text-dark">Status</label><br>
                        <form:input 
                        	path="status"
                            class="form-control font-weight-bold ml-2 text-right border border-dark pr-2" 
                            id="statusDis" 
                            name="statusDis" 
                            value="${order.status}" 
                            disabled="true" />
                        <select class="form-control ml-2" id="status" name="status" required hidden="true" onload="onPendingColor()">
                            <option></option>
                            <option value="Pending">Pending</option>
                            <option value="Completed">Completed</option>
                        </select>
                        <small><label class="mt-3">Square Footage: </label></small><br>
                        <small>
                            <label 
                                class="mt-2 ml-4 text-primary mr-2 font-weight-bold">
                                Tile - ${order.squareFootage}
                            </label>/<label class="mt-2 ml-2 text-danger mr-2 font-weight-bold"> Ditra - ${order.squareFootageDitra}</label>/<label class="mt-2 ml-2 text-success mr-2 font-weight-bold">Hardwood - ${order.squareFootageHarwood}</label>
                        </small>
                    </div>
                    <div class="col-sm">
                        <label class="mt-2 text-dark">Services:</label>
                        <div id="rowService">
                            <textarea 
                                class="form-control font-weight-bold text-primary" 
                                rows="5" disabled><c:forEach items="${services}" var="service">${service}&#10</c:forEach>
                            </textarea>  
                        </div>
                        <div id="rowserviceEdit" hidden="true">
                            <select class="form-control" id="service" onchange="onChangeSelect()">
                                <option id="option0"></option>
                                <c:forEach items="${svcArray}" var="service">
                                    <option id="${service.name}">${service.name}</option>
                                </c:forEach>
                            </select>
                            <div class="form-inline mt-3">
                                <input 
                                    class="form-control mr-2 text-right" 
                                    value="0" 
                                    type="text" 
                                    id="sqf" 
                                    name="sqf" 
                                    disabled
                                    onkeypress="return isNumberKey(event)" />Sqft
                                <input 
                                    class="form-control mr-2 text-right" 
                                    value="0" 
                                    type="text" 
                                    id="sqfDitra" 
                                    name="sqfDitra" 
                                    disabled
                                    onkeypress="return isNumberKey(event)" /> Sqft w/ ditra
                            </div>
                            <div class="form-check form-check-inline mt-2">
                                <input 
                                    class="form-check-input" 
                                    type="checkbox" 
                                    onchange="checkNiche()" 
                                    id="soapniche" 
                                    value="niche" 
                                    disabled>
                                <label class="form-check-label" for="niche">Soap Niche +$100</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input 
                                    class="form-check-input" 
                                    type="checkbox" 
                                    onchange="checkBench()" 
                                    id="bench" 
                                    value="bench" 
                                    disabled>
                                <label class="form-check-label" for="bench">Bench +$100</label>
                            </div>
                            <div class="form-row">
                                <div class="col">
                                    <input
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
                                        onclick="addExtraEntry()">
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
							</div> Extra Cost Total
                            </div>
                            <select class="form-control mt-2" name="services" id="listOfServices" multiple>
                                <c:forEach items="${services}" var="service">
                                    <option id="${service}">${service}</option>
                                </c:forEach>
                            </select>
                            <label>List of services</label>
                            <div class="row">
                        		<div class="col-6">
                        			<button class="btn btn-primary mt-4 float-right " type="button" onclick="getService()">Add Service</button>
                        		</div>
                        		<div class="col-6">
                        			<button class="btn btn-danger mt-4 float-right" type="button" onclick="removeService()">Remove</button>
                        		</div>
                        	</div>
                            <div class="col-sm" hidden="true">
                                <form:input 
                                	path="squareFootage"
                                	type="text" 
                                	value="${order.squareFootage}" 
                                	id="sftPH" 
                                	name="sftPH" />
                                <form:input 
                                	path="squareFootageDitra"
                                	type="text" 
                                	value="${order.squareFootageDitra}" 
                                	id="sftDPH" 
                                	name="sftDPH" />
                                <form:input 
                                	path="squareFootageHarwood"
                                	type="text" 
                                	value="${order.squareFootageHarwood}" 
                                	id="sftHPH" 
                                	name="sftHPH" />
                                <input type="text" value="0" id="ec" name="ec">
                                <form:input 
                                	path="services"
                                	type="text" 
                                	id="servicesPlaceholder" 
                                	name="servicesPlaceholder" />
                            </div> 
                        </div>
                    </div>
                    <div class="col-sm">
                        <label class="mt-2 text-dark">Details:</label>
                        <textarea
                        	class="form-control" 
                        	rows="5" 
                        	id="detailsShow" 
                        	name="details"
                        	disabled
                        	>${order.description}</textarea>
                        <form:textarea 
                        	path="description"
                        	class="form-control" 
                        	rows="5" 
                        	id="details" 
                        	name="details"
                        	hidden="true"
                        	></form:textarea>
                        <label 
                            class="mt-2 text-dark">Order Total: $${order.total}.00
                        </label>
                        <br> 
                        <label 
                            class="mt-2 text-dark">Pay Installer: $${order.toPay}.00
                        </label>
                        <br>
                        <br>
                        <hr>
                        <a 
                            class="font-weight-bold mt-4" 
                            id="clickToSee" href="${order.picture}" data-toggle="lightbox">
                                Click to see original order
                            </a>
                            <br>
                            <hr>
                        <div class="form-group p-2" hidden="true" id="upload">
                            <label class="mt-4" for="pic">Original Order</label>
                            <input 
                                class="form-control" 
                                type="text" id="pic" 
                                name="pic" 
                                value="${order.picture}" 
                                required 
                                disabled>
                        </div>
                        <small>
                            <label 
                                class="mt-4 text-dark">Order added by: ${order.userId} on
                            </label>
                                <label 
                                    class="mt-4 text-dark" id="addedDate">${order.dateAdded}
                                </label>
                        </small>          
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm">
                    <input type="file" name="file" hidden="true"/>
                    <input type="text" name="editOrder" id="editOrder" hidden="true"/>   
                    <form:input
		            	path="userId"
		            	type="text"
		            	id="userId"
		            	name="userId" 
		            	hidden="true"
		            	value="${order.userId}"/>                 
                    </div>
                    <div class="col-sm">
                    	
                    </div>
                    <div class="col-sm" id="buttons">
                        <button class="btn btn-danger float-right m-2" type="button" data-toggle="modal" data-target="#deleteModal">Delete Order</button>
	                    <button class="btn btn-warning float-right m-2" type="button" id="edit" onclick="toEdit()">Edit Order</button>    
	                    <button class="btn btn-success float-right m-2" type="submit" id="save" hidden="true">Save</button>
	                    <button class="btn btn-dark float-right m-2" type="button" onclick="toEdit()" hidden="true" id="cancel">Cancel</button> 
	                    <button class="btn btn-primary float-right m-2" onclick="printFunction()" id="print">Print</button> 
                    </div>
                </div>
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
                    Are you sure you want to delete this order?
                </div>
                <div class="modal-footer">
                    <form action="http://floor.us-east-1.elasticbeanstalk.com/deleteOrder" method="post">
                        <input 
                            class="form-control" 
                            type="text" 
                            id="pic" 
                            name="pic" 
                            value="${order.picture}" 
                            required 
                            hidden="true">
                        <button class="btn btn-primary" type="submit">Delete</button>
                    </form>
                    <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>