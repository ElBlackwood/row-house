<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">

<div id="imageSlider">
	<img alt="" src="<c:url value="/resources/img/horizon.jpg" />"/>
<%-- 	<%=request.getContextPath()%> --%>
</div>

<div id="navbar">
	<a href="${pageContext.servletContext.contextPath }/home">What's On</a>
	<a href="/aboutus">About Us</a>
	<a href="/whosnick">Who's Nick?</a>
</div>

</div>