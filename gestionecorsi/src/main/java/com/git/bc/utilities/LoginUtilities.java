package com.git.bc.utilities;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.git.architecture.dao.DAOConstants;
import com.git.architecture.dao.DAOException;
import com.git.architecture.dbaccess.DBAccess;

public class LoginUtilities implements DAOConstants {
	private Connection conn;

	public LoginUtilities() throws DAOException, ClassNotFoundException, IOException {
		conn = DBAccess.getConnection();
	}

	public String getAdminPass(String username) throws DAOException {
		try {
			PreparedStatement ps = conn.prepareStatement(SELECT_ADMINPASS);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next())
				return rs.getString(1);
			return null;
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}

}
