<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header.jsp" %>
<div>헤더</div>
<hr>
<h2>공지사항 글쓰기</h2>
<form action="noticeWrite.do">
<ul>
<li>작성자:<input type="text" name="writer" value="관리자" readonly="readonly"></li>
<li>제목:<input type="text" name="subject" ></li>
<li>내용</li>
</ul>
<textarea name="content" rows="35" cols="70"></textarea><br>
<input type="reset" value="다시작성">
<input type="submit" value="글작성완료">

</form>
<hr>
<div>풋</div>
</body>
</html>