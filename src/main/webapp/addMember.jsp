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
	if(document.frm.confirmPw.value==""){
		alert("확인 비밀번호를 입력하세요");
		document.frm.confirmPw.focus(); 
		return false;  
	}
	if(document.frm.password.value!=document.frm.confirmPw.value){
		alert("비밀번호가 일치하지 않습니다");
		document.frm.password.focus(); 
		return false;  
	}
	 document.frm.action="addMemberProcess.jsp";
}
	
function changesubmit(){
	frm.submit();
    }

function checkEmail() { //도메인 자동 선택
	alert("ee  :"+document.frm.emailList.value)
	if (document.frm.emailList.value != "") {
		document.frm.email2.value = document.frm.emailList.value;
	} else {
		    document.frm.email2.value = "";
			document.frm.email2.focus();
		   }
}    


</script>


</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>회원 가입 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>

<%
    ResultSet rs=null;
    PreparedStatement pstmt=null;
    
    String name=request.getParameter("name"); 
    String password=request.getParameter("password"); 
    String confirmPw=request.getParameter("confirmPw");
    String birth=request.getParameter("birth");
    String email=request.getParameter("email");
    String address=request.getParameter("address");
 
    if(name == null) {
    	name = "";
    }
    if(password == null) {
        password = "";
     }
    if(confirmPw == null) {
    	confirmPw = "";
     }
    if(birth == null) {
    	birth = "";
     }
    if(email == null) {
    	email = "";
     }
    if(address == null) {
    	address = "";
     }
%>
  
<form name="frm" method="post" action="addMember.jsp">
<table border=1 id="tab2">

<% 
   String sql = "select max(id) from member0911";
   pstmt=conn.prepareStatement(sql);
   rs=pstmt.executeQuery();
   int id = 0;
   if(rs.next()) {
	   id = rs.getInt(1)+1;
   }
%>

<tr> 
      <th>아이디(자동생성)</th>
      <td><input type="text" name="id" value="<%=id %>" id=in1> 마지막번호+1</td>
</tr>

<tr> 
      <th>성명</th>
      <td><input type="text" name="name" value="<%=name %>" id=in></td>
</tr>

<tr> 
      <th>비밀번호</th>
      <td><input type="text" name="password" value="<%=password %>" id=in></td>
</tr>

<tr> 
      <th>비밀번호 확인</th>
      <td><input type="text" name="confirmPw" value="<%=confirmPw %>" id=in></td>
</tr>

<tr> 
      <th>성별</th>
      <td>
         <input type="Radio" name="gender" value="1" onclick="gender()" checked>남성
         <input type="Radio" name="gender" value="2" onclick="gender()">여성
      </td>
</tr>

<tr> 
      <th>생일</th>
      <td>
    
      <input type="text" name="birth1" id=in>
      년
          
       <select name="birth2">
       <%for(int i=1; i<=12; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
       </select>월
       <select name="birth3">
       <%for(int i=1; i<=31; i++){ %>
       <option value="<%=i %>"><%=i %></option>
       <%} %>
       </select>일
    </td>
</tr>

<tr>
         <th>이메일</th>
         <td>
			<input type="text" name="email1" id="in">
			@
			<input type="text" name="email2" id="in"> 
			<select name="emailList" onchange="checkEmail()">
				<option value="">직접 입력</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
				<option value="google.com">google.com</option>
				<option value="hotmail.com">hotmail.com</option>
			</select> 
		</td> 
 <tr> 
      <th>연락처</th>
      <td>
    
      <input type="text" name="phone1" id=in>
      -
        <input type="text" name="phone2" id=in>
        -
          <input type="text" name="phone3" id=in>
    </td>
</tr>

<tr> 
      <th>주소</th>
      <td><input type="text" name="address" value="<%=address %>" id=in1></td>
</tr>

<tr> 
      <th>관심분야</th>
      <td><input type="checkbox" name="interest" value="프로그램"> 프로그램
      <input type="checkbox" name="interest" value="독서"> 독서
      <input type="checkbox" name="interest" value="등산"> 등산
      <input type="checkbox" name="interest" value="여행"> 여행
      <input type="checkbox" name="interest" value="컴퓨터"> 컴퓨터 
      <input type="checkbox" name="interest" value="영화"> 영화
      <input type="checkbox" name="interest" value="운동"> 운동
      <input type="checkbox" name="interest" value="진학"> 진학</td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="submit" value="등록" onclick="check()"> 
    <input id=bt1 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>