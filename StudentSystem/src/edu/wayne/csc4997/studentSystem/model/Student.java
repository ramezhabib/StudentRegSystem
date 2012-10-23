package edu.wayne.csc4997.studentSystem.model;

import java.util.LinkedList;


public class Student extends Person {
	
	public LinkedList<Course> currentCourses;		//Students have courses that they are enrolled in for the current semester
	public LinkedList<Course> previous;				//Students have courses that they have taken previous semesters.
	public boolean editable;						// Property to modify entity
	
	Student(int id, String firstLast)
	{
		ID = id;	name = firstLast; 
		currentCourses = new LinkedList<Course>();
		previous = new LinkedList<Course>();
	}

	public LinkedList<Course> getCurrentCourses(){
		return this.currentCourses;
	}
	
	public LinkedList<Course> getPreviousCourses(){
		return this.previous;
	}
	
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}

	// Register a student to a course
	public boolean register(Course course) {
		
		// Checking for pre-reqs if any
		if ( previous.containsAll(course.prereq) || course.prereq.isEmpty() )
		{
			course.enrolledStudents.add(this);
			this.currentCourses.add(course);
			//System.out.println("Student registered for class successfully");
			return true;	
		}
		
		//System.out.println("Student is missing 1 or more pre-requisites");
		return false;
			
	
	}

	// Method to drop a student from a class
	// student is removed from the list of enrolled students for the class
	//the course is added to the student's previous record
	public void drop(Course course) {
	
		course.enrolledStudents.remove(this);
		this.currentCourses.remove(course);
		// student dropped from class 
		this.previous.add(course);
		//System.out.println("Student dropped the class successfully");	
	}
	

	

}
