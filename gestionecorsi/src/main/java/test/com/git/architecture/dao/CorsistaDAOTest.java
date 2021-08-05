package test.com.git.architecture.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.git.architecture.dao.CorsistaDAO;
import com.git.architecture.dao.DAOException;
import com.git.architecture.dbaccess.DBAccess;
import com.git.bc.CorsistaIdGenerator;
import com.git.bc.model.Corsista;

class CorsistaDAOTest {

	private static Corsista c;
	private static Corsista[] corsisti;
	private static Connection conn;
	private static long id;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		CorsistaIdGenerator ci = CorsistaIdGenerator.getInstance();
		id = ci.getNextId();
		System.out.println(id);
		conn = DBAccess.getConnection();
		c = new Corsista();
		c.setIdCorsista(id);
		c.setNomeCorsista("Alvise");
		c.setCognomeCorsista("Rossi");
		c.setPrecedentiFormativi(true);
		
	}

	@Test
	void testCreate() {
		try {
			CorsistaDAO.getFactory().create(conn, c);
			System.out.println("Corsista creato " + c.toString());
		} catch (DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}

	@Test
	void testGetById() throws DAOException{
		try {
			Corsista c1 = new Corsista();
			c1 = CorsistaDAO.getFactory().getById(conn, 1);
			assertNotNull(c1);
			System.out.println(c1.toString());
		} catch (DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}

	@Test
	void testGetAll() {
		try {
			corsisti = CorsistaDAO.getFactory().getAll(conn);
			assertNotNull(corsisti);
			for (int i = 0; i < corsisti.length; i++) {
				System.out.println(corsisti[i].toString());
			}
		} catch (DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		try {
			corsisti = null;
			c = null;
			id = 0;
			DBAccess.closeConnection();
		} catch(DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}
}
