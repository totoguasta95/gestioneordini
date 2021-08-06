package com.git.architecture.dao;

public interface DAOConstants {
	
	/* SELECT */
	String SELECT_CORSISTA = "select * from corsista";
	String SELECT_CORSO = "select * from corso";
	String SELECT_CORSO_CORSISTA = "select * from corso_corsista";
	String SELECT_DOCENTE = "select * from docente";
	
	/* SELECT BY ID*/
	String SELECT_CORSISTA_BYID = "select * from corsista where id_corsista = ?";
	String SELECT_DOCENTE_BYID = "select * from docente where id_docente = ?";

	
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
	
	/* REPORT */
	String SELECT_TOT_CORSISTI = "select count(*) from corsista";
	String SELECT_MAX_FREQUENZA = "select nome_corso from corso"
			+ " where id_corso in(select id_corso from corso_corsista"
			+ " group by id_corso"
			+ " having count(*) = (select max(t.corsisti)"
			+ " from (select id_corso, count(*) as corsisti"
			+ " from corso_corsista group by id_corso) t))";
	String SELECT_LAST_DATE = "select max(data_inizio_corso) from corso";
	String SELECT_AVG_DURATA = "";
	String SELECT_TOT_COMMENTI = "select count(*) from corso where commenti_corso is not null";
	String SELECT_DOCENTE_PIU_CORSI = "select * from docente"
			+ " where id_docente in(select id_docente from corso"
			+ " group by id_docente"
			+ " having count(*) > 1)";
	String SELECT_CORSI_POSTI_DISP = "select c.id_corso, c.nome_corso, count(*)"
			+ " from corso c,corso_corsista cc"
			+ " where c.id_corso = cc.id_corso"
			+ " group by c.id_corso, c.nome_corso"
			+ " having count(*) < 12"
			+ " order by c.id_corso";
	String SELECT_CORSI_POSTI_DISP2 = "select * from corso"
			+ " where id_corso = ?"
			+ " and id_corso in(select id_corso from corso_corsista"
			+ " group by id_corso"
			+ " having count(*) < 12)";
}
