<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">

<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
      </ol>
      <div class="carousel-inner">
        <div class="item">
          <img alt="" src="<c:url value="resources/img/home1.jpg" />"/>
          <div class="container">
            <div class="carousel-caption">
            </div>
          </div>
        </div>
        <div class="item">
          <img alt="" src="<c:url value="resources/img/home2.jpg" />"/>
          <div class="container">
            <div class="carousel-caption">
            </div>
          </div>
        </div>
        <div class="item active">
          <img alt="" src="<c:url value="resources/img/home3.jpg" />"/>
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
		<li><a href="${pageContext.servletContext.contextPath }/home">What's On</a></li>
		<li><a href="/aboutus">About Us</a></li>
		<li><a href="/contact">Contact</a></li>
	</ul>
</div>
</nav>

</div>

