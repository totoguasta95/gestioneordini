<% session.invalidate(); %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<meta charset="UTF-8">
<title>Accesso negato</title>
</head>
<body>
<jsp:include page="nav.jsp"/>
	<div class="container">
		<div class="page-header">
			<h3>Accesso negato</h3>
		</div>

		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3>Numero di tentativi esauriti!</h3>
			</div> 
			<div class="panel-body">
				<p>Siamo spiacenti, per recuperare le credenziali contattare
					l'amministratore:</p>
				<p>
					<a href="mailto:admin@site.com">admin@site.com</a>
				</p>
				<p>Per tornare alla pagina di login</p>
				<p>
					<a href="login.jsp" class="btn btn-default">Login</a>
				</p>
			</div>
		</div>
	</div>
<footer>
	<%@include file="footer.html"%>
</footer>

</body>
</html>