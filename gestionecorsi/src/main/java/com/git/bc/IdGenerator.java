package com.git.bc;

import java.io.IOException;

import com.git.architecture.dao.DAOException;

public interface IdGenerator {
	long getNextId() throws ClassNotFoundException, DAOException, IOException;
}
