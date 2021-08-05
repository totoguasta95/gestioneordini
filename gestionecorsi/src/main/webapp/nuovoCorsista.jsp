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

		<form action="/<%=application.getServletContextName()%>/salvadati"
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


			<!-- Data inizio  ------------------------------------------------------>
			<div class="form-group">
				<label class="col-md-1 control-label">Data inizio</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group date" id="dp">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-calendar"></i></span> <input type="text"
							name="dataInizio" id="dataInizio" placeholder="GG/MM/AAAA"
							class="form-control">
					</div>
				</div>
				<div class="col-md-7 control-label" id="infoDataInizio"></div>
			</div>

			<script type="text/javascript">
				$(function() {
					$('#dp').datepicker({
						format : 'dd/mm/yyyy',
						autoclose : true,
						startDate : '01/01/2021',
						endDate : new Date()
					}).on(
							'changeDate',
							function(e) {
								$('#userForm').bootstrapValidator(
										'revalidateField', 'dataInizio');
							});
				}); 
			</script>

			<!-- Data Fine  ------------------------------------------------------>
			<div class="form-group">
				<label class="col-md-1 control-label">Data fine</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group date" id="dp1">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-calendar"></i></span> <input type="text"
							name="dataFine" id="dataFine" placeholder="GG/MM/AAAA"
							class="form-control">
					</div>
				</div>
				<div class="col-md-7 control-label" id="infoDataFine"></div>
			</div>

			<script type="text/javascript">
				$(function() {
					$('#dp1').datepicker({
						format : 'dd/mm/yyyy',
						autoclose : true,
						startDate : '01/01/2021',
						endDate : new Date()
					}).on(
							'changeDate',
							function(e) {
								$('#userForm').bootstrapValidator(
										'revalidateField', 'dataFine');
							});
				});
			</script>
			<!-- Commenti ----------------------------------------------------->
			<div class="form-group">
				<label class="col-md-1 control-label">Commenti</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-pencil"></i></span>
						<textarea name="commenti" id="commenti" placeholder="Commenti"
							class="form-control" maxlength="10" cols="40" rows="3"
							style="resize: none" maxlength="200"></textarea>
					</div>
				</div>

				<div class="col-md-7 control-label" id="infoCommenti"></div>
			</div>

			<!-- Precedenti formativi ----------------------------------------------------->
			<div class="form-group">
				<label class="col-md-1 control-label">Precedenti formativi</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="form-check">
						<input class="form-check-input" type="radio" name="gridRadios"
							id="si" value="si"> <label class="form-check-label"
							for="gridRadios1"> Si </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="gridRadios"
							id="no" value="no"> <label class="form-check-label"
							for="gridRadios1"> No </label>
					</div>


					<div class="col-md-7 control-label" id="infoPrecedentiFormativi"></div>
				</div>
			</div>

			<!-- Aula corso -------------------------------------------------------->
			<div class="form-group">
				<label class="col-md-1 control-label">Aula corso</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-modal-window"></i></span> <input type="text"
							name="aulaCorso" id="aulaCorso" placeholder="Aula corso"
							class="form-control" maxlength="3">
					</div>
				</div>
				<div class="col-md-7 control-label" id="infoAulaCorso"></div>
			</div>
			<!-- Docente --------------------------------------------------------->
			<div class="form-group">
				<label class="col-md-1 control-label">Docente</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-user"></i></span> <input type="text"
							name="docente" id="docente" placeholder="Docente"
							class="form-control">
					</div>
				</div>
				<div class="col-md-7 control-label" id="infoDocente"></div>
			</div>

			<!-- Submit ------------------------------------------------------->
			<div class="row">
				<div class="col-md-4 col-md-offset-1">
					<button type="submit" class="btn btn-primary">
						Registrati&nbsp;<span class="glyphicon glyphicon-send"></span>
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