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
	
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		
		function orderCancel(orderId,paymentType) {
			var msg1 = "구매취소 신청이 완료되었습니다.\n\n 취소한 상품은 다시 장바구니에 등록하실수 있습니다.\n등록하시겠습니까?\n\n *결제수단에 따라 실제 환불까지 1일~2주정도 소요될 수 있습니다.\n 궁금하신 사항은 고객센터 1577-0098로 문의주세요";
			var msg2 = "구매취소 하시겠습니까?\n\n *무통장입금 결제 후 구매취소시 환불 받으실 입금계좌 확인을\n 위해 별도로 연락을 드리도록 하겠습니다.\n궁금하신 사항은 고객센터 1577-0098로 문의주세요";
			
			var purl =  contextPath + "/myPage/orderCancel";
			

			if (paymentType == "SC0040") {
				purl = contextPath + "/myPage/orderCancelAccount"
			} else if (paymentType == "KAKAO") {
				purl = contextPath + "/myPage/orderCancelKakao"
			} else if (paymentType == "SMILE") {
				purl = contextPath + "/myPage/orderCancelSmile"
			} else if (paymentType == "NOPAY") {
				purl = contextPath + "/myPage/orderCancelNoPay"
			}

			if (confirm(msg2)) {

				$.ajax({
					url : purl,
					type : "POST",
					dataType : "json",
					data : {
						orderId : orderId
					},
					success : function(response) {
						//alert(JSON.stringify(response));
						if (response.status == "OK") {
							if (confirm(msg1)) {
								$.ajax({
									url : contextPath + "/myPage/recover",
									type : "POST",
									dataType : "json",
									data : {
										orderId : orderId
									},
									success : function(response) {
										//alert(JSON.stringify(response));
										if (response.status == "OK") {
											alert("상품을 장바구니에 담았습니다.");
											location.reload(true);
										} else {
											alert(response.message);
											location.reload(true);
										}
									}
								});
							}
						} else {
							alert(response.message);
							location.reload(true);
						}
					}
				});
			}
			else
				location.reload(true);
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

									<i class="icon-grade family">family</i>

							</div>
							<div class="name"><b>관리자</b><em>님</em></div>

						</div>

						<div class="personal-status">
							<ul>
								<li>
									<a href="/dailychan/admin/orderList.action">
										<i class="icon-mypage ps-order"></i>
										<font size="15pt"><b>최근 주문내역</b></font>
										<span><em>${orderDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/productQna/productQuestion.action">
										<i class="icon-mypage ps-chat"></i>
										<b>상품 문의내역</b>
										<span><em>${productQnaDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/qnaList.action">
										<i class="icon-mypage ps-chat"></i>
										<b>1:1 상담내역</b>
										<span><em>${qnaDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/refund/permitRefund.action">
										<i class="icon-mypage ps-point"></i>
										<b>환불 요청내역</b>
										<span><em>${refundDataCount }건</em></span>							
									</a>
								</li>						
							</ul>
						</div>
					</div>

					<div class="mypage-contents-wrap">

						<div class="mypage-lnb">
							<a href="/dailychan/admin/main.action">
								<h3>Admin</h3>
							</a>
							<ul>
									<li>
										<a href="/dailychan/admin/productRegister.action">상품등록</a>
										
									</li>
									
									<li>
										<a href="/dailychan/admin/recipeRegister.action">레시피등록</a>
										
									</li>
								
									<li>
										<a href="/dailychan/admin/orderList.action">주문관리</a>
										
									</li>
								
									<li>
										<a href="/dailychan/admin/coupon.action">쿠폰 발급</a>
										
									</li>
									
									<li>
										<a href="/dailychan/admin/productRecommand.action">상품추천내역</a>									
																			
									</li>
								
									<li>
										<a href="/dailychan/admin/productQna/productQuestion.action">상품문의내역</a>									
										
									</li>
								
									<li>
										<a href="/dailychan/admin/qnaList.action">1:1상담내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/admin/refund/permitRefund.action">환불서비스</a>
										
									</li>
								
									<li>
										<a href="/dailychan/admin/info.action">회원정보 관리</a>

										
									</li>

							</ul>
						</div>
											
						<div class="mypage-contents">
						
							<!-- 최신 주문 문의내역 -->
							<div class="mypage-cblock">
								<div class="mypage-subtit"><h4>최근 주문내역</h4></div>
								<div class="mypage-orderinfo-wrap"></div>
							</div>
								<table class="tableCom mgT10">
									<colgroup>
										<col width="90">
										<col width="90">
										<col width="*">
										<col width="90">
										<col width="115">
									</colgroup>
									<thead>
										<tr>
											<th>주문번호</th>
											<th>배송상태</th>
											<th>구매정보</th>
											<th>구매자</th>
											<th>구매날짜</th>
										</tr>
									</thead>

									<tbody>

										<c:if test="${orderDataCount==0 }">
						
											<tr>
												<td colspan="5">
					                                <div class="empty-msg">주문 내역이 없습니다.</div>
												</td>
											</tr>
										
										</c:if>
										
										<c:if test="${orderDataCount!=0 }">
											<c:forEach var="dto" items="${orderLists }">
											<tr>
												<td>${dto.orderList_id }</td>
												<td><span class="reply_end">
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
												</span></td>
												<td class="tL"><a href="#" onclick="return false;">
														${dto.product_subject } 등 ${dto.orderList_productCount }개 </a></td>
												<td>${dto.join_id }</td>
												<td>${dto.orderList_created }</td>
												
											</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table><br/><br/>
							
							<!-- 최신 상품 문의내역 -->
							<div class="mypage-cblock">
								<div class="mypage-subtit"><h4>상품 문의내역</h4></div>
								<div class="mypage-orderinfo-wrap"></div>
							</div>

								<table class="tableCom mgT10">
									<colgroup>
										<col width="90">
										<col width="90">
										<col width="*">
										<col width="90">
										<col width="115">
									</colgroup>
									<thead>
										<tr>
											<th>문의유형</th>
											<th>답변상태</th>
											<th>제목</th>
											<th>문의자</th>
											<th>등록일</th>
										</tr>
									</thead>

									<tbody id="productAnswer">
										<c:if test="${productQnaDataCount==0 }">						
											<tr>
												<td colspan="5">
					                                <div class="empty-msg">상품 문의 내역이 없습니다.</div>
												</td>
											</tr>										
										</c:if>

										<c:if test="${productQnaDataCount!=0 }">
											<c:forEach var="dto" items="${productQnaLists }">
											<tr>
												<td>${dto.productQuestion_type }</td>
												<td><span class="reply_end">[${dto.productQuestion_state }]</span></td>
												<td class="tL"><a href="#" onclick="return false;">
														${dto.productQuestion_content } </a></td>
												<td>${dto.join_id }</td>
												<td>${dto.productQuestion_created }</td>
												
											</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table><br/><br/>
							
							<!-- 최신 1:1 문의내역 -->
							<div class="mypage-cblock">
								<div class="mypage-subtit"><h4>1:1 문의내역</h4></div>
								<div class="mypage-orderinfo-wrap"></div>
							</div>
								<table class="tableCom mgT10">
									<colgroup>
										<col width="90">
										<col width="90">
										<col width="*">
										<col width="90">
										<col width="115">
									</colgroup>
									<thead>
										<tr>
											<th>문의유형</th>
											<th>답변상태</th>
											<th>제목</th>
											<th>문의자</th>
											<th>등록일</th>
										</tr>
									</thead>

									<tbody id="productAnswer">
										<c:if test="${qnaDataCount==0 }">						
											<tr>
												<td colspan="5">
					                                <div class="empty-msg">상품 문의 내역이 없습니다.</div>
												</td>
											</tr>										
										</c:if>

										<c:if test="${qnaDataCount!=0 }">
											<c:forEach var="dto" items="${qnaLists }">
											<tr>
												<td>${dto.qna_type }</td>
												<td><span class="reply_end">[${dto.qna_state }]</span></td>
												<td class="tL">
													<a href="#" onclick="return false;">${dto.qna_subject }</a>
												</td>
												<td>${dto.join_id }</td>
												<td>${dto.qna_created }</td>
												
											</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table><br/><br/>
							
							<!-- 최신 환불 요청내역 -->
							<div class="mypage-cblock">
								<div class="mypage-subtit"><h4>환불 요청내역</h4></div>
								<div class="mypage-orderinfo-wrap"></div>
							</div>

								<table class="tableCom mgT10">
									<colgroup>
										<col width="90">
										<col width="90">
										<col width="90">
										<col width="*">
										<col width="115">
									</colgroup>
									<thead>
										<tr>
											<th>요청일</th>
											<th>ID</th>
											<th>주문번호</th>
											<th>제품명</th>
											<th>구매가</th>
										</tr>
									</thead>

									<tbody>

										<c:if test="${refundDataCount==0 }">						
											<tr>
												<td colspan="5">
					                                <div class="empty-msg">환풀 신청 내역이 없습니다.</div>
												</td>
											</tr>										
										</c:if>

										<c:if test="${refundDataCount!=0 }">
											<c:forEach var="dto" items="${refundLists }">
											<tr>
												<td>${dto.refund_created }</td>
												<td>[${dto.join_id }]</td>
												<td>${dto.orderList_id }</td>
												<td class="tL">
													${dto.refund_subject }
												</td>
												<td>${dto.orderList_resultPrice }</td>
											</tr>
											</c:forEach>
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
</body>
</html>