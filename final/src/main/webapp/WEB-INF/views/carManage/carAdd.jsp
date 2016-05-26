<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> 
function previewImage(obj) 
{ 
var dest    = document.getElementById("preview"); 
dest.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + obj.value + "',sizingMethod=scale)"; 
} 
</script> 


</head>
<body>
<fieldset>
<legend>차량등록</legend>
<form  name="carAdd" action="carAdd.do" method="post">
<div>
<input type="hidden" name="id" value="${sid }">
운전자 이름:<input type="text" name="driver">
<br>
차 번호:<input type="text" name="carnum">
<br>
차종:<input type="text" name="cartype">
</div>

<input type="file" onchange="previewImage(this)"> 
<br><br> 
<div id="preview" style="width:100px; height:100px"></div> 

<div>
<input type="hidden" name="confirmphoto" value="사진없음">
<!-- <img src='이미지 경로명' width="100" height="100"/>
<br>
<input type="file"> -->
</div>

<br>
	<input type="button" value="취소">
	<input type="submit" value="등록">

	</form>
	</fieldset>
</body>
</html>