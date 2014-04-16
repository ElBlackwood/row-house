<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<body>
<jsp:include page="fragments/pageHead.jsp" />
<jsp:include page="fragments/topNav.jsp" />
<jsp:include page="fragments/header.jsp" />

<div id="content" >

<form:form method="POST" action="${pageContext.servletContext.contextPath}/addEvent" modelAttribute="eventModel" class="form-horizontal">
<h6>New Event: </h6>
	<table>
		<tr>
			<td class="control-label">Name:</td>
			<td class="controls"><form:input path="name"/></td>
		</tr>
		<tr>
			<td class="control-label">Location</td>
			<td class="controls"><form:input path="location"/></td>
		</tr>
		<tr>
			<td class="control-label">Date</td>
			<td class="controls"><form:input path="date"/></td>
		</tr>
		<tr>
			<td class="control-label">Description</td>
			<td class="controls"><form:textarea path="description" rows="5" cols="30"/></td>
		</tr>
		<tr><td class="btn"><button type="submit">Save event</button></td></tr>
	</table>
</form:form>	

</div>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script src="<c:url value="resources/js/main.js" />" ></script>
</body>
</html>