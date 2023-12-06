<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section> 
<%
   int num = Integer.parseInt(request.getParameter("num"));
%>
 <h1>삭제</h1>

  <form name="frm" method="post" action="deleteBoardProcess.jsp?num=<%=num%>"> 
  
  <table border=1 id="tab1">
  
	   <tr> 
	   <th>비밀번호</th>
	   <td><input type="password" name="password"></td>
	   </tr>
	  <tr> 
	   <td colspan=2><input type="submit" value="삭제"></td>
	   </tr>
</table>
</form>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>