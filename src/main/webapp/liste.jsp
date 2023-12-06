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

<h1> </h1>
<%
ResultSet rs = null;
PreparedStatement pstmt = null;
int cnt=0;

	 String sql = "select count(*) from board0911";
	 pstmt = conn.prepareStatement(sql);
	 rs = pstmt.executeQuery();
	 if(rs.next()) {
		 cnt=rs.getInt(1);
	 }
%>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;총 게시물: <%=cnt %>개
<table border=1 id="tab1">
<tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>작성일</th>
    <th>조회수</th>   
</tr>

<%
    /*  ResultSet rs = null; //ResultSet타입으로 결과값 반환해줌. 결과값 저장->한 행 단위로 불러올 수 있음
     PreparedStatement pstmt = null; */
   
     try{
    	 sql = "select num, title, name, time, hit from board0911";
    	 pstmt = conn.prepareStatement(sql);
    	 
    	 rs = pstmt.executeQuery(); //executeQuery(String sql) 통해 쿼리 실행하면▲
    	 while(rs.next()) {
    		 String num = rs.getString("num");
    		 String title= rs.getString("title");
    		 String name = rs.getString("name");
    		 String time = rs.getString("time");
    		 String hit = rs.getString("hit");
%>

<tr>
    <td><%=num %> </td>
    <td><a href = "view.jsp?num=<%=num %>"><%=title %></a> </td>
    <td><%=name %> </td>
    <td><%=time %> </td>
    <td><%=hit %> </td>

</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>


<tr>
    <td colspan = 5  align = center>
    <input id=bt1 type="button" value="글쓰기" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insertBoard.jsp";
	}
    </script>
    </td>
</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>