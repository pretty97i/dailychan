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
		
		function sendIt(){
			
			var f=document.myForm;
			var qna_id=${dto.qna_id};
			
			f.action="/dailychan/myPage/qnaArticle_ok.action?qna_id="+qna_id;
			f.submit();
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
								
									<li>
										<a href="/dailychan/myPage/productQnaList.action">상품문의내역</a>
										
										
									</li>
								
									<li class="on">
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
							<div class="mypage-subtit" style="border-bottom : solid 2px green;">
								<h4 style="height: 25px;">1:1상담</h4>
							</div>
						
								<div class="notice_view_area">

									<!-- title -->
									<!--// 주문단계 -->
									
										<div class="orderTbl2" style="border: solid 1px #ddd">
											<table style="border-top: 1px solid #ddd">
												<colgroup>
													<col width="143px" />
													<col width="" />
													<col width="143px" />
													<col width="" />
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">
															<span class=""inputWd140"">	문의분야 </span>
														</th>
														<td>${dto.qna_select }
															<input type="hidden" name="${dto.qna_id }" value="${dto.qna_id }">
														</td>
													</tr>
													<tr>
														<th scope="row">
															<span class=""inputWd140"">문의유형 </span>
														</th>
														<td>${dto.qna_type }</td>
													</tr>
													
													<c:if test="${dto.qna_type eq '매장에 직접문의' }">													
														<tr>
															<th scope="row">
																<span class="inputWd140">문의매장 </span>
															</th>
															<td>${dto.qna_store }</td>
														</tr>
													</c:if>

													<tr>
														<th scope="row">
															<span class="inputWd140"> 제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 </span>
														</th>
														<td>${dto.qna_subject }</td>
													</tr>
													<c:if test="${saveFileName ne null }">
														<tr>
															<th scope="row"><span class="inputWd140">이미지 </span></th>
															<td><img src="/dailychan/resources/images/qna/${saveFileName }" width="400" height="400"></td>
														</tr>
													</c:if>
													<tr>
														<th scope="row"><span class="inputWd140">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용 </span></th>
														<td>${dto.qna_content }</td>
													</tr>
											 
													<c:if test="${dto.qna_reply ne null }"> 
														<tr>
															<th scope="row"><span class="inputWd140"><img alt="" src="/dailychan/resources/images/shop/arrow_bottom_red.gif"  align="right"> </span></th>
															<td><b>관리자 댓글</b> <br>${dto.qna_reply }
															</td>
															
														</tr>
														
													</c:if>
									
												</tbody>
											</table>

												<div class="btn_center btn_green ">
													<a href="/dailychan/myPage/qnaList.action">목록보기</a> 
													<a href="/dailychan/myPage/qnadelete.action?qna_id=${dto.qna_id }&pageNum=${pageNum}">삭제하기</a>
												
												</div>

									 <c:if test="${join_id eq 'admin' }"> 		
											
										<form action="" name="myForm" method="post">
										
											<table>
												<colgroup>
													<col width="143px" />
													<col width="" />
													<col width="143px" />
								 					<col width="" />
												</colgroup>
												<tbody>
													
												<tr>
													<th scope="row"><span class="inputWd140">답글달기 </span></th>
													<td>
														<textarea name="qna_reply" class="inputWd380" style="border:1px solid #bbbbbb"></textarea>
														<div class="btn_blue ">
															<input type="button" onclick="sendIt();"  value="등록하기">
														</div>
													</td>
												</tr>
		
												</tbody>
											</table>
								
										</form>
										
									 </c:if> 
									</div>
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