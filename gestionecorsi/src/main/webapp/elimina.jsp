<%@page import="java.util.Enumeration"%>
<%
String admin = (String) session.getAttribute("admin");
if (admin != null) {
%>
<%@page import="com.git.bc.model.Corsista"%>
<%@page import="com.git.bc.model.Corso"%>
<%@page import="com.git.bc.model.Docente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<title>Elimina</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="container">
		<div class="page-header">
			<h3>Elimina corsi</h3>
		</div>
		<div>
			<table class="table table-striped" style="margin-top: 50px">
				<thead>
					<tr>
						<th scope="col">nome</th>
						<th scope="col">cognome</th>
						<th scope="col">nome corso</th>
						<th scope="col">data inizio</th>
						<th scope="col">data fine</th>
						<th scope="col">commenti</th>
						<th scope="col">precedenti formativi</th>
						<th scope="col">aulacorso</th>
						<th scope="col">docente</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>nome</td>
						<td>cognome</td>
						<td>nomeCorso</td>
						<td>dataInizio</td>
						<td>commenti</td>
						<td>precedentiFormativi</td>
						<td>aulacorso</td>
						<td>docente</td>
						<td>
							<button class="btn btn-danger btn-sm">
								Delete</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<div class="panel panel-info">
			<div class="panel-heading"></div>
			<div class="panel-body"></div>
		</div>
	</div>
	<footer>
		<%@include file="footer.html"%>
	</footer>
</body>
</html>
<%
} else
	response.sendRedirect("login.jsp");
%>