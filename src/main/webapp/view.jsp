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
<%@ include file = "dbconn.jsp" %>

      <h1>내용</h1>
<table border=1 id="tab1">

 <% 
    PreparedStatement pstmt = null;
	String sql="";
	ResultSet rs = null;
/* 	String rst="";
	String msg=""; */
	int hit = 0;
	int num = Integer.parseInt(request.getParameter("num"));
  
     try{
    	 sql = "select name, title, memo, time, hit from board0911 where num=?";
    	 pstmt = conn.prepareStatement(sql);
    	 pstmt.setInt(1, num); //idx=num
    	 rs = pstmt.executeQuery();
    	 if(rs.next()) {
    		 String name = rs.getString("name");
    		 String title= rs.getString("title");
    		 String memo = rs.getString("memo");
    		 String time = rs.getString("time");
    		 hit = rs.getInt(5);
    		 hit++;
    		 %>
    
<tr>
	<th>글번호</th>
    <td><%=num %></td>
</tr>  
<tr> 
	<th>조회수</th> 
	<td><%=hit %></td>
</tr>
<tr>
	<th>이름</th>
    <td><%=name %> </td>
</tr>
<tr>
	<th>작성일</th>
    <td><%=time %></td>
</tr>
<tr> 
	<th>제목</th>
	<td><%=title %></td>
</tr>
<tr> 
	<td colspan=2><textarea cols="120" rows="15"><%=memo %> </textarea></td>
</tr>
 

<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }
     sql = "update board0911 set hit=? where num=?";
	 pstmt = conn.prepareStatement(sql);
	 pstmt.setInt(1, hit); 
	 pstmt.setInt(2, num); //idx=num
	 pstmt.executeUpdate();
%>

<tr>
    <td colspan = 2  align = center>
    <input id=bt1 type="button" value="글쓰기" onclick="newPage1()" > 
       <script>
       function newPage1()  {
	   location.href="insertBoard.jsp";
	   }
       </script>
      
    <input id=bt1 type="button" value="답글" onclick="newPage()" >
     
    <input id=bt1 type="button" value="목록" onclick="newPage3()" >
       <script>
       function newPage3()  {
	   location.href="liste.jsp";
	   }
       </script> 
      
    <input id=bt1 type="button" value="수정" onclick="newPage4()" >
       <script>
       function newPage4()  {
	   location.href="updateBoard.jsp?num=<%=num %>";
	   }
       </script>  
      
    <input id=bt1 type="button" value="삭제" onclick="newPage5()">
       <script>
       function newPage5()  {
	   location.href="deleteBoard.jsp?num=<%=num %>";
	   }
       </script>  
       
    </td>
</tr>

</table>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>