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
	
	
	if(sex=="����")
	{
		male.checked=true;
	}
}
</script>
</head>
<body>

	<fieldset>
		<legend>īǮ ���</legend>
		<fieldset>
			<legend>���� ����</legend>
			<form name="userInfo" action="poolMemberAdd02.do">
			<div id="div1">
			�̸� <input type="text" name="name" value="${dto.name }"> 
			<br>
			���̵� <input type="text" name="id" value="${dto.id }">
			<br>
			�ּ� <input type="text" name="addr" value="${dto.addr} }">
			<br>
			�̸��� <input type="text" name="email" value="${dto.email}">
			<br>
			������� <input type="text" name="birthday" value="${dto.birth }">
			<br>
			��ȭ��ȣ <input type="text" name="phonenumber" value="${dto.phonenum }">
			<br>
			���� <input type="radio"  name="sex" value="����" id="male">����
			<input type="radio" name="sex" value="����" id="female">����
			<br>
			</div>
			<div id="div2">
			<img src='�̹��� ��θ�' width="100" height="100"/>
			<br>
			
			
			<input type="file">
			</div>
			<input type="button" value="���" onclick="poolAdd.do">
			<input type="button" value="����" onclick="poolAdd01Edit.do">  
			<input type="submit" value="����"> 
			</form>
		</fieldset>
		<br>
		
	</fieldset>
</body>
</html>