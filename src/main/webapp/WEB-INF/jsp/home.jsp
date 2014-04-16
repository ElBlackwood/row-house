<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<ul class="list-group">
					
						<c:forEach items="${events }" var="eventItem">
						
							<li class="list-group-item">
								<img alt="some" src="<c:url value="resources/img/stache face smaller.png" />">
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
	</div>
	<div class="col-sm-3 visible-lg">
		<div class="sidebar-module sidebar-module-inset">
			<h4 class="list-group-item-heading">Anouncement ipsum</h4> 
			<p class="list-group-item-text">Super important anouncement text.Super important anouncement text.Super important anouncement text.</p>
		</div>
	</div>
</div>
</div>

<jsp:include page="fragments/pageFoot.jsp" />