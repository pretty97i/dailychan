<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int su = 1;
	int su2 = 1;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <title>데일리찬::믿을 수 있는 먹거리</title>
    
<jsp:include page="/WEB-INF/views/top.jsp"/>
<jsp:include page="/WEB-INF/views/right.jsp"/>

<meta property="og:image" content="/dailychan/resources/images/etc/oasis_kakao.jpg"/>
<meta name="naver-site-verification" content="3899c51fb285431259219d5399363f4ef440e1b6"/>

<link rel="shortcut icon" href="/favicon.ico">
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72.png" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-50@2x.png" sizes="96x96" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72@2x.png" sizes="144x144" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-60@3x.png" sizes="192x192" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css?dummy=5.99" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
//<![CDATA[
var contextPath = "";
var imgUrl = "http://www.oasis.co.kr:8580";
(function($) {
	$.ajaxSetup({
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
		},
		error: function(xhr, status, err) {
			if (xhr.status == 403) {
				location.href = contextPath + "/login?redirect=true";
			}
			else {
				console.log("error: " + xhr.status);
			}
		}
	});
	
	$(document).ajaxStart(function() {
		$("#isolationField").show();
		
	}).ajaxStop(function() {
		$("#isolationField").hide();
	});
})(jQuery);
//]]>
</script>

<!-- 현우 -->

<script type="text/javascript">

window.onload = function () {
	
	var totalResultPrice = Number("${totalResultPrice}");
	var regexp = /\B(?=(\d{3})+(?!\d))/g;

	$("#sumSummary").html(totalResultPrice.toString().replace(regexp, ','));
	
}

function pointUse() {

	var couponPrice = Number($("#couponId option:selected").val());
	var totalPrice = "${totalResultPrice}";
	var join_point = Number("${join_point}");
	var usePoint = Number($("#usePoint").val());
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	
	totalPrice = totalPrice - couponPrice;

	if(join_point<totalPrice){
		
		if(join_point<usePoint){
			
			alert(join_point + "포인트 이하만 사용가능합니다.");
			return;
			
		}else{

			join_point = join_point - usePoint;
			totalPrice = totalPrice - usePoint;
			
			$("#usePointPrice").html(usePoint.toString().replace(regexp, ','));
			$("#sumSummary").html(totalPrice.toString().replace(regexp, ','));
			$("#point").html(join_point.toString().replace(regexp, ','));
			$("#calculator").val(totalPrice);
			
		}
		
		
	}else{
		
		if(totalPrice<usePoint){
			
			alert(totalPrice + "포인트 이하만 사용가능합니다.");
			return;
			
		}else{
			
			join_point = join_point - usePoint;
			totalPrice = totalPrice - usePoint;
			
			$("#usePointPrice").html(usePoint.toString().replace(regexp, ','));
			$("#sumSummary").html(totalPrice.toString().replace(regexp, ','));
			$("#point").html(join_point.toString().replace(regexp, ','));
			$("#calculator").val(totalPrice);
			
		}
		
	}
	
}

