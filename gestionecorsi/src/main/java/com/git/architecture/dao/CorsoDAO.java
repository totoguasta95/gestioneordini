package com.git.architecture.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

import com.git.bc.model.Corso;

public class CorsoDAO extends DAOAdapter<Corso> implements DAOConstants{
	private CachedRowSet rowSet;

	private CorsoDAO() throws DAOException {
		try {
			rowSet = RowSetProvider.newFactory().createCachedRowSet();
		} catch (SQLException sql) {
			throw new DAOException(sql);

		}
	}
	
	public static CorsoDAO getFactory() throws DAOException {
		return new CorsoDAO();
	}

	@Override
	public void create(Connection conn, Corso c) throws DAOException {
		try {
			rowSet.setCommand(SELECT_CORSO);
			rowSet.execute(conn);
			rowSet.moveToInsertRow();
			rowSet.updateLong(1,c.getIdCorso());
			rowSet.updateString(2, c.getNomeCorso());
			rowSet.updateDate(3, new java.sql.Date(c.getDataInizioCorso().getTime()));
			rowSet.updateDate(4, new java.sql.Date(c.getDataFineCorso().getTime()));
			rowSet.updateDouble(5, c.getCostoCorso());
			rowSet.updateString(6, c.getCommentiCorso());
			rowSet.updateString(7, c.getAulaCorso());
			rowSet.updateLong(8, c.getIdDocente());
			rowSet.insertRow();
			rowSet.moveToCurrentRow();
			rowSet.acceptChanges();
			
		}catch(SQLException sql) {
			throw new DAOException(sql);
		}
	}

	@Override
	public void delete(Connection conn, Corso c) throws DAOException {
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(DELETE_CORSO);
			ps.setLong(1, c.getIdCorso());
			ps.execute();
			conn.commit();
			
		} catch(SQLException sql) {
			throw new DAOException(sql);
		}
	}

	@Override
	public Corso[] getAll(Connection conn) throws DAOException {
		Corso[] corsi = null;
		try {
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(SELECT_CORSO);
			rs.last();
			corsi = new Corso[rs.getRow()];
			rs.beforeFirst();
			for (int i = 0; rs.next(); i++) {
				Corso c = new Corso();
				c.setIdCorso(rs.getLong(1));
				c.setNomeCorso(rs.getString(2));
				c.setDataInizioCorso(new java.util.Date(rs.getDate(3).getTime()));
				c.setDataFineCorso(new java.util.Date(rs.getDate(4).getTime()));
				c.setCostoCorso(rs.getDouble(5));
				c.setCommentiCorso(rs.getString(6));
				c.setAulaCorso(rs.getString(7));
				c.setIdDocente(rs.getLong(8));
				corsi[i] = c;
			}
			rs.close();
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return corsi;
	}
	
}
