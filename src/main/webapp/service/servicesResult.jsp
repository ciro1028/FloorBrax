<%-- 
    Document   : searchService
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
</head>
<body>
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
            <a href="../uploadPicture.jsp" class="dropdown-item">Add Order</a>
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
        <form action="http://floor.us-east-1.elasticbeanstalk.com/searchServiceServlet" method="post"
            <div class="input-group mt-4">
                <input class="form-control" type="text" name="name" placeholder="Enter Service Name" required>
                <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit">Search</button>
                </span>
            </div>
        </form>
        
    </div>
    <div class="container">
        <form action="http://floor.us-east-1.elasticbeanstalk.com/searchServiceServlet" method="post">
            <button class="btn btn-link" type="submit">Show all services</button>
        </form>
    </div>
    
    <div class="container">
        <div style="overflow-x:auto;">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Id</th>
                  <th>Title</th>
                  <th>Description</th>
                  <th>View Service</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td><c:out value="${sessionScope.service.id}"/></td>
                  <td><c:out value="${sessionScope.service.title}"/></td>
                  <td><c:out value="${sessionScope.service.description}"/></td>
                  <td><a class="btn btn-primary" href="service/editService.jsp">View</a></td>
                </tr>
              </tbody>
            </table>
        </div>
  </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

    </body>
</html>
