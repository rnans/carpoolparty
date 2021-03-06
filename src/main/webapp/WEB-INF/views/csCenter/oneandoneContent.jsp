<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가장 편리한 카풀 서비스, 풀파티!</title>
  <link rel="stylesheet" href="./bootstrap/css/font-awesome.min.css">
<link href="/final02/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<style>
	textarea.form-control2 {
  width: 550px;
  height: 250px;
textarea {
  margin: 0;
  font-family: inherit;
  font-size: 100%;
}
}
</style>
</head>
<body>

<%@include file="../header.jsp" %>


<c:if test="${empty list }">
<h3>글이 누락되었거나 사라졌습니다.</h3>
</c:if>
<div class="container"  style=" margin: 50px 0px 0px 0px">
	<div class="row">
	<%@include file="csCenterSubMenu.jsp" %>
				<div class=".col-md-10" style="display: inline-block; width: 70%; ">		
			<div style=" padding: 10px; height:570px;">	
<div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header" style="margin-top: 20px;border-bottom: 5px solid #eeeeeee;">
               1:1문의
                        </h1>
                    </div>
                </div>
<div class="row" >
<div class="form-group" style="width: 50%; float: left; padding-right: 30px;">
글번호<input class="form-control" id="idx" name="idx"  value="${list[0].idx }"type="text" required autofocus readonly="readonly"/>
</div>
<div class="form-group" style="width: 50%; display: inline-block; padding-left: 30px;">
작성날짜<input class="form-control" id="writedate" name="writedate" value="${list[0].writedate}" type="text" required autofocus readonly="readonly"/>
</div>
<div class="form-group" style="width: 100%;" >
문의유형<input class="form-control" id="type" name="type"   value="${list[0].type }" type="text" required autofocus readonly="readonly"/>
</div>

<div class="form-group" style="width: 100%; " >
제목
<input class="form-control" id="subject" name="subject" value="${list[0].subject }" type="text" required autofocus />
</div>
</div>
<br>
<div class="row">
내용
<br><textarea class="form-control2" id="content" name="content" rows="5" style="width: 100%; padding-left: 30px; padding-right: 30px;">${list[0].content }</textarea>
<br />
<br>
답변
<br><textarea class="form-control2" id="answer" name="answer" rows="5" style="width: 100%; padding-left: 30px; padding-right: 30px;">${list[0].answer }</textarea>
<br />
<a href="oneAndOne.do"><button class="btn btn-primary ">이전페이지로</button></a>
</div>
</div>
</div>
</div>
</div>
<hr>


</body>
</html>