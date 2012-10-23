<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Instructors Page</title>

<LINK href="<%=request.getContextPath()%>/css/mystyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<f:view>
	<h:messages layout="table"></h:messages>
	<h:form><h:commandLink action="welcome.jsp" value="Homepage"/></h:form>
	
	<h:form>
    	<h:commandLink  action="#{courseManager.instructorManager.addInstructor}" value="Add new instructor"/>
 	</h:form>
    
	<h:form binding="#{courseManager.instructorManager.form}" rendered="false">
		<h:panelGrid columns="2"> 
		<h:outputLabel > Instructor ID </h:outputLabel>
		<h:inputText value = "#{courseManager.instructorManager.instructor.ID}"/> 
		<h:outputLabel > Instructor Name </h:outputLabel>
		<h:inputText value = "#{courseManager.instructorManager.instructor.name}" />
		</h:panelGrid>
			<h:panelGroup>
		 		<h:commandButton action="#{courseManager.instructorManager.save}" value="Save"/>
		 	</h:panelGroup>
	</h:form>
	
	<h:form >
    <h:dataTable value="#{courseManager.instructorManager.instructors}" var="instructor" 
    styleClass="entity" headerClass="entityheader" columnClasses="first, rest">
      <h:column>
        <%-- Via this facet we define the table header (column 1) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Instructor ID"/>
          </h:column>
        </f:facet>
        <h:inputText value="#{instructor.ID}" size="10" rendered="#{instructor.editable}" />
        <h:outputText value="#{instructor.ID}" rendered="#{not instructor.editable}"/>
      </h:column>
      
      <h:column>
        <%-- Via this facet we define the table header (column 2) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Instructor Name"/>
          </h:column>
        </f:facet>
        <h:inputText value="#{instructor.name}" size="10" rendered="#{instructor.editable}" />
        <h:outputText value="#{instructor.name}" rendered="#{not instructor.editable}"/>
      </h:column>
     
      <h:column>
        <%-- Via this facet we define the table header (column 4) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Actions"/>
          </h:column>
        </f:facet>  
        <h:panelGrid columns="2">
          <h:commandLink value="Delete" action="#{courseManager.instructorManager.delete}">
            <f:setPropertyActionListener target="#{courseManager.instructorManager.instructor}"
              value="#{instructor}" />
          </h:commandLink> 
       	  <h:commandLink value="Modify" action="#{courseManager.instructorManager.modify}" rendered="#{not instructor.editable}"/>
        </h:panelGrid>
      </h:column>
    </h:dataTable>
    <h:commandButton value="Save Changes" action="#{courseManager.instructorManager.saveChanges}" 
    rendered="#{not courseManager.instructorManager.form.rendered}" />
  </h:form>

</f:view>
</body>
</html>