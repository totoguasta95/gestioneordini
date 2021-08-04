package com.git.architecture.dao;

public interface DAOConstants {
	
	/* SELECT */
	String SELECT_CORSISTA = "select * from corsista";
	String SELECT_CORSO = "select * from corso";
	String SELECT_CORSO_CORSISTA = "select * from corso_corsista";
	String SELECT_DOCENTE = "select * from docente";
	
	/* SELECT BY ID*/
	String SELECT_CORSISTA_BYID = "select * from corsista where id_corsista = ?";
	
	/* SEQUENZE */
	String SELECT_CORSISTASEQ = "select corsista_seq.nextval from dual";
	String SELECT_CORSOSEQ = "select corso_seq.nextval from dual";
	String SELECT_DOCENTESEQ = "select docente_seq.nextval from dual";
	
	/* INSERT */
	String INSERT_CORSISTA = "insert into corsista values(?,?,?,?)";
	String INSERT_CORSO = "insert into corso values(?,?,?,?,?,?,?,?)";
	String INSERT_CORSO_CORSISTA = "insert into corso_corsista values(?,?)";
	
	/* DELETE */
	String DELETE_CORSO = "Delete from corso where id_corso = ?";
	
	String SELECT_ADMINPASS = "select password from admin where username = ?";
	
	

}
