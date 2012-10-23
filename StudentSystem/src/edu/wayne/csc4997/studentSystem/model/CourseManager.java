package edu.wayne.csc4997.studentSystem.model;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.LinkedList;

import javax.faces.component.UIForm;
import edu.wayne.csc4997.studentSystem.model.exceptions.*;

public class CourseManager {
	
	public LinkedList<Course> allCourses;	
	public StudentManager stManager;
	public InstructorManager instManager;	
	
	public int studentToRegID;
	public String courseToRegName;
	public int teacherToAssignID;
	
	public String prereqToAdd;
	
	private Course course;
	
	private UIForm form;
	private UIForm modifyForm;
	
	
	public CourseManager(){
		stManager = new StudentManager();
		instManager = new InstructorManager();
		allCourses = new LinkedList<Course>();
	}
	
	
	public String getPrereqToAdd(){
		return this.prereqToAdd;
	}
	
	public void setPrereqToAdd(String prereqToAdd){
		this.prereqToAdd = prereqToAdd;
	}
	public int getTeacherToAssign(){
		return this.teacherToAssignID;
	}
	
	public void setTeacherToAssign(int teacherToAssign){
		this.teacherToAssignID = teacherToAssign;
	}
	
	public int getStudentToReg(){
		return this.studentToRegID;
	}
	
	public void setStudentToReg(int ID){
		this.studentToRegID = ID;
	}
	
	public String getCourseToReg(){
		return this.courseToRegName;
	}
	
	public void setCourseToReg(String course){
		this.courseToRegName = course;
	}
	
	public LinkedList<Course> getCourses(){
		return this.allCourses;
	}
	
	public void setCourses(LinkedList<Course> courses){
		this.allCourses = courses;
	}
	
	public Course getCourse() {
		return course;
	}
	
	public void setCourse(Course course) {
		this.course = course;
	}
	
	public void setStudentManager(StudentManager stManager){
		 this.stManager = stManager;
	}
	 
	public StudentManager getStudentManager(){
		 return this.stManager;
	}
	 
	public void setInstructorManager(InstructorManager instManager){
		 this.instManager = instManager;
	}
	 
	public InstructorManager getInstructorManager(){
		 return this.instManager;
	}
	
	public UIForm getForm() {    return form;  }  
	public void setForm(UIForm form) {    this.form = form;  }
	public UIForm getModifyForm() {    return modifyForm;  }  
	public void setModifyForm(UIForm modifyForm) {    this.modifyForm = modifyForm;  }
	
	
	/*** Other Methods ***/
	public String addCourse(){
		course = new Course(0,"","");
		form.setRendered(true);
		return null; }
	
	public String save()  {  	
		allCourses.add(course);	
		form.setRendered(false);
		return null;}
	
	 public String delete() {    
		 allCourses.remove(course);
	    return null;  } 
	 
	 public String select(){
		 modifyForm.setRendered(true);
		 return null;
	 }
	 
	public String modify(){
		course.setEditable(true);
		return null;
	}
	
	public String saveChanges(){
		for (Course course : allCourses){
			course.setEditable(false);
		}
		return null;
	}
	
	public String addPrereqCourse(){
		for(Course c: allCourses )
		 {
			 if(c.getName().equals(prereqToAdd) )
				 course.addPrereq(c);
		 }
		prereqToAdd = "";
		modifyForm.setRendered(false);
		return null;
	}
	
	public String assignInstructor(){
		 for(Instructor i: instManager.allInstructors )
		 {
			 if(i.getID() == teacherToAssignID )
				 course.assignTeacher(i);
		 }
		 teacherToAssignID = 0;
		 modifyForm.setRendered(false);
		return null;
		
	}
	 
	 public String regCourse(){
		 for(Student s: stManager.allStudents )
		 {
			 if(s.getID() == studentToRegID)
				 for(Course c: this.allCourses)    //****
				 {
					if(c.getName().equals(courseToRegName))
						s.register(c);
				 }
		 }
		 studentToRegID=0; courseToRegName="";
		 return null;
	 }
	 
	 public String dropCourse(){
		 for(Student s: stManager.allStudents )
		 {
			 if(s.getID() == studentToRegID)
				 for(Course c: this.allCourses)
				 {
					if(c.getName().equals(courseToRegName))
						s.drop(c);
				 }
		 }
		 studentToRegID=0; courseToRegName="";
		 return null;
	 }

	 public String printToFile() throws IOException{
	 String sysHome = System.getProperty("user.home");
		File f = new File(sysHome+"\\data.csv");
		FileWriter writer = new FileWriter(f);
		for(int i=0; i < allCourses.size();i++)
		{	
			writer.append(allCourses.get(i).getName());
			writer.append(',');
			writer.append(allCourses.get(i).getDescription());
			writer.append(',');
			writer.append("Instructor: ");
			if(allCourses.get(i).getInstructor() != null)
				writer.append(allCourses.get(i).getInstructor().getName());
			writer.append('\n');
			writer.write("Enrolled Students:");
			writer.append('\n');
			writer.append("ID");
			writer.append(',');
			writer.append("Name");
			writer.append('\n');
			for(int j=0; j<allCourses.get(i).enrolledStudents.size(); j++)
			{
				writer.append(String.valueOf(allCourses.get(i).enrolledStudents.get(j).ID));
				writer.append(',');
				writer.append(allCourses.get(i).enrolledStudents.get(j).name);
				writer.append('\n');
			}
			writer.append('\n');
		}
		
		writer.flush();
	    writer.close();
		return null;
	 }
}
