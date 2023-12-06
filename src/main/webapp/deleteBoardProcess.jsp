<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
<%
   int num = Integer.parseInt(request.getParameter("num"));
   String pass = request.getParameter("password"); //폼의 패스워드 pass
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String sql = "select password from board0911 where num=?";
	 pstmt = conn.prepareStatement(sql);
	 pstmt.setInt(1, num);
	 rs = pstmt.executeQuery();
	 if(rs.next()) {
		String password = rs.getString(1); //데이터베이스에 저장된 패스워드 password
		if(pass.equals(password)){         //(폼과 db 패스워드 값 비교)
			sql = "delete from board0911 where num=?";
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, num); 
			   pstmt.executeUpdate();
			   %>
			    <script>
			       alert("삭제 완료");
			       location.href = "liste.jsp";
			   </script>
			   <%
		}else{
			 %>
			    <script>
			       alert("패스워드가 일치하지 않습니다");
			       location.href = "view.jsp";
			   </script>
			   <%
		}
		 
	 }
  %>
</body>
</html>