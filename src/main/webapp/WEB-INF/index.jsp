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
   <div class=container>		
		<div>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Name</th>
					    <th>Creator</th>
					    <th>Version</th>					    
					    <th>Action</th>	
					    				    
					    					    
					</tr>			
				</thead>
				<tbody>
					<c:forEach items="${alldaLanguages}" var="language">
						<tr>
							<td><a href="/languages/${language.id}">${language.name}</a></td>						
							<td>${language.creator}</td>						
							<td>$${language.version}</td>							
							<td class="d-flex flex-row">
								<a href="/languages/edit/${language.id}"><button class="btn btn-success">edit</button></a>
								<form action="/languages/${language.id}" method="post">
									<input type="hidden" name="_method" value="delete">
									<input type="submit" value="delete" class="btn btn-danger"> 
								</form>
							</td>					
						</tr>
					</c:forEach>													
				</tbody>		
			</table>
		</div>
		
		<div>			
			<form:form action="/languages" method="post" modelAttribute="language">
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
	</div>
</body>
</html>