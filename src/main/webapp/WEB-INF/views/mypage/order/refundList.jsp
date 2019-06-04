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
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72.png" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-50@2x.png" sizes="96x96" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72@2x.png" sizes="144x144" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-60@3x.png" sizes="192x192" />
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
											
												<li><a href="/dailychan/myPage/orderList.action">주문/배송내역</a></li>
											
												<li><a href="/dailychan/myPage/cancelList.action">주문취소 내역</a></li>
											
												<li class="on"><a href="/dailychan/myPage/refundList.action">교환/반품 내역</a></li>
											
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
									<h4>교환/반품 내역</h4>
									<p>최근 3개월 이내의 내역만 보여집니다.</p>
								</div>
								
								<div class="mypage-table mypage-goods-list row">
									<table>
										<colgroup>
											<col style="width:90px;">
											<col style="width:100px;">
											<col>
											<col style="width:100px;">
											<col style="width:100px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">주문번호</th>
												<th scope="col">구매날짜</th>
												<th scope="col">구매정보</th>
												<th scope="col">구매가</th>
												<th scope="col">배송상태</th>
											</tr>
										</thead>
										<tbody>
										
											<c:if test="${dataCount==0 }">
											
												<tr>
													<td colspan="5">
						                                <div class="empty-msg">교환/반품 내역이 없습니다.</div>
													</td>
												</tr>
											
											</c:if>
											
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
															<font color="gold">
																<c:if test="${dto.orderList_step==7 }">
																	[반품신청]
																</c:if>
																<c:if test="${dto.orderList_step==8 }">
																	[반품완료]
																</c:if>
																<c:if test="${dto.orderList_step==9 }">
																	[반품반려]
																</c:if>
															</font>
														</th>
													</tr>
												</c:forEach>
												
											    <tr height="30" style="border-top: 1px #bbb;">
												    <th align="center" colspan="5">
														${pageIndexList }
												    </th>
												</tr>
												
											</c:if>
											
										</tbody>
									</table>
								</div>

								<div class="paging-wrap">
									
								</div>
							</div>

							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>교환/반품 안내</h4>
								</div>					

								<div class="mypage-order-guide">
									<div class="txt-guide-block">
										<p class="tit">1. 주문/결제/배송 관련설명</p>
										<ul class="dash">
											<li>상품의 수령 즉시 모든 상품의 상태를 확인해 주십시오.</li>
											<li>식품의 특성상 고객님 임의로 반송 및 수취 거부하실 수 없으며 아래에 안내된 기준에 의해서만 교환, 반품, 환불 접수가 가능합니다.</li>
										</ul>
									</div>
									
									<div class="mypage-guide-table">
										<table>
											<colgroup>
												<col style="width:136px;">
												<col>
											</colgroup>
											<thead>
												<tr>
													<th scope="col">가능여부</th>
													<th scope="col">교환, 반품 환불 기준 내용</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row">가능</th>
													<td>
														<div class="txt-guide-block">
															<p class="tit">불량 및 오배송으로 인한 교환 및 반품</p>
															<ol class="number-list">
																<li>상품에 하자가 있거나 불량인 경우 변질, 불량, 파손, 표기오류, 이물혼입, 중량미달 등</li>
																<li>주문한 내역과 다른 상품이 배송 된 경우</li>
															</ol>		

															<p class="tit">고객 단순변심으로 인한 반품</p>
															<ol class="number-list">
																<li>일반 가공식품 및 생활용품만 반품가능</li>
																<li>포장 및 구성품이 훼손되지 않은 경우 (단, 반송시 발생하는 비용은 고객부담 )</li>
															</ol>																				
															<p>※ 고객부담 배송비: 6,000원 (왕복배송비)</p>
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">불가능</th>
													<td>
														<ol class="number-list">
															<li>위의 안내된 접수기간이 지난 경우</li>
															<li>본인의 과실로 상품이 없어지거나 훼손 된 경우</li>
															<li>개봉하여 이미 사용한 경우</li>
															<li>단순 기호차이에 의한 경우 (맛, 향, 색 등)</li>
															<li>시간이 경과되어 상품의 가치가 현저히 떨어진 경우</li>
															<li>예약상품: 취소 및 반품이 어렵습니다. 단, 예약마감 전 고객센터로 연락하시면 취소 가능</li>
															<li>신선식품: 채소, 청과, 일부 신선가공식품 (두부 / 빵 외)</li>
														</ol>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="txt-guide-block">
										<p class="tit">2. 품목별 접수시간</p>
									</div>
									
									<div class="mypage-guide-table">
										<table>
											<colgroup>
												<col style="width:50%;">
												<col>
											</colgroup>
											<thead>
												<tr>
													<th scope="col">채소/과일류, 냉장/냉동식품, 베이커리제품, 유제품, 양곡 등</th>
													<th scope="col">일반 가공식품, 건강기능식품, 생활용품</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="guide-expire">
														<p>상품 수령일로부터<br>다음날까지(영업일 기준)</p>
													</td>
													<td class="guide-expire">
														<p>상품 수령일로부터<br>7일 이내</p>
													</td>
												</tr>
											</tbody>
										</table>
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