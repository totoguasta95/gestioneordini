package com.git.bc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.git.architecture.dao.CorsoDAO;
import com.git.architecture.dao.DAOException;
import com.git.architecture.dbaccess.DBAccess;
import com.git.bc.model.Corso;

public class CorsoBC {
	private Connection conn;
	private CorsoIdGenerator cig;
	
	public CorsoBC() throws DAOException, ClassNotFoundException, IOException {
		conn = DBAccess.getConnection();
		cig = CorsoIdGenerator.getInstance();
	}
	
	public void create(Corso corso) throws DAOException, ClassNotFoundException, IOException {
		try {
			corso.setIdCorso(cig.getNextId());
			CorsoDAO.getFactory().create(conn, corso);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
	public void delete(Corso ordine) throws DAOException {
		try {
			CorsoDAO.getFactory().delete(conn, ordine);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
	public Corso[] getAll() throws DAOException {
		try {
			return CorsoDAO.getFactory().getAll(conn);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
}
