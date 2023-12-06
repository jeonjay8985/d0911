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

<h1>수정</h1>
<%@ include file = "dbconn.jsp" %>


<%
   ResultSet rs=null;
   PreparedStatement pstmt = null;

   int num=Integer.parseInt(request.getParameter("num"));

   try{
	   String sql="select title, name, password, memo from board0911 where num=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setInt(1, num);
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		 String title = rs.getString("title");
		 String name = rs.getString("name");
		 String password = rs.getString("password");
		 String memo = rs.getString("memo");
	
%>

<%
	checkName=(String)session.getAttribute("s_Name");
%>

<form name="frm" method="post" action="updateBoardProcess.jsp?num=<%=num%>">
<table border=1 id="tab2">
<tr> 
      <th>제목</th>
      <td><input type="text" name="title" value="<%=title %>" id=in2></td>
</tr>

<tr> 
      <th>이름</th>
      <td><input type="text" name="name" value="<%=checkName %>" id=in2></td>
</tr>

<tr> 
      <th>비밀번호</th>
      <td><input type="text" name="password" value="<%=password %>" id=in2></td>
</tr>

<tr> 
      <th>내용</th>
      <td><textarea name="memo"  cols="70" rows="15" ><%=memo %></textarea></td>

</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="submit" value="수정"> 
    <input id=bt1 type="reset" value="취소">
    </td>
</tr>

</table>

<%
	   }
    }catch(Exception e){
 	  System.out.println("수정 에러" +e.getMessage());
   }
%>

</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>