<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {
	
	if(document.frm.name.value==""){
		alert("이름을 입력하세요");
		document.frm.name.focus();
		return false;  
	}
	if(document.frm.password.value==""){
		alert("비밀번호를 입력하세요");
		document.frm.password.focus(); 
		return false;  
	}
	/* if(document.frm.confirmPw.value==""){
		alert("확인 비밀번호를 입력하세요");
		document.frm.confirmPw.focus(); 
		return false;  
	}
	if(document.frm.password.value!=document.frm.confirmPw.value){
		alert("비밀번호가 일치하지 않습니다");
		document.frm.password.focus(); 
		return false;  
	} */
	
	 document.frm.submit();
}
	
</script>


</head>

<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>회원 정보 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>
<%
   String id = request.getParameter("id"); //productUpdate.jsp?id의 id
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   String sel="";
   
   try{
	   String sql="select password,name,gender,to_char(birth,'yyyy-mm-dd'),email,phone,address,interest from member0911 where id=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, id); //String의 id랑 이름이 같아야 함
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String password = rs.getString("password");
		   String name = rs.getString("name");
		   String gender = rs.getString("gender");
		   String birth = rs.getString(4);
		   String bir[] = birth.split("-");
		       String birth1 = bir[0];
               String birth2 = bir[1];
               String birth3 = bir[2]; 
               int mm=Integer.parseInt(birth2);
               int day=Integer.parseInt(birth3);
		   String email = rs.getString("email");
	           String em[] = email.split("@");
	           String email1 = em[0];
	           String email2 = em[1]; 
		   String phone = rs.getString("phone"); //010-1111-2222
		       String ph[] = phone.split("-");
		       String phone1 = ph[0];
		       String phone2 = ph[1];
		       String phone3 = ph[2];
		   String address = rs.getString("address");
		   String interest="";
		   interest = rs.getString("interest");
		   String arr[] = interest.split(",");
%>

<form name="frm" method="post" action="memberUpdateProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>아이디</th>
      <td><input type="text" name="id" id=in1 value="<%=id%>"></td>
</tr>
<tr> 
      <th>비밀번호</th>
      <td><input type="text" name="password" id=in1 value="<%=password%>"></td>
</tr>

<tr> 
      <th>성명</th>
      <td><input type="text" name="name" id=in1 value="<%=name%>"></td>
</tr>

<tr> 
      <th>성별</th>
      <td>
         <input type="Radio" name="gender" value="1" <%=gender.equals("1") ? "checked" :""%>>남자
         <input type="Radio" name="gender" value="2" <%=gender.equals("2") ? "checked" :""%>>여자
     </td>
</tr>

<tr> 
      <th>생일</th>
      <td>
    
      <input type="text" name="birth1" id=in value="<%=birth1 %>">
      년
          
       <select name="birth2" >
       <%for(int i=1; i<=12; i++){ 
       sel="";
       if(mm==i){sel=" selected";}
       %>
       <option value="<%=i %>"<%=sel %>><%=i %></option>
       <%} %>
       </select>월
       <select name="birth3">
       <%for(int i=1; i<=31; i++){ 
       sel="";
       if(day==i){sel=" selected";}
       %>
       <option value="<%=i %>"<%=sel %>><%=i %></option>
       <%} %>
       </select>일
    </td>
</tr>

<tr> 
      <th>이메일</th>
    <td>
      <input type="text" name="email1" id=in placeholder="이메일" value="<%=email1 %>">
      @
      <select name = "email2" id=in2>
      <option value="" <% if(email2.equals("")){%>selected <%} %> > 직접입력</option>
      <option value ="naver.com" <% if(email2.equals("naver.com")){%>selected <%} %> > naver.com</option>
      <option value ="daum.net" <% if(email2.equals("daum.net")){%>selected <%} %>> daum.net</option>
      <option value ="nate.com" <% if(email2.equals("nate.com")){%>selected <%} %>> nate.com</option>
      <option value ="google.com" <% if(email2.equals("google.com")){%>selected <%} %>> google.com</option>
      <option value ="hotmail.com" <% if(email2.equals("hotmail.com")){%>selected <%} %>> hotmail.com</option>
      </select>
    </td>
</tr>
 
<tr> 
      <th>연락처</th>
      <td>
      <input type="text" name="phone1" id=in value="<%=phone1 %>">
      -
        <input type="text" name="phone2" id=in value="<%=phone2 %>">
        -
          <input type="text" name="phone3" id=in value="<%=phone3 %>">
    </td>
</tr>

<tr> 
      <th>주소</th>
      <td><input type="text" name="address" id=in1 value="<%=address%>"></td>
</tr>

<tr> 
       <th>관심분야</th>
 
       <td><input type="checkbox" name="interest" value="프로그램"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("프로그램")) out.print("checked");} %>>프로그램 
       <input type="checkbox" name="interest" value="독서"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("독서")) out.print("checked");} %>>독서 
       <input type="checkbox" name="interest" value="등산"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("등산")) out.print("checked");} %>>등산
       <input type="checkbox" name="interest" value="여행"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("여행")) out.print("checked");} %>>여행
       <input type="checkbox" name="interest" value="컴퓨터"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("컴퓨터")) out.print("checked");} %>>컴퓨터
       <input type="checkbox" name="interest" value="영화"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("영화")) out.print("checked");} %>>영화
       <input type="checkbox" name="interest" value="운동"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("운동")) out.print("checked");} %>>운동
       <input type="checkbox" name="interest" value="진학"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("진학")) out.print("checked");} %>>진학</td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt1 type="reset" value="취소">
    </td>
</tr>

</table>
<%
	   }
    }catch(Exception e){
 	  System.out.println("수정 실패" +e.getMessage());
   }
%>

</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>