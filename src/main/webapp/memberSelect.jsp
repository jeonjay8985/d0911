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

<h1>회원 목록</h1>

<table border=1 id="tab1">
<tr>
    <th>id</th>
    <th>성명</th>
    <th>비밀번호</th>
    <th>성별</th>
    <th>생년월일</th>
    <th>이메일</th>
    <th>연락처</th>
    <th>주소</th>
    <th>관심분야</th>
    <th>구분</th>
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;

     try{
    	 String sql = "select id,password,name,gender,to_char(birth,'yyyy-mm-dd'),email,phone,address,interest  from member0911";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String id = rs.getString("id");
    		 String password= rs.getString("password");
    		 String name = rs.getString("name");
    		 String gender = rs.getString("gender");
    		 if(gender.equals("1")){
    			 gender="남성";
    		 }else if(gender.equals("2")){
    			 gender="여성";
    		 }
    		 String birth = rs.getString(5);
    		 String email = rs.getString("email");
    		 String phone = rs.getString("phone");
    		 String address = rs.getString("address");
    		 String interest = rs.getString("interest");
    		
 
%>

<tr>
    <td><%=id %> </td>
    <td><%=password %> </td>
    <td><%=name %> </td>
    <td><%=gender %> </td>
    <td><%=birth %> </td>
    <td><%=email %> </td>
    <td><%=phone %> </td>
    <td><%=address %> </td>
    <td><%=interest %> </td>

    <td>
     <a href="memberUpdate.jsp?id=<%=id %>"> 수정</a>/
    
     <a href="memberDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 11  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="addMember.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>