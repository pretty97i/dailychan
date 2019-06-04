<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String join_id = request.getParameter("join_id");
	String join_name = request.getParameter("join_name");
	String join_email = request.getParameter("join_email");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	  <title>DailyChan: 믿을 수 있는 먹거리</title>
	
	<!-- 네이버 전환페이지 설정  -->
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script> 
	<script type="text/javascript"> 
	var _nasa={};
	_nasa["cnv"] = wcs.cnv("2","10"); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
	</script> 
	<meta name="referrer" content="no-referrer" />

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
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.12"></script>

<!-- 네이버 프리미엄 로그 적용 : 공통 --> 
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_eb0d5275a00";
if (!_nasa) var _nasa={};
wcs.inflow();
wcs_do(_nasa);
</script>

	
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
	</script>
	
	<!-- 다음 가입전환 -->
	<script type="text/javascript"> 
	 //<![CDATA[ 
	 var DaumConversionDctSv="type=M,orderID=,amount="; 
	 var DaumConversionAccountID="RJSnSKGGnQfKt2u6pgST8w00"; 
	 if(typeof DaumConversionScriptLoaded=="undefined"&&location.protocol!="file:"){ 
	 	var DaumConversionScriptLoaded=true; 
	 	document.write(unescape("%3Cscript%20type%3D%22text/javas"+"cript%22%20src%3D%22"+(location.protocol=="https:"?"https":"http")+"%3A//t1.daumcdn.net/cssjs/common/cts/vr200/dcts.js%22%3E%3C/script%3E")); 
	 } 
	 //]]> 
	 </script> 
	
</head>

<body>
<div class="allWrap">
	<!-- header -->

	<!-- header -->
		<jsp:include page="/WEB-INF/views/top.jsp">
			<jsp:param value="${sort }" name="sort"/>
		</jsp:include>
		<!-- 상단 헤더 영역 -->
	
		<!-- gnb 영역 -->

		<!-- //popup : 개인정보 입력 -->

        <div class="popDim"></div>
		
	</div>
	<!-- // header -->
	<!-- // header -->
	
	<!-- 컨텐츠 -->
	<div class="contentsArea loginJoinBg" id="sec_join_result">
		<div class="contentsWrap">
			
			<!-- 오른쪽 영역 -->
			<div class="content oasisLoginHt"> 
				<!-- 내용 입니다 -->
				
				<div class="oasisLoginWrap oasisJoinWrap" id="resultBox">
				
				 	<div class="newJoinTitle">가입신청 완료</div>           

                    
                    <!-- 가입신청완료 영역 -->
                    <div class="join_result_area">
						<div>
							<img src="/dailychan/resources/images/loginJoin/ico_join_end.png" alt="" />
						</div>
						<div>
							Daily Chan <strong>회원이 되신것을 환영</strong>합니다!
						</div>
						
							<p>
								 행복한 dailychan ♥ <strong> <%=join_name %> </strong>회원님 ♥ 입니다.
							</p>
						
						<span>가격감동/품질감동/서비스 감동을 경험하세요.</span>
					</div>
                    <!-- //가입신청완료 영역 -->
                    
                    <!-- tit : 오아시스 패밀리 혜택 안내 -->
					<div class="tit_benefit">
						<p><img src="/dailychan/resources/images/loginJoin/tit_membership.png" alt="오아시스 패밀리 혜택 안내" /></p>
					</div>
					
					<!--오아시스 패밀리 혜택 영역 -->
					<div class="benefit_list_area">
						<table cellpadding="0" cellspacing="0" border="0">
							<colgroup>
								<col width="33%" />
								<col width="34%" />
								<col width="33%" />
							</colgroup>
							<tr>
								<td>
									<div class="ico_benefit_1">
										<img src="/dailychan/resources/images/intro/ico_benefit_1.png" alt="4" />
									</div>
									<span>혜택하나!</span>
									<strong>DailyChan 24 배송</strong>
								
									<p>
										주문 후 5시간 이내<br />
										엄선된 품질로 <br />
										신속 정확 배송!
									</p>
								</td>
								<td>
									<div class="ico_benefit_1">
										<img src="/dailychan/resources/images/intro/ico_benefit_2.png" alt="SALE" />
									</div>
									<span>혜택두울!</span>
									<strong>매일 매일 특별한 혜택</strong>
								
									<p>
										매장에서 만나보던 <br />
										혜택 그대로 +<br />
										온라인 회원 전용 혜택
									</p>
								</td>
								<td>
									<div class="ico_benefit_1">
										<img src="/dailychan/resources/images/intro/ico_benefit_3.png" alt="DAY" />
									</div>
									<span>혜택세엣!</span>
									<strong>오! 감동</strong>
								
									<p>
										ID당 품목별<br />
										하루에 한개씩만 구매 가능한<br />
										파격 할인!
									</p>
								</td>
							</tr>

						</table>
					</div>
					<!--//오아시스패밀리 혜택 영역 -->

					<!-- 버튼 -->
					<div class="oasisLoginBtn2">
						
						<a href="/dailychan/join/login.action" >로그인</a>
					</div>
					<!--// 버튼 -->
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