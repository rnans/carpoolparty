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
			<div id="div1">
			����:<input type="text" name="model" value="����ι�"> 
			<br>
			�� ��ȣ:<input type="text" name="carNum" value="��123">
			<br>
			����:<input type="text" name="carAddr" value="����">
			<br>
			������ ���� �Դϴ�.
			<br>
			</div>
			<div id="div2">
			<img src='�̹��� ��θ�' width="100" height="100"/>
			<br>
			<input type="radio"  name="carImage">
			<input type="radio" name="carImage">
			<input type="radio" name="carImage">
			<input type="radio" name="carImage">
			<br>	
			<input type="file">
			</div>
		</fieldset>
		<br>
		<input type="button" value="����"> 
			<input type="submit" value="����"> 
	</fieldset>
</body>
</html>