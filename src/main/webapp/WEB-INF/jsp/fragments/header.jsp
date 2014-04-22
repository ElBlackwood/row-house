<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div id="header">

<c:set var="imgLink" value="/home"/>

<sec:authorize access="isAuthenticated()">
	<c:set var="imgLink" value="/admin"/>
</sec:authorize>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <a href="${imgLink}"><img class="rotato-img" alt="" src="<c:url value="/resources/img/home1.jpg" />"/></a>
          <div class="container">
            <div class="carousel-caption">
            </div>
          </div>
        </div>
        <div class="item">
          <a href="${imgLink}"><img class="rotato-img" alt="" src="<c:url value="/resources/img/home2.jpg" />"/></a>
          <div class="container">
            <div class="carousel-caption">
            </div>
          </div>
        </div>
        <div class="item">
          <a href="${imgLink}"><img class="rotato-img" alt="" src="<c:url value="/resources/img/home3.jpg" />"/></a>
          <div class="container">
            <div class="carousel-caption">
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>

<nav class="navbar navbar-default center" role="navigation">
<div class="navbar-inner">
	<ul class="nav navbar-nav">
		<li><a href="/home">What's On</a></li>
		<li><a href="/aboutus">About Us</a></li>
		<li><a href="/contact">Contact</a></li>
	</ul>
</div>
</nav>

</div>

