<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
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
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/Node.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>


	<!-- header -->
		<jsp:include page="/WEB-INF/views/top.jsp">
			<jsp:param value="${sort }" name="sort"/>
		</jsp:include>
	
	<div id="header">
		<!--top banner-->
		
		<!-- //top banner-->

	</div>
	<!-- header -->


		<!-- 상단 헤더 영역 -->
		
		<!-- 상단 헤더 영역 -->
	
		<!-- gnb 영역 -->
		


		<!-- //gnb 영역 -->
		
		<!-- 상품검색 form -->
	
		<!--// 상품검색 form -->
		
		<!-- 상품 카테고리 form -->
	
		<!--// 상품 카테고리 form -->	


		<!------------------------ 배송관련 레이어팝업 / 전 페이지 공통 ------------------------>
		
			<!-- btn : 닫기 -->	
		<!-- //popup : 개인정보 입력 -->
		<!------------------------ //배송관련 레이어팝업 / 전 페이지 공통 ------------------------>
		
		<!-- 배송 지역 찾기 -->		

		 
		            <!-- //이 안에 팝업 내용 넣기 -->
		
		<!-- //배송 지역 찾기 -->
		
		<!------------------------ 장바구니 레이어 팝업 ------------------------>
        
        <!------------------------ // 장바구니 레이어 팝업 ------------------------>
        
        <div class="popDim"></div>
		
	</div>
	<!-- // header -->
    <!-- // header -->
    
    <!-- 컨텐츠 -->
   <div class="contentsArea">
        <div class="contentsWrap">
          <div class="list_top_banner img_join">
          </div>
            <!-- 오른쪽 영역 -->
            <div class="content oasisLoginHt">
                <div class="oasisLoginWrap">
                    <div style="background: #efefef;width: 560px;height: 520px;margin: 0 auto;">
                    <div class="oasisLoginTit1">Daily Chan 회원 가입</div>
                    <div class="oasisLoginBtn2">
                        <a href="/dailychan/join/signUp.action">회원가입</a> 
                    </div>

                    <div style=" padding: 30px 0 10px 100px; text-align: left; font-size: 14px;">SNS로 간편 회원가입
                    </div>
                    <div class="sns_list">
                    	<a href="${url }">
                        <img src="/dailychan/resources/images/loginJoin/join_sns_kakao.png" />
                        </a>
                        <a href="/dailychan/join/naverlogin.action">
                        <img src="/dailychan/resources/images/loginJoin/join_sns_naver.png" />
                        </a>
                        <a href="/join/social/google">
                        <img src="/dailychan/resources/images/loginJoin/join_sns_google.png" />
                        </a>
                        <a href="/join/social/facebook">
                        <img src="/dailychan/resources/images/loginJoin/join_sns_facebook.png" />
                        </a>
                    </div>
                   
                </div>
            <!-- //오른쪽 영역 -->  
            </div>    
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


