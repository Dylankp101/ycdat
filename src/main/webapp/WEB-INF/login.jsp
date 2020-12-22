<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body class="bg-light bg-gradient">


<nav class="navbar navbar-dark bg-dark bg-gradient">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1 text-info">Belt Exam</span>
  </div>
</nav>




<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#4af3df" fill-opacity="1" d="M0,224L6.2,224C12.3,224,25,224,37,202.7C49.2,181,62,139,74,117.3C86.2,96,98,96,111,96C123.1,96,135,96,148,85.3C160,75,172,53,185,85.3C196.9,117,209,203,222,208C233.8,213,246,139,258,138.7C270.8,139,283,213,295,202.7C307.7,192,320,96,332,96C344.6,96,357,192,369,234.7C381.5,277,394,267,406,256C418.5,245,431,235,443,218.7C455.4,203,468,181,480,149.3C492.3,117,505,75,517,69.3C529.2,64,542,96,554,138.7C566.2,181,578,235,591,229.3C603.1,224,615,160,628,133.3C640,107,652,117,665,117.3C676.9,117,689,107,702,106.7C713.8,107,726,117,738,144C750.8,171,763,213,775,218.7C787.7,224,800,192,812,202.7C824.6,213,837,267,849,288C861.5,309,874,299,886,282.7C898.5,267,911,245,923,229.3C935.4,213,948,203,960,181.3C972.3,160,985,128,997,117.3C1009.2,107,1022,117,1034,149.3C1046.2,181,1058,235,1071,256C1083.1,277,1095,267,1108,240C1120,213,1132,171,1145,144C1156.9,117,1169,107,1182,138.7C1193.8,171,1206,245,1218,256C1230.8,267,1243,213,1255,170.7C1267.7,128,1280,96,1292,122.7C1304.6,149,1317,235,1329,224C1341.5,213,1354,107,1366,106.7C1378.5,107,1391,213,1403,234.7C1415.4,256,1428,192,1434,160L1440,128L1440,0L1433.8,0C1427.7,0,1415,0,1403,0C1390.8,0,1378,0,1366,0C1353.8,0,1342,0,1329,0C1316.9,0,1305,0,1292,0C1280,0,1268,0,1255,0C1243.1,0,1231,0,1218,0C1206.2,0,1194,0,1182,0C1169.2,0,1157,0,1145,0C1132.3,0,1120,0,1108,0C1095.4,0,1083,0,1071,0C1058.5,0,1046,0,1034,0C1021.5,0,1009,0,997,0C984.6,0,972,0,960,0C947.7,0,935,0,923,0C910.8,0,898,0,886,0C873.8,0,862,0,849,0C836.9,0,825,0,812,0C800,0,788,0,775,0C763.1,0,751,0,738,0C726.2,0,714,0,702,0C689.2,0,677,0,665,0C652.3,0,640,0,628,0C615.4,0,603,0,591,0C578.5,0,566,0,554,0C541.5,0,529,0,517,0C504.6,0,492,0,480,0C467.7,0,455,0,443,0C430.8,0,418,0,406,0C393.8,0,382,0,369,0C356.9,0,345,0,332,0C320,0,308,0,295,0C283.1,0,271,0,258,0C246.2,0,234,0,222,0C209.2,0,197,0,185,0C172.3,0,160,0,148,0C135.4,0,123,0,111,0C98.5,0,86,0,74,0C61.5,0,49,0,37,0C24.6,0,12,0,6,0L0,0Z"></path></svg>


