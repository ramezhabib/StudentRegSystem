<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course Page</title>




<LINK href="<%=request.getContextPath()%>/css/mystyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<f:view>
	<h:messages layout="table"></h:messages>
	<h:form><h:commandLink action="welcome.jsp" value="Homepage"/></h:form>
  	
  	<h:form>
    	<h:commandLink  action="#{courseManager.addCourse}" value="Add new Course"/>
 	</h:form>
    
	<h:form binding="#{courseManager.form}" rendered="false">
		<h:panelGrid columns="2"> 
		<h:outputLabel > Course number </h:outputLabel>
		<h:inputText value = "#{courseManager.course.number}"/> 
		<h:outputLabel > Course name </h:outputLabel>
		<h:inputText value = "#{courseManager.course.name}" />
		<h:outputLabel > Course description </h:outputLabel>
		<h:inputTextarea value = "#{courseManager.course.description}"/> 
		</h:panelGrid>
			<h:panelGroup>
		 		<h:commandButton action="#{courseManager.save}" value="Save"/>
		 	</h:panelGroup>
	 </h:form>
	
	<h:form >
    <h:dataTable value="#{courseManager.courses}" var="course" styleClass="entity" headerClass="entityheader"
      columnClasses="first, rest">
      <h:column>
        <%-- Via this facet we define the table header (column 1) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Course Number"/>
          </h:column>
        </f:facet>
        <h:inputText value="#{course.number}" size="10" rendered="#{course.editable}" />
        <h:outputText value="#{course.number}" rendered="#{not course.editable}"/>
      </h:column>
      <h:column>
        <%-- Via this facet we define the table header (column 2) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Course Name"/>
          </h:column>
        </f:facet>
        <h:inputText value="#{course.name}" size="10" rendered="#{course.editable}" />
        <h:outputText value="#{course.name}" rendered="#{not course.editable}"/>
      </h:column>
      
      <h:column>
        <%-- Via this facet we define the table header (column 3) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Description"/>
          </h:column>
        </f:facet>
        <h:inputText value="#{course.description}" size="10" rendered="#{course.editable}" />
        <h:outputText value="#{course.description}" rendered="#{not course.editable}"/>
      </h:column>
     
      <h:column>
        <%-- Via this facet we define the table header (column ) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Actions"/>
          </h:column>
        </f:facet>  
        <h:panelGrid columns="2">
          <h:commandLink value="Delete" action="#{courseManager.delete}">
            <f:setPropertyActionListener target="#{courseManager.course}" value="#{course}" />
          </h:commandLink>
          <h:commandLink value="Modify" action="#{courseManager.modify}" rendered="#{not instructor.editable}">
       	  	<f:setPropertyActionListener target="#{courseManager.course}" value="#{course}" />
       	  </h:commandLink>
       	  <h:commandLink value="Select to assign instructor/add prereq" action="#{courseManager.select}"/>
       	  
        </h:panelGrid>
      </h:column>
    </h:dataTable>
    <h:commandButton value="Save Changes" action="#{courseManager.saveChanges}" rendered="#{not courseManager.form.rendered}" />
  </h:form>
  
 	 <h:form binding="#{courseManager.modifyForm}" rendered="false">
    		<h:panelGrid columns="2">
    		<h:commandLink value="Click to Assign Instructor by ID" action="#{courseManager.assignInstructor}" /> 
      		<h:inputText value="#{courseManager.teacherToAssign}" />
         	<h:commandLink value="Enter course name & Click to add as prereq " action="#{courseManager.addPrereqCourse}"/>
         	<h:inputText value="#{courseManager.prereqToAdd}" />
   			</h:panelGrid>
         </h:form> 
	
</f:view>
</body>
</html>