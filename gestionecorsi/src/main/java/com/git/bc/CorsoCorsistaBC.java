package com.git.bc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.git.architecture.dao.DAOException;
import com.git.architecture.dbaccess.DBAccess;
import com.git.bc.model.CorsoCorsista;
import com.git.architecture.dao.CorsoCorsistaDAO;

public class CorsoCorsistaBC {
	private Connection conn;

	public CorsoCorsistaBC() throws DAOException, ClassNotFoundException, IOException {
		conn = DBAccess.getConnection();
	}
	
	public void create(CorsoCorsista cc) throws DAOException {
		try {
			CorsoCorsistaDAO.getFactory().create(conn, cc);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
}
