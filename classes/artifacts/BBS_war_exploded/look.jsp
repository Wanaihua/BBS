<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>My JSP 'look.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#bbody div").addClass("div");
		});
	</script>
	<style type="text/css">
		.bbody{
			width: 960px;
			height:600px;
			background: #fff;
			border-radius: 10px;
			padding: 30px 43px 11px 33px;
		}
		.imgg{
			display:block;
			float: right;
			margin-right:-20px;
			margin-top: 20px;
		}
		.div{
			padding-top: 20px;
		}
		.top{
			width: 100%;
			height: 90%;
		}
		.show{
			display: none;
		}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
	<%
		int id=0;
		if(request.getAttribute("id")!=null)
		id=Integer.parseInt(request.getAttribute("id").toString());
		if(id==1){
		%>$("#id1").addClass("show");
		$("#id2").addClass("show");
		 
	   <%
		}else if(id>0){
		%>
		  $("#id").addClass("show");
		  $("#id2").addClass("show");
		<%
		}else{
		%>
		  $("#id1").addClass("show");
		  $("#id").addClass("show");	
		<%
		
		}
		
	 %>
	 });
	</script>
  </head>
  
  <body>
   <div class="bg">
   	<div class="bbody" id="bbody">
   		<div class="top">
   		<div><h3>${sessionScope.l[0].topic }</h3></div>
   		<div><h4 style="float: left;">author: ${sessionScope.l[0].author }</h4>
   		<h4 style="display: inline; margin-left: 200px;">time: ${sessionScope.l[0].postTime }</h4></div>
   		<div><h5>${sessionScope.l[0].matter }</h5></div>
   		</div>
   		<a href="rootRefresh.do?pages=${sessionScope.pages }&id=<%=id %>" class="imgg" id="id"><img src="img/goback.png"></a>
   		<a href="refresh.do?pages=${sessionScope.pages }" class="imgg" id="id2"><img src="img/goback.png"></a>
   		<a href="refresh.do?pages=${sessionScope.pages }&id=<%=id %>" class="imgg" id="id1"><img src="img/goback.png"></a>
   	</div>
   </div>
   
  </body>
</html>
