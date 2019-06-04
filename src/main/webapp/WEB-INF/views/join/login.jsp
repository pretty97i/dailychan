<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <title>DailyChan::믿을 수 있는 먹거리</title>

<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72.png" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-50@2x.png" sizes="96x96" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72@2x.png" sizes="144x144" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-60@3x.png" sizes="192x192" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css?dummy=5.99" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_comm.js?dummy=5.12"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script>
	window.onload = function () {
		
		var join_id = getCookie('Cookieid');
		
		if (join_id!="") {
			$("#Cookieid").get(0).checked = true;
			$("#join_id").val(join_id);
		}
		
	}

	function enterkey() {
	    if (window.event.keyCode == 13) {

	         // 엔터키가 눌렸을 때 실행할 내용
	         doLogin();
	    }
	}
	
	
	
	function doLogin() {
		
		var f = document.loginForm;
		var join_id = $('[name="join_id"]').val();
		var join_password = $('[name="join_password"]').val();
		
		if ($.trim(join_id) == "") {
			alert("아이디를 입력해주세요.");
			$join_id.focus();
			return;
		} else if ($.trim(join_password) == "") {
			alert("비밀번호를 입력해주세요.");
			$join_password.focus();
			return;
		} else {
			if ($("input:checkbox[id='Cookieid']").is(":checked") == true) {
				setCookie('Cookieid',join_id,7);
			} else {
				deleteCookie('Cookieid');
			} 
	
		}
		
		f.action = "/dailychan/join/loginCheck.action";
		f.submit();
		
	}
			
	function setCookie(cookieName, value, exdays){
		
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	    
	}
	
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
		
	function kout(){
		Kakao.Auth.logout();
	}

</script>

</head>

<body>
	<div class="allWrap">
		<!-- header -->

		<!-- 상단 헤더 영역 -->
		<jsp:include page="/WEB-INF/views/top.jsp">
			<jsp:param value="${sort }" name="sort"/>
		</jsp:include>
		<!-- 상단 헤더 영역 -->
	
		<!-- gnb 영역 -->

		<!-- 컨텐츠 -->
		<div class="contentsArea loginJoinBg" id="sec_login">
			
			<div class="contentsWrap">

				<!-- 오른쪽 영역 -->
				<div class="content oasisLoginHt">
					<!-- 내용 입니다 -->
					
					<form name="loginForm" method="post" action="/dailychan/join/loginCheck.action" ><!-- method="POST"  -->
						<div class="oasisLoginWrap">
							<strong class="oasisLoginTit">DailyChan 로그인</strong>

							<ul class="oasisLoginInputLi">
								<li><input type="text" placeholder="아이디" class="oasisLoginID" id="join_id" name="join_id" /></li>
								<li><input type="password" placeholder="비밀번호" class="oasisLoginPW" id="join_password" name="join_password" onkeyup="enterkey();" /></li>
							</ul>

							<div class="oasisLoginBtn2">
								<a href="#" onclick="doLogin(); return false;">로그인</a><!-- 로그인을 했을 경우 메인 페이지 가게 하는것 해야함  -->
							</div>

							<div class="oasisLoginBtn">
								<input type="checkbox" id="Cookieid" /><label for="Cookieid" style="cursor:pointer">아이디 저장</label>
								<div class="olBtn">
									<a href="/dailychan/join/findUserIdForm.action">아이디 찾기</a>
									<a href="/dailychan/join/findPasswordForm.action">비밀번호 찾기</a>
									<a href="/dailychan/join/list.action">가입하기</a>
								</div>
							</div>
							<br/>
							<!-- 네이버아이디로로그인 버튼 노출 영역 -->
  						
							<div class="socialLoginWrap">
								<a href="${url }">
									<img src="/dailychan/resources/images/loginJoin/login_sns_kakao1.png">
								</a>
								
								<!-- <a href="http://developers.kakao.com/logout"><img src="/dailychan/resources/images/loginJoin/login_sns_kakao1.png"></a> -->
	                         
	                           	<a href="/dailychan/join/naverlogin.action">
	                            	 <img src="/dailychan/resources/images/loginJoin/login_sns_naver1.png" >
	                                
	                            </a>
	                            <a href="/social/login/google">
	                                <img src="/dailychan/resources/images/loginJoin/login_sns_google1.png">
	                            </a>
	                            <a href="/social/login/facebook">
	                                <img src="/dailychan/resources/images/loginJoin/login_sns_facebook1.png">
	                            </a>
							</div>
							
						</div>
					</form>
					<!-- //내용 입니다 -->
				</div>
				<!-- //오른쪽 영역 -->
			</div>
		</div>
		<!-- //컨텐츠 -->

		<!-- footer -->
 		<jsp:include page="/WEB-INF/views/footer.jsp">
			<jsp:param value="${sort }" name="sort"/>
		</jsp:include>
		<!-- // footer -->
	</div>
</body>
</html>