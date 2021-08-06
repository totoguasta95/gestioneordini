<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.git.bc.model.Corso"%>
<%@page import="com.git.bc.model.Docente"%>
<%@page import="com.git.bc.AdminFacade"%>
<%@page import="java.util.Date"%>
<%
String admin = (String) session.getAttribute("admin");
if (admin != null) {
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<title>Elimina</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
						<th scope="col">nome corso</th>
						<th scope="col">data inizio</th>
						<th scope="col">data fine</th>
						<th scope="col">commenti</th>
						<th scope="col">aulacorso</th>
						<th scope="col">docente</th>
					</tr>
				</thead>

				<tbody>
					<%
					Corso[] corsi = AdminFacade.getInstance().getAllCorso();
					Docente doc = new Docente();
					AdminFacade af = AdminFacade.getInstance();
					Date oggi = new Date();
					for (int i = 0; i < corsi.length; i++) {
						if (corsi[i].getDataInizioCorso().after(oggi)) {
							doc = af.getByIdDocente(corsi[i].getIdDocente());
					%>
					<tr>
						<td><%=corsi[i].getNomeCorso()%></td>
						<td><%=corsi[i].getDataInizioCorso()%></td>
						<td><%=corsi[i].getDataFineCorso()%></td>
						<td><%=corsi[i].getCommentiCorso()%></td>
						<td><%=corsi[i].getAulaCorso()%></td>
						<td><%=doc.getCognomeDocente()%></td>
						<td>
							<form
								action="/<%=application.getServletContextName()%>/eliminacorso"
								method="post">
								<input type="hidden" name="id"
									value="<%=corsi[i].getIdCorso()%>">
								<button type="submit" class="btn btn-danger btn-md">
									<span class="glyphicon glyphicon-trash "></span> Elimina
								</button>
							</form>
						</td>
					</tr>
					<%
					}
					}
					%>
				</tbody>
			</table>
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