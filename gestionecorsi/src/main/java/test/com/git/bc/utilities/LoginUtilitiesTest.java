package test.com.git.bc.utilities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import com.git.architecture.dao.DAOException;
import com.git.bc.utilities.LoginUtilities;
import com.git.security.AlgoritmoMD5;

class LoginUtilitiesTest {
	private static String password;
	private static LoginUtilities lu;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		lu = new LoginUtilities();
	}

	@Test
	void testgetAdminPass() {
		try {
			System.out.println("--- Username corretto ---");
			password = lu.getAdminPass("admin");
			assert(password.equals(AlgoritmoMD5.converti("Pass01$")));
			System.out.println(password+"\n");

			System.out.println("--- Username errato ---");
			password = lu.getAdminPass("usernameErrato");
			assertNull(password);
			System.out.println("L'username inserito non è corretto!");
			
		} catch (DAOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}
	
	
	@AfterAll
	static void tearDownAfterClass() throws Exception {
		System.out.println("Test finito!");
	}

}
