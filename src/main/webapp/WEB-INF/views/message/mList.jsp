<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="CSS/message.css">
<script src="js/message.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"></script>
<script type="text/javascript">
	function mCon(idx){
		var param = '?idx='+idx;
		location.reload();
		window.open('messageContent.do'+param,'mCon','width=450,height=270');
	}
	function allDel(){
		if(confirm("메시지를 모두 삭제 하시겠습니까?")){
			location.href="messageAllDel.do";
		}else{
			
		}
	}
	function selectDel(){
		if(confirm("선택한 메시지를 모두 삭제 하시겠습니까?")){
			location.href="messageDel.do";
		}else{
			
		}
	}
	function Test(idx){
		var param = '?idx='+idx;
		location.reload();
		window.open('messageReWrite.do'+param,'mrWrite','width=450,height=270');
		
	}
	
</script>
<style>
	.mContent{background-color: #efefef;}
</style>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div class="container" style="margin-top:80px;">
	<div class="row">
		<section class="content">
			<h1>MessageBox</h1>
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-success btn-filter" onclick="allDel()">전체메시지삭제</button>
								<button type="button" class="btn btn-warning btn-filter" onclick="selectDel()">읽은메시지삭제</button>
							</div>
						</div>
						
						<div class="table-container">
						<div class=""><c:if test="${empty lists}">받은 쪽지가 없습니다.</c:if></div>
						
							<table class="table table-filter">
							<c:forEach var="m" items="${lists}">
								<tbody>
									<tr data-status="pagado">
										<td>
											<div class="ckbox">
												<input type="checkbox" id="checkbox">
												<label for=""></label>
											</div>
										</td>
										<td>
											<!-- <a href="javascript:;" class="star">
												<i class="glyphicon glyphicon-star"></i>
											</a> -->
										</td>
										<td>
											<%-- <c:url var="mrWrite" value="messageReWrite.do">
													<c:param name="receiveid">${m.receiveid}</c:param>
													<c:param name="sendid">${m.sendid}</c:param>
													<c:param name="midx">${m.idx}</c:param>
											</c:url> --%>
											<div class="media">
												<a href="#" class="pull-left">
													<img src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg" class="media-photo">
												</a>
												<div class="media-body" style="margin:0px auto;">
													<span class="media-meta pull-right">${m.senddate} <br> 
														<c:if test="${m.reading=='읽음'}"><font color="#8C8C8C">읽음</font></c:if>
														<c:if test="${m.reading=='안읽음'}"><font color="#6799FF">안읽음</font></c:if>
													</span>
													
													<h4 class="title">
														<a href="javascript:Test(${m.idx})">${m.sendid}</a>
														<span class="pull-right pagado">${m.receiveid}</span>
													</h4>
									
													<p class="summary"><a href="javascript:mCon(${m.idx});"><font color="black">${m.content}...</font></a></p>
													<div class="mContent"></div>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
								</c:forEach>
							</table>
							<div class="paging" style="margin:0px auto;width:500px; text-align: center;">${pageStr}</div>
					</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
</body>
</html>