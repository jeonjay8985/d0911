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
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String id = request.getParameter("id");  
   String password = request.getParameter("password");
   String name = request.getParameter("name");  
   String gender = request.getParameter("gender");
   String birth = request.getParameter("birth1")+"-"+request.getParameter("birth2")+"-"+request.getParameter("birth3");
   String email = request.getParameter("email1")+"@"+request.getParameter("email2");
   String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
   String address = request.getParameter("address");
   String[] val = request.getParameterValues("interest");
   String interest="";
   if(val != null) {
	   for(int i=0; i<val.length; i++) {
		   if(i == (val.length-1)) {
			   interest += val[i];
		   }else{
			   interest += val[i] + ",";
		   }
	   }
   }
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Update member0911 set password=?, name=?, gender=?, birth=?, email=?, phone=?, address=?, interest=? where id=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(9, id);  
      pstmt.setString(2, name);    
      pstmt.setString(1, password);         
      pstmt.setString(3, gender);
      pstmt.setString(4, birth);
      pstmt.setString(5, email);
      pstmt.setString(6, phone);
      pstmt.setString(7, address); 
      pstmt.setString(8, interest); 

      pstmt.executeUpdate();
      
      %>
      <script>
       alert("수정 성공");
       location.href="memberSelect.jsp";
      </script>
      <%
   }catch(Exception e) {
	   System.out.println("수정 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
   
%>

</body>
</html>