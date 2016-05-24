<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function carUp(){
	
	var param='idx='+document.carManage.idx.value;
	location.href='carUpdate.do'+param;
}
</script>
</head>
<body>
	<fieldset>
		<legend>차량관리</legend>
		<table border="1">
			<tr>
				<th>운전자</th>
				<th>차량번호</th>
				<th>차량종류</th>
				<th>인증여부</th>
				<th>관리</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="6">등록된 차량이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${list }">
			<input type="hidden" name="idx" value="${dto.idx}">
			<form name="carManage">
				<tr>
					<td>${dto.driver }</td>
					<td>${dto.carNum }</td>
					<td>${dto.carType }</td>
					<td>${dto.confirm }</td>
					<td colspan="2"><input type="button" value="수정" onclick="carUp()">|<input type="button" value="삭제" onclick="carDel()"></td>
				</tr>
				</form>
			</c:forEach>
			<tr>
			<td colspan="6" align="right"><input type="button" value="등록"></td>
			</tr>

		</table>
	</fieldset>
</body>
</html>