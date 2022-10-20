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
    
    <title>My JSP 'release.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="jquery.min.js"></script>
	<style type="text/css">
		.bor{
			border: 2px solid red;
		}
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
		.rig{
			margin-top: -100px;
		}
		.button {
		    background-color: #00BBFF;
		    border: none;
		    color: white;
		    text-align: center;
		    padding: 10px 5px;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 10px;
		    cursor: pointer;
		    float: left;
		}
		.button:hover {
		    background-color: #009FCC;
		}
	</style>
  </head>
  
  <body>
   <%
   		List l=(List)session.getAttribute("user");
			User user=(User)l.get(0);
    %>
   	console.log(<%=user%>);
    <div class="bg">
    <jsp:useBean id="command" class="Bean.User" scope="request"></jsp:useBean>
    <div class="body">
    <div class="rig">
    <form:form name="form1" id="form1" action="update.do" method="post">
    	<form:input  path="userId" style="display: none" />
    	<input name="userBirthday" type="text" style="display: none" id="userBirthday"/><br/>
    	<table cellspacing="10px">
    		<tr id="shows">
    			<td><spring:message code="userName"></spring:message>:</td>
    			<td><form:input path="userName" id="userName"/><form:errors path="userName"></form:errors></td>
    		</tr>
    		<tr id="show">
    			<td><spring:message code="oldUserPass"></spring:message>:</td>
    			<td><form:input type="password" path="oldUserPass" id="oldUserPass"/></td>
    		</tr>
    		<tr id="show">
    			<td><spring:message code="newUserPass"></spring:message>:</td>
    			<td><form:input type="password" path="userPass" id="userPass"/></td>
    		</tr>
    		<tr id="show">
    			<td><spring:message code="password1"></spring:message>:</td>
    			<td><form:input type="password" path="" id="password1"/></td>
    		</tr>
    		<tr>
    			<td><spring:message code="userEmail"></spring:message>:</td>
    			<td><form:input path="userEmail" id="userEmail"/></td>
    		</tr>
    		<tr>
    			<td><spring:message code="userNickname"></spring:message>:</td>
    			<td><form:input path="userNickname" id="userNickname"/></td>
    		</tr>
    		<tr>
    			<td><spring:message code="userBirthday"></spring:message>:</td>
    			<td><select id="year" onchange="changeday()" name="year"> <option value="">年</option></select><select id="month" name="month"  onchange="changeday()"><option value="">月</option> </select><select id="day" name="day" ><option value="">日</option> </select>
    		<script type="text/javascript" language="javascript">
    		  			<%	int id=0;
    		  			if(request.getAttribute("id")!=null){
                            	id=Integer.parseInt(request.getAttribute("id").toString());
                          %>
                            	window.alert("修改成功");<%
					   		}
                          %>
                            var curdate = new Date();
                            var year = document.getElementById("year");
                            var month = document.getElementById("month");
                            var day = document.getElementById("day");
                            $(document).ready(function(){
                            	$("tr[id='show']").hide();
								$("input[type!=text]").addClass("button");
								$("input[type=password]").removeClass("button");
								$("input[type=radio]").removeClass("button");
    							$("input[type=text]").addClass("inputtt");
    							$("input[type=password]").addClass("inputtt");
                            	$("#userId").val("<%=user.getUserId() %>");
                            	$("#userName").val("<%=user.getUserName() %>");
                            	$("#userEmail").val("<%=user.getUserEmail() %>")
                            	$("#userNickname").val("<%=user.getUserNickname() %>");
                            	<%
                            		int a=0,year=0,month=0;
                            		String ss=user.getUserBirthday();
                            		StringBuffer sb = new StringBuffer("");
       								 for (int i = 0; i < ss.length(); i++) {
							            if (ss.charAt(i) != '-') {
							                sb.append(ss.charAt(i));
							            }else{
								            if(a==0){
								            	year=Integer.parseInt(sb.toString());
								            	sb=new StringBuffer("");;
								            }
								            if(a==1){
								            	month=Integer.parseInt(sb.toString());
								            	sb=new StringBuffer("");;
								            }
								            a++;
							            }
							        }
							        int day=Integer.parseInt(sb.toString());
                            	%>
								$("#year option[value='<%=year %>']").attr("selected",true);
								$("#month option[value='<%=month %>']").attr("selected",true);
								$("#day option[value='<%=day %>']").attr("selected",true);
								$("#userRemark").val("<%=user.getUserRemark() %>");
								$("input[id='<%=user.getSex() %>']").attr("checked",true);
								
								$("#updatePass").click(function(){
	                            	if($("tr[id='shows']").next().is(":hidden")){
	                            		$("tr[id='show']").slideDown("slow");
	                            		$("#userPass").val("");
	                            	}else{
	                            		$("tr[id='show']").slideUp(1);
	                            		$("#userPass").val("<%=user.getUserPass() %>");
	                            	}
                            	
                            	});
                            	
                            	$("#getday").click(function(){
                            		if($("tr[id='shows']").next().is(":hidden")){
                            			var s="";
	                            		s=s+$("#year").val()+"-"+$("#month").val()+"-"+$("#day").val();
	                            		$("#userPass").val("<%=user.getUserPass() %>");
	                            		$("#userBirthday").val(s);
	                            		form1.submit();
                            		}else{
                            			var oldpass=$("#oldUserPass").val();
                            			var newpass=$("#userPass").val();
                            			var password1=$("#password1").val();
                            			if(oldpass==""){
                            				alert("不能为空");
                            				$("#oldUserPass[value='']").focus();
                            				return false;
                            			}else if(newpass==""){
                            				alert("不能为空");                 
                            				$("#userPass[value='']").focus();
                            				return false;
                            			}else if(password1==""){
                            				alert("不能为空");
                            				$("#password1[value='']").focus();
                            				return false;
                            			}else if(oldpass!=<%=user.getUserPass() %>){
                            				alert("密码错误!!!");
                            				$("#password1[value='']").removeClass("bor");
                            				$("#oldUserPass[value='']").addClass("bor");
                            				return false;
                            			}else if(newpass!=password1){
                            				alert("两次密码不一致");
                            				$("#password1[value='']").addClass("bor");
                            				return false;
                            			}else{
	                            			var s="";
		                            		s=s+$("#year").val()+"-"+$("#month").val()+"-"+$("#day").val();
		                            		$("#userBirthday").val(s);
		                            		form1.submit();
                            			}
                            			
                            		}
                            		
                            	});
                            	
                            	
                            });
                            function add() {
                                var curyear = curdate.getFullYear();
                                var minyear = curyear - 100;
                                var maxyear = curyear;
        						for (maxyear; maxyear >= minyear; maxyear = maxyear - 1) {
                                    year.options.add(new Option(maxyear, maxyear));
                                }
                                for (var mindex = 1; mindex <= 12; mindex++) {
                                    month.options.add(new Option(mindex, mindex));
                                }
                            }

                            function leapyear(intyear) {
                                var result = false;
                                if (((intyear % 400 == 0) && (intyear % 100 != 0)) || (intyear % 4 == 0)) {
                                    result = true;
                                }
                                else {
                                    result = false;
                                }
                                return result;
                            }
                            function addday(maxday) {
                                day.options.length = 1;
                                for (var dindex = 1; dindex <= maxday; dindex++) {
                                    day.options.add(new Option(dindex, dindex));
                                }
                            }
                            function changeday() {
                                if (year.value == null || year.value == "") {
                                    alert("请先选择年份！");
                                    return false;
                                }
                                else {
                                    if (month.value == 1 || month.value == 3 || month.value == 5 || month.value == 7 || month.value == 8 || month.value == 10 || month.value == 12) {
                                        addday(31);
                                    }
                                    else {
                                        if (month.value == 4 || month.value == 6 || month.value == 9 || month.value == 11) {
                                            addday(30);
                                        }
                                        else {
                                            if (leapyear(year.value)) {
                                                addday(29);
                                            }
                                            else {
                                                addday(28);
                                            }
                                        }
                                    }
                                }
                            }
                            window.onload = add();
                            window.onload = addday(30);
                            
                            function goback(){
                            	document.getElementById("aa").style.display="block";
                            	setInterval(go, 1000);
                            }
                            var x=2; 
							function go(){ 
								x--; 
								if(x>0){ 
									document.getElementById("sp").innerHTML=x;
								}else{ 
									location.href='refresh.do?id=<%=user.getUserId() %>&pages=1'; 
								} 
							} 

                            
                        </script></td>
    		</tr>
    		<tr>
    			<td><spring:message code="sex"></spring:message>:</td>
    			<td><input type="radio" value='<spring:message code="man"></spring:message>' name="sex" id="<spring:message code="man"></spring:message>"/><spring:message code="man"></spring:message><input type="radio" value='<spring:message code="woman"></spring:message>' name="sex" id='<spring:message code="woman"></spring:message>' /><spring:message code="woman"></spring:message><br/></td>
    		</tr>
    		<tr>
    			<td><spring:message code="userRemark"></spring:message>:</td>
    			<td><form:textarea path="userRemark" id="userRemark" class="area"/></td>
    		</tr>
    		<tr>
    			<td><input type="button" value='<spring:message code="update"></spring:message>' id="getday"/><input type="button" value='<spring:message code="updatePass"></spring:message>' id="updatePass"/></td>
    			<td><input type="reset" value='<spring:message code="reset"></spring:message>' /><input type="button" value='<spring:message code="goback"></spring:message>' onclick="goback()"/></td>
    		</tr>
    	</table>
    	<a style="display: none; padding-left: 220px; margin-top: -40px;color: #00BBFF;" id="aa"><span id="sp">2</span>秒后跳转</a>
    	
    </form:form>
    </div>
    </div>
    </div>
  </body>
</html>
