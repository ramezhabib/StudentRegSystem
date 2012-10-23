package edu.wayne.csc4997.studentSystem.model;

import java.util.LinkedList;

public class Course {
	
	private int courseNumber;
	private String name;
	private String description;
	private Instructor teacher; 				//Courses are taught by an Instructor.

	public LinkedList<Course> prereq;			//Courses may have prerequisites that a student must have taken 
												//in a previous semester in order to register.
	public LinkedList<Student> enrolledStudents;  //Courses have students that are enrolled for the current semester.
	public boolean editable;					// Property to modify entity
	
	
	public Course(int cNum,String cNam, String cDescrip){
		this.courseNumber = cNum;
		this.name = cNam;
		this.description = cDescrip;
		prereq = new LinkedList<Course>();                 
		enrolledStudents = new LinkedList<Student>();
	}
	

	/*** Setters and Getters ***/
	public int getNumber(){
		return this.courseNumber;
	}
	
	public String getName(){
		return this.name;
	}
	
	public String getDescription(){
		return this.description;
	}
	
	public Instructor getInstructor(){
		return this.teacher;
	}
	
	public void setNumber(int cNum){
		this.courseNumber = cNum;
	}
	
	public void setName(String cName){
		this.name = cName;
	}
	
	public void setDescription(String cDesc){
		this.description = cDesc;
	}
	
	public void setInstructor(Instructor in){
		this.teacher = in;
	}
	
	public LinkedList<Course> getPrereqs(){
		return this.prereq;
	}
	
	public LinkedList<Student> getStudents(){
		return this.enrolledStudents;
	}
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}
	
	
	/*** Other Methods ***/
	public boolean assignTeacher(Instructor instructor){
		if(teacher == null)
		{
			this.teacher = instructor;
			return true;
		}
		else if(teacher.ID == instructor.ID)
			return false;
		else
		{
			this.teacher = instructor;
			return true;
		}
	}

	public void addPrereq(Course c){
		
		// Check if course exists in the system 
		// Check if pre-req already exists in this course's pre-req
		if(prereq.contains(c))
			System.out.println("This pre-req already exists for the class");
		else
			prereq.add(c);
			//System.out.println("Pre-req added successfully");
			
	}
	

	

	

}
