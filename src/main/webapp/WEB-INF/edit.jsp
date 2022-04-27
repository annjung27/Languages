<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Languages</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<form:form action="/languages/${language.id}" method="post" modelAttribute="language">
	   		<input type="hidden" name="_method" value="put">
			<p>
				<form:label path="name">Name:</form:label>
				<form:errors path="name"/>
				<form:input path="name" class="form-control"/>
			</p>
			<p>
				<form:label path="creator">Creator</form:label>
				<form:errors path="creator"/>
				<form:input path="creator" class="form-control"/>
			</p>
					    
			<p>
				<form:label path="version">Version:</form:label>
				<form:errors path="version"/>     
				<form:input path="version" class="form-control"/>
			</p>			       
			<input type="submit" value="Submit" class="btn btn-primary"/>				
		</form:form>
	</div>
   
</body>
</html>