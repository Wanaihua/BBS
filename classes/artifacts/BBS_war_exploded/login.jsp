<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script src="jquery.min.js" type="text/javascript" ></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#userLogin").addClass("bor");
    		$("#userLogin").click(function(){
    			$("#userLogin").addClass("bor");
    			$("#rootLogin").removeClass("bor");
    			$("#form1").attr("action","login.do");
    			
    		});
    		$("#rootLogin").click(function(){
    			$("#userLogin").removeClass("bor");
    			$("#rootLogin").addClass("bor");
    			$("#form1").attr("action","rootlogin.do");
    			
    		});
		  <%
		  	if(request.getAttribute("no")!=null){
		  		%>    
		  		alert("用户名或密码错误!!!");
		  		<%
		  	}else if(request.getAttribute("rootno")!=null){
		  		%>    
		  		alert("用户名或密码错误!!!");
		  		$("#userLogin").removeClass("bor");
    			$("#rootLogin").addClass("bor");
    			$("#form1").attr("action","rootlogin.do");
		  		<%
		  	}
		   %>
		});
	</script>
	<style type="text/css">
		.bor{
			border-bottom: 5px solid pink;
            padding-bottom: 10px;
            color: pink;
		}
		.txt2{
			margin-top: 400px;
			margin-right: -100px;
		}
	</style>
  </head>
  
  <body>
  <div class="login">
	<div class="bg">
		<div class="body">
			<div class="img">
					<img src="img/img-01.png" alt="IMG">
			</div>
		    <jsp:useBean id="command" class="Bean.User" scope="request"></jsp:useBean>
		    <form:form action="login.do" method="post" name="form1" id="form1" >
		    <div class="title">
		    		<span class="pad1" id="userLogin"><spring:message code="userLogin"></spring:message></span>
		    		<span class="pad1" id="rootLogin"><spring:message code="rootLogin"></spring:message></span>
		    </div>
		    	
		    <div class="inputt">
		    	<form:input path="userName" class="inputtt" placeholder="用户名"/><form:errors path="userName"></form:errors>
			</div>
			
			<div class="inputt">		    	
		    	<form:input path="userPass" type="password" class="inputtt" placeholder="密码"/><form:errors path="userPass"></form:errors>
			</div>
		    
		    <div class="">	    		
		    	<input type="submit" value='<spring:message code="submit"></spring:message>' class="btn">
		    </div>		    	  		  
		    </form:form>
    	<a class="txt2" href="register.jsp">
			<spring:message code="register"></spring:message>
		</a>
    	</div>
    </div>
   </div>
  </body>
</html>
