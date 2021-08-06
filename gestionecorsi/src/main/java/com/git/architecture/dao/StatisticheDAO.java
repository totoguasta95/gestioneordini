package com.git.architecture.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.HashMap;

import com.git.bc.model.Corso;
import com.git.bc.model.Docente;

public class StatisticheDAO implements DAOConstants {

	private StatisticheDAO() {}

	public static StatisticheDAO getFactory() throws DAOException {
		return new StatisticheDAO();
	}
	
	public int getTotCorsisti(Connection conn) throws DAOException {
		int totC = 0;
		Statement stmt;
		ResultSet rs;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_TOT_CORSISTI);
			if(rs.next()) {
				totC = rs.getInt(1);
			}
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return totC;
	}
	
	public String getMaxFrequenza(Connection conn) throws DAOException {
		String maxF = null;
		Statement stmt;
		ResultSet rs;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_MAX_FREQUENZA);
			if(rs.next()) {
				maxF = rs.getString(1);
			}
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return maxF;
	}
	
	public Date getLastDateCorsi(Connection conn) throws DAOException {
		Date data = new Date();
		Statement stmt;
		ResultSet rs;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_LAST_DATE);
			if(rs.next()) {
				data = rs.getDate(1);
			}
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return data;
	}
	
	public double getAvgDurataCorsi(Connection conn) throws DAOException {
		double maxF = 0;
		Statement stmt;
		ResultSet rs;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_AVG_DURATA);
			if(rs.next()) {
				maxF = rs.getDouble(1);
			}
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return maxF;
	}
	
	public int getTotCommenti(Connection conn) throws DAOException {
		int totC = 0;
		Statement stmt;
		ResultSet rs;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_TOT_COMMENTI);
			if(rs.next()) {
				totC = rs.getInt(1);
			}
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return totC;
	}
	
	public Docente[] getDocentePiuCorsi(Connection conn) throws DAOException {
		Docente[] docenti = null;
		try {
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(SELECT_DOCENTE_PIU_CORSI);
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
	
	public HashMap<Corso,Integer> getCorsiDisponibili(Connection conn) throws DAOException {
		HashMap<Corso,Integer> cd = null;
		try {
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(SELECT_CORSI_POSTI_DISP);
			cd = new HashMap<Corso, Integer>();
			rs.beforeFirst();
			while (rs.next()) {
				Corso c = new Corso();
				c.setIdCorso(rs.getLong(1));
				c.setNomeCorso(rs.getString(2));
				cd.put(c, rs.getInt(3));
			}
			rs.close();
		} catch (SQLException sql) {
			throw new DAOException(sql);
		}
		return cd;
	}

}
