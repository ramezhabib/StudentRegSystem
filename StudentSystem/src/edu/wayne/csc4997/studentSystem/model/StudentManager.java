package edu.wayne.csc4997.studentSystem.model;


import java.util.LinkedList;

import javax.faces.component.UIForm;

public class StudentManager {
	
	public LinkedList<Student> allStudents;
	public Student student;
	
	private UIForm form;
	
	
	public StudentManager(){
		allStudents = new LinkedList<Student>();
		//form = new UIForm();
		
	}
	
	public LinkedList<Student> getStudents(){
		return this.allStudents;
	}
	
	public void setStudents(LinkedList<Student> students){
		 this.allStudents = students;
	}
	
	public Student getStudent() {
		return student;
	}
	
	public void setStudent(Student student) {
		this.student = student;
	}
	
	public String addStudent(){
		student = new Student(0,"");
		form.setRendered(true);
		return null; }
	
	public String save(){
		allStudents.add(student);	
		form.setRendered(false);
		return null;}
	
	 public String delete() {    
		 allStudents.remove(student);
	    return null;  } 
	 
	public String modify(){
		student.setEditable(true);
		return null;
		}
		
		public String saveChanges(){
			for (Student student : allStudents){
				student.setEditable(false);
			}
			return null;
		}
	 
	 public UIForm getForm() {    return form;  }
	  
	 public void setForm(UIForm form) {    this.form = form;  }

}
