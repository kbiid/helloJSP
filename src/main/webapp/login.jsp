<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Manager Login</title>
<script type="text/javascript">
	screenWidth = 978;
	projectId = "Dn8aEQNuBakD9AyR9WsZKvPKNJ8Ve7Fe";
	sequenceId = "olr2p";

	window.onload = function() {
		var btnLogin = document.getEelementById("btnLogin");
		if (btnLogin) {
			btnLogin.addEventListner("click", funcLogin, false);
		}
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
<body data-locale="ko">
	<div id="webView" data-canvas="true" data-show-memo="false"
		data-show-link="false">
		<div data-obj-id="YEIpQ" data-obj-type="element"
			data-text-editable="true" class=""
			style="position: absolute; top: 29px; left: 309px; width: 300px; height: 58px;">
			<div data-text-content="true"
				style="font-weight: bold; font-size: 41px; text-align: center; color: rgb(211, 0, 194);"
				class="">Torpedo</div>
		</div>

		<form name="loginForm">
			<div data-obj-id="J2TeP" data-obj-type="element"
				data-text-editable="true" class=""
				style="position: absolute; top: 157px; left: 380px; width: 300px; height: 40px;">
				<input type="text" data-min-width="60" data-min-height="30"
					name="id" data-text-content="true" placeholder="아이디"
					style="color: rgb(94, 94, 94);" class="">
			</div>
			<div data-obj-id="h72qn" data-obj-type="element"
				data-text-editable="true" class=""
				style="position: absolute; top: 243px; left: 380px; width: 300px; height: 40px;">
				<input type="password" data-min-width="60" data-min-height="30"
					name="passwd" data-text-content="true" placeholder="비밀번호"
					style="color: rgb(94, 94, 94);" spellcheck="false" class="">
			</div>
			<input type="button" value="로그인" id="btnLogin" onclick="funcLogin()"
				style="font-size: 16px; color: rgb(255, 255, 255); text-align: center; line-height: 2.5em; border-top-left-radius: 4px; border-top-right-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; background-color: rgb(52, 152, 219);; position: absolute; top: 350px; left: 409px; width: 100px; height: 40px;">
		</form>
	</div>

</body>
</html>