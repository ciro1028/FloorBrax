<%-- 
    Document   : InstallerView
    Created on : May 18, 2018, 9:52:44 AM
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
  <script type="text/javascript" src="scripts/javascript.js"></script>
  <script type="text/javascript" src="../scripts/javascript.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body onload="getSatus()">
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
            <div class="row float-right mt-2"><small><label>User: </label><label class="ml-1" id="userLabel"><c:out value="${sessionScope.user.name}"/></label></small></div>
        </div>
    </div>  
  <div class="container my-4">
        <form action="http://localhost:8080/FloorBrax/addInstallersServlet" method="post">
        <div class="row">
               <div class="col-sm">
                    <label>Name</label>
                    <input class="form-control mr-2" type="text" id="name" name="name"
                           value="<c:out value="${sessionScope.installer.name}"/>">
                           
                </div>
                <div class="col-sm">
                    <label>Description</label>
                    <input class="form-control mr-2" type="text" id="phone" name="phone"
                           value="<c:out value="${sessionScope.installer.phone}"/>">
                </div>
                <div class="col-sm">
                    <button class="btn btn-primary float-right mt-4  ml-4" type="button" data-toggle="modal" data-target="#deleteModal">Delete Installer</button>
                    <button class="btn btn-primary float-right mt-4" type="submit">Save</button>
                </div>
            </div>

    </form>
    </div>
    <div class="container">
      <h4 class="bg-primary p-2 w-100 text-center text-white">List of orders</h4>
    </div>
    <div class="container">
        <form action="http://localhost:8080/FloorBrax/installerSearchOrdersServlet" method="post">
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
    <div class="container">
        <div class="row">
            <div class="col-sm mt-4">
                Range Selected:  <label><c:out value="${sessionScope.rangeSelected}"/></label>
            </div>
            <div class="col-sm">
                
            </div>
            <div class="col-sm">
                <div class="input-group mt-2">
                    <span class="input-group-addon bg-primary text-white">TOTAL</span>
                    <input class="form-control text-right" type="text" value="$<c:out value="${sessionScope.total}"/>.00">
                </div>
            </div>
        </div>
    </div>
    <div class="container">
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
          <c:set var="orders" value=""/>
          <c:forEach items="${sessionScope.orderList}" var="order" varStatus="loop"> 
              <c:set var="orders" value="${orders}${order.orderNum}%"/>
        <tr>
          <th scope="row">${loop.index}</th>
          <td id="<c:out value="${order.orderNum}"/>" class="text-center"><c:out value="${order.orderNum}"/></td>
          <td class="text-center"><c:out value="${order.date}"/></td>
          <td class="text-center"><c:out value="${sessionScope.installer.name}"/></td>
          <td class="text-center"><c:out value="${sessionScope.orderSubs[loop.index]}"/></td>
          <td class="text-center">
              <c:forEach items="${order.services}" var="service">
                  <c:out value="${service} /"/>
              </c:forEach>

          </td>
          <td class="text-center align-middle"><label id="<c:out value="${order.orderNum}&"/>"><c:out value="${order.status}"/></label></br>
            <small>
                <a id="<c:out value="${order.orderNum}*"/>" 
                   href="<c:url value="http://localhost:8080/FloorBrax/markOrderStatusInstallerAllServlet">
                       <c:param name="id" value="${order.orderNum}"></c:param></c:url>">
                </a>
            </small>
        </td>
        <td class="text-center">$<c:out value="${order.toPay}"/>.00</td>
          <td class="text-center">
                <a class="btn btn-primary" href="<c:url value="http://localhost:8080/FloorBrax/goToOrderSelectedServlet"><c:param name="num" value="${order.orderNum}"></c:param></c:url>">View</a>
            </td>
        </tr>
        </c:forEach>
      <input id="orders_num" type="text" value="<c:out value="${orders}"/>" onload="getSatus()" hidden="true">
      </tbody>
    </table>
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
            <form action="http://localhost:8080/FloorBrax/deleteInstallerServlet" method="post">
                <button class="btn btn-secondary" type="submit">Delete</button>
            </form>

            <button class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    </body>
</html>

