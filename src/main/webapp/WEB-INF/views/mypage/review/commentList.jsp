<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script type="text/javascript">

	//jsp 시작할 때 자동 function 실행용
	$(function(){
		
		//var review_id = "${dto.review_id}";
		
		DatalistPage(1);
		NoDatalistPage(1);
		
	});
	
	//페이지
	function DatalistPage(page) {
		
		var url = "<%=cp%>/myPage/commentDataList.action";
		
		//넘기는 방식
		$.post(url,{pageNum:page},function(args){
			
			$("#listReviewData").html(args);
			
		});
		
		$("#listReviewData").show();	//display : block의 역할을 함
		
	}
	
	//페이지
	function NoDatalistPage(page) {
		
		var url = "<%=cp%>/myPage/commentNoDataList.action";
		
		//넘기는 방식
		$.post(url,{pageNum:page},function(args){
			
			$("#listNoReviewData").html(args);
			
		});
		
		$("#listNoReviewData").show();	//display : block의 역할을 함
		
	}

</script>

    <link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_mypage.css" />
    
</head>

<body>
<div class="allWrap">
    
    <!-- 컨텐츠 -->
    <div class="contentsArea">

		<div class="contentsWrap">

			<div class="content"> 
				<!-- mypage-wrap -->
				<div class="mypage-wrap">

					<div class="mypage-personal">
						<div class="personal-info">
							<div class="grade">

								<i class="icon-grade basic">member</i>

							</div>
							<div class="name"><b>${dto.join_name }</b><em>님</em></div>
						</div>

						<div class="personal-status">
							<ul>
								<li>
									<a href="/dailychan/myPage/orderList.action">
										<i class="icon-mypage ps-order"></i>
										<b>주문/배송</b>
										<span><em>${buySu }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/pointList.action?accGubun=M">
										<i class="icon-mypage ps-point"></i>
										<b>포인트</b>
										<span><em>${dto.join_point }P</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/couponList.action?couponGubun=USE">
										<i class="icon-mypage ps-coupon"></i>
										<b>쿠폰</b>
										<span><em>${coupon }</em>장</span>
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

					<!-- mypage-contents-wrap -->
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
										<a href="/dailychan/myPage/pointList.action?accGubun=M">포인트 내역</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/couponList.action?couponGubun=USE">쿠폰 내역</a>
										
									</li>
								
									<li class="on">
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
								
									<li>
										<a href="/dailychan/myPage/invite.action">친구추천</a>

									</li>
								
							</ul>
						</div>

						<div class="mypage-contents">
							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>미등록 구매후기 (${noDataCount }건)</h4>
								</div>
								<div class="mypage-order-info auto">
									<div class="row">
										<ul class="dash">
											<li>배송완료 상품은 주문일로 부터 30일 이내에 작성이 가능합니다.</li>
											<li><b>일반평 100포인트/ 포토평 200포인트</b>가 지급 됩니다.</li>
											<li>구매후기 내용과 사진은 오아시스에 거래되는 상품의 판촉, 홍보등을 위하여 복제, 배포,전송, 전시등에 이용 될수 있습니다.</li>
											<li>상품과 관계없는 내용 또는 이미지, 비방, 허위사실 등록은 작성자에게 통보없이 비공개 처리 및 포인트 회수 처리 될 수 있습니다.</li>
										</ul>
									</div>
								</div>

								<div class="mypage-table mypage-goods-list">

									<!-- 미등록 구매 후기 들어가는 부분!!!!!!!!!!-->
									<span id="listNoReviewData" style="display: none;"></span>

								</div>
								
								<div class="paging-wrap">
									
								</div>
								
							</div>

							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>작성한 구매후기 (${dataCount }건)</h4>
									<p></p>
								</div>
								<div class="mypage-table mypage-goods-list">
									
									<!-- 등록된 구매 후기 들어가는 부분!!!!!! -->
									<span id="listReviewData" style="display: none;"></span>
									
								</div>
								
								<div class="paging-wrap">
									
								</div>
								
							</div>
						</div>
					</div>
					<!--// mypage-contents-wrap -->
				</div>
				<!--// mypage-wrap -->
			</div>
		</div>
	</div>
    <!-- //컨텐츠 -->
  
</div>

</body>
</html>