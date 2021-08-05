package com.git.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.git.architecture.dao.DAOException;
import com.git.bc.AdminFacade;
import com.git.bc.model.Corso;

@WebServlet("/eliminacorso")
public class EliminaCorso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Corso corso = new Corso();
		long id = Long.parseLong(request.getParameter("id"));
		corso.setIdCorso(id);
		if (corso != null) {
			try {
				AdminFacade af = AdminFacade.getInstance();
				af.delete(corso);
			} catch (DAOException | ClassNotFoundException exc) {
				exc.printStackTrace();
				exc.getMessage();
			}
			response.sendRedirect("elimina.jsp");
		}
	}
}
