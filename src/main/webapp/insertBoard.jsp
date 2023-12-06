<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {
	document.frm.submit();
}


</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>글쓰기</h1>
<%@ include file = "dbconn.jsp" %>

<%
	checkName=(String)session.getAttribute("s_Name");
%>

<form name="frm" method="post" action="insertBoardProcess.jsp" method="post">
<table border=1 id="tab2">
<tr> 
      <th>제목</th>
      <td><input type="text" name="title" id=in2></td>
</tr>

<tr> 
      <th>이름</th>
      <td><input type="text" name="name" value="<%=checkName %>" id=in2></td>
</tr>

<tr> 
      <th>비밀번호</th>
      <td><input type="text" name="password"  id=in2></td>
</tr>

<tr> 
      <th>내용</th>
      <td><textarea name="memo"  cols="70" rows="15"> </textarea></td>

</tr>

<tr align="center" valign="middle">
    <td colspan = 2> 
    <input id=bt2 type="button" value="등록" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>