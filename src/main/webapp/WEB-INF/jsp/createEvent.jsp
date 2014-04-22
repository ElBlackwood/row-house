<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="fragments/pageHead.jsp" />
<jsp:include page="fragments/topNav.jsp" />
<jsp:include page="fragments/header.jsp" />

<div class="container">

<h3 style="text-decoration: underline">New Event</h3>
<form:form method="POST" action="${pageContext.servletContext.contextPath}/addEvent" modelAttribute="eventModel" class="form-horizontal" role="form">
		<div class="form-group">
			<label class="col-sm-2 control-label">Name</label>
			<div class="col-sm-10">
				<form:input class="form-control" path="name"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Location</label>
			<div class="col-sm-10">
				<form:input class="form-control" path="location"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Date</label>
			<div class="col-sm-10">
				<form:input class="form-control" path="date"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Description</label>
			<div class="col-sm-10">
				<form:textarea class="form-control" path="description" rows="3"/>
			</div>
		</div>
		<div class="form-group">
    		<div class="col-sm-offset-2 col-sm-10">
      			<button type="submit" class="btn btn-default">Create event</button>
    		</div>
  		</div>
</form:form>	

</div>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script src="<c:url value="resources/js/main.js" />" ></script>
</body>
</html>