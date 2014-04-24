<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="fragments/pageHead.jsp" />
<jsp:include page="fragments/topNav.jsp" />
<jsp:include page="fragments/header.jsp" />

<div class="container" >

<div class="row">
	<div class="col-lg-9">
		<div class="panel panel-defualt">
				<div class="panel-body">
				<c:if test="${not empty deleting}">
					<h3 class="text-danger"><strong>Choose event to delete</strong></h3>
				</c:if>
				
					<ul class="list-group">
					
						<c:forEach items="${events }" var="eventItem">
						
							<li class="list-group-item">
								<sec:authorize access="isAuthenticated()">
									<c:if test="${not empty deleting}">
										<a href="/admin/deleteEvent/${eventItem.id}" class="btn btn-danger close pull-right">X Delete</a>
									</c:if>
								</sec:authorize>
								
								<img alt="some" src="<c:url value="/resources/img/stache face smaller.png" />">
								<span class="glyphicon glyphicon-music"></span>
							 	<h4><c:out value="${eventItem.name}" /></h4>
								<p class="desc"><c:out value="${eventItem.description}" /></p>
								<span class="label label-info"><c:out value="${eventItem.date}" /></span>
								<span class="label label-info"><c:out value="${eventItem.location}" /></span>
								
							</li>
							
						</c:forEach>
					</ul>

				</div>
		</div>
		
		<div class="panel panel-defualt">
				<div class="panel-body">
				<c:if test="${not empty deleting}">
					<h3 class="text-danger"><strong>Choose event to delete</strong></h3>
				</c:if>
					<ul class="list-group">
					
						<c:forEach items="${guestEvents}" var="guestEventItem">
						
							<li class="list-group-item">
								<sec:authorize access="isAuthenticated()">
									<c:if test="${not empty deleting}">
										<a href="/admin/deleteEvent/${guestEventItem.id}" class="btn btn-danger close pull-right">X Delete</a>
									</c:if>
								</sec:authorize>
								
								<img alt="some" src="<c:url value="/resources/img/stache face smaller.png" />">
								<span class="glyphicon glyphicon-music"></span>
								<span class="glyphicon glyphicon-user">  Guest event</span>
							 	<h4><c:out value="${guestEventItem.name}" /></h4>
								<p class="desc"><c:out value="${guestEventItem.description}" /></p>
								<span class="label label-info"><c:out value="${guestEventItem.date}" /></span>
								<span class="label label-info"><c:out value="${guestEventItem.location}" /></span>
								<span class="label label-info"><c:out value="${guestEventItem.email}" /></span>
								
							</li>
							
						</c:forEach>
					</ul>
				</div>
		</div>
	</div>
	<div class="col-lg-3 visible-lg">
		<div class="sidebar-module sidebar-module-inset">
			<h4 class="list-group-item-heading">Anouncement ipsum</h4> 
			<p class="list-group-item-text">Needs padding.... Super important anouncement text.Super important anouncement text.Super important anouncement text.</p>
		</div>
		<div class="sidebar-module sidebar-module-inset">
			<h4 class="list-group-item-heading">Think you got a good event?</h4> 
			<p class="list-group-item-text">Submit it it here to have it reviewed for approval. If your event is all in order we'll display on the homepage beneath our own. </p>
			<p class="list-group-item-text"><a href="/guestSubmit" ><button type="button" class="btn btn-default">Submit event</button></a></p>
		</div>
	</div>
</div>
</div>

<jsp:include page="fragments/pageFoot.jsp" />