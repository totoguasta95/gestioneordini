package test.com.git.security;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.git.security.AlgoritmoMD5;

class AlgoritmoMD5Test {

	@Test
	void testConversione() {
		String password = AlgoritmoMD5.converti("Pass01$");
		assertNotNull(password);
		System.out.println(password);
	}

}
