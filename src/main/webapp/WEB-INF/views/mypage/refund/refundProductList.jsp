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
	
<jsp:include page="../../top.jsp"/>
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
	//팝업 관련 메소드
    function refundOrderSendIt(orderList_id) {
		
   	 var url = "/dailychan/myPage/refundProductData.action";
   		
   		$.post(url,{orderList_id:orderList_id},function(data){

   			$("#productQuestionData").html(data);

   		});

   	 $('.oasisDim').show();
   	 $('.oasisLayerPop4').show();
    }

    function closeProductQnaForm() {
   	 $('.oasisLayerPop4').hide();
   	 $(".oasisLayerPop").hide();
   	 $('.oasisDim').hide();
   	 
   	 $('.oasisDim').hide(50, function(){
			$('body').css("overflow-y","auto");
		 });
    }
    
    //환불 요청 작성
    function refundOrderAnswer() {  

    	 $("#imageUploadForm").ajaxForm({
             url : "/dailychan/myPage/refundProductAnswer.action",
             enctype : "multipart/form-data",
             dataType : "json",
             complete : function(){
                 alert("환불 신청 되었습니다.") ;
                 location.reload(true);
             }
         });
  
    	 $("#imageUploadForm").submit();
	 
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
										<a href="/dailychan/myPage/productQnaList.action?refundGbn=R0">상품문의내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/qnaList.action">1:1상담내역</a>
										
										
									</li>
								
									<li class="on">
										<a href="/dailychan/myPage/refundProductList.action?refundGbn=R0">환불서비스</a>
										
										
											<ul>
												<c:if test="${refundGbn=='R0' }">
													<li class="on"><a href="/dailychan/myPage/refundProductList.action?refundGbn=R0">환불가능상품</a></li>
													<li><a href="/dailychan/myPage/refundProductList.action?refundGbn=R1">환불요청상품</a></li>
													<li><a href="/dailychan/myPage/refundProductList.action?refundGbn=R2">승인/반려상품</a></li>
												</c:if>
												
												<c:if test="${refundGbn=='R1' }">
													<li><a href="/dailychan/myPage/refundProductList.action?refundGbn=R0">환불가능상품</a></li>
													<li class="on"><a href="/dailychan/myPage/refundProductList.action?refundGbn=R1">환불요청상품</a></li>
													<li><a href="/dailychan/myPage/refundProductList.action?refundGbn=R2">승인/반려상품</a></li>
												</c:if>
												
												<c:if test="${refundGbn=='R2' }">
													<li><a href="/dailychan/myPage/refundProductList.action?refundGbn=R0">환불가능상품</a></li>
													<li><a href="/dailychan/myPage/refundProductList.action?refundGbn=R1">환불요청상품</a></li>
													<li class="on"><a href="/dailychan/myPage/refundProductList.action?refundGbn=R2">승인/반려상품</a></li>
												</c:if>
											</ul>
										
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
										<c:if test="${refundGbn=='R0' }">
				                        	<h4>환불 가능 상품</h4>
											<p>상품의 배송완료 일자가 1주일 이내인 상품</p>
										</c:if>
										<c:if test="${refundGbn=='R1' }">
				                        	<h4>환불 요청 상품</h4>
										</c:if>
										<c:if test="${refundGbn=='R2' }">
				                        	<h4>환불 승인/불가 상품</h4>
										</c:if>
								</div>

								<div class="mypage-table mypage-goods-list row">
									<table>
										<colgroup>
											<col style="width:90px;">
											<col style="width:100px;">
											<col>
											<col style="width:140px;">
											<col style="width:100px;">
											<col style="width:100px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">주문번호</th>
												<th scope="col" colspan="2">상품정보</th>
												<th scope="col">주문일자</th>
												<th scope="col">구매가</th>
												<th scope="col">배송상태</th>
											</tr>
										</thead>
										<tbody>
										
											<c:if test="${dataCount==0 }">
											
												<tr>
													<td colspan="6">
						                                <div class="empty-msg">상품 내역이 없습니다.</div>
													</td>
												</tr>
											
											</c:if>
											
											<c:if test="${dataCount!=0 }">
												<c:forEach var="dto" items="${lists }">
													<tr>
														<th>${dto.orderList_id }</th>
														<th>
															<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품 섬네일" class="thum" style="width: 70px;height: 70px;vertical-align: middle;">
														</th>
														<th>${dto.product_subject } 등 ${dto.orderList_productCount } 종</th>
														<th>${dto.orderList_created }</th>
														<th>${dto.result_price }원</th>
														<th>	
															<c:if test="${dto.orderList_step==5 }">
																<a href="#" class="btn lgray" onclick="refundOrderSendIt('${dto.orderList_id}'); return false;">[환불신청]</a>
															</c:if>
															<font color="gold">
																<c:if test="${dto.orderList_step==7 }">
																	[환불신청]
																</c:if>
															</font>
															<font color="green">
																<c:if test="${dto.orderList_step==8 }">
																	[환불완료]
																</c:if>
															</font>	
															<font color="red">	
																<c:if test="${dto.orderList_step==9 }">
																	[환불반려]
																</c:if>
															</font>
														</th>
													</tr>
												</c:forEach>
												
											    <tr height="30" style="border-top: 1px #bbb;">
												    <th align="center" colspan="6">
														${pageIndexList }
												    </th>
												</tr>
												
											</c:if>
										
										</tbody>
									</table>
								</div>
							</div>

							<div class="mypage-cblock">
								<div class="mypage-subtit underline">
									<h4>상품환불안내</h4>
								</div>					
								
								<div class="mypage-order-guide">
									<div class="txt-guide-block">
										<ul class="dash">
											<li>배송완료가 된 상품에 한하여 1주일 이내 환불 요청 가능합니다.</li>
											<li>환불 요청 가능한 기간 이후에 환불을 요청 하실 경우는 고객센터로 문의 바랍니다.</li>
											<li>환불 요청 후 담당자의 검토/승인까지는 최대 하루가 소요됩니다.</li>
											<li>환불 요청 이후 보상은 포인트로 지급되며, 결제 수단으로 환불을 원하실 경우 "환불요청"하시지 마시고 고객센터로 문의 바랍니다.</li>
											<li>상품 하자의 경우 상품 상태와 사진을 첨부하여 주시면 상품 개선에 도움이 됩니다.</li>
											<li>사실과 다른 환불 요청의 경우 반려 처리 될 수 있습니다.</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--// mypage-contents-wrap -->
				</div>
				<!--// mypage-wrap -->
				
				
	<!-- 팝업창 -->
	<div class="oasisDim"></div>
	
	<div class="oasisLayerPop4" style="height:585px">
	    <div class="oasisLayerPop_in">
			<div class="oasisLPtit" >
				<strong class="comLayerTit">환불요청</strong>
				 <div style="position:absolute; width: 27px;height: 27px;top: 27px;right: 26px;">
                        <a href="#" onclick="closeProductQnaForm(); return false;" class="popOasisDeliveryClose"></a>
                    </div>
			</div>
			
			<div class="oasisLPconWrap">
			    <form id="imageUploadForm" name="imageUploadForm" method="post" enctype="multipart/form-data">
					<div class="comLayerCon">
						 <div class="oasisLPcon2" style="padding: 0 20px;">
							<table class="tableComWrite">
								<colgroup>
									<col width="100">
									<col width="*">
								</colgroup>
								<tbody id="productQuestionData">
								
								</tbody>
							</table>
			
						</div>
			
						<div style="height: 20px;">
							
						</div>
						
						<div class="oasisLPcon3">
							 <a href="#" onclick="refundOrderAnswer();">요청</a>
							 <a href="#" class="oasisMapClose2" onclick="closeProductQnaForm();">취소</a>
						</div>
					
						<input type="hidden" id="qnaType" name="qnaType" value="1">
						<input type="hidden" id="openYn" name="openYn" value="Y">
						<input type="hidden" id="productId" name="productId" value="2646">
			    	</div>
			    </form>
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