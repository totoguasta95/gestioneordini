<%@page import="java.util.Enumeration"%>
<%
//String admin = (String) session.getAttribute("admin");
//if (admin != null) {
%>
<%@page import="com.git.bc.model.Corsista"%>
<%@page import="com.git.bc.model.Docente"%>
<%@page import="com.git.bc.model.Corso"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<title>Corsisti</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="container">
		<div class="page-header">
			<h3>Corsisti iscritti ai corsi</h3>
		</div>
		<div class="table-responsive">
			<table class="table table-hover" style="width: 100%;">
				<thead class="thead-light">
					<tr>
						<th scope="col">Nome</th>
						<th scope="col">Cognome</th>
						<th scope="col">Nome corso</th>
						<th scope="col">data inizio</th>
						<th scope="col">data fine</th>
						<th scope="col">Commenti</th>
						<th scope="col">Precedenti formativi</th>
						<th scope="col">Aulacorso</th>
						<th scope="col">Docente</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<div class="panel panel-info">
			<div class="panel-heading"></div>
			<div class="panel-body"></div>
		</div>

		<div class="btn-group">
			<a class="btn btn-primary btn-lg" href="nuovoCorsista.jsp" role="button">
				<span class="glyphicon glyphicon-pencil"></span> Inserisci
			</a>
			<a class="btn btn-info btn-lg" href="nuovoCorsista.jsp" role="button">
				<span class="glyphicon glyphicon-th-list"></span> Statistiche
			</a>
			<a class="btn btn-danger btn-lg" href="elimina.jsp" role="button">
				<span class="glyphicon glyphicon-trash"> </span> Elimina corsi
				</a>
		</div>

	</div>




	<footer>
		<%@include file="footer.html"%>
	</footer>
</body>
</html>
<%
//} else
//	response.sendRedirect("login.jsp");
%>