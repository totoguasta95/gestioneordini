<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
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
			</div>
		</div>
	</div>
<footer>
	<%@include file="footer.html"%>
</footer>

</body>
</html>