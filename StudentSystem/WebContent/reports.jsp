<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reports </title>

<LINK href="<%=request.getContextPath()%>/css/mystyle.css"
  rel="stylesheet" type="text/css">
</head>
<body>
<f:view>
	<h:messages layout="table"></h:messages>
	<h:form><h:commandLink action="welcome.jsp" value="Homepage"></h:commandLink></h:form>
	
	<h:form >
    <h:dataTable value="#{courseManager.courses}" var="c"
    styleClass="entity" headerClass="entityheader"
      columnClasses="first, rest">
      <h:column>
        <%-- Via this facet we define the table header (column 2) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Course Name"></h:outputText>
          </h:column>
        </f:facet>
        <h:outputText value="#{c.name}"></h:outputText>
      </h:column>
      
       <h:column>
        <%-- Via this facet we define the table header (column 4) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Course Pre-reqs"/>
          </h:column>
        </f:facet>
        <h:dataTable value="#{c.prereqs}" var="pre"  styleClass="entity" headerClass="entityheader"
      			columnClasses="first, rest">
      			<h:column>
        			<h:outputText value="#{pre.name}"></h:outputText>
      			</h:column>	
      		</h:dataTable>
      </h:column>
      
      <h:column>
        <%-- Via this facet we define the table header (column 4) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Instructor"></h:outputText>
          </h:column>
        </f:facet>
        <h:outputText value="#{c.instructor.name}"></h:outputText>
      </h:column>
            
     
      <h:column>
        <%-- Via this facet we define the table header (column 4) --%>
        <f:facet name="header">
          <h:column>
            <h:outputText value="Enrolled Students"></h:outputText>
          </h:column>
        </f:facet>  
        	<h:dataTable value="#{c.students}" var="i"
    			styleClass="entity" headerClass="entityheader"
      			columnClasses="first, rest">
      			<h:column>
        			<h:outputText value="#{i.name}"></h:outputText>
      			</h:column>	
      		</h:dataTable>
      </h:column>
    </h:dataTable>
  </h:form>
  <h:form> <h:commandLink action="#{courseManager.printToFile}"> Print to file "data.csv" in home directory</h:commandLink></h:form>

</f:view>
</body>
</html>