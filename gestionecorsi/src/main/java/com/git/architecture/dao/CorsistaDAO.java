package com.git.architecture.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

import com.git.bc.model.Corsista;

public class CorsistaDAO extends DAOAdapter<Corsista> implements DAOConstants {
	private CachedRowSet rowSet;

	private CorsistaDAO() throws DAOException {
		try {
			rowSet = RowSetProvider.newFactory().createCachedRowSet();
		} catch (SQLException sql) {
			throw new DAOException(sql);

		}
	}

	public static CorsistaDAO getFactory() throws DAOException {
		return new CorsistaDAO();
	}

	@Override
	public void create(Connection conn, Corsista c) throws DAOException {
		try {
			rowSet.setCommand(SELECT_CORSISTA);
			rowSet.execute(conn);
			rowSet.moveToInsertRow();
			rowSet.updateLong(1, c.getIdCorsista());
			rowSet.updateString(2, c.getNomeCorsista());
			rowSet.updateString(3, c.getCognomeCorsista());
			rowSet.updateInt(4, (c.isPrecedentiFormativi() ? 1 : 0));
			rowSet.insertRow();
			rowSet.moveToCurrentRow();
			rowSet.acceptChanges();

		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}

	@Override
	public Corsista getById(Connection conn, long id) throws DAOException {
		Corsista c = null;
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(SELECT_CORSISTA_BYID);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				c = new Corsista();
				c.setIdCorsista(rs.getLong(1));
				c.setNomeCorsista(rs.getString(2));
				c.setCognomeCorsista(rs.getString(3));
				c.setPrecedentiFormativi((rs.getInt(4) == 1 ? true : false));
			}
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return c;
	}

	@Override
	public Corsista[] getAll(Connection conn) throws DAOException {
		Corsista[] corsisti = null;
		try {
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(SELECT_CORSISTA);
			rs.last();
			corsisti = new Corsista[rs.getRow()];
			rs.beforeFirst();
			for (int i = 0; rs.next(); i++) {
				Corsista c = new Corsista();
				c.setIdCorsista(rs.getLong(1));
				c.setNomeCorsista(rs.getString(2));
				c.setCognomeCorsista(rs.getString(3));
				c.setPrecedentiFormativi((rs.getInt(4) == 1 ? true : false));
				corsisti[i] = c;
			}
			rs.close();
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return corsisti;
	}

}
