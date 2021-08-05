<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#menu">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			

			<a class="navbar-brand" href="index.jsp">Login</a>
		</div>
		
		<div class="collapse navbar-collapse" id="menu">
		<%
			String user = (String)session.getAttribute("username");
			if(user == null){
		%>	
		<ul class="nav navbar-nav navbar-right">
			<li>
				<a href="registra.jsp">
				<span class="glyphicon glyphicon-user"></span> Sign Up</a>
			</li>
			<li>
				<a href="login.jsp">
				<span class="glyphicon glyphicon-log-in"></span> Login</a>
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