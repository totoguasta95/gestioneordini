<%
String admin = (String) session.getAttribute("admin");
if (admin != null) {
	session.invalidate();
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="head.jsp"%>
<title>logout</title>
</head>
<body> 
	<jsp:include page="nav.jsp" />
	<div class="container">
		<div class="page-header">
			<h3>Logout</h3>
		</div>

		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3>Effettuato il logout</h3>
			</div>
			<div class="panel-body">
				<h3>Per accedere effettua il login</h3>
				<p>
					<a href="login.jsp">Login</a>
				</p>
			</div>
		</div>
	</div>
	<footer>
		<%@include file="footer.html"%>
	</footer>

</body>
</html>

<%
} else
	response.sendRedirect("error.jsp");
%>