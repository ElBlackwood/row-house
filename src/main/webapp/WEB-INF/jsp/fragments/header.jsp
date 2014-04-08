<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">

<div id="imageSlider">
	<img alt="" src="<c:url value="resources/img/horizon.jpg" />"/>
</div>

<nav class="navbar navbar-default center" role="navigation">
<div class="navbar-inner">
	<ul class="nav navbar-nav">
		<li class="active"><a href="${pageContext.servletContext.contextPath }/home">What's On</a></li>
		<li><a href="/aboutus">About Us</a></li>
		<li><a href="/whosnick">Who's Nick?</a></li>
	</ul>
</div>
</nav>

</div>

