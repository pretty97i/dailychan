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
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>

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
										<span><em>${orderDataCount}건</em></span>
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
										<span><em>${couponDataCount }장</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/qnaList.action">
										<i class="icon-mypage ps-chat"></i>
										<b>1:1 상담</b>
										<span><em>${qnaDataCount }건</em></span>							
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
									<h4>최근 주문내역</h4>
									
									<p>최근 주문하신 3개 내역만 보여집니다.</p>
	
								</div>

								<div class="mypage-orderinfo-wrap mypage-table mypage-goods-list row">
									
									<!-- 수정 필요한 부분!!!!!!!(3개월치 내역 조정용) -->
									<c:if test="${orderDataCount==0 }">
										<div class="empty-msg">최근주문 내역이 없습니다.</div>	
									</c:if>

									<!-- 구매한 리스트 띄울 것!! end paging 처리까지 해야됨 -->
									<c:if test="${orderDataCount!=0 }">
									<table>
										<colgroup>
											<col style="width:90px;">
											<col style="width:100px;">
											<col>
											<col style="width:100px;">
											<col style="width:100px;">
										</colgroup>
										<thead style="background: #f4f4f4;">
											<tr>
												<th scope="col">주문번호</th>
												<th scope="col">구매날짜</th>
												<th scope="col">구매정보</th>
												<th scope="col">구매가</th>
												<th scope="col">배송상태</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="dto" items="${orderList }">
													<tr>
														<th>${dto.orderList_id }</th>
														<th>${dto.orderList_created }</th>
														<th>${dto.product_subject } 등 ${dto.orderList_productCount }개</th>
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
													</tr>									
										</c:forEach>
										</tbody>
									</table>
									</c:if>
								</div>
							</div>
							
							<div class="mypage-cblock">

								<div class="mypage-subtit">
									<h4>찜내역</h4>
									<a href="/dailychan/myPage/wishList.action" class="more">
										<i class="icon-mypage more">More</i>
									</a>
								</div>

								<div class="mypage-table mypage-goods-list">
								
									<c:if test="${zzimDataCount == 0 }">
										<div class="empty-msg">찜내역이 없습니다.</div>	
									</c:if>

									<c:if test="${zzimDataCount != 0 }">
									<table>
										<colgroup>
											<col style="width:100px;">
											<col style="width:200px;">
											<col style="width:100px;">
											<col style="width:140px;">
											<col style="width:100px;">
										</colgroup>
										<thead style="background: #f4f4f4;">
											<tr>
												<th scope="col" colspan="2">상품정보</th>
												<th scope="col">판매가</th>
												<th scope="col">할인금액</th>
												<th scope="col">구매가</th>
											</tr>
										</thead>
										<tbody>
												<c:forEach var="dto" items="${zzimList }">
													<tr>
														<th>
															<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품 섬네일" class="thum" style="width: 70px;height: 70px;vertical-align: middle;">
														</th>
														<th>
															${dto.product_subject }
														</th>
														<th>${dto.price }원</th>
														<th>
															${dto.discount_price }원<br/>
															<font color="red">[${dto.product_discount }%]</font>
															<font color="gray">할인가</font>
														</th>
														<th>${dto.result_price }원</th>
													</tr>
												</c:forEach>
											
										</tbody>
									</table>
									</c:if>

								</div>
							</div>
						
							<div class="mypage-cblock">

								<div class="mypage-subtit">
									<h4>자주구매상품</h4>
									<a href="/dailychan/myPage/frequencyList.action" class="more"><i class="icon-mypage more">More</i></a>
								</div>

								<div class="mypage-table mypage-goods-list">
								
									<c:if test="${frequencyDataCount==0 }">
										<div class="empty-msg">자주구매 상품이 없습니다.</div>
									</c:if>

									<c:if test="${frequencyDataCount!=0 }">

									<table>
										<colgroup>
											<col style="width:100px;">
											<col style="width:200px;">
											<col style="width:100px;">
											<col style="width:140px;">
											<col style="width:100px;">
										</colgroup>
										<thead style="background: #f4f4f4;">
											<tr>
												<th scope="col" colspan="2">상품정보</th>
												<th scope="col">판매가</th>
												<th scope="col">할인금액</th>
												<th scope="col">구매가</th>
											</tr>
										</thead>
										<tbody>
												<c:forEach var="dto" items="${frequencyList }">
													<tr>
														<th>
															<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품 섬네일" class="thum" style="width: 70px;height: 70px;vertical-align: middle;">
														</th>
														<th>
															${dto.product_subject }
														</th>
														<th>${dto.price }원</th>
														<th>
															${dto.discount_price }원<br/>
															<font color="red">[${dto.product_discount }%]</font>
															<font color="gray">할인가</font>
														</th>
														<th>${dto.result_price }원</th>
													</tr>
												</c:forEach>
											
										</tbody>
									</table>

									</c:if>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>
</body>
</html>