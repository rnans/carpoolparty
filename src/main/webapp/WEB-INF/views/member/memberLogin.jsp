<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
		<article>
			<form name="login" action="login.do" method="post">
				<fieldset>
					<legend>로그인</legend>
						<ul>
							<li>ID : <input type="text" name="id"></li>
							<li>비밀번호 : <input type="password" name="pwd"></li>
						</ul>
						<p>
							<input type="checkbox" name="saveid"> ID기억하기
						</p>
						<div>
							<input type="submit" value="로그인">	
						</div>
						<div>
							<a>ID찾기</a> / <a>비밀번호찾기</a>
						</div>
				</fieldset>
			</form>
		</article>
	</section>
</body>
</html>