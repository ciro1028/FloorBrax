<%-- 
    Document   : serviceAdded
    Created on : May 17, 2018, 11:42:05 AM
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
            <a href="../addOrder.jsp" class="dropdown-item">Add Order</a>
            <a href="../searchByNum.jsp" class="dropdown-item">Search by Number</a>
            <a href="../searchByInstaller.jsp" class="dropdown-item">Search by Installer</a>
            <a href="../searchByDate.jsp" class="dropdown-item">Search by Date</a>
            <a href="../searchByService.jsp" class="dropdown-item">Search by Service</a>
            <a href="../searchBySubdivision.jsp" class="dropdown-item">Search by Subdivision</a>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="dropdown">
          <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">
            Services
          </button>
          <div class="dropdown-menu">
            <a href="addService.jsp" class="dropdown-item">Add Service</a>
            <a href="searchService.jsp" class="dropdown-item">Search Service</a>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="dropdown">
          <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">
            Installers
          </button>
          <div class="dropdown-menu">
            <a href="../installer/addInstaller.jsp" class="dropdown-item">Add Installer</a>
            <a href="../installer/searchInstaller.jsp" class="dropdown-item">Search Installer</a>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="dropdown">
          <button class="btn btn-primary btn-block dropdown-toggle" type="button" data-toggle="dropdown">
            Subdivisions
          </button>
          <div class="dropdown-menu">
            <a href="../subdivision/addSubdivision.jsp" class="dropdown-item">Add Subdivision</a>
            <a href="../subdivision/searchSubdivision.jsp" class="dropdown-item">Search Subdivision</a>
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
        <form action="http://localhost:8080/FloorBrax/addServiceServlet" method="post">
        <div class="row">
               <div class="col-sm">
                    <label>Title</label>
                    <input class="form-control mr-2" type="text" id="title" name="title" 
                           value="<c:out value="${sessionScope.service.title}"/>">
                </div>
                <div class="col-sm">
                    <label>Description</label>
                    <input class="form-control mr-2" type="text" id="desc" name="desc" 
                           value="<c:out value="${sessionScope.service.description}"/>">
                </div>
                <div class="col-sm">

                </div>
            </div>
            <div class="row">
                <div class="col-sm">
                    <div class="form-row">
                        <div class="col">
                            <label>Price</label>
                            <input class="form-control mr-2 text-right" type="text" id="price" name="price" 
                                   value="<c:out value="${sessionScope.service.price}"/>">
                        </div>
                        <div class="col">
                            <label>Price to Pay</label>
                            <input class="form-control mr-2 text-right" type="text" id="pricePay" name="pricePay" 
                                   value="<c:out value="${sessionScope.service.toPay}"/>">
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="form-row">
                        <div class="col">
                            <label>Price per sqf</label>
                            <input class="form-control mr-2 text-right" type="text" id="priceSqf" name="priceSqf" 
                                   value="<c:out value="${sessionScope.service.pricePerSquareFoot}"/>">
                        </div>
                        <div class="col">
                            <label>Price per sqf to pay</label>
                            <input class="form-control mr-2 text-right" type="text" id="pricePaySqf" name="pricePaySqf" 
                                   value="<c:out value="${sessionScope.service.pricePerSquareFootPaid}"/>">
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="form-row">
                        <div class="col">
                            <label>Price w/ ditra</label>
                            <input class="form-control mr-2 text-right" type="text" id="priceDitra" name="priceDitra" 
                                   value="<c:out value="${sessionScope.service.priceperSquareFootDitra}"/>">
                        </div>
                        <div class="col">
                            <label>Price w/ ditra to Pay</label>
                            <input class="form-control mr-2 text-right" type="text" id="pricePayDitra" name="pricePayDitra" 
                                   value="<c:out value="${sessionScope.service.priceperSquareFootDitraToPay}"/>">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm">
            </div>
                        <div class="col-sm">
            </div>
                        <div class="col-sm">
                           <button class="btn btn-primary float-right mt-4  ml-4" type="button" data-toggle="modal" data-target="#deleteModal">Delete Service</button> 
                           <button class="btn btn-primary float-right mt-4" type="submit">Save</button>

                        </div>

    </form>            
    </div>    
    <div class="modal" id="deleteModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Confirm</h5>
            <button class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
              Are you sure you want to delete this service?
          </div>
          <div class="modal-footer">
            <form action="http://localhost:8080/FloorBrax/deleteService" method="post">
                <button class="btn btn-secondary" type="submit">Delete</button>
            </form>
              
            <button class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
</body>
</html>