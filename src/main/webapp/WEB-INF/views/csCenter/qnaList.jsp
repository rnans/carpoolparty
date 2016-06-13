<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가장 편리한 카풀 서비스, 풀파티!</title>
<link rel="stylesheet" href="./bootstrap/css/font-awesome.min.css">
<link href="/final02/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
</head>
<script src="/final2/js/jquery-1.12.4.min"></script>
<script >

function QnaShow(qna) {
 
$('.tr').css('display','none');
	
 var obj=document.getElementById(qna);
	 
 obj.style.display = "block";
}
</script> 

<body>

<%@include file="../header.jsp" %>

<div>
<div class="container" style="margin:  50px 0px 0px 0px;">
	<div class="row">
	<%@include file="csCenterSubMenu.jsp" %>
				<div class=".col-md-10" style="display: inline-block; width: 70%; ">		
			<div style=" padding: 10px; height:570px;">	
<div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header" style="margin-top: 20px;border-bottom: 5px solid #eeeeeee;">
                       자주묻는질문(Q&A)
                        </h1>
                    </div>
                </div>

<table class="table table-list-search" style=" margin-top: 20px;"> 

<tbody>
<c:if test="${empty list }">
<tr>
 <td colspan="2" align="center">작성된 글이 없습니다.</td>
</tr>
 </c:if>
<c:forEach var="qna" items="${list }" >
<tr>
  <td><a href="javascript:QnaShow('qna${qna.idx }')">Q. ${qna.subject }</a></td>
 </tr>
 <tr class="tr" id="qna${qna.idx}" style="display:none;">
   <td>A. ${qna.content }</td>
 </tr>
 </c:forEach>
</tbody>
<tfoot>
<tr>
 <td colspan="1" align="center">${pageStr }</td>
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