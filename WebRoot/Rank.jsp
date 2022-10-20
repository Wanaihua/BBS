<%@ page language="java" import="java.util.*,Bean.User" pageEncoding="UTF-8"%>
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
    
    <title>My JSP 'myself.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	
	
		<% 
			int id=0;
			if(request.getAttribute("id")!=null){
			 id=Integer.parseInt(request.getAttribute("id").toString());
			}
			if(id==1){
				%>
				$("#id").addClass("in");		
				<%
			}else{
				%>
				$("#root").addClass("in");		
				<%
			}
		%>
	})
	</script>
	<style type="text/css">
		body,table{
			font-size:12px;
		}
		.in{
			display: none;
		}
		.disabled{
			opacity: 0.6;
			cursor: not-allowed;
		}
		.bbody{
			width: 960px;
			height:600px;
			background: #fff;
			border-radius: 10px;
			padding: 85px 43px 11px 33px;
		}
		table{
			table-layout:fixed;
			empty-cells:show; 
			border-collapse: collapse;
			margin:0 auto;
			text-align:center;
			border:1px solid #cad9ea;
			color:#666;
		}
		td,th{
			border:1px solid #cad9ea;
			padding:0 1em 0;
		}
		tr:nth-child(even){
			background-color: #f2f2f2
		}
		table,tr{
			background-color:#f5fafe;
		}
		th{
			background-image: url("img/th_bg1.gif");
			background-repeat::repeat-x;
			height:30px;
		}
		a{
			text-decoration : none;
		}
		td{
			height: 8%;
		}
	</style>
  </head>
  
  <body>
  <div class="bg">
   <jsp:useBean id="command" class="Bean.Invitation"></jsp:useBean>
  	<div class="bbody">
   <table width="100%" height="80%">
   		<tr>
   			<th><spring:message code="Rank"></spring:message></th>
   			<th><spring:message code="userName"></spring:message></th>
   			<th><spring:message code="sum"></spring:message></th>
   			<th><spring:message code="points"></spring:message></th>
   		</tr>
   	<%	
   		User user=null;
   		List list=(List)session.getAttribute("l");
   		for(int i=0;i<list.size();i++){
			user=(User)list.get(i);
			out.println("<tr><td>"+(i+1)+"</td>"+"<td>"+user.getUserName()+"</td>"+"<td>"+user.getUserPoints()/3+"</td>"+"<td>"+user.getUserPoints()+"</td></tr>");
		}
		for(int i=list.size()-1;i<9;i++){
			out.println("<tr><td></td><td></td><td></td><td></td></tr>");
		}
   	 %>
   </table>
   <a href="refresh.do?id=<%=id %>&amp;pages=1" style="float: right;" id="id">返回</a>
   <a href="rootRefresh.do?id=<%=id %>&amp;pages=1" style="float: right;" id="root">返回</a>
   	</div>
   </div>
  </body>
</html>
