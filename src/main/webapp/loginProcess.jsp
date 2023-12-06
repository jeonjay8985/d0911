<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	PreparedStatement pstmt = null;  //객체를 캐시에 담아 재사용. 반복적 쿼시 수행시 유용
	ResultSet rs = null;
	
	try{
		String sql = "select id, name, password from member0911 where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery(); //result set만드는 SELECT문 수행시 사용
		         //executeUpdate(); //INSERT문 or UPDATE문 실행시 사용
		
		if(rs.next()){
			String userId = rs.getString(1);
			String userName = rs.getString(2);
			String userPwd = rs.getString(3);
			if(pass.equals(userPwd)) {
				%>
			    <%=userName %>님 환영합니다
			    <%
			    session.setAttribute("s_Name", userName);//session.setAttribute(String name, Object value);
			    session.setAttribute("s_Id", userId);
			    response.sendRedirect("index.jsp");
			}else {
				%>
				<script>
					alert("패스워드가 일치하지 않습니다");
					history.back(-1);
				</script>
				<%
			}
		}else {
			%>
			<script>
				alert("등록되지 않은 id입니다");
				history.back(-1);
			</script>
			<%
		}
	}catch(Exception e) {
		System.out.println("데이터베이스 읽기 실패");
	}
%>

</body>
</html>