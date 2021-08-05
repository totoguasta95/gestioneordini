package com.git.architecture.dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

import com.git.bc.model.CorsoCorsista;

public class CorsoCorsistaDAO extends DAOAdapter<CorsoCorsista> implements DAOConstants{
	CachedRowSet rowSet;
	
	private CorsoCorsistaDAO() throws DAOException{
		try {
			rowSet = RowSetProvider.newFactory().createCachedRowSet();
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
	public static CorsoCorsistaDAO getFactory() throws DAOException {
		return new CorsoCorsistaDAO();
	}

	@Override
	public void create(Connection conn, CorsoCorsista cc) throws DAOException {
		try {
			rowSet.setCommand(SELECT_CORSO_CORSISTA);
			rowSet.execute(conn);
			rowSet.moveToInsertRow();
			rowSet.updateLong(1,cc.getIdCorso());
			rowSet.updateLong(2, cc.getIdCorsista());
			rowSet.insertRow();
			rowSet.moveToCurrentRow();
			rowSet.acceptChanges();
			
		}catch(SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
	
}
