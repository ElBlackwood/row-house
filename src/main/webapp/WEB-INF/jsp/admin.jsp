<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="fragments/pageHead.jsp" />
<jsp:include page="fragments/topNav.jsp" />
<jsp:include page="fragments/header.jsp" />

<c:url value="/j_spring_security_logout" var="logoutUrl" />

<div class="container">

<h3 style="text-decoration: underline">Admin panel</h3>
	<a href="/home" class="btn btn-default btn-lg btn-block">Home</a>
	<a href="/admin/createEvent" class="btn btn-primary btn-lg btn-block">Create Event</a>
	<a href="/admin/deleteEvent" class="btn btn-primary btn-lg btn-block">Delete Event</a>
	<a class="btn btn-primary btn-lg btn-block">Large button</a>
	
	<a href="javascript:formSubmit()" class="btn btn-default btn-lg btn-block">Logout</a>
</div>

	<!-- csrt for log out-->
	<form action="${logoutUrl}" method="post" id="logoutForm">
	  <input type="hidden" 
		name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	</form>

	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>

<jsp:include page="fragments/pageFoot.jsp" />