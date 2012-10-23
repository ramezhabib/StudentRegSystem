package edu.wayne.csc4997.studentSystem.model.exceptions;

@SuppressWarnings("serial")
public class EntityIdExistsException extends Exception {
	
	String message;
	
	public EntityIdExistsException(String err){
		super(err);
		message = err;
	}

}
