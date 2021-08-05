package com.git.bc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.git.architecture.dao.CorsistaDAO;
import com.git.architecture.dao.DAOException;
import com.git.architecture.dbaccess.DBAccess;
import com.git.bc.model.Corsista;

public class CorsistaBC {
	private Connection conn;
	private CorsistaIdGenerator cig;

	public CorsistaBC() throws DAOException, ClassNotFoundException, IOException {
		conn = DBAccess.getConnection();
		cig = CorsistaIdGenerator.getInstance();
	}

	public long create(Corsista corsista) throws DAOException, ClassNotFoundException, IOException {
		long id = 0;
		try {
			id = cig.getNextId();
			corsista.setIdCorsista(id);
			CorsistaDAO.getFactory().create(conn, corsista);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return id;
	}

	public Corsista getById(long id) throws DAOException {
		try {
			return CorsistaDAO.getFactory().getById(conn, id);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}

	public Corsista[] getAll() throws DAOException {
		try {
			return CorsistaDAO.getFactory().getAll(conn);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}

}
