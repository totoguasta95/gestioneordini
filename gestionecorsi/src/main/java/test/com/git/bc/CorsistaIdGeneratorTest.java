package test.com.git.bc;

import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;

import org.junit.jupiter.api.Test;

import com.git.architecture.dao.DAOException;
import com.git.bc.CorsistaIdGenerator;

class CorsistaIdGeneratorTest {

	@Test
	void testIdGenerator() {
		try {
			CorsistaIdGenerator idGen = CorsistaIdGenerator.getInstance();
			assertNotNull(idGen, "cig non creata");
			long valore = idGen.getNextId();
			assertEquals(valore, idGen.getNextId()-1);
		} catch(ClassNotFoundException | DAOException | IOException exc) {
			exc.printStackTrace();
			fail(exc.getMessage());
		}
	}
}
