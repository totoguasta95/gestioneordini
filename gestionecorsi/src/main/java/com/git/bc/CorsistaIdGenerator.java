package com.git.bc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.git.architecture.dao.DAOConstants;
import com.git.architecture.dao.DAOException;
import com.git.architecture.dbaccess.DBAccess;

public class CorsistaIdGenerator implements IdGenerator, DAOConstants {
	private static CorsistaIdGenerator cig;
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private CorsistaIdGenerator() throws DAOException, ClassNotFoundException, IOException {
		conn = DBAccess.getConnection();
	}
	
	public static CorsistaIdGenerator getInstance()
			throws ClassNotFoundException, DAOException, IOException {
		if (cig == null)
			cig = new CorsistaIdGenerator();
		return cig;
	}

	@Override
	public long getNextId() throws ClassNotFoundException, DAOException, IOException {
		long id = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_CORSISTASEQ);
			rs.next();
			id = rs.getLong(1);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return id;
	}
	
	

}
