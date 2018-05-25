<%-- 
    Document   : addOrders
    Created on : May 14, 2018, 6:48:28 PM
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
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="scripts/javascript.js"></script>
    <script type="text/javascript" src="../scripts/javascript.js"></script> 
</head>
<body>
    <div class="container">
        <h1 class="display-3 text-center text-white my-4 bg-primary"><a class="text-white" href="http://floor.us-east-1.elasticbeanstalk.com/loginSvlt">FloorBrax</a></h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="dropdown">
                    <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">
                        Orders
                    </button>
                    <div class="dropdown-menu">
                        <a href="uploadPicture.jsp" class="dropdown-item">Add Order</a>
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
            <div class="row float-right mt-2">
                <small>
                    <label>User: </label><label class="ml-1" id="userLabel"><c:out value="${sessionScope.user.name}"/></label>
                </small>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <div class="alert alert-info text-center">
            Add new Order
        </div>
    </div>
    <form action="http://floor.us-east-1.elasticbeanstalk.com/addOrdersServlet" method="post">
        <div class="container">
            <div class="container border border-primary">
                <div class="row mt-2">
                    <div class="col-sm">
                        <label>Order Number</label>
                        <input class="form-control mr-2" type="text" id="orderNum" name="orderNum" required>
                        <label class="mt-3">Date</label>
                        <input class="form-control" id="datepicker" name="datepicker" placeholder="MM/DD/YYYY" type="text" required/>
                        <label class="mt-3">Status</label>
                        <select class="form-control" id="status" name="status" required>
                            <option></option>
                            <option value="Pending">Pending</option>
                            <option value="Conpleted">Completed</option>
                        </select>
                        <h3 class="display-5 bg-primary text-white text-center mt-4">Details</h3>
                        <textarea class="form-control" rows="5" id="details" name="details"></textarea>
                    </div>
                    <div class="form-group col-sm">
                        <label for="service">Service</label>
                        <select class="form-control" id="service" onchange="onChangeSelect()">
                            <option id="option0"></option>
                            <c:forEach items="${sessionScope.listOfServices}" var="service" varStatus="loop">
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
                                <input class="form-control text-right" type="text" id="addedExtraDesc" name="addedExtraDesc">
                                <label>Add Extra</label>
                            </div>
                            <div class="col">
                                <input class="form-control text-right" type="text" id="addedExtraCost" name="addedExtraCost" value="0" onkeypress="return isNumberKey(event)" onblur="addExtraLeave()" onclick="addExtraEntry()">
                                <label>Cost</label>
                            </div>
                            <input class="form-control mr-2 mt-2 text-right" value="0" type="text" id="extraCost" name="extraCost" disabled onkeypress="return isNumberKey(event)"> Extra Cost Total
                        </div>
                        <select class="form-control mt-2" name="services" id="listOfServices" multiple>
                          <option></option>
                        </select>
                        <label>List of services</label>
                        <button class="btn btn-primary mt-4 float-right" type="button" onclick="removeService()">Remove</button>
                        <button class="btn btn-primary mt-4 float-right mr-2" type="button" onclick="getService()">Add Service</button>
                    </div>
                    <div class="form-group col-sm">
                        <label for="subdivision">Subdivision</label>
                        <select class="form-control" id="subdivision" name="subdivision" required>
                            <option></option>
                            <c:forEach items="${sessionScope.listOfSubdivisions}" var="sub" varStatus="loop">
                                <option><c:out value="${sub.name}"/></option>
                            </c:forEach>
                        </select>
                        <label for="installer">Installer</label>
                        <select class="form-control" id="installer" name="installer" required>
                            <option></option>
                            <c:forEach items="${sessionScope.listOfInstallers}" var="installer">
                                <option><c:out value="${installer.name}"/></option>
                            </c:forEach>
                        </select>
                        <label class="mt-4" for="pic">Original Order</label>
                        <input class="form-control" type="text" id="pic" name="pic" value="<c:out value="${sessionScope.path}"/>" required>
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
            <input type="text" value="0" id="sftPH" name="sftPH" >
            <input type="text" value="0" id="sftDPH" name="sftDPH">
            <input type="text" value="0" id="sftHPH" name="sftHPH">
            <input type="text" value="0" id="ec" name="ec">
            <input type="text" id="servicesPlaceholder" name="servicesPlaceholder">
        </div> 
    </form>
    <div class="container">
        <footer class="footer bg-primary"></footer>
    </div>                               
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>
    