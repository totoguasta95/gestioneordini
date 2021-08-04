package test.com.git.architecture.dbaccess;


import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;

import org.junit.jupiter.api.Test;

import com.git.architecture.dao.DAOException;
import com.git.architecture.dbaccess.DBAccess;

class DBAccessTest {

	@Test
	void test() {
		try {
			DBAccess.getConnection();
		} catch(DAOException | ClassNotFoundException | IOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		} finally {
			try {
				DBAccess.closeConnection();
			} catch(DAOException exc) {
				exc.printStackTrace();
				fail(exc.getMessage());
			}
		}
	}

}
