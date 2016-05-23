<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>헤더부분</div>
<%@include file="../header.jsp" %>
<%@include file="../adHeader.jsp" %>
<section>
<h2>고객센터관리</h2>
<a href="adminNoticeList.do">1.공지사항</a> |<a href="adminQnaList.do">2.Q&A</a> |<a href="adminOneAndOne.do">3.1:1문의</a> |<a href="useguideList.do">4.이용안내</a>
<h4>Q&A</h4>
</section>
<section>
<table border="1" width="800" height="150" >
<thead>
<tr>
   <th>번호</th>
   <th>제목</th>
   <th>내용</th>
   <th>작성날짜</th>
   <th>비고</th>
</tr>
</thead>
<tbody>
<c:if test="${empty list }">
<tr>
 <td colspan="5" align="center">작성된 글이 없습니다.</td>
</tr>
 </c:if>

<c:forEach var="qna" items="${list }">

<tr>
 <td>${qna.idx }</td>
 <c:url var="qnaContent" value="qnaUpdate.do">
 <c:param name="idx">${qna.idx }</c:param>
 </c:url>
 <td><a href="${qnaContent}">${qna.subject }</a></td>
 <td>${qna.content}</td>
 <td>${qna.writedate }</td>
 <td><a href="QnaDelete.do?idx=${qna.idx }">삭제</a></td>
</tr>
 </c:forEach>
</tbody>
<tfoot>
<tr>
 <td colspan="5" align="center">${pageStr }</td>
 </tr>
 </tfoot>
</table>
<a href="qnaWrite.do">글쓰기</a>
</section>
<hr>
<footer>푸터</footer>
</body>
</html>