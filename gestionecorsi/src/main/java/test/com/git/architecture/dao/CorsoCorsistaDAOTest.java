package test.com.git.architecture.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.util.GregorianCalendar;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.git.architecture.dao.CorsistaDAO;
import com.git.architecture.dao.CorsoCorsistaDAO;
import com.git.architecture.dao.CorsoDAO;
import com.git.architecture.dao.DAOException;
import com.git.architecture.dbaccess.DBAccess;
import com.git.bc.model.Corsista;
import com.git.bc.model.Corso;
import com.git.bc.model.CorsoCorsista;

class CorsoCorsistaDAOTest {
	private static Corso corso;
	private static Corsista corsista;
	private static CorsoCorsista cc;
	private static Connection conn;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		conn = DBAccess.getConnection();
		corso = new Corso();
		corso.setIdCorso(10);
		corso.setNomeCorso("Sistemi e Reti");
		corso.setDataInizioCorso(new GregorianCalendar(2020,9,2).getTime());
		corso.setDataFineCorso(new GregorianCalendar(2021,4,13).getTime());
		corso.setCostoCorso(650.00);
		corso.setCommentiCorso("bel corso, interessante, ma non vale tutti questi CFU");
		corso.setAulaCorso("B3");
		corso.setIdDocente(1);
		corsista = new Corsista();
		corsista.setIdCorsista(17);
		corsista.setNomeCorsista("Giuseppe");
		corsista.setCognomeCorsista("Verdi");
		corsista.setPrecedentiFormativi(false);
		cc = new CorsoCorsista();
		cc.setIdCorsista(corsista.getIdCorsista());
		cc.setIdCorso(corso.getIdCorso());
		
	}

	@Test
	void testCreate() {
		try {
			CorsoDAO.getFactory().create(conn, corso);
			System.out.println("Corso creato " + corso.toString());
			CorsistaDAO.getFactory().create(conn, corsista);
			System.out.println("Corsista creato " + corsista.toString());
			CorsoCorsistaDAO.getFactory().create(conn, cc);
			System.out.println("CC creato " + cc.toString());

		} catch (DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		try {
			CorsoDAO.getFactory().delete(conn, corso);
			System.out.println("Corso Eliminato");
			corso = null;
			cc = null;
			corsista = null;
			DBAccess.closeConnection();
		} catch(DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}
}
