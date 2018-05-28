<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

<style type="text/css">
	.login-form {
		width: 340px;
    	margin: 50px auto;
	}
    .login-form form {
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
</style>

</head>
<body>

	
			<div class="login-form">
			    <form name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>
			        <h2 class="text-center">Marcom Apps FSD</h2>       
			        <div class="form-group">
			            <input type="text" class="form-control" name='username' placeholder="Username">
			        </div>
			        <div class="form-group">
			            <input type="password" class="form-control" name='password' placeholder="Password">
			        </div>
			        <div class="form-group">
			            <button type="submit" class="btn btn-primary btn-block">Log in</button>
			        </div>
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />       
			    </form>
			</div>

<%-- 		<form name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'> --%>
<!-- 		  <table> -->
<!-- 			<tr> -->
<!-- 				<td>User:</td> -->
<!-- 				<td><input type='text' name='username' value=''></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>Password:</td> -->
<!-- 				<td><input type='password' name='password' /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td colspan='2'><input name="submit" type="submit" class="btn btn-primary" value="submit" /></td> -->
<!-- 			</tr> -->
<!-- 		  </table> -->
<%-- 			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
<!-- 		</form> -->

</body>
</html>