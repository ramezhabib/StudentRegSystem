package edu.wayne.csc4997.studentSystem.model;

import java.util.LinkedList;

import javax.faces.component.UIForm;

public class InstructorManager {
	
	public LinkedList<Instructor> allInstructors;
	public Instructor instructor;
	
	private UIForm form;

	public InstructorManager(){
		allInstructors = new LinkedList<Instructor>();	
	}

	public LinkedList<Instructor> getInstructors(){
		return this.allInstructors;
	}
	
	public void setInstructors(LinkedList<Instructor> instructors){
		this.allInstructors = instructors;
	}
	
	public Instructor getInstructor() {
		return instructor;
	}
	
	public void setInstructor(Instructor instructor) {
		this.instructor = instructor;
	}
	
	public String addInstructor(){
		instructor = new Instructor(0,"");
		form.setRendered(true);
		return null; }
	
	public String save(){
		allInstructors.add(instructor);	
		form.setRendered(false);
		return null;}
	
	 public String delete() {    
		 allInstructors.remove(instructor);
	    return null;  } 
	 
		public String modify(){
			instructor.setEditable(true);
			return null;
			}
			
			public String saveChanges(){
				for (Instructor instructor : allInstructors){
					instructor.setEditable(false);
				}
				return null;
			}
	
	public UIForm getForm() {    return form;  }
	  
	public void setForm(UIForm form) {    this.form = form;  }

}
