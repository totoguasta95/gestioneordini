<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@page import="com.git.bc.model.Corso"%>
<%@ page import="com.git.bc.AdminFacade"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<title>Nuovo corsista</title>
<style>
div.col-md-7 {
	text-align: left;
}
</style>

</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="container">
		<div class="page-header" style="text-align: center;">
			<h3>Registra nuova corsista</h3>
		</div>

		<form action="/<%=application.getServletContextName()%>/salvacorsista"
			method="post" id="userForm" class="form-horizontal">

			<!-- Nome --------------------------------------------------------->
			<div class="form-group">
				<label class="col-md-3 col-md-offset-3 control-label" style="text-align: left;">Nome</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-user"></i></span> <input type="text"
							name="nome" id="nome" placeholder="Nome" class="form-control">
					</div>
				</div>
			</div>

			<!-- Cognome ------------------------------------------------------>
			<div class="form-group">
				<label class="col-md-3 col-md-offset-3 control-label" style="text-align: left;">Cognome</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-user"></i></span> <input type="text"
							name="cognome" id="cognome" placeholder="Cognome"
							class="form-control">
					</div>
				</div>
			</div>

			<!-- Precedenti formativi ----------------------------------------------------->
			<div class="form-group">
				<label class="col-md-3 col-md-offset-3 control-label" style="text-align: left;">Precedenti formativi</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="form-check">
						<input class="form-check-input" type="radio" name="gridRadios"
							id="bool" value="si"> <label class="form-check-label"
							for="gridRadios1">Si</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="gridRadios"
							id="bool" value="no" checked> <label
							class="form-check-label" for="gridRadios1">No</label>
					</div>
				</div>
			</div>

			<!-- Nome Corso ---------------------------------------------------->


			<div class="form-group">
				<label class="col-md-3 col-md-offset-3 control-label" style="text-align: left;">Nome corso</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-book"></i></span> <select
							class="form-control" id="nomeCorso" name="nomeCorso">
							<%
							Corso[] corsi = AdminFacade.getInstance().getAllFreeCorso();
							for (int i = 0; i < corsi.length; i++) {
							%>
							<option value="<%=corsi[i].getIdCorso()%>"><%=corsi[i].getNomeCorso()%></option>
							<%
							}
							%>
						</select>
					</div>
				</div>
			</div>

			<!-- Submit ------------------------------------------------------->
			<div class="row">
				<div class="col-md-4 col-md-offset-6">
					<button type="submit" class="btn btn-primary">
						Inserisci&nbsp;<span class="glyphicon glyphicon-send"></span>
					</button>
				</div>
			</div>
		</form>
	</div>
	<footer>
		<%@include file="footer.html"%>
	</footer>

</body>
</html>
