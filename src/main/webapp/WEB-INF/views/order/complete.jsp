<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int su = 1;

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

<!-- 
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.12"></script>
 -->
 
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-PR5WGG3');</script>
<!-- End Google Tag Manager -->
    
    <script type="text/javascript">
        var LGD_window_type = null;
        var paying = false;
        var nopay = false;
        var totalResultPrice = Number("${totalResultPrice}");
        var deliveryPay = Number("${deliveryPay}");
        
        var TOTAL_PRICE = totalResultPrice + deliveryPay;
        
        $(document).ready(function() {
            
            LGD_window_type = $("#CST_WINDOW_TYPE").val();

            // 포인트 모두사용에 대한 이벤트
            $("#useAllPoint").click( function() {
                var checked = $(this).is(":checked");
                var point = $("#point").text().replace(/\,/g, "");
                var price = Number(TOTAL_PRICE) - Number($("#usageCoupon").val());
                var usePoint = 0;
                
                if(point)
                    point = Number(point);
                else 
                    point = 0;
                
                if (checked) {
                    if (point >= price) {
                        usePoint = price;
                    } else {
                        usePoint = point;
                    }
                } else {
                    usePoint = 0;
                }
                
                // 사용 포인트 변경 및 이벤트 생성
                $("#usePoint").val(usePoint).change();
            });
            
            // 사용 포인트 숫자만 입력되는 input 설정
            $("#usePoint").keyup( function() {
                var point = String($(this).val()).replace(/\..*|[^\d]/g,"");    // 숫자 이외의 문자 체크
                // 사용자가 input 직접입력하는 경우에 모두사용 체크해제
                $("#useAllPoint").attr('checked', false);
                $(this).val(point);
            });
            
            /*
            * 쿠폰 사용 이벤트
            */
            $("#couponId").change( function() {
                var couponId = $(this).val();
                var coupon = 0;
                var usageCoupon = 0;
                var price = Number(TOTAL_PRICE);
                
                if (couponId) {
                    $.ajax({
                        url : contextPath + "/order/check/coupon/" + couponId,
                        type: "GET",
                        dataType: "json",
                        success: function(data) {
                          if (data.status == 'OK') {
                            coupon = data.data;
                            if (coupon) {
                                coupon = Number(coupon);
                            }
                            
                            if (coupon > 0) {
                                if (coupon > price) {
                                    // 결제 금액을 초과하면 결제금액으로 세팅
                                    usageCoupon = price;
                                } else {
                                    usageCoupon = coupon;
                                }
                            } else {
                                usageCoupon = 0;
                            }
                            
                            updatePaymentByCoupon(usageCoupon);
                          } else {
                              $("#couponId").val("");
                              updatePaymentByCoupon(0);
                              alert(data.message);
                          }
                        }
                    });
                } else {
                    updatePaymentByCoupon(0);
                }
                
            })      
        });
                        
        /**
         * 포인트 변경에 따른 결제내역 업데이트
         */
        function updatePayment(point) {
            var price = Number(TOTAL_PRICE);
            var paymentPrice = price - point - $("#usageCoupon").val();
            
            $("#usagePoint").val(point);
            $(".usagePoint").text(comma(Number(-point)));
            $(".paymentPrice").text(comma(Number(paymentPrice)));
            // 카카오페이
            $("#Amt").val(paymentPrice);
            $("#WooriPoint").val(point);
            // xpay
            $("#LGD_AMOUNT").val(paymentPrice);
            $("#WOORI_POINT").val(point);
            
            if (paymentPrice == 0) {
                $(".optWrap").css("visibility", "hidden");
                // 최종결제금액이 0원인 경우 결제수단을 NOPAY로 세팅
                $("input[name='usablePay']").filter(function() {
                    return $(this).is(':checked');
                }).prop('checked', false);
                $("input[name='usablePay']").filter(function() {
                    return this.value == 'NOPAY'
                }).prop('checked', true);
            } else {
                $(".optWrap").css("visibility", "visible");
                // 최종결제금액이 0원이 아닌 경우 결제수단을 KAKAO로 세팅
                $("input[name='usablePay']").filter(function() {
                    return $(this).is(':checked');
                }).prop('checked', false);
                $("input[name='usablePay']").filter(function() {
                    //return this.value == 'KAKAO';
                    return this.value == 'SC0010';
                }).prop('checked', true);
                //카카오 설명 show
                descPaymentType($("input[name='usablePay']:checked").val());
            }
        }
        
        /**
         * 쿠폰 적용에 따른 결제내역 업데이트
         */
        function updatePaymentByCoupon(coupon) {
            var price = Number(TOTAL_PRICE);
            var paymentPrice = price -  $("#usagePoint").val() - coupon;
            
            $("#usageCoupon").val(coupon)
            $(".usageCoupon").text(comma(Number(-coupon)));
            $(".paymentPrice").text(comma(Number(paymentPrice)));
            // 카카오페이
            $("#Amt").val(paymentPrice);
            $("#WooriPoint").val(point);
            // xpay
            $("#LGD_AMOUNT").val(paymentPrice);
            $("#WOORI_POINT").val(point);
            
            if (paymentPrice == 0) {
                $(".optWrap").css("visibility", "hidden");
                // 최종결제금액이 0원인 경우 결제수단을 NOPAY로 세팅
                $("input[name='usablePay']").filter(function() {
                    return $(this).is(':checked');
                }).prop('checked', false);
                $("input[name='usablePay']").filter(function() {
                    return this.value == 'NOPAY'
                }).prop('checked', true);
            } else {
                $(".optWrap").css("visibility", "visible");
                // 최종결제금액이 0원이 아닌 경우 결제수단을 KAKAO로 세팅
                $("input[name='usablePay']").filter(function() {
                    return $(this).is(':checked');
                }).prop('checked', false);
                $("input[name='usablePay']").filter(function() {
                    //return this.value == 'KAKAO';
                    return this.value == 'SC0010';
                }).prop('checked', true);
                //카카오 설명 show
                descPaymentType($("input[name='usablePay']:checked").val());
            }
            
            $("#usePoint").val($("#usagePoint").val()).change();
        }
                        
        function launchCrossPlatform() {
            lgdwin = openXpay(document.getElementById("LGD_PAYINFO"),
                    "service", LGD_window_type, null, "", "");
        }
 
        function launchKakaoPay() {
            kakaopayReady();
        }
        
        function launchSmilePay() {
            smilepayReady();
        }
        
        function getFormObject() {
            return document.getElementById("LGD_PAYINFO");
        }

        // 인증결과 처리
        function payment_return(respMessage, respCode, payKey) {
            if (respCode == "0000") {
                paying = false;
                document.getElementById("LGD_PAYKEY").value = payKey;
                document.getElementById("LGD_PAYINFO").target = "_self";
                document.getElementById("LGD_PAYINFO").action = "/xpay/payres";
                document.getElementById("LGD_PAYINFO").submit();
            } else {
                alert("LGD_RESPCODE (결과코드) : " + respCode + "\n"
                        + "LGD_RESPMSG (결과메시지): " + respMessage);
                closeIframe();
            }
        }

        function descPaymentType(paymentType) {
            if (paymentType == "KAKAO") {
                $("#descKAKAO").show();
                $("#descSMILE").hide();
                $("#descSC0010").hide();
                $("#descSC0060").hide();
                $(".paymentWrap").css("min-height", "260px");
            } else if (paymentType == "SMILE") {
                $("#descKAKAO").hide();
                $("#descSMILE").show();
                $("#descSC0010").hide();
                $("#descSC0060").hide();
                $(".paymentWrap").css("min-height", "260px");
            } else if (paymentType == "SC0010") {
                $("#descKAKAO").hide();
                $("#descSMILE").hide();
                $("#descSC0010").show();
                $("#descSC0060").hide();
                $(".paymentWrap").css("min-height", "260px");
            } else if (paymentType == "SC0060") {
                $("#descKAKAO").hide();
                $("#descSMILE").hide();
                $("#descSC0010").hide();
                $("#descSC0060").show();
                $(".paymentWrap").css("min-height", "350px");
            } else {
                $("#descKAKAO").hide();
                $("#descSMILE").hide();
                $("#descSC0010").hide();
                $("#descSC0060").hide();
                $(".paymentWrap").css("min-height", "260px");
            }
        }
        
        $(window).on("beforeunload", function() {
            if (paying && !nopay) {
                return "결제를 취소하시겠습니까?";
            }
        });

        /**
         * kakaopay를 통해 결제를 시작합니다.
         */
        function kakaopay(osName) {

            // tid가 있을 경우.
            if (document.kakaoPayForm.tid.value != '') {
                paying = false;
                
                var nextUrl;

                // 결제 창
                if(osName == 'WEB')
                    nextUrl = document.kakaoPayForm.next_redirect_pc_url.value;
                else
                    nextUrl = document.kakaoPayForm.next_redirect_mobile_url.value;
                
            } else {
                alert(document.kakaoPayForm.msg.value);
            }

            $("#kakaopayLayerIframe").attr("src", nextUrl);
            popHeightControl("kakaopay_layer", "block");
        }
        
        function closeKakaopay() {
            popHeightControl("kakaopay_layer", "none");
        }
        
        
        function successKakaopay(orderId) {
            popHeightControl("kakaopay_layer", "none");
            location.href = contextPath + "/order/complete/" + orderId;
        }
        
        
        function kakaopayReady() {
            // order id 설정
            document.kakaoPayForm.elements['oid'].value = $("#LGD_OID").val();
            
            // form에 iframe 주소 세팅
            document.kakaoPayForm.target = "txnIdGetterFrame";
            document.kakaoPayForm.action = "/kakaopay/ready";
            document.kakaoPayForm.acceptCharset = "utf-8";
            if (kakaoPayForm.canHaveHTML) { // detect IE
                document.charset = kakaoPayForm.acceptCharset;
            }

            // post로 iframe 페이지 호출
            document.kakaoPayForm.submit();

            // payForm의 타겟, action을 수정한다
            document.kakaoPayForm.target = "";
            document.kakaoPayForm.action = "/kakaopay/approve";
            document.kakaoPayForm.acceptCharset = "utf-8";
            if (kakaoPayForm.canHaveHTML) { // detect IE
                document.charset = kakaoPayForm.acceptCharset;
            }

        }
        
        
        /**
         * smilepay를 통해 결제를 시작합니다.
         */
        function smilepay(osName) {

            // tid가 있을 경우.
            if (document.smilePayForm.tid.value != '') {
                paying = false;
                
                var nextUrl;

                // 결제 창
                if(osName == 'WEB')
                    nextUrl = document.smilePayForm.next_redirect_pc_url.value;
                else
                    nextUrl = document.smilePayForm.next_redirect_mobile_url.value;
                
            } else {
                alert(document.smilePayForm.msg.value);
            }

        }
        
        
        function smilepayReady() {
            // form에 iframe 주소 세팅
            document.smilePayForm.target = "txnIdGetterFrame";
            document.smilePayForm.action = "/smilepay/ready";
            document.smilePayForm.acceptCharset = "utf-8";
            if (payForm.canHaveHTML) { // detect IE
                document.charset = smilePayForm.acceptCharset;
            }

            // post로 iframe 페이지 호출
            document.smilePayForm.submit();

            // payForm의 타겟, action을 수정한다
            document.smilePayForm.target = "";
            document.smilePayForm.action = "/smilepay/liteResult";
            document.smilePayForm.acceptCharset = "utf-8";
            if (smilePayForm.canHaveHTML) { // detect IE
                document.charset = smilePayForm.acceptCharset;
            }
            // getTxnId.jsp의 onload 이벤트를 통해 cnspay() 호출

        }
        
        function autoHypenPhone(str) {
            str = str.replace(/[^0-9]/g, '');
            var tmp = '';
            if (str.length < 11) {
                return str;
            } else {
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
            return str;
        }

        var submitFunc = function cnspaySubmit(data) {
            if (data.RESULT_CODE === '00') {
                // 매뉴얼 참조하여 부인방지코드값 관리
                document.smilePayForm.submit();
            } else if (data.RESULT_CODE === 'KKP_SER_002') {
                // X버튼 눌렀을때의 이벤트 처리 코드 등록
                alert('[RESULT_CODE] : ' + data.RESULT_CODE
                        + '\n[RESULT_MSG] : ' + data.RESULT_MSG);
            } else {
                alert('[RESULT_CODE] : ' + data.RESULT_CODE
                        + '\n[RESULT_MSG] : ' + data.RESULT_MSG);
            }
        };
        
        // 결제 요청
        function requestPayment() {             
            
	            if ( (10100 - $("#usagePoint").val() - $("#usageCoupon").val()) < 10000) {
	                alert('상품 주문은 배송비를 제외한 실 결제금액 10,000원 이상부터 가능합니다.');
	                return;
	            }
            
                        
            if(!$("#agreement").get(0).checked){
                alert('주문서 동의가 필요합니다.');
                return;
            }
   
            var unreleasedInfo = "unreleasedPoint";
            if($("#unreleasedPayment").is(":checked")) {
                //unreleasedInfo += "결제수단으로 환불";
                unreleasedInfo = "unreleasedPayment";
            } else if($("#unreleasedPoint").is(":checked")) {
                //unreleasedInfo += "포인트 환불 (미출고 상품가의 5% 추가 보상 지급)";
                unreleasedInfo = "unreleasedPoint";
            } else if($("#changeProduct").is(":checked")) {
                //unreleasedInfo += "대체상품으로 교환배송";
                unreleasedInfo = "changeProduct";
            } else if($("#deliveryNextDay").is(":checked")) {
                unreleasedInfo = "deliveryNextDay";
            }
            
            var orderUserName = '황병열';
            var orderUserTel = '01053054710';
            var userName = '황병열';
            var zoneCode = '03426';
            var postCode = '122-821';
            var address1 = '서울 은평구 서오릉로17길 21-11';
            var address2 = '501호';
            var oldAddress1 = '서울 은평구 구산동 147-20';
            var tel = '01053054710';
            var usagePoint = $.trim($("#usagePoint").val());
            var usageCoupon = $.trim($("#usageCoupon").val());
            var couponId = $.trim($("#couponId").val());
            var userOasisYn = '';
            var deliveryTime = 'DT4';
            var oasisProductYn = 'Y';
            var saveAddress = 'true';
            var latitude = '';
            var longitude = '';
            var daybreakDeliveryYn = 'Y';
            var recoveryWrapperYn = 'N';
            var deliveryStoreId = '0';
            var packingType = 'P2';
            var usablePay = $("input[name='usablePay']:checked").val();
            var smsNoticeCode = 'S1';
            var doorKey = '3628';
            var orderRequestMsg = '';
            var recycleYn = 'Y';
            
            if (!usablePay) {
                alert("결제수단을 선택해주세요.");
                $("input[name='usablePay']").focus();
                return;
            }
            
            $("#LGD_CUSTOM_USABLEPAY").val(usablePay);

            var deliveryMessage = $("#deliveryMessage").val();
            
            var param = {
                paymentType : usablePay,
                buyerName : orderUserName,
                buyerTel : orderUserTel,
                receiver : userName,
                zoneCode : zoneCode,
                postCode : postCode,
                address1 : address1,
                address2 : address2,
                oldAddress1 : oldAddress1,
                tel : tel,
                totalPayment : $("#LGD_AMOUNT").val(),
                orderRequestMsg : orderRequestMsg,
                unreleasedInfo : unreleasedInfo,
                usagePoint : usagePoint,
                usageCoupon : usageCoupon,
                couponId : couponId,
                oasisYn : userOasisYn,
                deliveryTimeCode : deliveryTime,
                oasisProductYn : oasisProductYn,
                saveAddress : saveAddress,
                latitude : latitude,
                longitude : longitude,
                daybreakDeliveryYn: daybreakDeliveryYn,
                smsNoticeCode: smsNoticeCode,   
                doorKey: doorKey,
                recoveryWrapperYn : recoveryWrapperYn,
                deliveryStoreId: deliveryStoreId,
                packingType: packingType,
                recycleYn: recycleYn
            };

            var cartIds = [];
            $(".order_product").each(function() {
                cartIds.push($(this).data("cartid"));
            });

            param.cartIds = cartIds;
            
            $('#LGD_PAYINFO [name="LGD_BUYERPHONE"]').val('01053054710');

            var formData = {};
            var formDataArray = $("#LGD_PAYINFO").serializeArray();
            for (i in formDataArray) {
                formData[formDataArray[i].name] = formDataArray[i].value;
            }
            
            param.formData = JSON.stringify(formData);
            
            
            param.chosenEventProductId = 4;
            
            
            if (usablePay == "NOPAY") {
                $.ajax({
                    url : contextPath + "/order/requestNoPay",
                    type : "POST",
                    data : param,
                    dataType : "json",
                    success : function(response) {
                        if (response.status == "OK") {
                            paying = true;
                            nopay = true;
                            var data = response.data;
                            
                            alert("결제가 완료되었습니다. 주문내역으로 이동합니다.");
                            location.href = contextPath + "/order/complete/" + data.orderId;
                        } else {
                            alert(response.message + "\n장바구니로 이동합니다.");
                            location.href = contextPath + "/cart/list";
                        }
                    }
                });
            } else {
                $.ajax({
                    url : contextPath + "/order/request",
                    type : "POST",
                    data : param,
                    dataType : "json",
                    success : function(response) {
                        if (response.status == "OK") {
                            paying = true;
                            var data = response.data;
                            $("#LGD_OID").val(data.LGD_OID);
                            $("#LGD_HASHDATA").val(data.LGD_HASHDATA);
                            $("#LGD_CUSTOM_USABLEPAY").val(
                                    data.LGD_CUSTOM_USABLEPAY);
                            $("#LGD_TIMESTAMP").val(data.LGD_TIMESTAMP);
    
                            $("#EdiDate").val(data.LGD_TIMESTAMP);
    
                            if (usablePay == "KAKAO")
                                launchKakaoPay();
                            else if (usablePay == "SMILE")
                                launchSmilePay();
                            else
                                launchCrossPlatform();
                        } else {
                            alert(response.message + "\n장바구니로 이동합니다.");
                            location.href = contextPath + "/cart/list";
                        }
                    }
                });
            }
            
        }
    </script>

<!-- 현우 -->

<script type="text/javascript">

var totalPrice;

window.onload = function () {
	
	var totalResultPrice = Number("${totalResultPrice}");
	var deliveryPay = Number("${deliveryPay}");
	var price = totalResultPrice + deliveryPay;
	var totalPrice = price;
	var regexp = /\B(?=(\d{3})+(?!\d))/g;

	$("#sumSummary").html(totalPrice.toString().replace(regexp, ','));
	
}

function usePoint() {

	var totalResultPrice = Number("${totalResultPrice}");
	var deliveryPay = Number("${deliveryPay}");
	var price = totalResultPrice + deliveryPay;
	var join_point = "${join_point}";
	var usePoint = $("#usePoint").val();
	var regexp = /\B(?=(\d{3})+(?!\d))/g;

	if(join_point<price){
		
		if(join_point<usePoint){
			
			alert(join_point + "포인트 이하만 사용가능합니다.");
			return;
			
		}else{

			price = price - usePoint;
			
			totalPrice = price;
			
			$("#usePointPrice").html(usePoint.toString().replace(regexp, ','));
			$("#sumSummary").html(totalPrice.toString().replace(regexp, ','));
			
		}
		
		
	}else{
		
		if(price<usePoint){
			
			alert(price + "포인트 이하만 사용가능합니다.");
			return;
			
		}else{
			
			price = price - usePoint;
			
			totalPrice = price;
			
			$("#usePointPrice").html(usePoint.toString().replace(regexp, ','));
			$("#sumSummary").html(totalPrice.toString().replace(regexp, ','));
			
		}
		
	}

}

function useCoupon() {
	
	var totalResultPrice = Number("${totalResultPrice}");
	var deliveryPay = Number("${deliveryPay}");
	var price = totalResultPrice + deliveryPay;
	var couponPrice = $("#couponId option:selected").val();

	
	if(couponPrice<totalPrice){
	
		totalPrice = totalPrice - couponPrice;
		$("#sumSummary").html(totalPrice.toString().replace(regexp, ','));
		return;
		
	}else{
	
		alert("최종 결제금액보다 큰 금액의 쿠폰은 사용 할 수 없습니다.");
		$("#couponId").find("option:eq(0)").prop("selected", true);
		return;
		
	}
	
	
}

</script>
</head>

<body>
<div class="allWrap">
    
    <!-- 컨텐츠 -->
    <div class="contentsArea" id="sec_order_result">
        <div class="contentsWrap">
            <!-- 오른쪽 영역 -->
            <div class="content">
                <!-- 내용 입니다 -->
                <div class="orderStepWrap">
                   <div class="orderStepImg">
                        <img src="/dailychan/resources/images/order/order_ico_step4.png" alt="주문단계 - 4.배송완료">
                    </div> 
                                
                    <div class="orderNewCont">
                        <div>
                            <img src="/dailychan/resources/images/common/h1_logo.png" alt="">
                        </div>
                        <div class="orderNewTxt">
                            주문해주셔서 감사합니다.
                        </div>
                        <div class="orderNewSubTxt">
                            주문내역 및 배송현황은 마이페이지 주문관리에서<br>
                            확인 할 수 있습니다.<br><br>
                            
                            친구 초대하고 할인 혜택을 받으세요!
                        </div>
                    </div>
              
                    <!-- 버튼 -->
                    <div class="orderBtnWrap btnC" style="padding-bottom:150px">
                        <a href="/dailychan/myPage/orderList.action" class="orderBtnRed" style="background:#6ca435; border-color:#6ca435; width: 400px; height: 55px; padding-top: 14px; font-size: 20pt;">주문 내역 확인</a>
                    </div>
                    <!--// 버튼 -->
                </div>
                <!-- //내용 입니다 -->
            </div>
            <!-- //오른쪽 영역 -->
        </div>
    </div>
        
    <!-- //컨텐츠 -->
        </div>
    </div>
</div>

</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
 