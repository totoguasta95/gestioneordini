package com.git.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.git.bc.AdminFacade;
import com.git.bc.model.Corsista;
import com.git.bc.model.Corso;
import com.git.bc.model.CorsoCorsista;
import com.git.bc.utilities.Validator;

@WebServlet("/salvacorsista")
public class SalvaCorsista extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Corsista corsista = new Corsista();
		long id = 0;
		Corso corso	= new Corso();
		CorsoCorsista cc = new CorsoCorsista();
		Validator v = new Validator();
		
		try {
			AdminFacade af = AdminFacade.getInstance();
			
			corsista.setNomeCorsista(request.getParameter("nome"));
			corsista.setCognomeCorsista(request.getParameter("cognome"));
			corsista.setPrecedentiFormativi(
					v.convalidaPrecedentiFormativi(request.getParameter("gridRadios")));
			id = af.create(corsista);
			if(id > 0) {
				corso.setIdCorso(Long.parseLong(request.getParameter("nomeCorso")));
				cc.setIdCorso(corso.getIdCorso());
				cc.setIdCorsista(id);
			
				af.create(cc);
				response.sendRedirect("corsisti.jsp");
			} else
				response.sendRedirect("error.jsp");
			
		} catch (SQLException | ClassNotFoundException exc) {
			exc.printStackTrace();
			exc.getMessage();
		}
	}
}
