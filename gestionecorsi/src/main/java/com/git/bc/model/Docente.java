package com.git.bc.model;

public class Docente {
	private String nomeDocente;
	private String cognomeDocente;
	private long idDocente;
	private String cvDocente;
	public String getNomeDocente() {
		return nomeDocente;
	}
	public void setNomeDocente(String nomeDocente) {
		this.nomeDocente = nomeDocente;
	}
	public String getCognomeDocente() {
		return cognomeDocente;
	}
	public void setCognomeDocente(String cognomeDocente) {
		this.cognomeDocente = cognomeDocente;
	}
	public long getIdDocente() {
		return idDocente;
	}
	public void setIdDocente(long idDocente) {
		this.idDocente = idDocente;
	}
	public String getCvDocente() {
		return cvDocente;
	}
	public void setCvDocente(String cvDocente) {
		this.cvDocente = cvDocente;
	}
	@Override
	public String toString() {
		return "Docente [nomeDocente=" + nomeDocente + ", cognomeDocente=" + cognomeDocente + ", idDocente=" + idDocente
				+ ", cvDocente=" + cvDocente + "]";
	}
	
	
	
}