function allUsePoint() {
	
	var couponPrice = Number($("#couponId option:selected").val());
	var totalPrice = Number("${totalResultPrice}");
	var join_point = Number("${join_point}");
	var usePoint = 0;
	var price = totalPrice - couponPrice;
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	
	if(join_point>totalPrice){
		
		if($("input:checkbox[id='useAllPoint']").is(":checked") == true){
		
			totalPrice = totalPrice - couponPrice;
			usePoint = totalPrice;
			join_point = join_point - totalPrice;
			price = totalPrice - usePoint;
			
			$("#usePointPrice").html(usePoint.toString().replace(regexp, ','));
			$("#sumSummary").html(price.toString().replace(regexp, ','));
			$("#point").html(join_point.toString().replace(regexp, ','));
			$("#calculator").val(price);
			$("#usePoint").val(usePoint);
		
		}else{
			
			$("#usePointPrice").html(usePoint.toString().replace(regexp, ','));
			$("#sumSummary").html(price.toString().replace(regexp, ','));
			$("#point").html(join_point.toString().replace(regexp, ','));
			$("#calculator").val(price);
			$("#usePoint").val(usePoint);
			
		}
		
	}else{
		
		if($("input:checkbox[id='useAllPoint']").is(":checked") == true){
			
			totalPrice = totalPrice - couponPrice;
			usePoint = join_point;
			totalPrice = totalPrice - usePoint;
			join_point = join_point - usePoint;
			
			$("#usePointPrice").html(usePoint.toString().replace(regexp, ','));
			$("#sumSummary").html(totalPrice.toString().replace(regexp, ','));
			$("#point").html(join_point.toString().replace(regexp, ','));
			$("#calculator").val(totalPrice);
			$("#usePoint").val(usePoint);
			
		}else{
			
			$("#usePointPrice").html(usePoint.toString().replace(regexp, ','));
			$("#sumSummary").html(price.toString().replace(regexp, ','));
			$("#point").html(join_point.toString().replace(regexp, ','));
			$("#calculator").val(price);
			$("#usePoint").val(usePoint);
			
		}
		
	}
	
}

function useCoupon() {
	
	var usePoint = Number($("#usePoint").val());
	var totalPrice = "${totalResultPrice}";
	var couponPrice = Number($("#couponId option:selected").val());
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	
	totalPrice = totalPrice - usePoint;

	if(couponPrice>totalPrice){
		
		alert("최종 결제금액보다 큰 금액의 쿠폰은 사용 할 수 없습니다.");
		$("#couponId").find("option:eq(0)").prop("selected", true);
		return;
		
	}else{
	
		totalPrice = totalPrice - couponPrice;

		$("#useCouponPrice").html(couponPrice.toString().replace(regexp, ','));
		$("#sumSummary").html(totalPrice.toString().replace(regexp, ','));
		$("#calculator").val(totalPrice);
		
	}

}

</script>
</head>

