<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="fragments/pageHead.jsp" />
<body>
<jsp:include page="fragments/topNav.jsp" />
<jsp:include page="fragments/header.jsp" />

<div class="container">
	<div class="row row-padded">
		<div class="col-md-12">
			<c:choose>
				<c:when test="${event.imageUrl != null}">
					<img class="img-responsive center-block singleEventImg" alt="Event image" src="<c:url value="${event.imageUrl}" />">
				</c:when>
				<c:otherwise>
					<img class="img-responsive center-block singleEventImg" alt="silly image" src="<c:url value="/resources/img/stache face smaller.png" />">
				</c:otherwise>
			</c:choose>				
		</div>
	</div>

	<div class="row row-padded">
		<div class="col-md-6 col-md-offset-3">
			<span class="glyphicon glyphicon-music"></span>
		 	<h3><c:out value="${event.name}"/></h3>
			<p class="desc text-justify"><c:out value="${event.description}" /></p>
			<br>
			<div class="labels">
				<span class="label label-info"><c:out value="${event.date}" /></span>
				<span class="label label-info"><c:out value="${event.location}" /></span>
			</div>
		</div>
	</div>
</div>

<jsp:include page="fragments/pageFoot.jsp" />