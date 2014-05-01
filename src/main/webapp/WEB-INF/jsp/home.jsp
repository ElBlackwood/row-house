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
		<c:if test="${not empty msg}">
			<div class="alert alert-warning">
			<a class="close" data-dismiss="alert">&times;</a>			
			<c:out value="${msg}" />
			</div>
		</c:if>
	</div>
</div>
<div class="row">
	<div class="col-lg-9">
		<div class="panel panel-defualt">
				<div class="panel-body">
				<c:if test="${not empty deleting}">
					<h3 class="text-danger"><strong>Choose event to disable/delete</strong></h3>
				</c:if>
				
					<ul class="list-group">
					
						<c:forEach items="${events}" var="eventItem">
						
							<li class="list-group-item">
								<sec:authorize access="isAuthenticated()">
									<c:if test="${not empty deleting}">
									<div class="pull-right">
											<c:choose>
												<c:when test="${eventItem.approved}">
													<a href="/admin/disableEvent/${eventItem.id}" class="btn btn-warning">Disable</a>
												</c:when>
												<c:otherwise>
													<a href="/admin/enableEvent/${eventItem.id}" class="btn btn-success">Enable </a>
												</c:otherwise>
											</c:choose>
											<a href="/admin/editEvent/${eventItem.id}" class="btn btn-info">Edit</a>
											<a href="/admin/deleteEvent/${eventItem.id}" class="btn btn-danger">Delete</a>
										</div>
									</c:if>
								</sec:authorize>
			
								<c:choose>
									<c:when test="${eventItem.imageUrl != null}">
										<img alt="some" src="<c:url value="${eventItem.imageUrl}" />">
									</c:when>
									<c:otherwise>
										<img alt="some" src="<c:url value="/resources/img/stache face smaller.png" />">
									</c:otherwise>
								</c:choose>								
								<span class="glyphicon glyphicon-music"></span>
							 	<h4><a href="/singleEvent/${eventItem.id}"><c:out value="${eventItem.name}" /></a></h4>
								<p class="desc"><c:out value="${eventItem.description}" /></p>
								<br>
								<div class="labels">
									<span class="label label-info"><c:out value="${eventItem.date}" /></span>
									<span class="label label-info"><c:out value="${eventItem.location}" /></span>
								</div>
							</li>
							
						</c:forEach>
					</ul>

				</div>
		</div>
		
		<div class="panel panel-defualt">
				<div class="panel-body">
				<c:if test="${not empty deleting}">
					<h3 class="text-danger"><strong>Choose guest event to disable/delete</strong></h3>
				</c:if>
					<ul class="list-group">
					
						<c:forEach items="${guestEvents}" var="guestEventItem">
							<li class="list-group-item">
								<sec:authorize access="isAuthenticated()">
									<c:if test="${not empty deleting}">
										<div class="pull-right">
											<c:choose>
												<c:when test="${guestEventItem.approved}">
													<a href="/admin/disableEvent/${guestEventItem.id}" class="btn btn-warning">Disable</a>
												</c:when>
												<c:otherwise>
													<a href="/admin/enableEvent/${guestEventItem.id}" class="btn btn-success">Enable</a>
												</c:otherwise>
											</c:choose>
											<a href="/admin/editEvent/${guestEventItem.id}" class="btn btn-info">Edit</a>
											<a href="/admin/deleteEvent/${guestEventItem.id}" class="btn btn-danger">Delete</a>
										</div>
									</c:if>
								</sec:authorize>
								<c:choose>
									<c:when test="${guestEventItem.imageUrl != null}">
										<img alt="some" src="<c:url value="${eventItem.imageUrl}" />">
									</c:when>
									<c:otherwise>
										<img alt="some" src="<c:url value="/resources/img/stache face smaller.png" />">
									</c:otherwise>
								</c:choose>	
								<span class="glyphicon glyphicon-music"></span>
								<span class="glyphicon glyphicon-user">  Guest event</span>
							 	<h4><a href="/singleEvent/${guestEventItem.id}"><c:out value="${guestEventItem.name}" /></a></h4>
								<p class="desc"><c:out value="${guestEventItem.description}" /></p>
								<br>
								<div class="labels">
									<span class="label label-info"><c:out value="${guestEventItem.date}" /></span>
									<span class="label label-info"><c:out value="${guestEventItem.location}" /></span>
									<span class="label label-info"><c:out value="${guestEventItem.email}" /></span>
								</div>
							</li>
							
						</c:forEach>
					</ul>
				</div>
		</div>
	</div>
	<div class="col-lg-3 visible-lg">
		<div class="sidebar-module sidebar-module-inset sidebar-announce-item">
			<h4 class="list-group-item-heading">Anouncement ipsum</h4> 
			<p class="list-group-item-text">Needs padding..... Super important anouncement text.Super important anouncement text.Super important anouncement text.</p>
		</div>
		<div class="sidebar-module sidebar-module-inset sidebar-announce-item">
			<h4 class="list-group-item-heading">Think you got a good event?</h4> 
			<p class="list-group-item-text">Submit it it here to have it reviewed for approval. If your event is all in order we'll display on the homepage beneath our own. </p>
			<br>
			<a href="/guestSubmit" ><button type="button" class="btn btn-default">Submit event</button></a>
		</div>
	</div>
</div>
</div>

<jsp:include page="fragments/pageFoot.jsp" />