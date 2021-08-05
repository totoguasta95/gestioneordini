package com.git.bc.model;

public class Corsista {
	private String nomeCorsista;
	private String cognomeCorsista;
	private long idCorsista;
	private boolean precedentiFormativi;

	public String getNomeCorsista() {
		return nomeCorsista;
	}

	public void setNomeCorsista(String nomeCorsista) {
		this.nomeCorsista = nomeCorsista;
	}

	public String getCognomeCorsista() {
		return cognomeCorsista;
	}

	public void setCognomeCorsista(String cognomeCorsista) {
		this.cognomeCorsista = cognomeCorsista;
	}

	public long getIdCorsista() {
		return idCorsista;
	}

	public void setIdCorsista(long idCorsista) {
		this.idCorsista = idCorsista;
	}

	public boolean isPrecedentiFormativi() {
		return precedentiFormativi;
	}

	public void setPrecedentiFormativi(boolean precedentiFormativi) {
		this.precedentiFormativi = precedentiFormativi;
	}

	@Override
	public String toString() {
		return "Corsista [nomeCorsista=" + nomeCorsista + ", cognomeCorsista=" + cognomeCorsista + ", idCorsista="
				+ idCorsista + ", precedentiFormativi=" + precedentiFormativi + "]";
	}
}
