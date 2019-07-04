<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Manager Login</title>
<style>
body {
	margin: 0;
	padding: 0;
}

#webView {
	overflow: hidden;
	position: relative;
	background:;
	width: 978px;
	height: 600px;
	margin: 0 auto;
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0)
}

#webView[data-show-memo='true'] {
	overflow: visible
}
</style>
</head>
<body>
	<div >
		<div
			style="position: absolute; top: 29px; left: 800px; width: 300px; height: 58px;">
			<div
				style="font-weight: bold; font-size: 41px; text-align: center; color: rgb(211, 0, 194);"
				class="">Torpedo</div>
		</div>

		<form name="loginForm">
			<div
				style="position: absolute; top: 157px; left: 871px; width: 300px; height: 40px;">
				<input type="text" data-min-width="60" data-min-height="30"
					name="id" data-text-content="true" placeholder="아이디"
					style="color: rgb(94, 94, 94);">
			</div>
			<div
				style="position: absolute; top: 243px; left: 871px; width: 300px; height: 40px;">
				<input type="password" data-min-width="60" data-min-height="30"
					name="passwd" data-text-content="true" placeholder="비밀번호"
					style="color: rgb(94, 94, 94);" spellcheck="false" class="">
			</div>
			<input type="button" value="로그인" id="btnLogin" onclick="funcLogin()"
				style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.5em; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; background-color: rgb(52, 152, 219);; position: absolute; top: 350px; left: 901px; width: 100px; height: 40px;">
		</form>
	</div>
</body>
<jsp:useBean id="repository"
	class="kr.co.torpedo.hellojsp.repository.hibernate.HibernateRepository" />
<jsp:useBean id="manager" class="kr.co.torpedo.hellojsp.domain.Manager" />
<script type="text/javascript">
	screenWidth = 978;

	window.onload = function() {
<%manager.setId("kbiid");
			manager.setPwd("1234");
			manager.hashPwd();
			repository.insert(manager);%>
	}

	function funcLogin() {
		if (loginForm.id.value == "") {
			alert("아이디를 입력해 주세요");
			loginForm.id.focus();
		} else if (loginForm.passwd.value == "") {
			alert("비밀번호를 입력해 주세요");
			loginForm.passwd.focus();
		} else {
			loginForm.action = "loginCheck.jsp";
			loginForm.method = "post";
			loginForm.submit();
		}
	}
</script>
</html>