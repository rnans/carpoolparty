<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<style>
	a{display:block;background-color:gray; width:70px; height:20px;float:left;}
	.card{height:230px;}
	label{float:left;}
	input[type=image]{float:left;margin-bottom:30px;margin-right:20px;}
	.clbo{clear:both;}
	.section{background-color:#efefef;}
	.card{background-color: #efefef;}
</style>
</head>
<body>
	<div class="section">
		<div class="clbo"></div>
			
		<div class="card">
		
			<c:if test="${empty lists}">등록된 카드 정보가 없습니다.</c:if>
		
			<c:forEach var="pay" items="${lists}">
				
				<input type="image" name="cardImg" src="${pay.cardImg}">
					<c:url var="payURL" value="lastPay.do">
						<c:param name="cardId">${pay.cardId}</c:param>
						<c:param name="ridx">${ridx}</c:param>
					</c:url>
				<input type="text" value="${pay.cardType1}" disabled><br>
				<input type="text" value="${pay.cardNum}" disabled><br>
				<input type="text" value="${pay.cardName}" disabled><br>
				<input type="text" value="${pay.cardId}" disabled><br>
				<a href="javascript:dopay()">카드선택</a><br>
				<div class="clbo"></div>
				<hr>
			</c:forEach>
		</div>
	</div>
</body>

<script type="text/javascript">
	function dopay(){
		if(confirm("결제를 완료하시겠습니까?")){
			location.href='${payURL}';
		}else{
			location.href="index.do";
		}
	}
</script>
</html>