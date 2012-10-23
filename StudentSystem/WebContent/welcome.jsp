<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome </title>
</head>
<body>
<f:view>
	<h:form>
		<h2>  Welcome </h2>
		<h:panelGrid columns="1">
			<h:outputLink value="courses.jsp">  Courses </h:outputLink>
			<h:outputLink value="students.jsp">  Students </h:outputLink>
			<h:outputLink value="instructors.jsp">  Instructors </h:outputLink>
			<h:outputLink value="register.jsp">  Register/Drop </h:outputLink>
			<h:outputLink value="reports.jsp">  Reports </h:outputLink>
		</h:panelGrid>
		<h:messages layout="table"></h:messages>
	</h:form>
	
</f:view>
</body>
</html>