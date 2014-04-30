<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="fragments/pageHead.jsp" />
<jsp:include page="fragments/topNav.jsp" />
<jsp:include page="fragments/header.jsp" />

<c:set var="guest" value="true"/>
<c:set var="eventSubmit" value="/addEvent"/>
<sec:authorize access="isAuthenticated()">
	<c:set var="guest" value="false"/>
	<c:set var="eventSubmit" value="/admin/addEvent"/>
</sec:authorize>

<div class="container">

<h3 style="text-decoration: underline">New Event</h3>
<form:form method="POST" action="${eventSubmit}" modelAttribute="eventModel" class="form-horizontal" role="form">
		<div class="form-group">
			<label class="col-sm-2 control-label">Name</label>
			<div class="col-sm-10">
				<form:input class="form-control" path="name" max="255"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Location</label>
			<div class="col-sm-10">
				<form:input class="form-control" path="location" max="255"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Date</label>
			<div class="col-sm-10">
				<form:input class="form-control" path="date" type="date" max="255"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Description</label>
			<div class="col-sm-10">
				<form:textarea class="form-control" path="description" rows="3" type="text" maxLength="512"/>
			</div>
		</div>
		<c:if test="${guest eq true}">
			<div class="form-group">
				<label class="col-sm-2 control-label">Your email</label>
				<div class="col-sm-10">
					<form:input class="form-control" path="email" type="email" placeholder="Email address" max="255"/>
				</div>
			</div>
		</c:if>
		<div class="form-group">
    		<div class="col-sm-offset-2 col-sm-10">
      			<button type="submit" class="btn btn-default">Create event</button>
    		</div>
  		</div>
</form:form>	

</div>

<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script src="<c:url value="/resources/js/main.js" />" ></script>
</body>
</html>