<div class="container">
  <div class="row justify-content-center">
    <div class="col-sm-4">
    
    
    <h1>Login</h1>
    <p><c:out value="${error}" /></p>
 	  <form method="post" action="/login">  
	    <div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">Email</span>
	  		<input name="email"  class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
		</div>
	    <div class="input-group mb-3">
 			 <span class="input-group-text" id="basic-addon1">Password</span>
 			 <input name="password" type="password" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
		</div>
    <button type="submit" class="btn btn-primary">Login</button>
    </form>
    
    
    </div>
    
    
    
    <div class="col-sm-4">
    
    	<h1>Register!</h1>
    
    <p><form:errors path="user.*"/></p>
    
        <form:form method="post" action="/registration" modelAttribute="user">
        <div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">First Name</span>
	  		<form:input path="firstName" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
		<div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">Last Name</span>
	  		<form:input path="lastName" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
    
    	 <div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">Email</span>
	  		<form:input path="email"  class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
		<div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">Location</span>
	  		<form:input path="location" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
		<div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">State</span>
	  		<form:input path="state" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
		
	    <div class="input-group mb-3">
 			 <span class="input-group-text" id="basic-addon1">Password:</span>
 			 <form:input path="password" type="password" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
    
    	 <div class="input-group mb-3">
 			 <span class="input-group-text" id="basic-addon1">Confirm P:</span>
 			 <form:input path="passwordConfirmation" type="password" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
    	    <button type="submit" class="btn btn-primary">Register</button>
    	     
    	</form:form>
   
    </div>
    
    
  </div>
</div>


     <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#4af3df" fill-opacity="1" d="M0,224L6.2,224C12.3,224,25,224,37,202.7C49.2,181,62,139,74,117.3C86.2,96,98,96,111,96C123.1,96,135,96,148,85.3C160,75,172,53,185,85.3C196.9,117,209,203,222,208C233.8,213,246,139,258,138.7C270.8,139,283,213,295,202.7C307.7,192,320,96,332,96C344.6,96,357,192,369,234.7C381.5,277,394,267,406,256C418.5,245,431,235,443,218.7C455.4,203,468,181,480,149.3C492.3,117,505,75,517,69.3C529.2,64,542,96,554,138.7C566.2,181,578,235,591,229.3C603.1,224,615,160,628,133.3C640,107,652,117,665,117.3C676.9,117,689,107,702,106.7C713.8,107,726,117,738,144C750.8,171,763,213,775,218.7C787.7,224,800,192,812,202.7C824.6,213,837,267,849,288C861.5,309,874,299,886,282.7C898.5,267,911,245,923,229.3C935.4,213,948,203,960,181.3C972.3,160,985,128,997,117.3C1009.2,107,1022,117,1034,149.3C1046.2,181,1058,235,1071,256C1083.1,277,1095,267,1108,240C1120,213,1132,171,1145,144C1156.9,117,1169,107,1182,138.7C1193.8,171,1206,245,1218,256C1230.8,267,1243,213,1255,170.7C1267.7,128,1280,96,1292,122.7C1304.6,149,1317,235,1329,224C1341.5,213,1354,107,1366,106.7C1378.5,107,1391,213,1403,234.7C1415.4,256,1428,192,1434,160L1440,128L1440,320L1433.8,320C1427.7,320,1415,320,1403,320C1390.8,320,1378,320,1366,320C1353.8,320,1342,320,1329,320C1316.9,320,1305,320,1292,320C1280,320,1268,320,1255,320C1243.1,320,1231,320,1218,320C1206.2,320,1194,320,1182,320C1169.2,320,1157,320,1145,320C1132.3,320,1120,320,1108,320C1095.4,320,1083,320,1071,320C1058.5,320,1046,320,1034,320C1021.5,320,1009,320,997,320C984.6,320,972,320,960,320C947.7,320,935,320,923,320C910.8,320,898,320,886,320C873.8,320,862,320,849,320C836.9,320,825,320,812,320C800,320,788,320,775,320C763.1,320,751,320,738,320C726.2,320,714,320,702,320C689.2,320,677,320,665,320C652.3,320,640,320,628,320C615.4,320,603,320,591,320C578.5,320,566,320,554,320C541.5,320,529,320,517,320C504.6,320,492,320,480,320C467.7,320,455,320,443,320C430.8,320,418,320,406,320C393.8,320,382,320,369,320C356.9,320,345,320,332,320C320,320,308,320,295,320C283.1,320,271,320,258,320C246.2,320,234,320,222,320C209.2,320,197,320,185,320C172.3,320,160,320,148,320C135.4,320,123,320,111,320C98.5,320,86,320,74,320C61.5,320,49,320,37,320C24.6,320,12,320,6,320L0,320Z"></path></svg>
     
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
     
</body>
</html>