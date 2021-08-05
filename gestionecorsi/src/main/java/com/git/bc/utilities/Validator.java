package com.git.bc.utilities;

import java.util.regex.Pattern;

public class Validator {
	
	public boolean convalidaNome(String nome) {
		Pattern regex = Pattern.compile("^[A-Za-z]{1,30}+$");
		if(!regex.matcher(nome).matches())
			return false;
		else
			return true;
	}
	
	public boolean convalidaCognome(String cognome) {
		Pattern regex = Pattern.compile("^[A-Za-z]{1,30}+$");
		if(!regex.matcher(cognome).matches())
			return false;
		else
			return true;
	}
	
}
