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
</head>
<body>

	<fieldset>
		<legend>īǮ ���</legend>
		<fieldset>
			<legend>���� ����</legend>
			<form name="userInfo" action="poolMemberAdd02.do">
			<div id="div1">
			�̸�:<input type="text" name="name" value="�ھ缱"> 
			<br>
			���̵�:<input type="text" name="id" value="didtjs123">
			<br>
			�ּ�:<input type="text" name="addr" value="����">
			<br>
			�̸���:<input type="text" name="email" value="naver@naver.com">
			<br>
			�������<input type="text" name="birthday" value="19961216">
			<br>
			��ȭ��ȣ:<input type="text" name="phonenumber" value="01012342345">
			<br>
			����:<input type="radio"  name="sex" value="����">����
			<input type="radio" name="sex" value="����">����
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