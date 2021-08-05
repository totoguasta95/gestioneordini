<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<title>login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="container">
		<div class="page-header">
			<h3>Inserire i dati per la registrazione</h3>
		</div>

		<form action="/<%=application.getServletContextName()%>/controllo"
			method="post" id="userForm" class="form-horizontal">



			<!-- Username ----------------------------------------------------->
			<div class="form-group">
				<label class="col-md-1 control-label">Username</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-user"></i></span> <input type="text"
							name="username" id="username" placeholder="Username"
							class="form-control" maxlength="10">
					</div>
				</div>
				<div class="col-md-7 control-label" id="infoUsername"></div>
			</div>

			<!-- Password ----------------------------------------------------->
			<div class="form-group">
				<label class="col-md-1 control-label">Password</label>
				<div class="col-md-4 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-lock"></i></span> <input type="password"
							name="password" id="password" placeholder="Password"
							class="form-control">
					</div>
				</div>
				<div class="col-md-7 control-label" id="infoPassword"></div>
			</div>


			<!-- Submit ------------------------------------------------------->
			<div class="row">
				<div class="col-md-4 col-md-offset-1">
					<button type="submit" class="btn btn-primary">
						Login&nbsp;<span class="glyphicon glyphicon-log-in"></span>
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