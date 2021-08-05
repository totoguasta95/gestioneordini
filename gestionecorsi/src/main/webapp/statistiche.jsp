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
<title>Statistiche</title>
</head>
<body>
<jsp:include page="nav.jsp" />
	<div class="container">
		<h1>Statistiche</h1>
		<div class="table-responsive">
		<table class="table table-hover" style="width: 100%;">
  <thead>
    <tr>

      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Numero corsisti totali.</td>
      <td></td>
    </tr>
    <tr>
      <td>Nome del corso piu frequentato</td>
      <td></td>
    </tr>
    <tr>
      <td>Data di inizio ultimo corso</td>
      <td></td>
    </tr>
    <tr>
      <td>Durata media dei corsi ( in giorni lavorativi )</td>
      <td></td>
    </tr>
    <tr>
      <td>Numero di commenti presenti</td>
      <td></td>
    </tr>
    <tr>
      <td>Elenco corsisti</td>
      <td></td>
    </tr>
    <tr>
      <td>Docente che puт tenere piu tipologie di corso</td>
      <td></td>
    </tr>
    <tr>
      <td>Corsi con posti disponibili</td>
      <td></td>
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
//} else
//response.sendRedirect("login.jsp");
%>