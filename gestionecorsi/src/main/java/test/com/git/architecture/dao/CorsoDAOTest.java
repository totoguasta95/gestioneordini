package test.com.git.architecture.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.util.GregorianCalendar;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;


import com.git.architecture.dao.CorsoDAO;
import com.git.architecture.dao.DAOException;
import com.git.architecture.dbaccess.DBAccess;
import com.git.bc.CorsoIdGenerator;
import com.git.bc.model.Corso;

class CorsoDAOTest {
	
	private static Corso c;
	private static Corso[] corsi;
	private static Connection conn;
	private static long id;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		CorsoIdGenerator ci = CorsoIdGenerator.getInstance();
		id = ci.getNextId();
		System.out.println(id);
		conn = DBAccess.getConnection();
		c = new Corso();
		c.setIdCorso(id);
		c.setNomeCorso("Lettere Antiche");
		c.setDataInizioCorso(new GregorianCalendar(2021,1,12).getTime());
		c.setDataFineCorso(new GregorianCalendar(2021,4,17).getTime());
		c.setCostoCorso(600.00);
		c.setCommentiCorso("corso un po' del menga");
		c.setAulaCorso("B2");
		c.setIdDocente(2);
	}

	@Test
	void testCreate() {
		try {
			CorsoDAO.getFactory().create(conn, c);
			System.out.println("Corso creato " + c.toString());
		} catch (DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}
	@Test
	void testGetAll() {
		try {
			corsi = CorsoDAO.getFactory().getAll(conn);
			assertNotNull(corsi);
			for (int i = 0; i < corsi.length; i++) {
				System.out.println(corsi[i].toString());
			}
		} catch (DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		try {
			corsi = null;
			CorsoDAO.getFactory().delete(conn, c);
			System.out.println("Corso Eliminato");
			c = null;
			id = 0;
			DBAccess.closeConnection();
		} catch(DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}

}
