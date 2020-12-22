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
    <a class="navbar-brand">BELT EXAM</a>
    <form class="d-flex">
      <a class="text-right" href="/logout">Logout</a>
    </form>
  </div>
</nav>

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#4af3df" fill-opacity="1" d="M0,224L80,197.3C160,171,320,117,480,101.3C640,85,800,107,960,106.7C1120,107,1280,85,1360,74.7L1440,64L1440,0L1360,0C1280,0,1120,0,960,0C800,0,640,0,480,0C320,0,160,0,80,0L0,0Z"></path></svg>


	<div class="container">
	  <div class="row">
	    <div class="col-sm">
	    <h1 class="text-center">${shows.firstName}</h1>
	   	<h4 class="text-center">Network: ${shows.lastName}</h4>
	    <h5 class="text-center"><a  href="/edit/${shows.id}">EDIT</a></h5>
	    

			    
	 	</div>
	 	<div class="col-sm">
	 		<table class="table">
	 			    <h5 class="text-center">People Who Rated The Show</h5>
	 		
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Rating</th>
    </tr>
  </thead>
  <tbody>
  
    <c:forEach items="${ratings}" var="show">
  
    <tr>
      <td>${user.firstName}</td>
      <td>${show.rating}</td>
    </tr>
	</c:forEach>
  
 
 </tbody>
</table>
	 	</div>
	  </div>
	</div>




<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-sm-6">
    
    <h5>Rate The Show</h5>
    
   <form method="post" action="/create/rating" modelAttribute="rating">
<input name="firstName" type="hidden" class="form-control" value="${shows.firstName }" aria-label="Username" aria-describedby="basic-addon1">
    	<input name="user_id" type="hidden" class="form-control" value="${shows.id}" aria-label="Username" aria-describedby="basic-addon1">

    
		<select name="rating" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
		  <option value="1">One</option>
		  <option value="2">Two</option>
		  <option value="3">Three</option>
		  <option value="4">Four</option>
		  <option value="5">Five</option> 
		</select>
		    
    			 <button type="submit" class="btn btn-info">SUBMIT</button>
    
    </form>
    
    
    </div>
  </div>
</div>








</body>
</html>