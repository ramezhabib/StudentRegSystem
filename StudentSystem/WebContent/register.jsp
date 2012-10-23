<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register/Drop</title>

<LINK href="<%=request.getContextPath()%>/css/mystyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<f:view>
	<h:messages layout="table"></h:messages>
	<h:form><h:commandLink action="welcome.jsp" value="Homepage"></h:commandLink></h:form>
	
	<h:form >
		<h:panelGrid columns="2"> 
		<h:outputLabel > Student ID </h:outputLabel>
		<h:inputText value = "#{courseManager.studentToReg}"></h:inputText>
		<h:outputLabel > Course Name </h:outputLabel>
		<h:inputText value = "#{courseManager.courseToReg}"></h:inputText> 
		</h:panelGrid>
			<h:panelGrid columns="2">
		 		<h:commandLink action="#{courseManager.regCourse}" value="Register Student"></h:commandLink>
		 		<h:commandLink action="#{courseManager.dropCourse}" value="Drop Student"></h:commandLink>
		 	</h:panelGrid>
	</h:form>

</f:view>
</body>
</html>