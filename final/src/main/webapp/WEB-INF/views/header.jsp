<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function loginOpen(){
	window.open('login.do', 'login', 'width=500 height=400 left=500 top=200');
}
</script>
<header>
	<div><a href="javascript:loginOpen()">로그인</a> | <a href="memberJoin.do">회원가입</a></div>
	<div></div>
	<ul>
		<li><a href="carpoolMain.do">카풀</a></li>
		<li><a href="carBookInfo.do">차계부</a></li>
		<li><a href="comm.do">커뮤니티</a></li>
		<li><a href="csCenter.do">고객센터</a></li>
	</ul>
</header>