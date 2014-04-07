<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<%-- 	<c:out value="${event.name}" /> --%>
	<ul>
	
		<c:forEach items="${events }" var="eventItem">
		
			<li><c:out value="${eventItem.name }" /></li>
		</c:forEach>
	</ul>
	
	<aside>
		<h5>Super important announcements</h5>
	</aside>
</div>

</body>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script src="<c:url value="resources/js/main.js" />" ></script>
</html>