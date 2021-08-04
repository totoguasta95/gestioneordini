package com.git.architecture.dbaccess;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.git.architecture.dao.DAOConstants;
import com.git.architecture.dao.DAOException;
import com.git.bc.model.Docente;

public class DocenteDAO extends DAOAdapter<Docente> implements DAOConstants {

	private DocenteDAO() throws DAOException {

	}

	public static DocenteDAO getFactory() throws DAOException {
		return new DocenteDAO();
	}

	@Override
	public Docente[] getAll(Connection conn) throws DAOException {
		Docente[] docenti = null;
		try {
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(SELECT_DOCENTE);
			rs.last();
			docenti = new Docente[rs.getRow()];
			rs.beforeFirst();
			for (int i = 0; rs.next(); i++) {
				Docente d = new Docente();
				d.setIdDocente(rs.getLong(1));
				d.setNomeDocente(rs.getString(2));
				d.setCognomeDocente(rs.getString(3));
				d.setCvDocente(rs.getString(4));
				docenti[i] = d;
			}
			rs.close();
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return docenti;
	}

}