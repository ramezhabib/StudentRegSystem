package edu.wayne.csc4997.studentSystem.model;

public abstract class Person {
	
	protected int ID;
	protected String name;
	
	public int getID() {
		return ID;
	}
	public String getName() {
		return name;
	}
	
	public void setID(int id){
		ID = id;	
	}
	
	public void setName(String n){
		name = n;	
	}
	
	
	

}
