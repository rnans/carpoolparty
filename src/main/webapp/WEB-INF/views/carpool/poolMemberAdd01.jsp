<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
#div1{
   float:left;
   width: 250px;
   height: 400px;
   border: 1px;
   margin: 5px;
}
#div2{
   float:right;
   width: 250px;
   height: 400px;
   border: 1px;
   margin: 5px;
}



</style>
<script>
window.onload=function()
{
	var sex='${dto.sex}';
	
	var male=document.getElementById('male');
	
	
	if(sex=="남자")
	{
		male.checked=true;
	}
}
</script>
</head>
<body>

	<fieldset>
		<legend>카풀 등록</legend>
		<fieldset>
			<legend>개인 정보</legend>
			<form name="userInfo" action="poolMemberAdd02.do">
			<div id="div1">
			이름 <input type="text" name="name" value="${dto.name }"> 
			<br>
			아이디 <input type="text" name="id" value="${dto.id }">
			<br>
			주소 <input type="text" name="addr" value="${dto.addr}">
			<br>
			이메일 <input type="text" name="email" value="${dto.email}">
			<br>
			생년월일 <input type="text" name="birthday" value="${dto.birth }">
			<br>
			전화번호 <input type="text" name="phonenumber" value="${dto.phonenum }">
			<br>
			성별 <input type="radio"  name="sex" value="남성" id="male">남성
			<input type="radio" name="sex" value="여성" id="female">여성
			<br>
			</div>
			<div id="div2">
			<img src='이미지 경로명' width="100" height="100"/>
			<br>
			
			
			<input type="file">
			</div>
			<input type="button" value="취소" onclick="poolAdd.do">
			<input type="button" value="수정" onclick="poolAdd01Edit.do">  
			<input type="submit" value="다음"> 
			</form>
		</fieldset>
		<br>
		
	</fieldset>
</body>
</html>