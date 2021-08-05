package com.git.bc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.git.architecture.dao.DAOConstants;
import com.git.architecture.dao.DAOException;
import com.git.architecture.dbaccess.DBAccess;

public class CorsoIdGenerator implements IdGenerator, DAOConstants {
	private static CorsoIdGenerator cig;
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private CorsoIdGenerator() throws DAOException, ClassNotFoundException, IOException {
		conn = DBAccess.getConnection();
	}
	
	public static CorsoIdGenerator getInstance()
			throws ClassNotFoundException, DAOException, IOException {
		if (cig == null)
			cig = new CorsoIdGenerator();
		return cig;
	}

	@Override
	public long getNextId() throws ClassNotFoundException, DAOException, IOException {
		long id = 0;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_CORSOSEQ);
			rs.next();
			id = rs.getLong(1);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return id;
	}
	
	

}
