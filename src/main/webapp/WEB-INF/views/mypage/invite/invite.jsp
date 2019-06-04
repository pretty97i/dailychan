<%@ page contentType="text/html; charset=UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <title>데일리찬::믿을 수 있는 먹거리</title>
    
<jsp:include page="/WEB-INF/views/top.jsp">
	<jsp:param value="${sort }" name="sort"/>
</jsp:include>

<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />

<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css?dummy=6.12" />
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

    <link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_mypage.css" />
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    
    <script type="text/javascript">
    var baseUrl = window.location.protocol+"//"+window.location.host;
    var kakaoApiKey = "dfbf5a4b6da726da4f8a82df7be6d6e9";
    var join_id = ("${dto.join_id}");
    
    function shareStory() {
      Kakao.Story.share({
        url: baseUrl + '<%=cp%>/join/recommend.action?recommend=' + join_id,
        text: '황병열님이 초대하는 #가격감동 #품질감동 #고객감동 오아시스마켓! 신선한 제품을 3시간내에 받아 볼수 있습니다.'
      });
    }
    
    function sendLink() {
    	 Kakao.Link.sendScrap({
    	        requestUrl:  baseUrl + '<%=cp%>/join/recommend.action?recommend=' + join_id,
    	        fail: function (res) {
    	        	  console.log(res)
    	        	}
    	      });
     }
    
    $(document).ready(function() {
    	
       $('.copyBtn').attr('data-clipboard-text', baseUrl + "<%=cp%>/join/recommend.action?recommend="+join_id);
       $('#fbCopyLink').attr("href", "https://www.facebook.com/sharer/sharer.php?u=" + baseUrl + contextPath + "/join/recommend/anews0927")
        var clipboard = new ClipboardJS('.copyBtn');

        clipboard.on('success', function(e) {
            alert("링크가 복사되었습니다.");
            e.clearSelection();
        });

        clipboard.on('error', function(e) {
                 
        });
        Kakao.init(kakaoApiKey);
    }); 
    </script>
</head>

<body>
<div class="allWrap">

    <!-- 컨텐츠 -->
    <div class="contentsArea">

		<div class="contentsWrap">


			
			<div class="content"> 
				<!-- mypage -->
				

				<div class="mypage-wrap">
		<div class="mypage-personal">
						<div class="personal-info">
							<div class="grade">
								
									
									
										<i class="icon-grade basic">member</i>
									
								
							</div>
							<div class="name"><b>${dto.join_name }</b><em>님</em></div>
							<div class="edit">
								<a href="/dailychan/myPage/info.action?check=0">
									<i class="icon-mypage tools"></i>회원정보관리
								</a>
							</div>
						</div>

						<div class="personal-status">
							<ul>
								<li>
									<a href="/dailychan/myPage/orderList.action">
										<i class="icon-mypage ps-order"></i>
										<b>주문/배송</b>
										<span><em>${buySu}건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/pointList.action">
										<i class="icon-mypage ps-point"></i>
										<b>포인트</b>
										<span><em>${dto.join_point }P</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/couponList.action">
										<i class="icon-mypage ps-coupon"></i>
										<b>쿠폰</b>
										<span><em>${coupon }장</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/qnaList.action">
										<i class="icon-mypage ps-chat"></i>
										<b>1:1 상담</b>
										<span><em>${consultingSu }건</em></span>							
									</a>
								</li>						
							</ul>
						</div>
					</div>

					<div class="mypage-contents-wrap">

						<div class="mypage-lnb">
							<a href="/dailychan/myPage/main.action">
								<h3>MY 쇼핑</h3>
							</a>
							<ul>
								
									<li>
										<a href="/dailychan/myPage/orderList.action">주문관리</a>

									</li>
								
									<li>
										<a href="/dailychan/myPage/wishList.action">찜내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/frequencyList.action">자주구매상품</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/pointList.action">포인트 내역</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/couponList.action">쿠폰 내역</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/commentList.action">구매후기</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/productQnaList.action">상품문의내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/qnaList.action">1:1상담내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/refundProductList.action?refundGbn=R0">환불서비스</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/info.action?check=0">회원정보 관리</a>
										
									</li>
								
									<li class="on">
										<a href="/dailychan/myPage/invite.action">친구추천</a>
										
									</li>
								
							</ul>
						</div>

						
						<div class="mypage-contents">
							<div class="mypage-cblock mypage-invite-wrap">
								<div class="invite-tit">
									<b>친구추천하고 친구도 나도 5,000원씩</b> 포인트받자!
								</div>
								<div class="invite-info">
									<div class="my-id">
										<span>나의 아이디</span><b>${dto.join_id }</b>
									</div>
									<div class="btn-wrap">
										<a href="#" class="btn green copyBtn" id="copyLink" data-clipboard-text="/join/recommend.action?join_recommend"+${dto.join_id }>링크 복사하기</a>
										<a id="fbCopyLink" href="#" target="_blank">
											<img src="/dailychan/resources/images/order/friend_add_btn_f.png">
										</a>
										<a id="kakao-link-btn" href="#" onclick="javascript:sendLink();">
											<img src="/dailychan/resources/images/order/friend_add_btn_t.png">
										</a>
										<a id="kakao-story-link-btn" href="#" onclick="javascript:shareStory();">
											<img src="/dailychan/resources/images/order/friend_add_btn_s.png">
										</a>
									</div>
								</div>
								<div class="invite-guide">
									<ul>
										<li>
											<div class="icon"><img src="/dailychan/resources/images/myPage/img_invite_1.png"></div>
											<b>친구추천</b>
											<p>가격감동, 품질감동,고객감동<br>데일리찬으로 친구를 추천하세요.</p>
										</li>
										<li>
											<div class="icon"><img src="/dailychan/resources/images/myPage/img_invite_2.png"></div>
											<b>친구 가입 완료</b>
											<p>추천받은 아이디로<br>친구가 가입을 완료합니다.</p>
										</li>
										<li>
											<div class="icon"><img src="/dailychan/resources/images/myPage/img_invite_3.png"></div>
											<b>첫 주문 완료</b>
											<p>친구 첫 주문 배송 완료 후<br>친구도 나도 5,000원 포인트받자!</p>
										</li>										
									</ul>
								</div>
								<div class="invite-guide-txt">
									<div class="tit">꼭 알아두세요!</div>
									<ol class="number-list">
										<li>포인트 지급 후 주문취소나 환불시 포인트는 회수 될수 있습니다.</li>
										<li>기존회원이 포인트을 위해 중복 가입 한 것으로 판단되는 경우 포인트가 지급되지 않습니다.</li>
										<li>추천인과 피추천인의 주소지(배송지)가 동일할 경우 중복 가입으로 판단되어 포인트가 지급되지 않을 수 있습니다.</li>
										
									</ol>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- //컨텐츠 -->

</div>
</body>
</html>