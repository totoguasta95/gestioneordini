<%
	String admin = (String) session.getAttribute("admin");
	if (admin != null) {
		Statistiche stat = new Statistiche();
		AdminFacade aF = AdminFacade.getInstance();
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.git.bc.AdminFacade"%>
<%@page import="com.git.bc.model.Docente"%>
<%@page import="com.git.bc.model.Corso"%>
<%@page import="com.git.bc.model.Corsista"%>
<%@page import="com.git.bc.Statistiche"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<title>Statistiche</title>
</head>
<body>
<jsp:include page="nav.jsp" />
	<div class="container">
		<div class="page-header">
			<h3>Statistiche</h3>
		</div>
		<div class="table">
			<table class="table table-hover" style="width: 100%;">
			  <thead>
			    <tr>
			      <th style="width: 40%;">Descrizione</th>
			      <th style="width: 60%;">Valore</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td>Numero corsisti totali.</td>
			      <td><%= stat.getTotCorsisti() %></td>
			    </tr>
			    <tr>
			      <td>Nome del corso piu frequentato</td>
			      <td><%= stat.getMaxFrequenza() %></td>
			    </tr>
			    <tr>
			      <td>Data di inizio ultimo corso</td>
			      <td><%= formato.format(stat.getLastDateCorsi()) %></td>
			    </tr>
			    <tr>
			      <td>Durata media dei corsi ( in giorni lavorativi )</td>
			      <td></td>
			    </tr>
			    <tr>
			      <td>Numero di commenti presenti</td>
			      <td><%= stat.getTotCommenti() %></td>
			    </tr>
			    <tr>
			      <td>Elenco corsisti</td>
			      <td>
			      	<div class="row">
			      		<div class="col-md-6">
			      			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
							  <div class="panel panel-default">
							    <div class="panel-heading" role="tab" id="headingCorsisti">
							      <h4 class="panel-title">
							        <a role="button" data-toggle="collapse" data-parent="#accordion" 
							        href="#collapseCorsisti" aria-expanded="true" aria-controls="collapseCorsisti">
							          Corsisti
							        </a>
							      </h4>
							    </div>
							    <div id="collapseCorsisti" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingCorsisti">
							      <div class="list-group">
							      		<%
											Corsista[] corsisti = aF.getAllCorsista();
											for(Corsista a : corsisti) {
										%>
										<form action="/<%=application.getServletContextName()%>/corsiFrequentati.jsp?id=<%= a.getIdCorsista() %>" 
										method="post">
											<button type="submit" class="list-group-item list-group-item-action">
												<%= a.getNomeCorsista() + " " + a.getCognomeCorsista()%>
											</button>
										</form>
									<% } %>
							      </div>
							    </div>
							  </div>
							 </div>
			      		</div>
			      	</div>
			      </td>
			    </tr>
			    <tr>
			      <td>Docenti che possono tenere più tipologie di corso</td>
			      <td>
			      	<div class="row">
			      		<div class="col-md-6">
			      			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
							  <div class="panel panel-default">
							    <div class="panel-heading" role="tab" id="headingDocenti">
							      <h4 class="panel-title">
							        <a role="button" data-toggle="collapse" data-parent="#accordion" 
							        href="#collapseDocenti" aria-expanded="true" aria-controls="collapseDocenti">
							          Docenti
							        </a>
							      </h4>
							    </div>
							    <div id="collapseDocenti" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingDocenti">
							      <ul class="list-group">
							      	<%
									Docente[] docenti = stat.getDocentePiuCorsi();
									for(Docente a : docenti) {
									%>
						      			<li class="list-group-item">
						      			<%= a.getNomeDocente() + " " + a.getCognomeDocente()%>
						      			</li>
									<% } %>
							      </ul>
							    </div>
							  </div>
							 </div>
			      		</div>
			      	</div>
			      </td>
			    </tr>
			    <tr>
			      <td>Corsi con posti disponibili</td>
			      <td>
			      	<div class="row">
			      		<div class="col-md-9">
			      			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
							  <div class="panel panel-default">
							    <div class="panel-heading" role="tab" id="headingCorsi">
							      <h4 class="panel-title">
							        <a role="button" data-toggle="collapse" data-parent="#accordion" 
							        href="#collapseCorsi" aria-expanded="true" aria-controls="collapseCorsi">
							          Corsi
							        </a>
							      </h4>
							    </div>
							    <div id="collapseCorsi" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingCorsi">
							      <ul class="list-group">
							      		<%	
								      		HashMap<Corso,Integer> map = stat.getCorsiDisponibili();
								      		Set<Corso> corsi = map.keySet();
								      		for(Corso corso : corsi) {
										%>
							      		<li class="list-group-item">
							      			<div class="row">
			      								<div class="col-md-7">
			      									Nome corso: <%= corso.getNomeCorso() %>
			      								</div>
			      								<div class="col-md-5">
			      									Posti disponibili: <%= map.get(corso) %>
			      								</div>
			      							</div>
							      		</li>
									<% } %>
							      </ul>
							    </div>
							  </div>
							 </div>
			      		</div>
			      		<div class="col-md-3"></div>
			      	</div>
			      </td>
			    </tr>
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