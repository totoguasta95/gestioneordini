<%
	boolean bloccato = (getServletContext().getAttribute("bloccato") != null) ?
			(boolean) getServletContext().getAttribute("bloccato") : false;

	if(bloccato == true) {
		response.sendRedirect("loginError.jsp");
	}

	String admin = (String) session.getAttribute("admin");
	if(admin == null) {
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp" %>
<title>Login</title>
</head>
<body>
<jsp:include page="nav.jsp"/> 
<div class="container">
	<div class="page-header">
		<h3 style="text-align: center;">Inserire i dati per effettuare il login</h3>
	</div>
	
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<form action="/<%=application.getServletContextName()%>/controllo" method="post"
			id="userForm" class="form-horizontal">
				
				<!------------------------------------------------ Username -->
				<div class="form-group">
					<label class="col-md-4 control-label">Username</label>
					<div class="col-md-6 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
							<input type="text" name="username" id="username"
							placeholder="Username..." class="form-control" maxlength="10"/>
						</div>
					</div>
				</div>
				
				<!------------------------------------------------ Password -->
				<div class="form-group">
					<label class="col-md-4 control-label">Password</label>
					<div class="col-md-6 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-lock"></i>
							</span>
							<input type="password" name="password" id="password"
							placeholder="Password..." class="form-control" />
						</div>
					</div>
				</div>
				
				<% if(getServletContext().getAttribute("countErr") != null) {
					 int countErr= (int)getServletContext().getAttribute("countErr");
					 String msg = (countErr == 1) ? 
					 	"ATTENZIONE! Ultimo tentativo!"
						: "Tentativo di accesso fallito! Numero tentativi rimanenti: " + countErr;
				%>
				<div class="form-group">
					<div class="alert alert-danger" style="font-weight: bold; text-align: center;">
						<%= msg %>
					</div>
				</div> 
				<% } %>
				
				<div class="row" style="text-align: center; margin-top: 30px; margin-bottom: 50px;">
					<button type="submit" class="btn btn-warning">
						Login&nbsp;<span class="glyphicon glyphicon-log-in"></span>
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
<footer class="footer"><%@include file="footer.html" %></footer>

</body>
</html>
<%
	} else
		response.sendRedirect("corsisti.jsp");
%>