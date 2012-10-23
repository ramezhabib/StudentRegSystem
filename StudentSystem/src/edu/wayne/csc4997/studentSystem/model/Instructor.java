package edu.wayne.csc4997.studentSystem.model;

public class Instructor extends Person {
	
	public boolean editable;
	
	Instructor(int id, String firstLast)
	{	
		ID = id;	name = firstLast;	
	}
	
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}

}
