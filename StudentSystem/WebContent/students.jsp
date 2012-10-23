<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Students Page</title>

<LINK href="<%=request.getContextPath()%>/css/mystyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<f:view>
	<h:messages layout="table"></h:messages>
	<h:form><h:commandLink action="welcome.jsp" value="Homepage"/></h:form>
	
	<h:form>
    	<h:commandLink  action="#{courseManager.studentManager.addStudent}" value="Add new student"/>
 	</h:form>
    
	<h:form binding="#{courseManager.studentManager.form}" rendered="false">
		<h:panelGrid columns="2"> 
		<h:outputLabel > Student ID </h:outputLabel>
		<h:inputText value = "#{courseManager.studentManager.student.ID}"/> 
		<h:outputLabel > Student Name </h:outputLabel>
		<h:inputText value = "#{courseManager.studentManager.student.name}"/>
		</h:panelGrid>
			<h:panelGroup>
		 		<h:commandButton action="#{courseManager.studentManager.save}" value="Save"/>
		 	</h:panelGroup>
	</h:form>
	
	<h:form >
    <h:dataTable value="#{courseManager.studentManager.students}" var="student"
    styleClass="entity" headerClass="entityheader" columnClasses="first, rest">
      <h:column>
        <%-- Via this facet we define the table header (column 1) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Student ID"/>
          </h:column>
        </f:facet>
        <h:inputText value="#{student.ID}" size="10" rendered="#{student.editable}" />
        <h:outputText value="#{student.ID}" rendered="#{not student.editable}"/>
      </h:column>
      <h:column>
        <%-- Via this facet we define the table header (column 2) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Student Name"/>
          </h:column>
        </f:facet>
        <h:inputText value="#{student.name}" size="10" rendered="#{student.editable}" />
        <h:outputText value="#{student.name}" rendered="#{not student.editable}"/>
      </h:column>
     
      <h:column>
        <%-- Via this facet we define the table header (column 4) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Actions"/>
          </h:column>
        </f:facet>  
        <h:panelGrid columns="2">
          <h:commandLink value="Delete" action="#{courseManager.studentManager.delete}">
            <f:setPropertyActionListener target="#{courseManager.studentManager.student}"
              value="#{student}" />
          </h:commandLink>
          <h:commandLink value="Modify" action="#{courseManager.studentManager.modify}" rendered="#{not student.editable}"/>
        </h:panelGrid>
      </h:column>
    </h:dataTable>
    <h:commandButton value="Save Changes" action="#{courseManager.studentManager.saveChanges}" 
    rendered="#{not courseManager.studentManager.form.rendered}" />
    
  </h:form>
	
	

</f:view>
</body>
</html>