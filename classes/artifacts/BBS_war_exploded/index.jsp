<%@ page language="java" import="java.util.*,Bean.*" pageEncoding="UTF-8"%>
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
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("input[id!='login']").attr("disabled","true");
			$("input[id='Rank']").removeAttr("disabled","true");
			$("input[id='admin']").removeAttr("disabled");
			$("#update").addClass("in");
			$("#delete").addClass("in");
		<% 
			int id=0;
			List list=(List)session.getAttribute("l");
			boolean us=false;
			if(request.getAttribute("user")!=null){
				List<User> l=(List)request.getAttribute("user");
				User user=l.get(0); 
				id=user.getUserId();
				%>
				$("#login").val("欢迎用户:<%=user.getUserName() %>");
				$("input[id='login']").attr("disabled","true");
				$("input[id!='login']").removeAttr("disabled");
				<%
			}else if(request.getAttribute("root")!=null){
				us=true;
				List<Rootr> l=(List)request.getAttribute("root");
				Rootr rootr=l.get(0); 
				id=rootr.getUserId();
				%>
				$("#login").val("欢迎用户:<%=rootr.getUserName() %>");
				$("#release").val("发表公告");
				$("input[id='login']").attr("disabled","true");
				$("span[id='infor']").addClass("in");
				$("input[id!='login']").removeAttr("disabled");
				$("#update").removeClass("in");
				$("#delete").removeClass("in");
				<%
			}
		%>
			$("#form1 input").removeAttr("disabled");
			$("#login").click(function(){
				$(location).attr('href', 'login.jsp');
			});
			$("#out").click(function(){
				$(location).attr('href', 'go.jsp');
			});
			$("#release").click(function(){
			<%
				if(us){ %>
					$(location).attr('href', 'release.jsp?id=<%=id %>&root=1');
			<%	}else{	%>			
					$(location).attr('href', 'release.jsp?id=<%=id %>');
			<%	} %>
			});
			$("#information").click(function(){
			<%
				if(us){ %>
					$(location).attr('href', 'information.do?id=<%=id %>&root=1');
			<%	}else{	%>			
					$(location).attr('href', 'information.do?id=<%=id %>');
			<%	} %>
			});
			$("#look").click(function(){	
					<%
				if(us){ %>
					$(location).attr('href', 'look.do?id=<%=id %>&root=1');
			<%	}else{	%>			
					$(location).attr('href', 'look.do?id=<%=id %>');
			<%	} %>
			});
			$("#Rank").click(function(){
					if(id!=0)
						$(location).attr('href', 'Rank.do?id=<%=id %>');
					else
						$(location).attr('href', 'Rank.do');
			});
		});
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
			padding: 60px 43px 11px 33px;
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
		span input{
			margin-left: 10px;
		}
		#navigation{			
			background-image:url(img/navigation_bg.jpg);
			width:100%;
			height:26px;
			padding:5px 5px 0px 5px;
			margin: 0px;
		}
		#navigation input{
			background-image: url(img/navigation_bg.jpg);
		}
		a{
			text-decoration : none;
		}
		td{
			height: 9%;
		}
		#ull li{
		border:0; margin:0; padding:0;
		font-size:11px;
		list-style:none;
		}
		#ull a{
		border:solid 1px #DDDDDD;
		margin-right:2px;
		}
		#ull .previous-off,
		#ull .next-off {
		color:#666666;
		display:block;
		float:left;
		font-weight:bold;
		padding:3px 4px;
		}
		#ull .next a,
		#ull .previous a {
		font-weight:bold;
		border:solid 1px #FFFFFF;
		} 
		#ull .active{
		color:#ff0084;
		font-weight:bold;
		display:block;
		float:left;
		padding:4px 6px;
		}
		#ull a:link,
		#ull a:visited {
		color:#0063e3;
		display:block;
		float:left;
		padding:3px 6px;
		text-decoration:none;
		}
		#ull a:hover{
		border:solid 1px #666666;
		}
	</style>
  </head>
  
  <body>
  <form action="lookOne.do" name="form1" id="form1" method="post">
  	<input type="text" name="x" id="x" style="display: none;">
  	<input type="text" name="pages" id="pages" style="display: none;">
  	<input type="text" name="id" id="id" style="display: none;">
  </form>
  <div class="bg">
  	<div class="bbody">
  	<div id="navigation">
		<div style="float:left;color:#00BBFF;">
			<b> &nbsp; 》&nbsp; 欢迎光临爱华论坛网！</b>
		</div>
		<div style="float:right;text-align: right;">
			&nbsp; | &nbsp;<input type="button" value="请登录" id="login">
			&nbsp; | &nbsp;<input type="button" value="排行榜" id="Rank">
			&nbsp; | &nbsp;<input type="button" value="发表新帖" id="release" >
			<span id="infor">&nbsp; | &nbsp;<input type="button" value="个人信息" id="information"></span>
			&nbsp; | &nbsp;<input type="button" value="我的帖子" id="look">
			&nbsp; | &nbsp;<input type="button" value="安全退出" id="out">
		</div>
	</div>
	<table width="100%" height="80%">
		<tr>
   			<th><spring:message code="list"></spring:message></th>
   			<th><spring:message code="title"></spring:message></th>
   			<th><spring:message code="author"></spring:message></th>
   			<th><spring:message code="date"></spring:message></th>
   			<th id="delete"><spring:message code="delete"></spring:message></th>
   			<th id="update"><spring:message code="update"></spring:message></th>
   		</tr>
   	<%	
   		int l=list.size()%10;
   		if(list.size()%10==0){
   			l=list.size()/10;
   		}else{
   			l=list.size()/10+1;
   		}
   		int pages=1;
   		if(request.getAttribute("pages")==null)
   			pages=Integer.parseInt(request.getParameter("pages"));
   		else
   			pages=Integer.parseInt(request.getAttribute("pages").toString());
   		int max=0;
   		if(pages*10>list.size()){
   			max=list.size();
   		}else{
   			max=10*pages;
   		}
   		if(us){
	   		for(int i=10*(pages-1);i<max;i++){
				Invitation invitation=(Invitation)list.get(i);
				out.println("<tr id='t'><td>"+(i+1)+"</td>"+"<td>"+invitation.getTopic()+"</td>"+"<td>"+invitation.getAuthor()+"</td>"+"<td>"+invitation.getPostTime()+"</td>"+"<td id='delete'><a href='RootDeletePost.do?id="+invitation.getPostId()+"&pages="+pages+"'>delete</a></td>"+"<td id='update'><a href='findPost.do?id="+invitation.getPostId()+"&useId=1&pages="+pages+"'>update</a></td></tr>");
			}
			for(int i=max;i<10*pages;i++){
				out.println("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
			}
		}else{
			for(int i=10*(pages-1);i<max;i++){
				Invitation invitation=(Invitation)list.get(i);
				out.println("<tr id='t'><td>"+(i+1)+"</td>"+"<td>"+invitation.getTopic()+"</td>"+"<td>"+invitation.getAuthor()+"</td>"+"<td>"+invitation.getPostTime()+"</td></tr>");
			}
			for(int i=max;i<10*pages;i++){
				out.println("<tr><td></td><td></td><td></td><td></td></tr>");
			}
		}
		StringBuffer sb = new StringBuffer();
		if(id==0) sb.append("<ul id='ull'><li><a href='index.jsp?pages=1'>首页</a></li>");
		else if(!us) sb.append("<ul id='ull'><li><a href='refresh.do?pages=1&amp;id="+id+"'>首页</a></li>");
		else sb.append("<ul id='ull'><li><a href='rootRefresh.do?pages=1&amp;id="+id+"'>首页</a></li>");
		for (int i = 1; i <= l; i++) {
	        if (i == pages) { 
	        	if(id==0)
	            sb.append("<li><a href='index.jsp?pages=" + i + "'>" + i + "</a></li>");
	            else if(us) sb.append("<li><a href='rootRefresh.do?pages=" + i + "&amp;id="+id+"'>" + i + "</a></li>");
	            else sb.append("<ul id='ull'><li><a href='refresh.do?pages=1&amp;id="+id+"'>"+i+"</a></li>");
	        } else {
	        	if(id==0)
	            	sb.append("<li><a href='index.jsp?pages=" + i + "'>" + i + "</a></li>");
	            else if(us)
	            	sb.append("<li><a href='rootRefresh.do?pages=" + i + "&amp;id="+id+"'>" + i + "</a></li>");
	           	else
	            	sb.append("<li><a href='refresh.do?pages=" + i + "&amp;id="+id+"'>" + i + "</a></li>");
	        }
    	}
    	if(id==0) sb.append("<ul id='ull'><li><a href='index.jsp?pages="+l+"'>末页</a></li>");
		else if(!us) sb.append("<ul id='ull'><li><a href='refresh.do?pages="+l+"&amp;id="+id+"'>末页</a></li>");
		else sb.append("<ul id='ull'><li><a href='rootRefresh.do?pages="+l+"&amp;id="+id+"'>末页</a></li>");
    	request.setAttribute("bar", sb.toString()); 
   	 %>
	</table>
	<%=request.getAttribute("bar")%>
	</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("tr[id='t']").click(function(){
				var x=$(this).children(':first-child').text();
				$("#x").val(x);
				$("#pages").val(<%=pages %>);
				$("#id").val(<%=id %>);
				form1.submit();
			});
		});
	</script>
  </body>
</html>
