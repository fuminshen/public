package com.fumin.role.demo.util;

public class FmException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5022573029234669961L;
	
	private String code;
	private String message;

    public FmException(String message) {
        super(message);
        this.message = message;
    }
    
    public FmException(String code,String message) {
        super(message);
        this.code=code;
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    public Throwable fillInStackTrace() {
    	 return this;
	 }
    
    @Override
    public String toString() {
    	return message;
    }

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
