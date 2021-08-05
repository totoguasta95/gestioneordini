<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="nav.jsp"/>
	<div class="container">
		<div class="page-header">
			<h3>Numero di tentativi esauriti!</h3>
		</div>

		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3>Prova a fare il login</h3>
			</div>
			<div class="panel-body">
				<p>Siamo spiacenti, per malfunzionamento contattare
					amministratore:</p>
				<p>
					<a href="mailto:admin@site.com">admin@site.com</a>
				</p>
				<p>Oppure torna alla pagina precedente</p>
				<p>
					<input type="button" class="btn btn-default" value="Indietro"
						onclick="window.history.back()">
				</p>
			</div>
		</div>
	</div>
	<footer>
		<%@include file="footer.html"%>
	</footer>


</body>
</html>