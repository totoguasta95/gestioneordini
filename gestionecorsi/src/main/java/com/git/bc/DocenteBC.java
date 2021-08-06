package com.git.bc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.git.architecture.dao.DAOException;
import com.git.architecture.dao.DocenteDAO;
import com.git.architecture.dbaccess.DBAccess;
import com.git.bc.model.Docente;

public class DocenteBC {
	private Connection conn;
	
	public DocenteBC() throws DAOException, ClassNotFoundException, IOException {
		conn = DBAccess.getConnection();
	}
	
	public Docente[] getAll() throws DAOException{
		try {
			return DocenteDAO.getFactory().getAll(conn);
		} catch(SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
	public Docente getById(long id) throws DAOException {
		try {
			return DocenteDAO.getFactory().getById(conn, id);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
}
