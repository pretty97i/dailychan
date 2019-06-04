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
									<a href="/dailychan/myPage/couponList.action?couponGubun==USE">
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
					
					
					<!-- 왼쪽 프레임 -->
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
										
											<li class="on"><a href="/dailychan/myPage/cancelList.action">주문취소 내역</a></li>
										
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
						
						<!-- //왼쪽 프레임 -->
						
						<!-- main -->
						<div class="mypage-contents">
							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>주문취소 내역</h4>
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
						                                <div class="empty-msg">주문 취소 내역이 없습니다.</div>
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
														<th><font color="red">[주문 취소]</font></th>
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
						</div>
						
						<!-- //main -->
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //컨텐츠 -->

</div>
</body>
</html>