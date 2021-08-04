package com.git.architecture.dbaccess;


import java.sql.Connection;

import com.git.architecture.dao.DAOException;
import com.git.architecture.dao.GenericDAO;

public abstract class DAOAdapter<T> implements GenericDAO<T>{

	@Override
	public void create(Connection conn, T entity) throws DAOException {
		
	}

	@Override
	public void update(Connection conn, T entity) throws DAOException {
		
	}

	@Override
	public void delete(Connection conn, T entity) throws DAOException {
		
	}

	@Override
	public T getById(Connection conn, long id) throws DAOException {
		return null;
	}

	@Override
	public T[] getAll(Connection conn) throws DAOException {
		return null;
	}
	
}
