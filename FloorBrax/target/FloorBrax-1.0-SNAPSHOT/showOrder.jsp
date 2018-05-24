<%-- 
    Document   : showOrder
    Created on : May 18, 2018, 6:33:28 PM
    Author     : Ciro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FloorBrax - System Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="scripts/javascript.js"></script>
    <script type="text/javascript" src="../scripts/javascript.js"></script> 
    <script>
        $( function() {
        $( "#datepicker" ).datepicker();
        } );
    </script>
</head>

<body onload="setPending()">
    <div class="container">
        <h1 class="display-3 text-center text-white my-4 bg-primary"><a class="text-white" href="">FloorBrax</a></h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="dropdown">
                    <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">
                        Orders
                    </button>
                    <div class="dropdown-menu">
                        <a href="addOrder.jsp" class="dropdown-item">Add Order</a>
                        <a href="searchByNum.jsp" class="dropdown-item">Search by Number</a>
                        <a href="searchByInstaller.jsp" class="dropdown-item">Search by Installer</a>
                        <a href="searchByDate.jsp" class="dropdown-item">Search by Date</a>
                        <a href="searchByService.jsp" class="dropdown-item">Search by Service</a>
                        <a href="searchBySubdivision.jsp" class="dropdown-item">Search by Subdivision</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="dropdown">
                    <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">
                        Services
                    </button>
                    <div class="dropdown-menu">
                        <a href="service/addService.jsp" class="dropdown-item">Add Service</a>
                        <a href="service/searchService.jsp" class="dropdown-item">Search Service</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="dropdown">
                    <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">
                        Installers
                    </button>
                    <div class="dropdown-menu">
                        <a href="installer/addInstaller.jsp" class="dropdown-item">Add Installer</a>
                        <a href="installer/searchInstaller.jsp" class="dropdown-item">Search Installer</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="dropdown">
                    <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">
                        Subdivisions
                    </button>
                    <div class="dropdown-menu">
                        <a href="subdivision/addSubdivision.jsp" class="dropdown-item">Add Subdivision</a>
                        <a href="subdivision/searchSubdivision.jsp" class="dropdown-item">Search Subdivision</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="container">
            <div 
                class="row float-right mt-2">
                <small>
                    <label>User: </label>
                    <label 
                        class="ml-1" 
                        id="userLabel">
                        <c:out value="${sessionScope.user.name}"/>
                    </label>
                </small>
            </div>
        </div>
    </div> 
    <div class="container mt-4">
        <div class="alert alert-success text-center">
            Add order
        </div>
    </div>
