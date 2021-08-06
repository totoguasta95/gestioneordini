package com.git.bc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;

import com.git.architecture.dao.DAOException;
import com.git.architecture.dao.StatisticheDAO;
import com.git.architecture.dbaccess.DBAccess;
import com.git.bc.model.Corso;
import com.git.bc.model.Docente;

public class Statistiche {
	private Connection conn;

	public Statistiche() throws ClassNotFoundException, DAOException, IOException {
		conn = DBAccess.getConnection();
	}
	
	public int getTotCorsisti() throws DAOException {
		try {
			return StatisticheDAO.getFactory().getTotCorsisti(conn);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
	public String getMaxFrequenza() throws DAOException {
		try {
			return StatisticheDAO.getFactory().getMaxFrequenza(conn);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
	public Date getLastDateCorsi() throws DAOException {
		try {
			return StatisticheDAO.getFactory().getLastDateCorsi(conn);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
	public double getAvgDurataCorsi() throws DAOException {
		try {
			return StatisticheDAO.getFactory().getAvgDurataCorsi(conn);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
	public int getTotCommenti() throws DAOException {
		try {
			return StatisticheDAO.getFactory().getTotCommenti(conn);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
	public Docente[] getDocentePiuCorsi() throws DAOException {
		try {
			return StatisticheDAO.getFactory().getDocentePiuCorsi(conn);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
	
	public HashMap<Corso,Integer> getCorsiDisponibili() throws DAOException {
		try {
			return StatisticheDAO.getFactory().getCorsiDisponibili(conn);
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
	}
}
