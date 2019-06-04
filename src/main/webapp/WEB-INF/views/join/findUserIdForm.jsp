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
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.12"></script>


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119809802-1"></script>
<script type="text/javascript">

	    // 아이디 찾기
		function findUserId() {
	    	
			var join_name = $("#join_name").val();
			var join_phone = $("#join_phone").val();
		
			if (join_name.length < 1) {
				alert("이름을 입력해주세요.");
				
			}
			else if (join_phone.length < 1) {
				alert("휴대폰을 입력해주세요.");
			
			}
			else {

				var url ="<%=cp%>/join/findUserIdForm_ok.action";
				
				$.post(url,{join_name:join_name,join_phone:join_phone},function(args){

					var checkId = "고객님의 아이디는" + args + "입니다.";
					
					$("#findIdcheck").html(checkId);
					$("#findIdcheck").show();
					
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

	<!-- header -->
	

		<!-- 상단 헤더 영역 -->
		<jsp:include page="/WEB-INF/views/top.jsp">
			<jsp:param value="${sort }" name="sort"/>
		</jsp:include>
		<!-- 상단 헤더 영역 -->

        <div class="popDim"></div>
		
	</div>
	<!-- // header -->
	<!-- // header -->
	
	<!-- 컨텐츠 -->
	<div class="contentsArea loginJoinBg" id="sec_idpw_search">
		<div class="contentsWrap">
			<!-- 오른쪽 영역 -->
			<div class="content oasisLoginHt">
				<!-- 내용 입니다 -->
				<div class="oasisLoginWrap oasisJoinWrap" id="findBox">
					 <div class="newJoinTitle">아이디 찾기</div>           
                     <div class="newJoinSubTitle">
                    	회원님의 소중한 개인정보 보호를 위하여 본인확인이 필요합니다. <br>
				     </div>      
					
					<form action="" method="post" name="myForm">
					<!-- 이름 입력 -->
					<ul class="oasisLoginInputLi oasisJoinInputLi oasisJoin_name">
						<li>
							<input type="text" placeholder="이름" id="join_name" />

						</li>
					<!-- //이름 입력 -->

					<!--휴대폰번호 입력 -->
						<li>
							<div class="oasisJoinInput_in">
								<input type="text" placeholder="휴대폰번호" id="join_phone" name="join_phone" maxlength="13"/>
							</div>
						</li>
					</ul>
					<!--//휴대폰번호 입력 -->
				</form>
					<!-- btn : 아이디 비밀번호 찾기 하단 버튼 -->
						<div class="oasisLoginBtn2">
						<div>
						 <strong style="display:none" id="findIdcheck"></strong>
						</div>	
						<a href="#"  onclick="findUserId(); return false;">아이디 찾기</a>
						
					</div>
					<div class="oasisLoginBtn2">
						
						<a href="#"  onclick="login(); return false;" >로그인페이지</a>
						
					</div>

					<!-- tit : 아이디 찾기 -->
				
					<!-- //아이디 찾기 결과 영역 -->
					

				</div>
				<!-- //내용 입니다 -->
			</div>
			<!-- //오른쪽 영역 -->
		</div>
	</div>
	<!-- //컨텐츠 -->
	
	<!-- footer -->

	<!-- // footer -->

</body>
</html>