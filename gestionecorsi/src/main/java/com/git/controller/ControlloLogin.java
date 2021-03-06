package com.git.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.git.architecture.dao.DAOException;
import com.git.bc.utilities.LoginUtilities;
import com.git.security.AlgoritmoMD5;

@WebServlet("/controllo")
public class ControlloLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = AlgoritmoMD5.converti(request.getParameter("password"));
		String adminpass;
		int count = 5;
		 
		
		HttpSession session = request.getSession();
		ServletContext servletContext = getServletContext();
		if(servletContext.getAttribute("countErr") != null)
			count = (int)servletContext.getAttribute("countErr");
		
		count--;
		
		if(username != null && password != null) {
			try {
				LoginUtilities lu = new LoginUtilities();
				adminpass = lu.getAdminPass(username);
				
				if(adminpass != null) {
					if(adminpass.equals(password)) {
						servletContext.removeAttribute("countErr");
						session.setAttribute("admin", username);
						response.sendRedirect("corsisti.jsp");
					} else {
						if(count > 0) {
							servletContext.setAttribute("countErr", count);
							response.sendRedirect("login.jsp");
						} else {
							servletContext.setAttribute("bloccato", true);
							response.sendRedirect("loginError.jsp");
						}
					}
				} else {
					if(count > 0) {
						servletContext.setAttribute("countErr", count);
						response.sendRedirect("login.jsp");
					} else {
						servletContext.setAttribute("bloccato", true);
						response.sendRedirect("loginError.jsp");
					}
				}
			} catch (DAOException | ClassNotFoundException exc) {
				exc.printStackTrace();
				throw new ServletException(exc.getMessage());
			}
		}
	}
}
