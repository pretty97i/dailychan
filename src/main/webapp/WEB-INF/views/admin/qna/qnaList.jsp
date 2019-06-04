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
		
		//팝업 관련 메소드
	     function openQnaReply(qna_id) {
			
	    	 var url = "/dailychan/admin/qnaData.action";
	    		
	    		$.post(url,{qna_id:qna_id},function(data){

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
	     
	     //답변 작성
	     function productAnswer() {

	    	var join_id = $('[name="join_id"]').val();
	    	var qna_id = $('[name="qna_id"]').val();
	    	var qna_reply = $('[name="qna_reply"]').val();
	    	
	    	if(qna_reply==""){
	    		alert("답변을 입력해주세요!");
	    		return false;
	    	}
	    	
	    	var url = "/dailychan/admin/qnaReply.action";
	    	
	    	$.post(url,{join_id:join_id,qna_id:qna_id,qna_reply:qna_reply},function(data){
	    			
	    			location.reload();

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
								
									<li class="on">
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
								<div class="mypage-subtit"><h4>1:1 상담 내역</h4></div>
								<div class="mypage-orderinfo-wrap"></div>
							</div>

								<table class="tableCom mgT10">
									<colgroup>
										<col width="90">
										<col width="90">
										<col width="*">
										<col width="90">
										<col width="115">
										<col width="70">
									</colgroup>
									<thead>
										<tr>
											<th>문의유형</th>
											<th>답변상태</th>
											<th>상품명</th>
											<th>문의자</th>
											<th>등록일</th>
											<th>답변</th>
										</tr>
									</thead>

									<tbody id="productAnswer">
										<c:if test="${qnaDataCount==0 }">
						
												<tr>
													<td colspan="6">
						                                <div class="empty-msg">상품 문의내역이 없습니다.</div>
													</td>
												</tr>
										
										</c:if>

										<c:if test="${qnaDataCount!=0 }">
											<c:forEach var="dto" items="${qnaLists }">
											<tr>
												<td>${dto.qna_type }</td>
												<td><span class="reply_end">[${dto.qna_state }]</span></td>
												<td class="tL">${dto.qna_content }</td>
												<td>${dto.join_id }</td>
												<td>${dto.qna_created }</td>
												<td><input type="button" onclick="openQnaReply('${dto.qna_id}'); return false;" class="btn green" value="답변"/></td>
												
											</tr>
											</c:forEach>
											<tr class="pagingWrap">
												<td colspan="6" align="center">
												${qnaPageIndexList}
												</td>
											</tr>
										</c:if>

									</tbody>
								</table><br/><br/>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 팝업창 -->
	<div class="oasisDim"></div>
	
	<div class="oasisLayerPop4" style="height:585px">
	    <div class="oasisLayerPop_in">
			<div class="oasisLPtit" >
				<strong class="comLayerTit">상품문의답변</strong>
				 <div style="position:absolute; width: 27px;height: 27px;top: 27px;right: 26px;">
                        <a href="#" onclick="closeProductQnaForm(); return false;" class="popOasisDeliveryClose"></a>
                    </div>
			</div>
			
			<div class="oasisLPconWrap">
			    <form id="productQnaForm" method="post">
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
							 <a href="#" onclick="productAnswer();">답변</a>
							 <a href="#" class="oasisMapClose2" onclick="closeProductQnaForm();">취소</a>
						</div>
					
						<input type="hidden" id="qnaType" name="qnaType" value="0">
						
			    	</div>
			    </form>
			</div>
		</div>
	</div>


</div>
</form>
</body>
</html>