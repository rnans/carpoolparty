<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<%@include file="../header.jsp" %>
<thead>
<tr>
   <th>번호</th>
   <th>작성자</th>
   <th>문의유형</th>
   <th>제목</th>
   <th>작성일</th>
   <th>답변현황</th>
   <th>비고</th>
</tr>
</thead>
<tbody>
<c:if test="${empty list }">
<tr>
 <td colspan="7" align="center">작성된 글이 없습니다.</td>
</tr>
 </c:if>

<c:forEach var="oneandone" items="${list }">
<tr>
 <td>${oneandone.idx }</td>
 <c:url var="oneandoneAnswer" value="oneandoneAnswer.do">
 <c:param name="idx">${oneandone.idx }</c:param>
 </c:url>
 <td>${oneandone.writer }</td>
 <td>${oneandone.type }</td>
 <td><a href="${oneandoneAnswer}">${oneandone.subject}</a></td>
 <td>${oneandone.writedate }</td>
 <td>${oneandone.state }</td>
 <td><a href="oneandoneDelete.do?idx=${oneandone.idx }">삭제</a></td>
 
</tr>
 </c:forEach>
</tbody>
<tfoot>
<tr>
 <td colspan="7" align="center">${pageStr }</td>
 </tr>
 </tfoot>
</table>
</section>
<hr>
풋부분
</body>
</html>