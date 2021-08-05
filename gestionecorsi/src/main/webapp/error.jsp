<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ page import="com.git.architecture.dao.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<!-- Latest compiled and minified CSS -->
<meta charset="UTF-8">
<title>Errore</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="container">
		<div class="page-header">
			<h3>Si è verificato un problema</h3>
		</div>

		<%
		if (exception instanceof ClassNotFoundException) {
		%>

		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3>Classe del Driver database non trovata</h3>
			</div>
			<div class="panel-body">
				<p><%=exception.getMessage()%></p>
				<p>Controllare DAOConstants e .lib del progetto</p>
				<p>Oppure torna alla pagina precedente</p>
				<p>
					<input type="button" class="btn btn-default" value="Indietro"
						onclick="window.history.back()">
				</p>
			</div>
		</div>

		<%
		} else if (exception instanceof DAOException) {
		%>

		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3>DAOException</h3>
			</div>
			<div class="panel-body">
				<p><%=exception.getMessage()%></p>
				<p>Controllare DAOConstants e .lib del progetto</p>
				<p>Oppure torna alla pagina precedente</p>
				<p>
					<input type="button" class="btn btn-default" value="Indietro"
						onclick="window.history.back()">
				</p>
			</div>
		</div>

		<%
		} else if (exception instanceof ParseException) {
		%>

		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3>ParseException</h3>
			</div>
			<div class="panel-body">
				<p><%=exception.getMessage()%></p>
				<p>Oppure torna alla pagina precedente</p>
				<p>
					<input type="button" class="btn btn-default" value="Indietro"
						onclick="window.history.back()">
				</p>
			</div>
		</div>

		<%
		} else {
		%>

		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3><%=exception.getClass().getName()%></h3>
			</div>
			<div class="panel-body">
				<p><%=exception.getMessage()%></p>
				<p>
					<%
					exception.printStackTrace(new PrintWriter(out));
					%>
				</p>
				<p>Oppure torna alla pagina precedente</p>
				<p>
					<input type="button" class="btn btn-default" value="Indietro"
						onclick="window.history.back()">
				</p>
			</div>
		</div>

		<%
		}
		%>

	</div>
	<footer>
		<%@include file="footer.html"%>
	</footer>
	


</body>
</html>