<form action="http://localhost:8080/FloorBrax/editOrderServlet" method="post">
    <div class="container mt-4">
        <div class="container border border-primary">
            <div class="row">
                <div class="col-sm">
                    <label class="mt-2 text-dark">Order Number:</label><br>
                    <input 
                        class="form-control font-weight-bold ml-2 text-primary text-right border border-dark pr-2" 
                        id="order_num" 
                        name="orderNum" 
                        value="<c:out value="${sessionScope.order.orderNum}"/>" 
                        disabled 
                        required>
                    <label class="mt-2 text-dark">Date:</label><br>
                    <input 
                        class="form-control font-weight-bold ml-2 text-primary text-right border border-dark pr-2" 
                        id="datepicker" 
                        name="datepicker" 
                        value="<c:out value="${sessionScope.order.date}"/>" 
                        disabled 
                        required>    
                    <label class="mt-2 text-dark">Subdivision:</label><br>
                    <input 
                        class="form-control font-weight-bold ml-2 text-primary text-right border border-dark pr-2" 
                        id="sub" 
                        name="sub" 
                        value="<c:out value="${sessionScope.subSelected}"/>" 
                        disabled>
                    <select class="form-control ml-2" id="subdivision" name="subdivision" required hidden="true">
                        <option></option>
                        <c:forEach items="${sessionScope.listOfSubdivisions}" var="sub">
                            <option><c:out value="${sub.name}"/></option>
                        </c:forEach>
                    </select>
                    <label class="mt-2 text-dark">Installer:</label><br>
                    <input 
                        class="form-control font-weight-bold ml-2 text-primary text-right border border-dark pr-2" 
                        id="installerDis" 
                        name="installerDis" 
                        value="<c:out value="${sessionScope.installerSelected}"/>" 
                        disabled>
                    <select class="form-control ml-2" id="installer" name="installer" required hidden="true">
                        <option></option>
                        <c:forEach items="${sessionScope.listOfInstallers}" var="installer">
                            <option value="<c:out value="${installer.name}"/>" ><c:out value="${installer.name}"/></option>
                        </c:forEach>
                    </select>    
                    <label class="mt-2 text-dark">Status</label><br>
                    <input 
                        class="form-control font-weight-bold ml-2 text-right border border-dark pr-2" 
                        id="statusDis" 
                        name="statusDis" 
                        value="<c:out value="${sessionScope.order.status}"/>" 
                        disabled>
                    <select 
                        class="form-control ml-2" 
                        id="status" 
                        name="status" 
                        required 
                        hidden="true" 
                        onload="onPendingColor()">
                        <option></option>
                        <option value="Pending">Pending</option>
                        <option value="Completed">Completed</option>
                    </select>
                    <small><label class="mt-2 ml-2">Square Footage: </label></small></br>
                    <small>
                        <label 
                            class="mt-2 ml-4 text-primary mr-2 font-weight-bold">
                            Tile - <c:out value="${sessionScope.order.squareFootage}"/>
                        </label>/<label class="mt-2 ml-2 text-danger mr-2 font-weight-bold"> Ditra - <c:out value="${sessionScope.order.sqfDitra}"/></label>/<label class="mt-2 ml-2 text-success mr-2 font-weight-bold">Hardwood - <c:out value="${sessionScope.order.sqfHardwood}"/>.</label>
                    </small>
                </div>
                <div class="col-sm">
                    <label class="mt-2 text-dark">Services:</label>
                    <div id="rowService">
                        <textarea 
                            class="form-control font-weight-bold text-primary" 
                            rows="5" 
                            disabled><c:forEach items="${sessionScope.order.services}" var="service"><c:out value="${service}"/>&#10</c:forEach>
                        </textarea>  
                    </div>
                    <div id="rowserviceEdit" hidden="true">
                        <select class="form-control" id="service" onchange="onChangeSelect()">
                            <option id="option0"></option>
                            <c:forEach items="${sessionScope.listOfServices}" var="service">
                                <option id="<c:out value="${service.title}"/>"><c:out value="${service.title}"/></option>
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
                                onkeypress="return isNumberKey(event)">Sqft
                            <input 
                                class="form-control mr-2 text-right" 
                                value="0" 
                                type="text" 
                                id="sqfDitra" 
                                name="sqfDitra" 
                                disabled 
                                onkeypress="return isNumberKey(event)"> Sqft w/ ditra
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
                                    name="addedExtraDesc">
                                <label>Add Extra</label>
                            </div>
                            <div class="col">
                                <input 
                                    class="form-control text-right" 
                                    type="text" id="addedExtraCost" 
                                    name="addedExtraCost" 
                                    value="0" 
                                    onkeypress="return isNumberKey(event)" 
                                    onblur="addExtraLeave()" 
                                    onclick="addExtraEntry()">
                                <label>Cost</label>
                            </div>
                            <input 
                                class="form-control mr-2 mt-2 text-right" 
                                value="0" 
                                type="text" 
                                id="extraCost" 
                                name="extraCost" 
                                disabled 
                                onkeypress="return isNumberKey(event)"> Extra Cost Total
                        </div>
                        <select class="form-control mt-2" name="services" id="listOfServices" multiple>
                            <c:forEach items="${sessionScope.order.services}" var="service">
                                <option id="<c:out value="${service}"/>"><c:out value="${service}"/></option>
                            </c:forEach>
                        </select>
                        <label>List of services</label>
                        <button 
                            class="btn btn-primary mt-4 float-right" 
                            type="button" 
                            onclick="removeService()">Remove</button>
                        <button 
                            class="btn btn-primary mt-4 float-right mr-2" 
                            type="button" 
                            onclick="getService()">Add Service</button>
                        <div class="col-sm" hidden="true">
                            <input type="text" value="0" id="sftPH" name="sftPH" >
                            <input type="text" value="0" id="sftDPH" name="sftDPH">
                            <input type="text" value="0" id="sftHPH" name="sftHPH">
                            <input type="text" value="0" id="ec" name="ec">
                            <input type="text" id="servicesPlaceholder" name="servicesPlaceholder">
                        </div> 
                    </div>
                </div>
                <div class="col-sm">
                    <label class="mt-2 text-dark">Details:</label>
                    <textarea 
                        class="form-control text-primary font-weight-bold" 
                        rows="5" 
                        id="details" 
                        name="details" 
                        disabled><c:out value="${sessionScope.order.description}"/>
                    </textarea>
                    <label 
                        class="mt-2 text-dark">Order Total: $<c:out value="${sessionScope.order.total}"/>.00</label></br>
                        <label class="mt-2 text-dark">Pay Installer: $<c:out value="${sessionScope.order.toPay}"/>.00</label></br>
                    <a 
                        class="font-weight-bold mt-4" 
                        id="clickToSee" 
                        href="<c:out value="${sessionScope.order.pic}"/>" data-toggle="lightbox">
                        <label class="mt-4 text-dark">Image:</label>
                            Click to see original order
                        </a>
                    <div class="form-group p-2" hidden="true" id="upload">
                        <label class="mt-4" for="pic">Original Order</label>
                        <input 
                            class="form-control" 
                            type="text" 
                            id="pic" 
                            name="pic" 
                            value="<c:out value="${sessionScope.order.pic}"/>" 
                            required >
                    </div>
                    <small>
                        <label 
                            class="mt-4 text-dark">Order added by:</br> <c:out value="${sessionScope.userSelected}"/> on</label><label class="mt-4 text-dark" id="addedDate"><c:out value="${sessionScope.order.dateAdded}"/></label>
                    </small>          
                </div>
            </div>
            <div class="row">
                <div class="col-sm">
                </div>
                <div class="col-sm">
                </div>
                <div class="col-sm">
                    <button class="btn btn-danger float-right m-2" type="button" data-toggle="modal" data-target="#deleteModal">Delete Order</button>
                    <button class="btn btn-warning float-right m-2" type="button" id="edit" onclick="toEdit()">Edit Order</button>    
                    <button class="btn btn-success float-right m-2" type="submit" id="save" hidden="true">Save</button>  
                    <button class="btn btn-primary float-right m-2" onclick="printFunction()">Print</button> 
                </div>
            </div>
        </div>
    </div>     
</form>
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
                    <form action="http://localhost:8080/FloorBrax/deleteOrder" method="post">
                        <input 
                            class="form-control" 
                            type="text" 
                            id="pic" 
                            name="pic" 
                            value="<c:out value="${sessionScope.order.pic}"/>" 
                            required 
                            hidden="true">
                        <button class="btn btn-primary" type="submit">Delete</button>
                    </form>
                    <button class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>