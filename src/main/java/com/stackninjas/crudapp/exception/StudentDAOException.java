package com.stackninjas.crudapp.exception;

public class StudentDAOException extends RuntimeException {
    public StudentDAOException(String message) {
        super(message);
    }

    public StudentDAOException(String message, Throwable cause) {
        super(message, cause);
    }
}
