<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
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
    
    <title>My JSP 'release.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main.css">
		<script src="jquery.min.js" type="text/javascript" ></script>
	<script type="text/javascript">
   <%
   		int id=0;
   		if(request.getParameter("id")!=null)
   			id=Integer.parseInt(request.getParameter("id"));
   		else{
   			id=Integer.parseInt(request.getAttribute("id").toString());
   			if(request.getAttribute("null")==null){
   			%>
   				alert("发表成功");
   			<%
   			}
   		}
   		if(request.getParameter("root")!=null||request.getAttribute("root")!=null){
   		%>
   			$("#form1").attr("action","release.do?root=1");
   		<%
   		}
    %>
		$(document).ready(function() {
    		$("input[type=text]").addClass("inputtt");
    		$("input[type!=text]").addClass("button");
    			<% 
    			if(request.getParameter("root")!=null){
    			%>
   					document.getElementById("headd").innerHTML="发表公告";
   				<%
   				}
    			%>
    		$("#btn").click(function(){
    				<%
    				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    				%>
    				$("#time").val("<%=df.format(new Date()) %>");
    				form1.submit();
    		});
    		$("#goback").click(function(){
    			<%
    				if(request.getParameter("root")!=null||request.getAttribute("root")!=null){
    				%>	$(location).attr("href","rootRefresh.do?id=<%=id %>&pages=1");
    			<%}else{
    				%>
						$(location).attr("href","refresh.do?id=<%=id %>&pages=1");
    				<%
    				}
    			 %>
			});
	});
	</script>
	<style type="text/css">
		.inputtt {
		  font-family: Poppins-Medium;
		  font-size: 15px;
		  color: #666666;
		  display: block;
		  width: 100%;
		  background: #e6e6e6;
		  height: 30px;
		  border-radius: 25px;
		}
		.area{
			font-size:15px;
			width:600px;
			height:280px;
			background: #e6e6e6;
		}
		.bbody{
			width: 960px;
			height:600px;
			background: #fff;
			border-radius: 10px;
			padding: 60px 43px 11px 33px;
		}
		.button {
		    background-color: #00BBFF; 
		    border: none;
		    color: white;
		    padding: 10px 21px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 16px;
		    cursor: pointer;
		    float: left;
		}
		
		.button:hover {
		    background-color: #009FCC;
		}
	</style>
  </head>
  
  <body>
  <div class="bg">
	  	<div class="bbody">
	    <jsp:useBean id="command" class="Bean.Invitation" scope="request"></jsp:useBean>
	    <form:form name="form1" id="form1" action="release.do" method="post">
	    <input type="text" name="userId" value="<%=id %>" style="display: none;" />
	    <input type="text" name="postTime" value="" style="display:none;"  id="time"/>
	    <table cellspacing="10px">
		    <tr>
		    	<th></th>
		    	<th align="center" id="headd"><spring:message code="Post a new post"></spring:message></th>
		    </tr>
	    	<tr>
	    		<td><spring:message code="title"></spring:message>:</td>
	    		<td><form:input path="topic" /><form:errors path="topic"></form:errors></td>
	    	<tr>
	    	<tr>
	    		<td><spring:message code="body"></spring:message></td>
	    		<td><form:textarea path="matter" class="area" /><form:errors path="matter"></form:errors></td>
	    	</tr>
	    	<tr>
	    		<td></td><td><input type="button" value='<spring:message code="submitt"></spring:message>' onclick="getday()" id="btn" /><input type="reset" value='<spring:message code="reset"></spring:message>' /><input type="button" value='<spring:message code="goback"></spring:message>' id="goback" /></td>
	    	</tr>
	    </table>
	    	
	    </form:form>
	    
	    </div>
    </div>
  </body>
</html>
