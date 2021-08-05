package test.com.git.bc;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;

import org.junit.jupiter.api.Test;

import com.git.architecture.dao.DAOException;
import com.git.bc.CorsoIdGenerator;

class CorsoIdGeneratorTest {

	@Test
	void testIdGenerator() {
		try {
			CorsoIdGenerator idGen = CorsoIdGenerator.getInstance();
			assertNotNull(idGen, "cig non creata");
			long valore = idGen.getNextId();
			assertEquals(valore, idGen.getNextId()-1);
		} catch(ClassNotFoundException | DAOException | IOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}

}
