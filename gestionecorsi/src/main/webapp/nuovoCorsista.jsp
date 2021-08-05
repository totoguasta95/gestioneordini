<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
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
		<div class="page-header">
			<h3>Inserire i dati per la registrazione del nuovo corsista</h3>
		</div>

		<form action="/<%=application.getServletContextName()%>/salvacorsista"
			method="post" id="userForm" class="form-horizontal">

			<!-- Nome --------------------------------------------------------->
			<div class="form-group">
				<label class="col-md-1 control-label">Nome</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-user"></i></span> <input type="text"
							name="nome" id="nome" placeholder="Nome" class="form-control">
					</div>
				</div>
				<div class="col-md-7 control-label" id="infoNome"></div>
			</div>

			<!-- Cognome ------------------------------------------------------>
			<div class="form-group">
				<label class="col-md-1 control-label">Cognome</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-user"></i></span> <input type="text"
							name="cognome" id="cognome" placeholder="Cognome"
							class="form-control">
					</div>
				</div>
				<div class="col-md-7 control-label" id="infoCognome"></div>
			</div>

			<!-- Precedenti formativi ----------------------------------------------------->
			<div class="form-group">
				<label class="col-md-1 control-label">Precedenti formativi</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="form-check">
						<input class="form-check-input" type="radio" name="gridRadios"
							id="bool" value="si"> <label class="form-check-label"
							for="gridRadios1">Si</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="gridRadios"
							id="bool" value="no"> <label class="form-check-label"
							for="gridRadios1">No</label>
					</div>


					<div class="col-md-7 control-label" id="precedentiFormativi"></div>
				</div>
			</div>

			<!-- Nome Corso ---------------------------------------------------->
			<div class="form-group">
				<label class="col-md-1 control-label">Nome corso</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-book"></i></span> <input name="nomeCorso"
							id="nomeCorso" placeholder="Nome corso" class="form-control"
							style="resize: none" />
					</div>
				</div>
				<div class="col-md-7 control-label" id="infoNomeCorso"></div>
			</div>

			<!-- Submit ------------------------------------------------------->
			<div class="row">
				<div class="col-md-4 col-md-offset-1">
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