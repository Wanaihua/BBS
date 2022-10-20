<%@ page language="java" import="java.util.*,Bean.Invitation" pageEncoding="UTF-8"%>
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
		<% 
			int root=0;
			if(request.getAttribute("root")!=null){
				root=1;
			}
			if(request.getAttribute("id")!=null){
			int id=Integer.parseInt(request.getAttribute("id").toString());
				%>
						alert("暂无帖子,去发表?");
						if(root==0)
						$(location).attr("href","release.jsp?id=<%=id %>");
						else
						$(location).attr("href","release.jsp?id=<%=id %>&root=1");
				<%
			}
			if(request.getAttribute("yes")!=null){
				%>window.alert("删除成功!!"); <%
			}
		
		
		%>
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
		tr:hover, tr:nth-child(even):hover {
			background: #edffcf;
		}
		table,tr{
			background-color:#f5fafe;
		}
		tr:nth-child(even){
			background-color: #f2f2f2
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
   			<th><spring:message code="list"></spring:message></th>
   			<th><spring:message code="title"></spring:message></th>
   			<th><spring:message code="date"></spring:message></th>
   			<th id="delete"><spring:message code="delete"></spring:message></th>
   			<th id="update"><spring:message code="update"></spring:message></th>
   		</tr>
   	<%	
   		Invitation invitation=null;
   		List list=(List)session.getAttribute("l");
   		for(int i=0;i<list.size();i++){
			invitation=(Invitation)list.get(i);
			out.println("<tr><td>"+(i+1)+"</td>"+"<td>"+invitation.getTopic()+"</td>"+"<td>"+invitation.getPostTime()+"</td>"+"<td><a href='deletePost.do?id="+invitation.getPostId()+"&userId="+invitation.getUserId()+"'>delete</a></td>"+"<td><a href='findPost.do?id="+invitation.getPostId()+"&useId="+invitation.getUserId()+"'>update</a></td></tr>");
		}
		for(int i=list.size()-1;i<9;i++){
			out.println("<tr><td></td><td></td><td></td><td></td><td></td></tr>");
		}
   	 %>
   </table>
   <a href="" style="float: right;" id=goback>返回</a>
   <script type="text/javascript">
   			$(document).ready(function(){
			$("#goback").click(function(){
				<% if(root==1){  %>
						$("#goback").attr("href","rootRefresh.do?id=1&pages=1");
				<%	}else{%>
						$("#goback").attr("href","refresh.do?id=<%=invitation.getUserId() %>&pages=1");
				<%	}%>
				});
			});
   </script>
   	</div>
   </div>
  </body>
</html>
