<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Row House Enterprises!</title>

<link href="<c:url value="resources/css/main.css" />" rel="stylesheet">
</head>
<body>

<jsp:include page="fragments/topNav.jsp" />
<jsp:include page="fragments/header.jsp" />

<div id="content" >

<form:form method="POST" action="${pageContext.servletContext.contextPath}/addEvent" modelAttribute="eventModel">
<h6>New Event: </h6>
	<table>
		<tr>
			<td>Name:</td>
			<td><form:input path="name"/></td>
		</tr>
		<tr>
			<td>Location</td>
			<td><form:input path="location"/></td>
		</tr>
		<tr>
			<td>Description</td>
			<td><form:textarea path="description" rows="5" cols="30"/></td>
		</tr>
		<tr><td><input type="submit" value="Save Event" /></td></tr>
	</table>
</form:form>	

</div>

</body>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script src="<c:url value="resources/js/main.js" />" ></script>
</html>