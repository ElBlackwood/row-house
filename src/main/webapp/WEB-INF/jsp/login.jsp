<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="fragments/pageHead.jsp" />

<body onload='document.loginForm.username.focus();'>

<div class="container">

      <form name="loginform" class="form-signin" role="form" action="<c:url value='j_spring_security_check' />" method="POST">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="email" class="form-control" placeholder="Email address" required="" autofocus="" name="username">
        <input type="password" class="form-control" placeholder="Password" required="" name="password">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">Sign in</button>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <br>
		<div id="output"></div>
        <div class="avatar"></div>
      </form>
      
		<c:if test="${not empty error}">
			<p class="error bg-warning text-danger text-center">${error}</p>
		</c:if>
		<c:if test="${not empty msg}">
			<p class="msg bg-info text-center">${msg}</p>
			<p><a href="/home" class="btn btn-lg btn-default btn-block" >Home</a><p>
		</c:if>
	
</div>


<body>
<jsp:include page="fragments/pageFoot.jsp" />