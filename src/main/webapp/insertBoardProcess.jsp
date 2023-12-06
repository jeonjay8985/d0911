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
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	int num=0;

	 String sql = "select max(num) from board0911";
	 pstmt = conn.prepareStatement(sql);
	 rs = pstmt.executeQuery();
	 if(rs.next()) {
		 num=rs.getInt(1)+1;
	 }else{
		 num=1;
	 }
	System.out.println("err :"+num);
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String name = request.getParameter("name");   //상품코드id 데이터
   String password = request.getParameter("password");
   String title = request.getParameter("title");
   String memo = request.getParameter("memo");
   
   try{
      sql = "Insert into board0911(num,name,password,title,memo,time) values(?,?,?,?,?,sysdate)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, num);
      pstmt.setString(2, name);    //첫번째 물음표에 name 넘어감
      pstmt.setString(3, password);         //두번째 물음표에 password 넘어감
      pstmt.setString(4, title);
      pstmt.setString(5, memo);
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("입력한 글을 저장하였습니다");
      location.href="liste.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("저장 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
    %>

</body>
</html>