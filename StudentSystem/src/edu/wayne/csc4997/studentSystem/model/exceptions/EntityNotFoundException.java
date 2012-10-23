package edu.wayne.csc4997.studentSystem.model.exceptions;

@SuppressWarnings("serial")
public class EntityNotFoundException extends Exception {
	
	public EntityNotFoundException(String message){
		super(message);
	}

}
