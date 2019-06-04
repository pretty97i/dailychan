<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<title>데일리찬::믿을::믿을 수 있는 먹거리</title>
	
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
	
	<script type="text/javascript">
		
	function cancelOrderSendIt(orderList_id) {	
		
		if(confirm("주문 취소하시겠습니까?")==true){
		
	        var url = "<%=cp%>/myPage/cancelOrder.action";
	        
	        $.post(url,{orderList_id:orderList_id},function(data){
	        	
	        	window.location.reload(true);
	        	
	        });
		}

		return false;
	
	}
		
	function refundOrderSendIt(orderList_id) {
		
		if(confirm("환불 신청하시겠습니까?")==true){
			
	        var url = "<%=cp%>/myPage/refundOrder.action";
	        
	        $.post(url,{orderList_id:orderList_id},function(data){
	        	
	        	window.location.reload(true);
	        	
	        });
		}

		return false;

	}

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
								<a href="/dailychan/myPage/info">
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
								
									<li class="on">
										<a href="/dailychan/myPage/orderList.action">주문관리</a>
										
										
											<ul>
											
												<li class="on"><a href="/dailychan/myPage/orderList.action">주문/배송내역</a></li>
											
												<li><a href="/dailychan/myPage/cancelList.action">주문취소 내역</a></li>
											
												<li><a href="/dailychan/myPage/refundList.action">교환/반품 내역</a></li>
											
											</ul>
										
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
								
									<li>
										<a href="/dailychan/myPage/invite.action">친구추천</a>
													
									</li>
								
							</ul>
						</div>

						<div class="mypage-contents">

							<div class="mypage-cblock">

								<div class="mypage-subtit">
									<h4>주문/배송 내역</h4>
									<p>최근 주문하신 3개월 이내의 내역만 보여집니다.</p>
								</div>

								<div class="mypage-table mypage-goods-list row">
									<table>
										<colgroup>
											<col style="width:90px;">
											<col style="width:100px;">
											<col>
											<col style="width:100px;">
											<col style="width:100px;">
											<col style="width:140px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">주문번호</th>
												<th scope="col">구매날짜</th>
												<th scope="col">구매정보</th>
												<th scope="col">구매가</th>
												<th scope="col">배송상태</th>
												<th scope="col">신청</th>
											</tr>
										</thead>
										<tbody>
										
											<c:if test="${dataCount==0 }">
											
												<tr>
													<td colspan="6">
						                                <div class="empty-msg">주문 내역이 없습니다.</div>
													</td>
												</tr>
											
											</c:if>
											
											<!-- <tr data-cartid="4325178" data-productid="2367-2282" data-price="9600" data-discountedprice="5200" data-deliveryprice="3000" data-buylimit="0" data-delivery_group="OASIS" data-isnotdelivery="false" data-isnotdaybreakdelivery="false"> -->
											
											<c:if test="${dataCount!=0 }">
												<c:forEach var="dto" items="${lists }">
													<tr>
														<th>${dto.orderList_id }</th>
														<th>${dto.orderList_created }</th>
														<c:if test="${dto.orderList_productCount==1 }">
															<th>${dto.product_subject }</th>
														</c:if>
														<c:if test="${dto.orderList_productCount!=1 }">
															<th>${dto.product_subject } 등 ${dto.orderList_productCount }개</th>
														</c:if>
														<th>${dto.result_price }원</th>
														<th>
															<font color="green">
																<c:if test="${dto.orderList_step==1 }">
																	[주문접수]
																</c:if>
																<c:if test="${dto.orderList_step==2 }">
																	[결제완료]
																</c:if>
																<c:if test="${dto.orderList_step==3 }">
																	[상품준비중]
																</c:if>
																<c:if test="${dto.orderList_step==4 }">
																	[배송중]
																</c:if>
																<c:if test="${dto.orderList_step==5 }">
																	[배송완료]
																</c:if>
																<c:if test="${dto.orderList_step==6 }">
																	[주문완료]
																</c:if>
															</font>
														</th>
														<th>
															<c:if test="${dto.orderList_step==1 }">
																<a href="#" class="btn" onclick="cancelOrderSendIt('${dto.orderList_id}'); return false;">취소</a>
															</c:if>
															<c:if test="${dto.orderList_step==5 }">
																<a href="<%=cp %>/myPage/refundProductList.action?refundGbn=R0" class="btn">환불</a>
															</c:if>
															<c:if test="${dto.orderList_step==2 || dto.orderList_step==3 || dto.orderList_step==4 || dto.orderList_step==6 }">
																<font color="gray">[취소/환불 불가]</font>
															</c:if>
														</th>
													</tr>
												</c:forEach>
												
											</c:if>
											
										</tbody>
									</table>
								</div>

								<div class="paging-wrap">
								
									<c:if test="${dataCount!=0 }">
										${pageIndexList }
									</c:if>
									
								</div>
								
							</div>

							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>주문/배송상태 안내</h4>
									<p>배송상태가 주문 완료 시 환불은 불가능합니다.</p>
								</div>					
								<div class="mypage-order-step">
									<ul>
										<li>
											<div class="step-head">
												<i class="txt-step step1">STEP 1</i>
												<span>주문접수</span>
											</div>
											<div class="step-body">
												입금 전 상태이며<br>7일 이내 미입금 시<br>자동취소됩니다.<br>
											</div>
										</li>
										<li>
											<div class="step-head">
												<i class="txt-step step2">STEP 2</i>
												<span>결제완료</span>
											</div>
											<div class="step-body">
												고객님의 결제내역<br>확인이 완료되었습니다.<br>
											</div>
										</li>
										<li>
											<div class="step-head">
												<i class="txt-step step3">STEP 3</i>
												<span>상품준비중</span>
											</div>
											<div class="step-body">
												주문 확인후 상품을<br>발송할 예정입니다.
											</div>
										</li>
										<li>
											<div class="step-head">
												<i class="txt-step step4">STEP 4</i>
												<span>배송중</span>
											</div>
											<div class="step-body">
												상품이 배송중입니다.<br>1~2일 후 상품이<br>도착합니다.
											</div>
										</li>
										<li>
											<div class="step-head">
												<i class="txt-step step5">STEP 5</i>
												<span>배송완료</span>
											</div>
											<div class="step-body">
												고객님이 상품을<br>수령하였습니다.<br>
											</div>
										</li>
									</ul>
								</div>
								<div class="mypage-order-guide">
									<div class="txt-guide-block">
										<p class="tit">1. 주문/결제/배송 관련설명</p>
										<ul class="dash">
											<li>주문이 정상완료 되지 않으면 내역조회가 되지 않습니다.</li>
											<li>무통장 입금 주문하신 경우, 5일내 전용계좌로 입금하셔야 하며 입금자명과 회원명이 달라도 결제처리 됩니다.</li>
											<li>입금대기/결제완료 단계에서 정보변경 버튼을 클릭하시면 배송지정보와 배송시요구사항을 변경하실 수 있습니다.</li>
											<li>결제수단 변경은 어려우니, 결제수단 변경이 필요한 경우 취소 후 재주문을 부탁 드립니다.</li>
											<li>배송조회는 상품이 출고된 날의 익일 오전부터 가능합니다.</li>
											<li>배송완료일로부터 2일 경과후에도 택배추적이 되지 않을 경우, 고객센터로 연락 부탁드립니다.</li>
											<li>주문번호를 클릭하시면 주문상세내역을 확인하실 수 있으며, 영수증은 주문상세내역에서 출력하실 수 있습니다.</li>
										</ul>
									</div>								
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