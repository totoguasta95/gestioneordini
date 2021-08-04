package com.git.architecture.dao;

import java.sql.SQLException;

public class DAOException extends SQLException {

	private static final long serialVersionUID = -6851075435797598049L;


	private final static int ORA1017 = 1017; /* Username e password errata */
	private final static int ORA17002 = 17002; /* errore connessione DB */
	private final static int ORA0001 = 0; /* vincolo integrità violato */

	private String message;

	@Override
	public String getMessage() {
		return message;
	}

	public DAOException(SQLException sql) {
		String chiave = "";
		if (sql != null) {
			switch (sql.getErrorCode()) {
			case ORA1017:
				chiave = "Username/Password invalida";
				log(sql);
				break;
			case ORA17002:
				chiave = "IO exception di Oracle DB";
				log(sql);
				break;
			case ORA0001:
				chiave = "Vincolo della tabella violato";
				log(sql);
				break;
			default:
				chiave = "Eccezione SQL non prevista";
				log(sql);
			}
		}
		message = chiave;
	}
	
	private void log(SQLException sql) {
		sql.printStackTrace();
		System.err.println("Motivo: "+sql.getMessage());
		System.err.println("Stato app: "+sql.getSQLState());
		System.err.println("Codice Errore: "+sql.getErrorCode());
		System.err.println("Causa: "+sql.getCause());
	}
}

