<%@page import="com.git.bc.AdminFacade"%>
<%@page import="java.util.Enumeration"%>
<%
String admin = (String) session.getAttribute("admin");
if (admin != null) {
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
			<h3>Partecipanti</h3>
		</div>
		<div class="table-responsive">
			<table class="table table-hover" style="width: 100%;">
				<thead class="thead-light">
					<tr>
						<th class="col-md-4">Nome</th>
						<th class="col-md-4">Cognome</th>
						<th class="col-md-4">Precedenti formativi</th>
					</tr>
				</thead>
				<tbody>
					<%
					Corsista[] corsisti = AdminFacade.getInstance().getAllCorsista();
					for (int i = 0; i < corsisti.length; i++) {
					%>
					<tr>
						<td><%=corsisti[i].getNomeCorsista()%></td>
						<td><%=corsisti[i].getCognomeCorsista()%></td>
						<td><%=corsisti[i].isPrecedentiFormativi()%></td>
						<td>
							<form
								action="/<%=application.getServletContextName()%>/aggiungicarrello"
								method="post">
								<input type="hidden" name="nome"
									value="<%=corsisti[i].getNomeCorsista()%>"> <input
									type="hidden" name="cognome"
									value="<%=corsisti[i].getCognomeCorsista()%>"> <input
									type="hidden" name="precedentiFormativi"
									value="<%=corsisti[i].isPrecedentiFormativi()%>">
							</form>
						</td>
					</tr>
				</tbody>
				<%
				}
				%>
			</table>
		</div>
		<br>


		<div class="btn-group">
			<a class="btn btn-primary btn-md" href="nuovoCorsista.jsp"
				role="button"><span class="glyphicon glyphicon-pencil"></span>
				Inserisci
			</a><a class="btn btn-info btn-md" href="statistiche.jsp" role="button">
				<span class="glyphicon glyphicon-th-list"></span> Statistiche
			</a><a class="btn btn-danger btn-md" href="elimina.jsp" role="button">
				<span class="glyphicon glyphicon-trash"></span>Elimina
			</a>
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