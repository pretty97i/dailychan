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
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css?dummy=5.92" />
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
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.04"></script>

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
								
									<li class="on">
										<a href="/dailychan/myPage/couponList.action?couponGubun=USE">쿠폰 내역</a>

											<ul>
											
											<c:if test="${couponGubun=='USE' }">
												<li class="on"><a href="/dailychan/myPage/couponList.action?couponGubun=USE">사용 가능 쿠폰</a></li>
												<li><a href="/dailychan/myPage/couponList.action?couponGubun=COM">사용 완료 쿠폰</a></li>
												<li><a href="/dailychan/myPage/couponList.action?couponGubun=EXP">기간 만료 쿠폰</a></li>
											</c:if>
											<c:if test="${couponGubun=='COM' }">
												<li><a href="/dailychan/myPage/couponList.action?couponGubun=USE">사용 가능 쿠폰</a></li>
												<li class="on"><a href="/dailychan/myPage/couponList.action?couponGubun=COM">사용 완료 쿠폰</a></li>
												<li><a href="/dailychan/myPage/couponList.action?couponGubun=EXP">기간 만료 쿠폰</a></li>
											</c:if>
											<c:if test="${couponGubun=='EXP' }">
												<li><a href="/dailychan/myPage/couponList.action?couponGubun=USE">사용 가능 쿠폰</a></li>
												<li><a href="/dailychan/myPage/couponList.action?couponGubun=COM">사용 완료 쿠폰</a></li>
												<li class="on"><a href="/dailychan/myPage/couponList.action?couponGubun=EXP">기간 만료 쿠폰</a></li>
											</c:if>	
											
											</ul>
										
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
								<c:if test="${couponGubun=='USE' }">
									<h4>${dto.join_name }님의 사용가능한 쿠폰은
													                       
				                       <font color="#e53433">총 ${coupon }장</font> 입니다. 
				                       
									</h4>
								</c:if>
								
								<c:if test="${couponGubun=='COM' }">
									<h4>${dto.join_name }님의 사용하신 쿠폰은
													                       
				                       <font color="#e53433">총 ${couponCom }장</font> 입니다. 
				                       
									</h4>
								</c:if>
								
								<c:if test="${couponGubun=='EXP' }">
									<h4>${dto.join_name }님의 기한만료된 쿠폰은
													                       
				                       <font color="#e53433">총 ${couponExp }장</font> 입니다. 
				                       
									</h4>
								</c:if>
								
								</div>

								<div class="mypage-table mypage-coupon-list">
									<table>
										<colgroup>
											
											<col>
											<col style="width:110px;">
											<col style="width:180px;">
											<col style="width:100px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">쿠폰명/정보</th>
												<th scope="col">할인금액</th>
												<th scope="col">유효기간</th>
												<th scope="col">상태</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${dataCount==0 }">
											<tr>
												<td colspan="4">
													<div class="empty-msg">쿠폰 내역이 없습니다.</div>
												</td>
											</tr>
										</c:if>
										<c:if test="${dataCount!=0 }">
											<c:if test="${couponGubun=='USE' }">
												<c:forEach var="dto" items="${couponLists }">
														<tr>
															<td class="tl">
																<p>가능쿠폰</p>
															</td>
															<td>
																<b>
																	${dto.coupon_price }
																</b>
															</td>
															<td>
																${dto.coupon_startDate } ~
																${dto.coupon_endDate }
															</td>
															<td>
	
																사용 가능
																
															</td>
														</tr>
												</c:forEach>
												 <tr height="30" style="border-top: 1px #bbb;">
														<th align="center" colspan="4">
															${pageIndexList }
												  		</th>
												  </tr>
											</c:if>
											
											<c:if test="${couponGubun=='COM' }">
												<c:forEach var="dto" items="${couponCOMLists }">
														<tr>
															<td class="tl">
																<p>완료쿠폰</p>
															</td>
															<td>
																<b>
																	${dto.coupon_price }
																</b>
															</td>
															<td>
																${dto.coupon_startDate } ~
																${dto.coupon_endDate }
															</td>
															<td>
																	
																사용 완료
																
															</td>
														</tr>
												</c:forEach>
												  <tr height="30" style="border-top: 1px #bbb;">
														<th align="center" colspan="4">
															${pageIndexList }
												  		</th>
												  </tr>
											</c:if>
											
											<c:if test="${couponGubun=='EXP' }">
												<c:forEach var="dto" items="${couponEXPLists }">
														<tr>
															<td class="tl">
																<p>만료쿠폰</p>
															</td>
															<td>
																<b>
																	${dto.coupon_price }
																</b>
															</td>
															<td>
																${dto.coupon_startDate } ~
																${dto.coupon_endDate }
															</td>
															<td>
	
																기한 만료
																
															</td>
														</tr>
												</c:forEach>
												
												 <tr height="30" style="border-top: 1px #bbb;">
														<th align="center" colspan="4">
															${pageIndexList }
												  		</th>
												  </tr>
													
											</c:if>
										</c:if>	
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
    <!-- //컨텐츠 -->

</div>
</body>
</html>