package test.com.git.bc.utilities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.git.bc.utilities.Validator;

class ValidatorTest {
	private static String stringa1;
	private static String stringa2;
	private static String stringa3;
	private static String stringa4;
	private static Validator v;
	
	@Test
	void test1() {
		stringa1 = "12312antonio";
		v = new Validator();
		assertFalse(v.convalidaNome(stringa1));
	}
	
	@Test
	void test2() {
		stringa2 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
		v = new Validator();
		assertFalse(v.convalidaNome(stringa2));
	}
	
	@Test
	void test3() {
		stringa3 = "";
		v = new Validator();
		assertFalse(v.convalidaNome(stringa3));
	}
	
	@Test
	void test4() {
		stringa4 = "Antonio";
		v = new Validator();
		assertTrue(v.convalidaNome(stringa4));
	}

}
