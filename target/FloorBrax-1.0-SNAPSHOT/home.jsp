<%-- 
    Document   : home
    Created on : May 14, 2018, 6:48:28 PM
    Author     : Ciro
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Business.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FloorBrax - System Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script type="text/javascript" src="scripts/javascript.js"></script>
</head>
<body onload="getStatus()">
    <div class="container">
        <h1 class="display-3 text-center text-white my-4 bg-primary"><a class="text-white" href="http://floor.us-east-1.elasticbeanstalk.com/goToHomeServlet">FloorBrax</a></h1>
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
            <div class="row float-right mt-2"><small><label>User: </label><label class="ml-1" id="userLabel"><c:out value="${sessionScope.user.name}"/></label></small></div>
        </div>
    </div>
    <div class="container">
        <div class="container border border-primary mt-4"
        <hr>
        <div class="alert alert-danger text-center mt-3">
          Orders for today.
        </div>
            <div style="overflow-x:auto;">
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
                    <c:set value="" var="orders"/>
                    <c:forEach items="${sessionScope.todayOrders}" var="order" varStatus="loop">
                        <c:set var="orders" value="${orders}${order.orderNum}%"/>
                        <form action="http://floor.us-east-1.elasticbeanstalk.com/orderSearchByNumServlet" method="post">
                            <tr>
                                <th scope="row" class="align-middle"><c:out value="${loop.index}"/></th>
                                <td id="<c:out value="${order.orderNum}"/>" class="text-center align-middle"><c:out value="${order.orderNum}"/></td>
                                <td class="text-center align-middle"><c:out value="${order.date}"/></td>
                                <td class="text-center align-middle"><c:out value="${sessionScope.todayInstallers[loop.index]}"/></td>
                                <td class="text-center align-middle"><c:out value="${sessionScope.todaySubs[loop.index]}"/></td>
                                <td class="text-center align-middle">
                                    <c:forEach items="${order.services}" var="service">
                                        <c:out value="${service} / "/>
                                    </c:forEach>
                                </td>
                                <td 
                                    class="text-center align-middle">
                                    <label id="<c:out value="${order.orderNum}&"/>"><c:out value="${order.status}"/></label></br>
                                    <small>
                                        <a id="<c:out value="${order.orderNum}*"/>" 
                                           href="<c:url value="http://floor.us-east-1.elasticbeanstalk.com/markOrderStatusServlet">
                                               <c:param name="id" value="${order.orderNum}"></c:param></c:url>">
                                        </a>
                                    </small>
                                </td>
                                <td class="text-center align-middle">
                                    <a class="btn btn-primary" href="<c:url value="http://floor.us-east-1.elasticbeanstalk.com/goToOrderSelectedServlet"><c:param name="num" value="${order.orderNum}"></c:param></c:url>">View</a>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    <input id="orders_num" type="text" value="<c:out value="${orders}"/>" hidden="true" onload="getSatus()">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>

