package test.com.git.architecture.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.git.architecture.dao.CorsistaDAO;
import com.git.architecture.dao.DAOException;
import com.git.architecture.dao.DocenteDAO;
import com.git.architecture.dbaccess.DBAccess;
import com.git.bc.model.Corsista;
import com.git.bc.model.Docente;

class DocenteDAOTest {
	private static Docente[] docenti;
	private static Connection conn;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		conn = DBAccess.getConnection();
	}

	@Test
	void testGetAllConnection() {
		try {
			docenti = DocenteDAO.getFactory().getAll(conn);
			assertNotNull(docenti);
			for(int i = 0; i<docenti.length; i++) {
				System.out.println(docenti[i].toString());
			}
		} catch (DAOException exc){
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}
	
	@Test
	void testGetById() throws DAOException{
		try {
			Docente d1 = new Docente();
			d1 =DocenteDAO.getFactory().getById(conn, 1);
			assertNotNull(d1);
			System.out.println(d1.toString());
		} catch (DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}
	
	@AfterAll
	static void tearDownAfterClass() throws Exception {
		try {
			docenti = null;
			DBAccess.closeConnection();
		} catch(DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}



}
