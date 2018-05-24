<%-- 
    Document   : home
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" /> 
    <script type="text/javascript" src="scripts/javascript.js"></script>
    <script type="text/javascript" src="../scripts/javascript.js"></script>
</head>
<body>
    <div class="container">
        <h1 class="display-3 text-center text-white my-4 bg-primary"><a class="text-white" href="home.jsp">FloorBrax</a></h1>
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
                    <label class="ml-1" id="userLabel"><c:out value="${sessionScope.user.name}"/></label>
                </small>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <div class="alert alert-info text-center">
            Search Orders by Date
        </div>
    </div>
    <div class="container">
        <form action="http://localhost:8080/FloorBrax/searchOrdersByDateServlet" method="post">
            <div class="p-3 mb-2 bg-light border border-primary">
                <div class="row">
                    <div class="col-sm">
                        <input class="form-control mr-2 text-right" type="text" id="reportrange" name="reportrange">Select Range
                    </div>
                    <div class="col-sm">
                        <button class="btn btn-primary" type="submit">Get Orders</button>
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>