<body>
<form method="post" class="uk-width-small-1-1 uk-width-medium-1-1" name="IMP">
<div class="allWrap">
    <!-- header -->
    
    <!-- // header -->
    
    <!-- 컨텐츠 -->
    <div class="contentsArea" id="sec_order_pay">
        <div class="contentsWrap">
            <!-- 오른쪽 영역 -->
            <div class="content">
                <!-- 내용 입니다 -->
                <div class="orderStepWrap">
                    <!-- 주문단계 -->
                    <div class="orderStepImg">
                        <img src="/dailychan/resources/images/order/order_ico_step3.png" alt="주문단계 - 3. 주문결제" />
                    </div>
                    <div style="background-color:#f5f5f5; height:36px; color:#6ca437; font-size:16px; font-weight:bold;text-align:center; padding-top:22px">
                        상품 주문은 배송비를 제외한 실 결제금액 10,000원 이상부터 가능합니다.
                    </div>
                    <!--// 주문단계 -->
                    <!-- 안내문구  -->
                    <div style="padding-top:58px"> 
                        <ul style="padding-bottom:30px;">
	                        <li style="font-size:20px; font-weight:bold; float:left; color:#333">주문 상품 <span style="color:#6ca437">${dataCount} </span>건</li>
	                        <li style="float:right">새벽배송이나 매장배송으로 산지직송 상품을 주문하시는경우 산지에서 별도로 직송합니다.</li>
                        </ul>
                    </div>
                    <div style="clear:both"></div>
                    <!--// 안내문구  --> 
                    <!-- 주문상품 -->
                        
                            <div style="border: 1px solid #ddd; padding:20px">
                            <div class="orderTbl">
                                <div style="border-top:2px solid #6ca437"></div>
	                            <table class="corp_products" id="corp_products">
	                                <colgroup>
	                                    <col width="40px" />
	                                    <col width="" />
	                                    <col width="105px" />
	                                    <col width="135px" />
	                                    <col width="95px" />
	                                    <col width="109px" />
	                                    <col width="100px" />
	                                </colgroup>
	                                <thead>
	                                    <tr>
		                                    <th scope="col">No.</th>
		                                    <th scope="col">상품정보</th>
		                                    <th scope="col">판매가</th>
		                                    <th scope="col">할인금액</th>
		                                    <th scope="col">수량</th>
		                                    <th scope="col">구매가</th>
	                                        <th scope="col">배송정보</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                
	                                	<c:if test="${division==1 }">
	                                	<tr class="order_product" data-cartid="3654388">
	                                            <td class="odTd1">1</td>
	                                            <th scope="row" class="odTh" style="height:70px;">
	                                                <span class="odThImg">
	                                                    <img src="/dailychan/resources/images/product/${vo.product_mainSaveFileName}" alt="상품 섬네일" style="max-width:70px;max-height:70px"/>
	                                                </span>
	                                                ${vo.product_subject }
	                                                
	                                            </th> 
	                                            <td class="odTd1"><fmt:formatNumber value="${vo.product_price }" pattern="#,###" /></td>
	                                            <td class="odTd2">
	                                            
	                                             

	                                                        <fmt:formatNumber value="${vo.product_resultPrice }" pattern="#,###" />
	                                                       
	                                                        <p><em>[${vo.product_discount }%]</em></p>
	                                                    
	                                                 
	                                            </td>
	                                            <td class="odTd1">${vo.cart_quantity }</td>
	                                            <td class="odTd4"><fmt:formatNumber value="${totalResultPrice }" pattern="#,###" /></td>
	                                            <td class="odTd5" style="border-right:none" rowspan="${dataCount }">
	                                                <p class="fnB" id="wrcDeliveryPrice">
	                                                <c:if test="${totalResultPrice>=50000 }">
	                                                    0
	                                                </c:if>
	                                                
	                                                <c:if test="${totalResultPrice<50000 }">
	                                                    3,000
	                                                </c:if>
	                                                </p>
	                                            </td>
	                                            
	                                        </tr>
	                                		</c:if>
	                                    
	                                    <c:if test="${division==2 }">
	                                    <c:forEach var="dto" items="${lists }">
	                                        <tr class="order_product" data-cartid="3654388">
	                                            <td class="odTd1"><%=su2 %></td>
	                                            <th scope="row" class="odTh" style="height:70px;">
	                                                <span class="odThImg">
	                                                    <img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품 섬네일" style="max-width:70px;max-height:70px"/>
	                                                </span>
	                                                ${dto.product_subject }
	                                                
	                                            </th>
	                                            <td class="odTd1"><fmt:formatNumber value="${dto.product_price }" pattern="#,###" /></td>
	                                            <td class="odTd2">
	                                                
	                                                    
	                                                    
	                                                        <fmt:formatNumber value="${dto.product_resultPrice }" pattern="#,###" />
	                                                        <p><em>[${dto.product_discount }%]</em> 하루 ${dto.product_saleLimit }개까지</p>
	                                                    
	                                                
	                                            </td>
	                                            <td class="odTd1">${dto.cart_quantity }</td>
	                                            <td class="odTd4"><fmt:formatNumber value="${dto.product_totalPrice }" pattern="#,###" /></td>
	                                            <% if(su==1){ %>
	                                            <td class="odTd5" style="border-right:none" rowspan="${dataCount }">
	                                                <p class="fnB" id="wrcDeliveryPrice">
	                                                <c:if test="${totalResultPrice>=50000 }">
	                                                    0
	                                                </c:if>
	                                                
	                                                <c:if test="${totalResultPrice<50000 }">
	                                                    3,000
	                                                </c:if>
	                                                </p>
	                                            </td>
	                                            <%} su++; su2++; %>
	                                        </tr>
     
	                                   </c:forEach>
	                                   </c:if>
	                                </tbody>
	                            </table>
                            </div>
                        <ul class="orderTotalBox">

	                        <li class="orderTotal_l" style="padding-left:10px">총 주문금액<span class="valp groupTotalPrice" style="font-weight:bold; padding-left:10px"><fmt:formatNumber value="${totalResultPrice }" pattern="#,###" /></span><span>원</span></li>
	                        <li class="orderTotal_e" style="padding-left:10px">총 배송비<span class="valp deliveryPrice" style="padding-left:10px">${deliveryPay }</span><span>원</span></li>
	                        <li class="orderTotal_p" style="padding-left:10px">총 할인금액<span class="valp discount" style="padding-left:10px"><fmt:formatNumber value="${discountPrice }" pattern="#,###" /></span><span>원</span></li>
	                        <li class="orderTotal_m" style="padding-left:10px">총 상품금액<span class="valp groupPrice" style="padding-left:10px"><fmt:formatNumber value="${totalPrice }" pattern="#,###" /></span><span>원</span></li>

	                        
                        </ul>
                        <div class="clear"></div>
                        </div>

                <!-- 포인트/혜택사용하기 -->
                <h4 class="orderTit2" style="padding-top:50px">결제수단</h4>
                <div style="border:solid 1px #ddd; width:1026px;  background-color:#f5f5f5">
                    <div style="background-color:#fff">
                        <div class="orderTbl2" style=" width: 685px; float: left; height:auto;background:#fff">
                            <div style="border-bottom:2px solid #6ca437; font-size:16px; font-weight:bold; color:#333; padding:10px 0">포인트/혜택사용하기</div>
                            <table>
                                <colgroup>
                                    <col width="140px" />
                                    <col width="" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><span class="checkBg">포인트 사용</span></th>
                                        <td>
                                            <input type="hidden" id="usagePoint" value="0"/>
                                            <input type="text" id="usePoint" name="usePoint" onchange="pointUse();" maxlength="10" value="0" class="inputWd140 floatL" />
                                            <span class="pointTxt floatL" style="padding:5px"><img src="/dailychan/resources/images/order/orderIcon8.png" alt="포인트"/></span>
                                            <span class="checks floatL" style="top:5px">
                                                <input type="checkbox" id="useAllPoint" onclick="allUsePoint();" /><label for="useAllPoint"></label>
                                            </span>
                                            <label for="useAllPoint">
                                                <p class="pointTxt2 floatL" style="padding-top:5px; padding-left:8px; cursor:pointer">보유포인트 <em>(<span id="point"><fmt:formatNumber value="${join_point }" pattern="#,###" /></span>P)</em></p>
                                            </label>
                                            <div class="clear" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><span class="checkBg">쿠폰 사용</span></th>
                                        <td>
                                            <input type="hidden" id="usageCoupon" value="0"/>
                                            <select id="couponId" onchange="useCoupon();" style="height:30px; width:250px">
                                                <option value="">사용안함</option>
                                                
                                                	<c:forEach var="dto" items="${coupon }">
                                                    <option value="${dto.coupon_price }" id="${dto.coupon_id }"><fmt:formatNumber value="${dto.coupon_price }" pattern="#,###" />원 쿠폰</option>
                                                	</c:forEach>
                                                	
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            <!-- 현우2 -->
                            <script type="text/javascript">
                            
                            $("#couponId").change(function() {
                            	
                            	  var id = $(this).children(":selected").attr("id");
                            	  
                            	  $("#coupon_id").val(id);
                            	  
                            });
                            
                            
                            </script>
                            
                            <div style="height:40px"></div>
                            <div style="border-bottom:2px solid #6ca437; font-size:16px; font-weight:bold; color:#333; padding-bottom:10px">결제방법</div>
                            <!-- 결제수단 -->
                            <div class="optWrap" >
                                <div style="padding-bottom: 10px;">
                                    <table>
                                        <colgroup>
                                            <col width="110px" />
                                            <col width="" />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="payment">
                                                        <span class="radios">
                                                            <input type="radio" id="usablePay2" name="orderList_payment" value="creditCard" onClick="descPaymentType('SC0010');" checked="checked"/>
                                                            <label for="usablePay2" />
                                                        </span>
                                                        <label for="usablePay2" >
                                                            <p style="cursor:pointer">신용카드</p>
                                                        </label>
                                                        <span class="radios">
                                                            <input type="radio" id="usablePay3" name="orderList_payment" value="wire" onClick="descPaymentType('SC0040');" />
                                                            <label for="usablePay3" />
                                                        </span>
                                                        <label for="usablePay3" >
                                                            <p style="cursor:pointer">무통장 입금 (가상계좌)</p>
                                                        </label>
                                                        <span class="radios">
                                                            <input type="radio" id="usablePay4" name="orderList_payment" value="phonePay" onClick="descPaymentType('SC0060');" />
                                                            <label for="usablePay4" />
                                                        </span>
                                                        <label for="usablePay4" >
                                                            <p style="cursor:pointer">휴대폰결제</p>
                                                        </label>
                                                        <span class="radios">
                                                            <input type="radio" id="usablePay1" name="orderList_payment" value="kakaoPay" onClick="descPaymentType('KAKAO');"  />
                                                            <label for="usablePay1" />
                                                        </span>
                                                        <label for="usablePay1">
                                                            <p style="cursor:pointer;">kakaoPay</p>
                                                        </label>
                                                        
                                                    </div>  
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <ul class="paymentTxt" id="descKAKAO" style="display: none;">
                                    <li>가장 빠른 모바일결제 <img src="/dailychan/resources/images/shop/mark_bg_white_s.png" alt="카카오페이" />
                                        <ul>
                                            <li>카카오페이 결제 시 화면 아래 '결제하기' 버튼을 클릭하시면 카카오페이 인증 창이 나타납니다.</li>
                                            <li>카카오페이 인증 창에서 정보를 입력하신 후 결제해주세요.</li>
                                        </ul>
                                    </li>
                                </ul>
                                
                                <ul class="paymentTxt" id="descSMILE" style="display: none;">
                                    <li>가장 빠른 모바일결제 <img src="/images/shop/mark_bg_white_s.png" alt="스마일페이" />
                                        <ul>
                                            <li>스마일페이 결제 시 화면 아래 '결제하기' 버튼을 클릭하시면 스마일페이 인증 창이 나타납니다.</li>
                                            <li>스마일페이 인증 창에서 정보를 입력하신 후 결제해주세요.</li>
                                            <li>Internet Explorer사용시 SmilePay URL( www.mysmilepay.com )을 신뢰할 수 있는 사이트로 등록하거나 브라우저 보안등급을 "낮음"으로 설정하셔야 합니다.</li>
                                        </ul>
                                    </li>
                                </ul>
                                
                                <ul class="paymentTxt" id="descSC0010">
                                    <li>신용카드 결제 시 화면 아래 ‘결제하기’버튼을 클릭하시면 신용카드 결제 창이 나타납니다.</li>
                                    <li>신용카드 결제 창을 통해 입력되는 고객님의 카드 정보는 128bit로 안전하게 암호화되어 전송되며, 승인 처리 후 카드 정보는 승인 성공/실퍠 여부에 상관없이 자동으로 폐기되므로 안전합니다.</li>
                                    <li>신용카드 결제 신청 시 승인 진행에 다소 시간이 소요될 수 있으므로 ‘중지’, ‘새로고침’을 누르지 마시고 결과 화면이 나타날 때까지 기다려 주십시오.</li>
                                </ul>
                                
                                <ul class="paymentTxt" id="descSC0060" style="display: none;">
                                    <li>오아시스에서 휴대폰으로 결제 가능한 최대 금액은 월 30만원이나, 개인별 한도금액은 통신사 및 개인 설정에 따라 <br />다를 수 있습니다.</li>
                                    <li>휴대폰으로 결제하신 금액은 익월 휴대폰 요금에 함께 청구되며 별도의 수수료는 부과되지 않습니다.</li>
                                    <li>휴대폰 소액결제로 구매하실 경우 현금영수증이 발급되지 않습니다.
                                        <ul>
                                            <li>미납/체납중인 휴대폰 요금이 있을 경우</li>
                                            <li>이동통신사 가입기간(번호이동포함) 6개월 이하인 경우</li>
                                            <li>외국인, 미성년자 요금제, 법인휴대폰, 선불요금제인 경우</li>
                                            <li>LGT 이용자 중 통신사로 [자동결제] 차단 신청하신 경우</li>
                                        </ul>
                                    </li>
                                    <li>휴대폰 소액결제로 결제하신 상품을 취소할 경우 결제하신 당월 말까지 가능합니다.</li>
                                    <li>휴대폰결제관련 문의사항은 LG유플러스전자결제 고객센터 1544-7772 또는 오아시스 고객센터 1577-0098으로 <br />연락주시기 바랍니다.</li>
                                </ul>
                                <!--// 결제수단 -->
                            </div>
                
                            </div>
                            <!-- 미 출고시 조치방법 -->
                            <div class="orderTbl2" style="width: 260px; float: left; height:auto; border:none">
                            <div style="border-bottom:2px solid #8b8b8b; font-size:16px; font-weight:bold; color:#333; padding:10px 0">미출고시 조치방법</div>
                                <table>
                                    <colgroup>
                                        <col width="110px" />
                                        <col width="" />
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                             <td style="padding-left:0; border-bottom:none">
                                                <div class="payment unreleasedWrap">
                                                    <span class="radios">
                                                        <input type="radio" id="unreleasedPoint" name="unreleased" value="unreleasedPoint" checked="checked"/>
                                                        <label for="unreleasedPoint" />
                                                    </span>
                                                    <label for="unreleasedPoint" >
                                                        <p style="cursor:pointer">포인트 환불</br> (미출고 상품가의 5% 추가 보상 지급)</p>
                                                    </label>
                                                    <div class="clear"></div>
                                                    <span class="radios">
                                                        <input type="radio" id="unreleasedPayment" name="unreleased" value="unreleasedPayment"/>
                                                        <label for="unreleasedPayment" />
                                                    </span>
                                                    <label for="unreleasedPayment" >
                                                        <p style="cursor:pointer">결제수단으로 환불</p>
                                                    </label>
                                                    <div class="clear"></div>
                                                    <span class="radios">
                                                        <input type="radio" id="changeProduct" name="unreleased" value="changeProduct"/>
                                                        <label for="changeProduct" />
                                                    </span>
                                                    <label for="changeProduct" >
                                                        <p style="cursor:pointer">대체상품으로 교환</br> (대체상품이 없을경우, 포인트로 환불해드립니다)</p>
                                                    </label>
                                                    <div class="clear"></div>
                                                    <span class="radios">
                                                        <input type="radio" id="deliveryNextDay" name="unreleased" value="deliveryNextDay"/>
                                                        <label for="deliveryNextDay" />
                                                    </span>
                                                    <label for="deliveryNextDay" >
                                                        <p style="cursor:pointer">다음날 결품없이 전품목 함께 받기</p>
                                                    </label> 
                                                    <div class="clear"></div>
                                                </div>  
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            </div>                  
                            <!--// 미 출고시 조치방법 -->
                            <div style="clear:both"></div>
                        </div>
                       
                        <!--// 포인트/혜택사용하기 -->
                                </div>
                    <div class="clear" />


                     <!-- 포인트/혜택사용하기 -->
                        <h4 class="orderTit2" style="padding-top:50px">주문서 동의</h4>
                    <div style="border:solid 1px #ddd; width:1026px">
                        <div style="background-color:#fff">
                            <div class="orderTbl2" style=" width: 685px; float: left; height:auto;background:#fff">
                            <div style="border-bottom:2px solid #6ca437; font-size:16px; font-weight:bold; color:#333; padding:10px 0">주문서 동의</div>
                                <table>
                                    <colgroup>
                                        <col width="" />
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <td>
                                              <div class="checkWrap">
                            <span class="checks"><input type="checkbox" id="agreement" /><label for="agreement" /></span>
                            <label for="agreement" >
                                <span class="checkTxt2" style="cursor:pointer">주문서 동의</span>
                            </label>
                                주문할 상품의 상품명,가격,배송정보를 확인하였으며, 구매에 동의합니다.</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(전자상거래법 제8조 제2항)</p>

                        </div>
                                            </td>
                                        </tr>
                                    
                                    </tbody>
                                </table>
                        <div style="height:40px"></div>
                            <div style="border-bottom:2px solid #6ca437; font-size:16px; font-weight:bold; color:#333; padding-bottom:10px">꼭 확인하세요.</div>
    <!-- 결제수단 -->
                            <div>
                                <div style="padding-top:20px">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <ul class="paymentTxt" style="display:inline-block; margin-bottom:30px">
                            <li style="font-size:14px; color:red; margin-bottom:10px">신규 회원 가입선물은 첫 구매 3만원 이상 결제시 드립니다.</li>
                            <li style="font-size:14px; margin-bottom:10px">구매 후 품절로 인하여 카드 취소/환불/입금등이 필요한 경우, 고객님의 불편을 최소화 하기 위해 결제금액의 5%를 포인트로 보상해 드리고 있습니다. (품절로 인한 포인트 환불 시 5%추가 보상지급)<br/>
                        적립 추가 5%+환불금액은 마이페이지에서 확인가능합니다.</li>
                            <li style="font-size:14px; margin-bottom:10px">포인트 보상 대신 결제 부분 취소를 원하시는 경우 1:1 고객센터에 메모 남겨주시면 24시간 이내에 취소하여 드리겠습니다. (핸드폰 결제 또는 안심결제시는 제외)</li>
                        </ul>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                
                            
                            </div>
                
                            </div>
                            <!-- 최종결제금액 -->
                            <div style="width: 260px; float: left; height:auto;  padding:20px">
                            <div style="border-bottom:2px solid #8b8b8b; font-size:16px; font-weight:bold; color:#333; padding:10px 0">최종 결제금액</div>
                        <div class="orderTbl3">
                            <table>
                                <colgroup>
                                    <col width="140px" />
                                    <col width="" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                    
                                        <th scope="row">총 상품금액</th>
                                        <td><fmt:formatNumber value="${resultPrice }" pattern="#,###" /><span>원</span></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">포인트 사용금액</th>
                                        <td><span id="usePointPrice" class="valp usagePoint">0</span><span>원</span></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">쿠폰 적용금액</th>
                                        <td><span id="useCouponPrice" class="valp usageCoupon">0</span><span>원</span></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">총 배송비</th>
                                        <td><fmt:formatNumber value="${deliveryPay }" pattern="#,###" /><span>원</span></td>
                                    </tr>
                                      <tr>
                                     <td colspan="2" style=" border-bottom:1px solid #ddd">
                                        </td>
                                    </tr>
                                    <tr>
                                     <th scope="row" style="color:#e53433">최종 결제금액</th>
                                        <td>
                                            </td>
                                    </tr>
                                    <fmt:formatNumber value="${deliveryPay }" pattern="#,###" var="num" />
                                      <tr>
                                        <td colspan="2">
                                            <b class="paymentPrice" id="sumSummary"></b>
                                            <span>원</span>
                                            <input type="hidden" name="orderList_resultPrice" value="${totalResultPrice }" id="calculator"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                            </div>                          </div>                  
                            <!--// 최종결제금액 -->

    
                            <div style="clear:both"></div>
                                    
                        </div>
                        
                        <input type="hidden" name="orderList_naturePackage" value="${dto.orderList_naturePackage }"/>
                        <input type="hidden" name="orderList_recyclePackage" value="${dto.orderList_recyclePackage }"/>
                        <input type="hidden" name="orderList_message" value="${dto.orderList_message }"/>
                        <input type="hidden" name="orderList_reciveName" value="${dto.orderList_reciveName }"/>
                        <input type="hidden" name="orderList_recivePhone" value="${dto.orderList_recivePhone }"/>
                        <input type="hidden" name="orderList_reciveAddrNum" value="${dto.orderList_reciveAddrNum }"/>
                        <input type="hidden" name="orderList_reciveAddr1" value="${dto.orderList_reciveAddr1 }"/>
                        <input type="hidden" name="orderList_reciveAddr2" value="${dto.orderList_reciveAddr2 }"/>
                        <input type="hidden" name="orderList_retrieve" value="${dto.orderList_retrieve }"/>
                        <input type="hidden" name="orderList_sendName" value="${dto.orderList_sendName }"/>
                        <input type="hidden" name="orderList_sendPhone" value="${dto.orderList_sendPhone }"/>
                        <input type="hidden" name="orderList_store" value="${dto.orderList_store }"/>
                        <input type="hidden" name="orderList_delivery" value="${dto.orderList_delivery }"/>
                        <input type="hidden" name="selectedCartIds" value="${selectedCartIds }"/>
						<input type="hidden" name="coupon_id" id="coupon_id" value="0"/>
						<input type="hidden" name="orderList_productCount" value="${dataCount }"/>
						<c:if test="${vo.cart_id ne null }"><input type="hidden" name="nowBuyCart_id" value="${vo.cart_id }"/></c:if>
                               
    <div class="orderBtnWrap_green" style="padding-top:20px">	
		<button type="button" name="paymentButton" id="check_module"
			class="orderBtngreen">결제하기</button>
	</div>
    <script type="text/javascript">
    $("#check_module").click(function () {
    	
    	if($("input:checkbox[id='agreement']").is(":checked") == false){
    	
    		alert("주문서 동의가 필요합니다.");
    		return;
    		
    	}
    	
    	var price = $("#calculator").val();
    	var payment = $("input[type=radio][name=orderList_payment]:checked").val();

    	if(payment=='wire'){
    		
    		document.IMP.action = "/dailychan/order/complete.action";
    		document.IMP.submit();
    		
    	}
    	
    
    /* 	var change = $("#kakao").val();
    	
    	if(change=='kakaoPay'){
    		
    		change = "\'kakao\'"; 
    		alert("첫번째:"+ change);
    		return;
    		
    	}else{
    		
    		change = "\'inicis\'";
    		alert("두번째:"+ change);
    	}    	
    	 */
		
    	//====================실제 결제 적용 시 price==0으로 수정할 것!!!!!!!!!!!!!!!!!!!!!!!!!
    	
    	
    	
    	if(price==0){
    	
    		
    		document.IMP.action = "/dailychan/order/complete.action";
    		document.IMP.submit();
    		
    	}
    	
        var IMP = window.IMP; // 생략가능
        IMP.init('iamport'); 
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: 'inicis', // version 1.1.0부터 지원.
            /* 
                'kakao':카카오페이, 
                html5_inicis':이니시스(웹표준결제)
                    'nice':나이스페이
                    'jtnet':제이티넷
                    'uplus':LG유플러스
                    'danal':다날
                    'payco':페이코
                    'syrup':시럽페이
                    'paypal':페이팔
                */
            pay_method: 'card',
            /* 
                'samsung':삼성페이, 
                'card:신용카드, 
                'trans':실시간계좌이체,
                'vbank':가상계좌,
                'phone':휴대폰소액결제 
            */
            merchant_uid: 'merchant_' + new Date().getTime(),
            /* 
                merchant_uid에 경우 
                https://docs.iamport.kr/implementation/payment
                위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
                참고하세요. 
                나중에 포스팅 해볼게요.
             */
            name: '123',
            //결제창에서 보여질 이름
            amount: '100', 
            //가격 
            buyer_email: '',
            buyer_name: '${dto.orderList_sendName }',
            buyer_tel: '${dto.orderList_sendPhone }',
            buyer_addr: '${dto.orderList_reciveAddr1 } + ${dto.orderList_reciveAddr2 }',
            buyer_postcode: '${dto.orderList_reciveAddrNum }',
            m_redirect_url: 'http://192.168.16.9:8080/dailychan/order/payComplete.action'
            /*  
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정 
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
                */
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                
                alert(msg);
			    return;
                
            }
            
            alert(msg);
            
            document.IMP.action = "/dailychan/order/complete.action";
    		document.IMP.submit();
            
        });
    });
</script>

                       
                        <!--// 포인트/혜택사용하기 -->
                    <!--// 최종결제 금액 확인 -->
                  
                </div>
                <!-- //내용 입니다 -->
            </div>
            <!-- //오른쪽 영역 -->
        </div>

    </div>


</form>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
 