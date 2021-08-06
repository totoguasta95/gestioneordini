package com.git.bc;

import java.io.IOException;

import com.git.architecture.dao.DAOException;
import com.git.bc.model.Corsista;
import com.git.bc.model.Corso;
import com.git.bc.model.CorsoCorsista;
import com.git.bc.model.Docente;

public class AdminFacade {
	
	private static AdminFacade af;
	private CorsistaBC corsistaBC;
	private CorsoBC corsoBC;
	private CorsoCorsistaBC ccBC;
	private DocenteBC docenteBC;
	
	public static AdminFacade getInstance() throws DAOException, ClassNotFoundException, IOException {
		if (af == null)
			af = new AdminFacade();
		return af;
	}
	
	private AdminFacade() throws DAOException, ClassNotFoundException, IOException {
		corsistaBC = new CorsistaBC();
		corsoBC = new CorsoBC();
		ccBC = new CorsoCorsistaBC();
		docenteBC = new DocenteBC();
	}
	
	// corsista
		public long create(Corsista corsista) throws DAOException, ClassNotFoundException, IOException {
			return corsistaBC.create(corsista);
		}
		
		public Corsista getById(long id) throws DAOException {
			return corsistaBC.getById(id);
		}
		
		public Corsista[] getAllCorsista() throws DAOException {
			return corsistaBC.getAll();
		}
		
	// corso
		public void create(Corso corso) throws DAOException, ClassNotFoundException, IOException {
			corsoBC.create(corso);
		}
		
		public Corso[] getAllCorso() throws DAOException {
			return corsoBC.getAll();
		}
		
		public void delete(Corso corso) throws DAOException {
			corsoBC.delete(corso);
		}
		
	// corso-corsista
		public void create(CorsoCorsista cc) throws DAOException, ClassNotFoundException, IOException {
			ccBC.create(cc);
		}
		
	// docente
		public Docente[] getAllDocente() throws DAOException {
			return docenteBC.getAll();
		}
		
		public Docente getByIdDocente(long id) throws DAOException {
			return docenteBC.getById(id);
		}
}
