<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<article>
<h1>예약 진행 상황 보기</h1>
<div id="tab">
<a href="ownMasterPoolList.do">파티 오너</a>
<a href="ownMemberPoolList.do">파티 멤버</a>
<div>
<h2>나에게 들어온 요청 목록</h2>
<div>
<table>
	<thead>
		<tr>
			<th>프로필</th>
			<th>출발</th>
			<th>도착</th>
			<th>유형</th>
			<th>인원/금액</th>
			<th>수락/거절</th>
		</tr>
	</thead>
	<tbody>
<c:if test="${empty list }">
<tr>
 <td colspan="6" align="center">나에게 들어온 요청이 없습니다.</td>
</tr>
 </c:if>
		
<c:forEach var="dtos" items="${list }">

<tr>
 <c:url var="poolEachContent" value="poolEachContent.do">
 <c:param name="idx">${dtos.idx }</c:param>
 </c:url>

 <td>${dtos.idx }</td>
 <td><a href="${poolEachContent }">${dtos.startspot}</a></td>
 <td>${dtos.endspot }</td>
 <td>${dtos.type }</td>
 <td>${dtos.mannum }/${dtos.pay }</td>

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
</article>
</section>
</body>
</html>