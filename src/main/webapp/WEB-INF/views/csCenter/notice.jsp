<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가장 편리한 카풀 서비스, 풀파티!</title>
<link rel="stylesheet" href="./bootstrap/css/font-awesome.min.css">
<link href="/final02/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
body {
    margin-top: 2%

}
</style>
</head>
<body>

<%@include file="../header.jsp" %>
<div>
<div class="container" style=" margin: 50px 0px 0px 0px; ">
	<div class="row">
				
<%@include file="csCenterSubMenu.jsp" %>
	<div class=".col-md-10" style="display: inline-block; width: 70%; ">
<div style=" padding: 10px; height:570px;">
	<div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header" style="margin-top: 20px;border-bottom: 5px solid #eeeeeee;">
                           공지사항
                        </h1>
                    </div>
                </div>
<table class="table table-list-search" style="margin-top: 20px;"> 
<thead>
<tr>
   <th>번호</th>
   <th>제목</th>
   <th>작성자</th>
   <th>작성일</th>
   <th>조회수</th>
</tr>
</thead>
<tbody>
<c:if test="${empty list }">
<tr>
 <td colspan="5" align="center">작성된 글이 없습니다.</td>
</tr>
 </c:if>

<c:forEach var="notice" items="${list }">

<tr>
 <td>${notice.idx }</td>
 <c:url var="noticeContent" value="noticeContent.do">
 <c:param name="idx">${notice.idx }</c:param>
 </c:url>
 <td><a href="${noticeContent}">${notice.subject}</a></td>
 <td>${notice.writer }</td>
 <td>${notice.writedate }</td>
 <td>${notice.readnum }</td>
</tr>
 </c:forEach>
</tbody>
<tfoot>
<tr>
 <td colspan="5" align="center">${pageStr }</td>
 </tr>
 </tfoot>
</table>
</div>
		</div>
	</div>
</div>
</div>
<hr>

</body>
</html>