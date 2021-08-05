<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#menu">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			 

			<a class="navbar-brand" href="#">Home</a>
			<a class="navbar-brand" href="corsisti.jsp">Corsisti</a>
			<a class="navbar-brand" href="nuovoCorsista.jsp">Nuovo Corsista</a>
			<a class="navbar-brand" href="statistiche.jsp">Statistiche</a>
		</div>
		
		<div class="collapse navbar-collapse" id="menu">
		<%
			String user = (String)session.getAttribute("admin");
			if(user == null){
		%>	
		<ul class="nav navbar-nav navbar-right">
			<li>
				<a href="login.jsp">
				<span class="glyphicon glyphicon-user"></span> Sign in</a>
			</li>
			<li>
				<a href="login.jsp">
				<span class="glyphicon glyphicon-log-in"></span> Logout</a>
			</li>
		</ul>
		<% 
			} else {
		%>
		<ul class="nav navbar-nav">
			<li><a href="corsisti.jsp">Corsisti</a></li>
			<li><a href="nuovoCorsista.jsp">Nuovo corsista</a></li>
		</ul>
					
		<ul class="nav navbar-nav navbar-right">

			<li>
				<a href="#">
				<span class="glyphicon glyphicon-user"></span> <%=user %></a>
			</li>
			<li>
				<a href="logout.jsp">
				<span class="glyphicon glyphicon-log-off"></span> Logout</a>
			</li>
		</ul>
			
		<%
			}
		%>
		</div>
	</div>
</nav>