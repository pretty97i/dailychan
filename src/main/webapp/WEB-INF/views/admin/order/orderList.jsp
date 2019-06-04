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
		
	function changeStep(orderList_id) {
		
		var orderList_step = $("#orderList_step" + orderList_id + " option:selected").val();
		var url = "<%=cp%>/admin/changeStep.action";
		
		if(orderList_step==""){
			alert("배송관리를 선택해 주세요!");
			return false;
		}

		$.post(url,{orderList_id:orderList_id,orderList_step:orderList_step},function(args){
			
			alert("배송 변경 완료!");
			location.reload(true);
			
		});
		
	}

</script>

</head>

<body>
<form action="" method="post">
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
								
									<li class="on">
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

							<div class="mypage-cblock">

								<div class="mypage-subtit">
									<h4>주문 관리내역</h4>
								</div>

								<div class="mypage-table mypage-goods-list row">
								<table class="tableCom mgT10">
									<colgroup>
										<col width="90">
										<col width="90">
										<col width="*">
										<col width="90">
										<col width="115">
										<col width="115">
										<col width="90">
									</colgroup>
									<thead>
										<tr>
											<th>주문번호</th>
											<th>배송상태</th>
											<th>구매정보</th>
											<th>구매자</th>
											<th>구매날짜</th>
											<th>배송관리</th>
											<th>비고</th>
										</tr>
									</thead>

									<tbody id="productAnswer">
										<c:if test="${orderDataCount==0 }">
						
											<tr>
												<td colspan="7">
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
												<td>
													<select id="orderList_step${dto.orderList_id }">
														<option value="">주문관리</option>
														<option value="1">주문접수</option>
														<option value="2">결제완료</option>
														<option value="3">상품준비중</option>
														<option value="4">배송중</option>
														<option value="5">배송완료</option>
														<option value="6">주문완료</option>
													</select>
												</td>
												<td>
													<a href="#" class="btn green" onclick="changeStep('${dto.orderList_id}'); return false;">변경</a>
												</td>
											</tr>
											</c:forEach>
											
										</c:if>

									</tbody>
								</table>
								</div>

								<div class="paging-wrap">
									<c:if test="${orderDataCount!=0 }">
										${orderPageIndexList }
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
</form>
</body>
</html>