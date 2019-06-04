<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <title>DailyChan::믿을 수 있는 먹거리</title>

<link rel="shortcut icon" href="/favicon.ico">
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
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
<script type="text/javascript" charset="utf-8" src="/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/js/oasis_common.js?dummy=5.12"></script>
<script type="text/javascript">
		function findPassword() {
			
			var join_id = $("#join_id").val();
			var join_email = $("#join_email").val();
		
			if (join_id.length < 1) {
				alert("아이디를 입력해주세요.");
				
			}
			else if (join_email.length < 1) {
				alert("이메일을 입력해주세요.");
			
			}
			else {
				
				var url ="<%=cp%>/join/searchPw.action";
				
				$.post(url,{join_id:join_id,join_email:join_email},function(data){
					
					var message = decodeURIComponent(data).replace(/\+/g, ' ');
					
					alert(message);
					
				});		
			} 
		}
		
		function login() {
			
			var f = document.myForm
			f.action = "<%=cp%>/join/login.action";
			f.submit();
			
		}
			
	</script>
</head>

<body>
<div class="allWrap">
	<!-- header -->
		<jsp:include page="/WEB-INF/views/top.jsp">
			<jsp:param value="${sort }" name="sort"/>
		</jsp:include>
	<!-- header -->
			<!-- 상단 헤더 영역 -->
    
        <div class="popDim"></div>
		
	</div>
	<!-- // header -->
	<!-- // header -->
	
	<!-- 컨텐츠 -->
	<div class="contentsArea loginJoinBg" id="sec_pw_retry">
		<div class="contentsWrap">
		
			<!-- 오른쪽 영역 -->
			<div class="content oasisLoginHt">
				<!-- 내용 입니다 -->
				
				<div class="oasisLoginWrap oasisJoinWrap">
				 	<div class="newJoinTitle">비밀번호 찾기</div>           
                	   
				
					<!-- 아이디 입력-->
					<form action="" method="post" name="myForm">
					<ul class="oasisLoginInputLi oasisJoinInputLi oasisJoin_name">
						<li>
							
							<input type="text" placeholder="아이디" id="join_id"/>
						
						</li>
					<!-- //아이디 입력-->

					<!-- 이메일 입력 -->
						<li>
							<input type="text" placeholder="이메일" id="join_email"/>
					
						</li>
					<!-- //이름 입력 -->


					</form>
					<!-- btn : 아이디 비밀번호 찾기 하단 버튼 -->
					<div class="oasisLoginBtn2">
						 
						<a href="#"  onclick="findPassword(); return false;" id="btnFindPwd">비밀번호 찾기</a>
						
					</div>
					<div class="oasisLoginBtn2">
						
						<a href="#"  onclick="login(); return false;" >로그인페이지</a>
						
					</div>
				</div>
				<!-- //내용 입니다 -->
			</div>
			<!-- //오른쪽 영역 -->
		</div>
	</div>
	<!-- //컨텐츠 -->
	
	<!-- footer -->

	<!-- // footer -->
</div>
</body>
</html>