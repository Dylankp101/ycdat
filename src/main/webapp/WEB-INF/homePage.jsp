<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>


<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand">Welcome, <c:out value="${user.firstName}" /></a>
    <form class="d-flex">
      <a class="text-right" href="/logout">Logout</a>
    </form>
  </div>
</nav>

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#4af3df" fill-opacity="1" d="M0,224L80,197.3C160,171,320,117,480,101.3C640,85,800,107,960,106.7C1120,107,1280,85,1360,74.7L1440,64L1440,0L1360,0C1280,0,1120,0,960,0C800,0,640,0,480,0C320,0,160,0,80,0L0,0Z"></path></svg>


	<div class="container">
	  <div class="row">
	    <div class="col-sm">
	    <h1 class="text-center">TV Shows</h1>
			
<table class="table table-success table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Title</th>
      <th scope="col">Network</th>
      <th scope="col">Avg Rating</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody> 
     <c:forEach items="${shows}" var="show">
  
    <tr>
      <td scope="row">${show.id}</td>
      <td><a href="/view/${show.id}">${show.firstName}</a></td>
      <td>${show.lastName}</td>
      <td>${show.rating}<td>
      <td><a href="/delete/${show.id}">Delete</a></td>
    </tr>
	</c:forEach>
  </tbody>
</table>
		
		<a href="/creation">Add Show</a>	    
	 	</div>
	  </div>
	</div>












</body>
</html>