<%
	String admin = (String) session.getAttribute("admin");
	if (admin != null) {
		Corsista corsista = null;
		Corso[] corsi = null;
		AdminFacade aF = AdminFacade.getInstance();
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
		if(request.getParameter("id") != null){
			int id = Integer.parseInt(request.getParameter("id"));
			corsista = aF.getById(id);
			corsi = aF.getCorsiByIdCorsista(id);
		}
%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.git.bc.model.Docente"%>
<%@page import="com.git.bc.model.Corso"%>
<%@page import="com.git.bc.model.Corsista"%>
<%@page import="com.git.bc.AdminFacade"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<title>Corsi Frequentati</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="container">
		<div class="page-header">
			<h3>Corsi frequentati da <%= corsista.getNomeCorsista() +
			" " + corsista.getCognomeCorsista() %></h3>
		</div>
		<div class="table-responsive">
			<table class="table table-hover" style="width: 100%;">
				<thead class="thead-light">
					<tr>
						<th class="col-md-1">Id Corso</th>
						<th class="col-md-2">Nome</th>
						<th class="col-md-1">Data inizio</th>
						<th class="col-md-1">Data fine</th>
						<th class="col-md-1">Costo</th>
						<th class="col-md-3">Commenti</th>
						<th class="col-md-1">Aula</th>
						<th class="col-md-2">Docente</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < corsi.length; i++) {
							
					%>
					<tr>
						<td><%=corsi[i].getIdCorso()%></td>
						<td><%=corsi[i].getNomeCorso()%></td>
						<td><%=formato.format(corsi[i].getDataInizioCorso())%></td>
						<td><%=formato.format(corsi[i].getDataFineCorso())%></td>
						<td><%=String.format("%.2f", corsi[i].getCostoCorso())%>&euro;</td>
						<td><%=corsi[i].getCommentiCorso()%></td>
						<td><%=corsi[i].getAulaCorso()%></td>
						<% Docente doc =  aF.getByIdDocente(corsi[i].getIdDocente()); %>
						<td><%=doc.getCognomeDocente() + " " + doc.getNomeDocente()%></td>
					</tr>
				</tbody>
				<%
				}
				%>
			</table>
		</div>
		<br>

		<button class="btn btn-info" onclick="window.history.back()">Indietro</button>

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