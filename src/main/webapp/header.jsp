<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css"> 
</head>
<body>

<header>
<%
	String checkName="";
	checkName=(String)session.getAttribute("s_Name");
	System.out.println("name :" +checkName);
	
	if(checkName==null) {
%>
 <h3 id="lo">쇼핑몰에 오신 것을 환영합니다.</h3>
 <div class="right">
  <fieldset id="s1">
   <form name="form" method="post" action="loginProcess.jsp">
   회원ID:<input type="text" name=id id="lo1">
   비밀번호:<input type="password" name="password" id="lo1">
   <input type="submit" value="로그인" id="lo1">
   <a href="addMember.jsp">회원가입</a> 
   </form>
  </fieldset>
 </div>
 <%}else {
	 session.setMaxInactiveInterval(5000); //5000초가 지나면 로그인 다시해야 함
 %>
  <h1 id="lo">쇼핑몰에 오신 것을 환영합니다.</h1>
  <div class="right">
  <%=checkName %>님 환영합니다.
  <a href="logout.jsp">logout</a>
  <a href="addMember.jsp">회원가입</a>
  </div>
 <%} %>
</header>

</body>
</html>