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
	
	<script type="text/javascript">

		
		function removeProductQna(productQuestion_id) {
			if(confirm("삭제 하시겠습니까?")) {
				//removeProductQna
				
				$.ajax({
					url : "removeProductQna.action",
					type : "POST",
					data : {productQuestion_id:productQuestion_id},
					async : false,
					success : function(response) {
							alert(response);
							window.location.reload(true);
					}
				});
			}
		}
		
		function showAnswer(answer_id) {
			
			$("#" + answer_id).toggle();
			
		}
	</script>
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
								
									<li>
										<a href="/dailychan/myPage/commentList.action">구매후기</a>
										
										
									</li>
								
									<li class="on">
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
									<h4>상품문의내역</h4>
								</div>
								<div class="mypage-order-info auto">
									<div class="row">
										<ul class="dash">
											<li>가격, 판매자, 교환/환불 및 배송 등에 해당 상품 자체와 관련없는 문의는 고객센터 내 1:1 문의하기를 이용하세요.</li>
											<li>"해당 상품 자체" 와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고없이 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</li>
											<li>고객센터 답변가능시간 : 오전 9시 30분 ~ 오후 6시 30분(토/일/공휴일 제외)</li>
										</ul>
									</div>
								</div>
								<div class="mypage-table mypage-toggle-list mypage-qna-table">
									<table>
										<colgroup>
											<col style="width:110px;">
											<col style="width:90px;">
											<col>
											<col style="width:90px;">
											<col style="width:100px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">문의유형</th>
												<th scope="col">답변상태</th>
												<th scope="col">제목</th>
												<th scope="col">등록일</th>
												<th scope="col">관리</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${questionCount==0 }">
												<tr>
													<td colspan="5">
														<div class="empty-msg">상품 문의 내역이 없습니다.</div>
													</td>
												</tr>
											</c:if>
											<c:if test="${questionCount!=0 }">
												<c:forEach var="dto" items="${lists }">
													<tr>
														<th>${dto.productQuestion_type }</th>
														<th><span class="reply_end">[${dto.productQuestion_state }]</span></th>
														<th class="tL"><a href="#" onclick="return false;">
																${dto.productQuestion_content } </a></th>
														<th>${dto.productQuestion_created }</th>
														<c:if test="${dto.productQuestion_state=='미답변' }">
															<th><input type="button" value="삭제" class="btn green" onclick="removeProductQna(${dto.productQuestion_id});"/> </th>
														</c:if>
														<c:if test="${dto.productQuestion_state=='답변완료' }">
															<th><input type="button" value="확인" class="btn green" onclick="showAnswer('answer${dto.productQuestion_id }'); return false;"/> </th>
														</c:if>
													</tr>
													
													<c:if test="${dto.productQuestion_state=='답변완료' }">
														<tr class="comMore" id="answer${dto.productQuestion_id }" style="display:none;">
															<td colspan="2"><img src="/dailychan/resources/images/shop/arrow_bottom_red.gif" class="icon_photoCom" style="margin-top: 3px;" height="20px;" width="30px;" align="right"></td>
															<td colspan="3" class="tL1">${dto.productAnswer_content }
															<p class="txt_qna_end">상품담당자 답변 ${dto.productAnswer_created }</p>
															</td>
														</tr>
													</c:if>
												  
												</c:forEach>
											</c:if>
											
										</tbody>
									</table>
								</div>

								<div class="paging-wrap">
									<c:if test="${questionCount!=0 }">
										${pageIndexList }
									</c:if>
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