<%@ page contentType="text/html; charset=UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <title>데일리찬::믿을 수 있는 먹거리</title>
    
<jsp:include page="/WEB-INF/views/top.jsp"/>

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

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.12"></script>

<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-PR5WGG3');</script>
<!-- End Google Tag Manager -->

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119809802-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-119809802-1');
</script>

<!-- 네이버 프리미엄 로그 적용 : 공통 --> 
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_eb0d5275a00";
if (!_nasa) var _nasa={};
wcs.inflow();
wcs_do(_nasa);
</script>

    
    <script type="text/javascript" src="https://xpay.uplus.co.kr/xpay/js/xpay_crossplatform.js"></script>
    <script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
    <script src="https://kmpay.lgcns.com:8443/js/dlp/client/kakaopayDlpConf.js" charset="utf-8"></script>
    <script src="https://kmpay.lgcns.com:8443/js/dlp/client/kakaopayDlp.min.js" charset="utf-8"></script>
    
    <script type="text/javascript">
        var LGD_window_type = null;
        var paying = false;
        var nopay = false;
        
        var TOTAL_PRICE = "9320";
        
        //var geocoder = new daum.maps.services.Geocoder();
        
        var lastOrderChecked = false;
        
        $(document).ready(function() {
            
            LGD_window_type = $("#CST_WINDOW_TYPE").val();
            
            // 숫자만 입력되는 input 설정.
            $(document).on("keyup", "#tel, #orderTel", function() {
                $(this).val( $(this).val().replace(/[^0-9]/gi,"") );
            });
            
            $('#selDeliveryMessage').change(function() {
            	if ($(this).val() == 'direct') {
            		$('#deliveryMessage').show().val('');
            	} else {
            		$('#deliveryMessage').hide().val($(this).val());
            	}
            })
            
            $("input[name='receiverInfo']").click(function() { // 새로운 주소 선택
            	$("#deliveryType1").prop("checked", false).hide();
                $("#deliveryType2").prop("checked", false);
                $("#deliveryType3").prop("checked", false).hide();
                $("#deliveryType").text("").next().text("");
                $("#oasisDeliveryType").hide();
                $("#daybreakDelivery").hide();
                $("#deliveryInfo").hide();
                $("#selectDelivery").hide();
                $("#deliveryMessage").val("");
                
                if ( $(this).val() == "new" ) { // 새로운 배송지 선택
                    $("#userName").val("");
                    $("#zoneCode").val("");
                    $("#postCode").val("");
                    $("#address1").val("");
                    $("#address2").val("");
                    $("#oldAddress1").val("");
                    $("#tel").val("");
                    $("#deliveryTypeSelect").hide();
                } else if ( $(this).val() == "old" ) { 
                    $("#userName").val($("#orderUserName").val());
                    $("#tel").val($("#orderUserTel").val());
                }
            });            

        });
        
        function checkDeliveryTimeStatus(address, oldAddress) { // 입력한 주소지가 매장, 새벽배송 권역인지 체크
            var replaceAddress = address.replace(/ /g, '');
            var replaceOldAddress = oldAddress.replace(/ /g, '');
            
            if (replaceAddress || replaceOldAddress) {
                isOasisDelivery(replaceAddress, replaceOldAddress);
            } else {
                $("#deliveryTime").val("");
            }
                
        }
        
        function isOasisDelivery(address, oldAddress) {
            var deliveryHour = 5;
            var param = {
                    address: address,
                    oldAddress: oldAddress
                };
            $.ajax({
                url : contextPath + "/order/check/deliveryArea",
                type: "GET",
                dataType: "json",
                data: param,
                success: function(data) {
                    if (data.status == 'OK') {
                        $("#deliveryType1").prop("checked", false).parent().hide().next().hide();
                        $("#deliveryType2").prop("checked", false);
                        $("#deliveryType3").prop("checked", false).parent().hide().next().hide();
                        
                        if (data.data.oasisDeliveryYn == "Y") {
                            if(data.data.deliveryHour != null)
                                deliveryHour = data.data.deliveryHour;
                            $("#deliveryType1").parent().show().next().show();
                            
                            if (data.data.daybreakDeliveryYn == "Y") {
                                $("#deliveryType").text("고객님이 선택하신 주소지는 '매장으로 주문하기' 또는 '새벽배송 주문하기' 가능 지역입니다. ").next().html("<span class='order_daybreakBg'>새벽배송</span>이나 <span class='order_shopBg'>매장배송</span>을 선택해 주시기 바랍니다. ");
                                $("#deliveryInfoDaybreak").show().next().show();
                            } else {
                                $("#deliveryType").text("고객님이 선택하신 주소지는 '매장으로 주문하기'만 가능한 지역입니다.").next().html("<span class='order_shopBg'>매장배송</span>을 선택해주세요.");
                                $("#deliveryInfoDaybreak").hide().next().hide();
                            }
                            
                        } else {
                            if (data.data.daybreakDeliveryYn == "Y") {
                                $("#deliveryType").text("고객님이 선택하신 주소지는 '매장으로 주문하기' 배송지가 아닙니다.").next().html("<span class='order_daybreakBg'>새벽배송</span>이나 <span class='order_deliveryBg'>택배배송</span>을 선택해 주시기 바랍니다. ");
                                $("#deliveryInfoDaybreak").show().next().show();
                              
                            } else {
                                $("#deliveryType").text("고객님이 선택하신 주소지는 '매장으로 주문하기' 또는 '새벽배송 주문하기' 배송지가 아닙니다.").next().html("해당 주소는 <span class='order_deliveryBg'>택배배송</span>만 가능합니다.");
                                $("#deliveryInfoDaybreak").hide().next().hide();
                            }
                        }
                        
                        if (data.data.daybreakDeliveryYn == "Y") {
                            $("#deliveryType3").parent().show().next().show();
                            
                            $("#daybreakDay").text("(" + data.data.daybreakDate + " 새벽 배송예정)");
                            $("#daybreakDeliveryMessage").text(data.data.daybreakMessage);
                            $("#daybreakDescription").hide();
                            var daybreakDescription = data.data.description;
                            if (daybreakDescription != null && daybreakDescription != "") {
                                $("#daybreakDescription").html(daybreakDescription).show();
                            }
                        }
                        
                        $("#oasisDeliveryType").show();  
                        $("#oasisDelivery").hide();
                        $("#daybreakDelivery").hide();
                        $("#deliveryInfo").hide();
                        $("#selectDelivery").hide();
                        
                        /*if(!lastOrderChecked) {
	                        if("" == "daybreak")
	                        	$('#deliveryType3').prop("checked", true);
	                        else if("" == "store")
	                        	$('#deliveryType1').prop("checked", true);
	                        else if("" == "delivery")
	                        	$('#deliveryType2').prop("checked", true);

	    	            	descOasisDeliveryType('');
	    	              	lastOrderChecked = true;
                        }*/
                    } else {
                      alert(data.message);
                    }
                }
            });
        }
     
        
        function nextStep() {
            
            if (!($("#deliveryType1").is(":checked") || $("#deliveryType2").is(":checked") || $("#deliveryType3").is(":checked"))) {
                alert("배송 방법을 선택해주세요.");
                $("input[name='deliveryType']").focus();
                return;
            }
            
            if ( ("${dto.product_totalPrice}" ) < 10000) {
                alert('상품 주문은 배송비를 제외한 실 결제금액 10,000원 이상부터 가능합니다.');
                return;
            }
            
            var doorKey = "";
            var smsNoticeCode;

            var radioEntranceMethod = document.getElementsByName("entranceMethod");
            var textEntranceMethodValue = $("#entranceMethodValue").val();
            
            if ($("#deliveryType3").is(":checked")) {
                $("#daybreakDeliveryYn").val("Y");
                $("#deliveryTime").val('DT4'); 
                // 공동현관 출입방법 
                if(radioEntranceMethod[0].checked){
                    
                    if (textEntranceMethodValue == "") {
                        alert("공동현관 비밀번호를 입력해 주세요.");
                        $("#entranceMethodValue").focus();
                        return;
                    } else {
                        doorKey =  textEntranceMethodValue;
                    }
                } else if (radioEntranceMethod[1].checked){
                    doorKey += "자유출입";
                } else if (radioEntranceMethod[2].checked){
                    doorKey += "기타";
                    if (textEntranceMethodValue != "") {
                        doorKey += "(" +  textEntranceMethodValue + ")" ;
                    }
                } else {
                    alert("공동현관 출입방법을 선택해 주세요.");
                    $("#entPassCode").focus();
                    return;
                }

                var radioCallMethod = document.getElementsByName("callMethodAtDaybreak");
                // 새벽배송 시 연락방법
                if(radioCallMethod[0].checked){
                    smsNoticeCode = radioCallMethod[0].value;
                } else if (radioCallMethod[1].checked){
                    smsNoticeCode = radioCallMethod[1].value;
                } else if (radioCallMethod[2].checked) {
                    smsNoticeCode = radioCallMethod[2].value;
                } else {
                    alert("새벽 배송 시 연락방법을 선택해 주세요.");
                    $("#callPhone").focus();
                    return;
                }

            } else {
                $("#daybreakDeliveryYn").val("N");
                doorKey = "";
                smsNoticeCode = null;
                if ($("#deliveryType1").is(":checked")) {
                    $("#deliveryTime").val('DT4'); 
                } else {
                    $("#deliveryTime").val("DT5");
                }
            }

            var orderUserName = $.trim($("#orderUserName").val());
            var orderUserTel = $.trim($("#orderUserTel").val());

            if (orderUserName == "") {
                alert("보내시는 분 이름을 입력해주세요.");
                $("#orderUserName").focus();
                return;
            }
            else if (orderUserTel == "") {
                alert("보내시는 분 전화 번호를 입력해주세요.");
                $("#orderUserTel").focus();
                return;
            } 

            var userName = $.trim($("#userName").val());
            var zoneCode = $.trim($("#zoneCode").val());
            var postCode = $.trim($("#postCode").val());
            var address1 = $.trim($("#address1").val());
            var address2 = $.trim($("#address2").val());
            var oldAddress1 = $.trim($("#oldAddress1").val());
            var tel = $.trim($("#tel").val());
            var userOasisYn = '';
            var deliveryTime = null;
            var oasisProductYn = 'Y';
            var saveAddress = $("#saveAddress").is(":checked");
            var latitude = $.trim($("#latitude").val());
            var longitude = $.trim($("#longitude").val());
            var daybreakDeliveryYn = $("#daybreakDeliveryYn").val();
            var recoveryWrapperYn = $("#recoveryWrapperYn").is(":checked")?"Y":"N";
            var deliveryStoreId = $("#deliveryStoreId").val();
            var packingType = "P1";
            var recycleYn = "";
            
            if ($("#P1").is(":checked")) {
            	packingType = "P1";
            } else if($("#P2").is(":checked")) {
            	packingType = "P2"
            } else if($("#P3").is(":checked")) {
                packingType = "P3"
            }
            
            if ($("#recycleY").is(":checked")) {
                recycleYn = "Y"
            } else if ($("#recycleN").is(":checked")) {
                recycleYn = "N"
            } else {
                alert("재활용 포장재 사용여부를 체크해주세요.")
                $("#recycleY").focus();
                return;
            }
            
            if($("#oasisDeliveryTime").css("display") != "none") {
                deliveryTime = $("#deliveryTime").val();
            }
            
            if (userName == "") {
                alert("받으시는 분 이름을 입력해주세요.");
                $("#userName").focus();
                return;
            } else if (zoneCode == "" || address1 == "" || address2 == "") {
                alert("주소를 입력해주세요.");
                $("#address2").focus();
                return;
            } else if (tel == "") {
                alert("휴대전화를 입력해주세요.");
                $("#tel").focus();
                return;
            } else if (deliveryStoreId == "") {
                if (!$("#deliveryType1").is(":checked")) {
                    deliveryStoreId = 0;
                } else {
                    alert("배송 받으실 매장을 선택해주세요.");
                    $("#deliveryStoreId").focus();
                    return;
                }
            }
            
            var deliveryMessage = $("#deliveryMessage").val();
                        
            $("#hBuyerName").val(orderUserName);
            $("#hBuyerTel").val(orderUserTel);
            $("#hReceiver").val(userName);
            $("#hZoneCode").val(zoneCode);
            $("#hPostCode").val(postCode);
            $("#hAddress1").val(address1);
            $("#hAddress2").val(address2);
            $("#hOldAddress1").val(oldAddress1);
            $("#hTel").val(tel);
            $("#hOrderRequestMsg").val(deliveryMessage);
            $("#hOasisYn").val(userOasisYn);
            $("#hDeliveryTimeCode").val(deliveryTime);
            $("#hOasisProductYn").val(oasisProductYn);
            $("#hSaveAddress").val(saveAddress);
            $("#hLatitude").val(latitude);
            $("#hLongitude").val(longitude);
            $("#hDaybreakDeliveryYn").val(daybreakDeliveryYn);
            $("#hSmsNoticeCode").val(smsNoticeCode);
            $("#hDoorKey").val(doorKey);
            $("#hRecoveryWrapperYn").val(recoveryWrapperYn);
            $("#hDeliveryStoreId").val(deliveryStoreId);
            $("#hPackingType").val(packingType);
            $("#hRecycleYn").val(recycleYn);

            $("#deliveryInfoForm").submit();
        }

        function findPostCode(isOrder) {
            new daum.Postcode({
                oncomplete : function(data) {
                    if (isOrder) {
                        $("#orderZoneCode").val(data.zonecode);
                        $("#orderAddress1").val(data.roadAddress);
                                                
                        if (data.jibunAddress.length > 0) {
                            $("#orderOldAddress1").val(data.jibunAddress);
                        } else {
                            $("#orderOldAddress1").val(data.autoJibunAddress);
                        }
                        $("#orerPostCode").val(data.postcode);
                        $("#orderAddress2").val("").focus();
                    } else {
                        $("#zoneCode").val(data.zonecode);
                        
                        if (data.jibunAddress.length > 0) {
                            $("#oldAddress1").val(data.jibunAddress);
                        } else {
                            $("#oldAddress1").val(data.autoJibunAddress);   
                        }
                        
                        if (data.roadAddress.length > 0) {
                            $("#address1").val(data.roadAddress);
                        } else {
                            $("#address1").val($("#oldAddress1").val());
                        }
                        
                        $("#postCode").val(data.postcode);
                        $("#address2").val("").focus();
                    }
                    checkDeliveryTimeStatus($("#address1").val(), $("#oldAddress1").val());
                }
            }).open();
        }
        
        //
        function callbackCheckOasisDeliveryStore(response) {
            if (response.status == "OK") {
                // 오아시스 배송시간 보이기
                $("#deliveryTime").val("DT1");
                $("#oasisDeliveryTimeDescImg").show();
            } else {
                // 오아시스 배송시간 감추기
                $("#deliveryTime").val("DT4");
                $("#oasisDeliveryTimeDescImg").hide();
            }
        }
        
        function descOasisDeliveryType(deliveryType) {
            $("#recoveryWrapper").show().next().hide();
            $("#selectStoreWrap").hide();
            if (deliveryType == "daybreak") {
                $("#selectDelivery").show();
                $("#deliveryInfo").hide();
                $("#daybreakDelivery").show();
                $("#oasisDelivery").hide();
                
                if (false) {
                	$("#storeDeliveryDirectPop").show();
                    $(".popDim").show();
                }
            } else if (deliveryType == "store") {
                // $("#deliveryType1").prop("checked", false);
                // alert("추석 연휴로 인해 현재 매장배송은 선택하실 수 없습니다. \n매장배송은 9월 28일 금요일부터 이용하실 수 있습니다.");
                $(".popDim").show();
                
                $("#selectDelivery").show();
                $("#deliveryInfo").hide();
                $("#daybreakDelivery").hide();
                $("#oasisDelivery").show();
                $("input[name='entranceMethod']").prop("checked", false);
                $("input[name='callMethodAtDaybreak']").prop("checked", false);
                $("#entranceMethodValue").val("");
                $("#selectStoreWrap").show();
                //매장배송 안내
                
                $("#storeDeliveryNoticePop").show();
                $(".popDim").show();
            } else {
                $("#recoveryWrapper").hide().next().show();
                $("#recoveryWrapperYn").prop("checked", false);
                $("#recoveryWrapperYn").val("N");
                $("#selectDelivery").show();
                $("#deliveryInfo").show();
                $("#daybreakDelivery").hide();
                $("#oasisDelivery").hide();
                $("input[name='entranceMethod']").prop("checked", false);
                $("input[name='callMethodAtDaybreak']").prop("checked", false);
                $("#entranceMethodValue").val("");
                
                // 새벽배송여부
                /*if($("#deliveryType3").parent().css("display") != "none") {
                    $("#daybreakNoticePop").show();
                    $(".popDim").show();
                }*/
            }
        }
        
        function closeDaybreakNoticePop() {
            $(".popDim").hide();
            $("#daybreakNoticePop").hide();
        }
        
        function closeStoreDeliveryNoticePop() {
            $(".popDim").hide();
            $("#storeDeliveryNoticePop").hide();
        }
        
        function closeStoreDirectNoticePop() {
        	$(".popDim").hide();
        	$("#storeDeliveryDirectPop").hide();
        }
        
        function closeDeliveryInfoPop() {
        	$(".popDim").hide();
            $("#deliveryInfoPop").hide();
        }
        
        function closeStoreDeliveryInfoPop() {
            $(".popDim").hide();
            $("#storeDeliveryInfoPop").hide();
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

        function order(type) {
            var $orderForm = $("#orderForm").empty();
            var count = 0;            
            
            if (type == 'daybreak') {
            	$(".daybreakDeliveryProduct").each(function() {
                    var cartId = $(this).data("cart");
                    $orderForm.append("<input type='text' name='cartId' value='" + cartId + "' />");
                    count++;
                });
            } else if (type == 'store') {
            	$(".storeDeliveryProduct").each(function() {
                    var cartId = $(this).data("cart");
                    $orderForm.append("<input type='text' name='cartId' value='" + cartId + "' />");
                    count++;
                });
            } else {
            	$(".deliveryProduct").each(function() {
                    var cartId = $(this).data("cart");
                    $orderForm.append("<input type='text' name='cartId' value='" + cartId + "' />");
                    count++;
                });
            }
            
            if (count > 0) {
                $orderForm.submit();
                
                return; 
            } else {
                alert("주문 가능한 상품이 없습니다.");
                return;
            }

        }
    </script>
   
    
<!-- 삭제금지 -->
<script type="text/javascript">

var oldVal;

setInterval(function() {
	
	var juso = $("#address1").val();

    if(juso == oldVal) {
        return;
    }
    	
    var url = "/dailychan/order/checkjuso.action";
       
       $.post(url,{juso:juso},function(data){
   	
       	var message;
       	
       	if(data=="0"){

       		message = "<span class='order_deliveryBg'>택배 배송</span>이 가능한 지역입니다.";
       		$('#deliveryTypeSelect').show();
       		$('#deliveryTypeA').hide();
       		$('#deliveryTypeB').hide();
       		$('#deliveryTypeC').show();
       		
       	}else if(data=="1"){

       		message = "<span class='order_daybreakBg'>새벽 배송</span> <span class='order_deliveryBg'>택배 배송</span>이 가능한 지역입니다.";
       		$('#deliveryTypeSelect').show();
       		$('#deliveryTypeA').show();
       		$('#deliveryTypeB').hide();
       		$('#deliveryTypeC').show();
       		
       	}else if(data=="2"){
       		
       		message = "<span class='order_shopBg'>매장 배송</span> <span class='order_deliveryBg'>택배 배송</span>이 가능한 지역입니다.";
       		$('#deliveryTypeSelect').show();
       		$('#deliveryTypeA').hide();
       		$('#deliveryTypeB').show();
       		$('#deliveryTypeC').show();
       		
       	}else if(data=="3"){
       		
       		message = "<span class='order_daybreakBg'>새벽 배송</span> <span class='order_shopBg'>매장 배송</span>이 가능한 지역입니다.";
       		$('#deliveryTypeSelect').show();
       		$('#deliveryTypeA').show();
       		$('#deliveryTypeB').show();
       		$('#deliveryTypeC').show();
       		
       	}else{
       		
       		message = "주소를 선택해 주십시오.";
       		
       	}
       	
       	$("#deliveryType").html(message);

   	});

    oldVal = juso;

}, 100);
/* 
function checkJuso(){
	
    var juso = $("#address1").val();
    var url = "/dailychan/order/checkjuso.action";
    
    $.post(url,{juso:juso},function(data){
	
    	var message;
    	
    	if(data=="0"){

    		
    		message = "<span class='order_deliveryBg'>택배 배송</span>이 가능한 지역입니다.";
    		$('#deliveryTypeSelect').show();
    		$('#deliveryTypeA').hide();
    		$('#deliveryTypeB').hide();
    		$('#deliveryTypeC').show();
    		
    	}else if(data=="1"){

    		message = "<span class='order_daybreakBg'>새벽 배송</span> <span class='order_deliveryBg'>택배 배송</span>이 가능한 지역입니다.";
    		$('#deliveryTypeSelect').show();
    		$('#deliveryTypeA').show();
    		$('#deliveryTypeB').hide();
    		$('#deliveryTypeC').show();
    		
    	}else if(data=="2"){
    		
    		message = "<span class='order_shopBg'>매장 배송</span> <span class='order_deliveryBg'>택배 배송</span>이 가능한 지역입니다.";
    		$('#deliveryTypeSelect').show();
    		$('#deliveryTypeA').hide();
    		$('#deliveryTypeB').show();
    		$('#deliveryTypeC').show();
    		
    	}else if(data=="3"){
    		
    		message = "<span class='order_daybreakBg'>새벽 배송</span> <span class='order_shopBg'>매장 배송</span>이 가능한 지역입니다.";
    		$('#deliveryTypeSelect').show();
    		$('#deliveryTypeA').show();
    		$('#deliveryTypeB').show();
    		$('#deliveryTypeC').show();
    		
    	}else{
    		
    		message = "주소를 선택해 주십시오.";
    		
    	}
    	
    	$("#deliveryType").html(message);

	});
    
}
*/
function orderComfirm() {
	
	var f = document.order;
	
	if (!($("#deliveryType1").is(":checked") || $("#deliveryType2").is(":checked") || $("#deliveryType3").is(":checked"))) {
        alert("배송 방법을 선택해주세요.");
        $("input[name='deliveryType']").focus();
        return;
    }
	
	if ($("#deliveryType1").is(":checked") && $("#deliveryStoreId option:selected").val()==""){
		
		alert("매장을 선택해주세요.");
		return;
		
	}
    
    if (("${dto.product_totalPrice}" ) < 10000) {
        alert('상품 주문은 배송비를 제외한 실 결제금액 10,000원 이상부터 가능합니다.');
        return;
    }
    
    if(!($("#recycleN").is(":checked") || $("#recycleY").is(":checked"))){
    	
    	alert("재활용 포장재 여부를 체크해주세요.");
    	return;
    	
    }
    
    f.action = "/dailychan/order/payment.action";
	f.submit();
	
}

</script>

<!-- //삭제금지 -->

	
</head>

<body>
<div class="allWrap">
		
		<!------------------------ 장바구니 레이어 팝업 ------------------------>
          
        <div id="cartPop" class="oasisLayerPop" style="height:584px">
            <div class="oasisLayerPop_in">
                <div class="oasisLPtit" style="position:relatvive">
                    <strong class="comLayerTit">장바구니</strong>
                    <div style="position:absolute; width: 27px;height: 27px;top: 27px;right: 26px;">
                        <a href="#" onclick="closeQuestionDialog(); return false;" class="popOasisDeliveryClose"></a>
                    </div>
                </div>
        
                <div class="oasisLPconWrap" style="text-align:center">
                    <!-- 이 안에 팝업 내용 넣기 -->
                    <div class="comLayerCon">
                        <div class="popCartList">
                            <div class="popCartInfo">
	                            <span id="popCartCnt"></span>
	                            <span class="totalCartPrice">총 주문 금액 <font color="red" id="popCartPrice"></font> 원</span>
                            </div>
                            <div class="popProductList">
                                <ul class="popProdInfo">
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="popCartPageWrap">
                    </div>
                    
                    <div class="popCartBtnWrap oasisLPcon3">
                        <a href="/cart/list" style="height:48px; font-size:15px; margin-top:30px; line-height:48px;">장바구니로 이동</a>
                        <a href="#" onclick="closeQuestionDialog(); return false;" style="height:46px; font-size:15px; color:#6ca435; border:1px solid #6ca435; background:white; line-height:46px">쇼핑 계속하기</a>
                    </div>
         
                    <!-- //이 안에 팝업 내용 넣기 -->
                </div>
            </div>
        </div>
        <!------------------------ // 장바구니 레이어 팝업 ------------------------>
        
        <div class="popDim"></div>
		
	</div>
	<!-- // header -->
    <!-- // header -->
    
    <form action="" method="post" name="order">
    
    <!-- 컨텐츠 -->
    <div class="contentsArea" id="sec_order_pay">
        <div class="contentsWrap">
            <!-- 오른쪽 영역 -->
            <div class="content">
                <!-- 내용 입니다 -->
                <div class="orderStepWrap">
                    <!-- 주문단계 -->
                    <div class="orderStepImg" >
                        <img src="/dailychan/resources/images/order/order_ico_step2.png" alt="주문단계 - 2.배송정보입력" />
                    </div>
                    <div style="background-color:#f5f5f5; height:36px; color:#6ca437; font-size:16px; font-weight:bold;text-align:center; padding-top:22px">상품 주문은 배송비를 제외한 실 결제금액 10,000원 이상부터 가능합니다.</div>
                    <!--// 주문단계 -->
                    
                    <h4 class="orderTit2 conS1">1. 주문자 정보 입력</h4>
                    <div class="orderTbl2" style="border:solid 1px #ddd">
                        <table style="border-top:1px solid #ddd">
                            <colgroup>
                                <col width="143px" />
                                <col width="" />
                                <col width="143px" />
                                <col width="" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span class="starBg">보내시는 분</span></th>
                                    <td><input type="text" id="orderUserName" name="orderList_sendName" class="inputWd260" value="${dto.join_name }" maxlength="10" /></td>
                                    <th scope="row"><span class="starBg">휴대전화</span></th>
                                    <td><input type="text" id="orderUserTel" name="orderList_sendPhone" class="inputWd260" value="${dto.join_phone }" maxlength="11" /></td>
                                </tr>
                            </tbody>
                        </table>
                     </div>
                    <div class="orderTit2 conS1" >
                        <h4>2. 배송지 주소 확인</h4>
                        <div class="selectAdd">
                            <span class="radios">
                                <input type="radio" id="order31" name="receiverInfo" value="old" checked="checked" />
                                <label for="order31"></label>
                            </span>
                            <label for="order31">
                                <p style="cursor:pointer">주문고객 정보와 동일</p>
                            </label>
                            <span class="radios">
                                <input type="radio" id="order32" name="receiverInfo" value="new"/>
                                <label for="order32"></label>
                            </span>
                            <label for="order32">
                                <p style="cursor:pointer">새로운 배송지</p>
                            </label>
                            
                        </div>  
                    </div>
                        
                    <div class="orderTbl2" style="border:solid 1px #ddd" >
                        <table style="border-top:1px solid #ddd">
                            <colgroup>
                                <col width="143px" />
                                <col width="" />
                                <col width="143px" />
                                <col width="" />
                            </colgroup>
                            <tbody>
                                    <tr><span style="height:10px;"></span>
                                            <th scope="row"><span class="starBg">받으시는 분</span></th>
                                            <td id="userName1"><input type="text" id="userName" name="orderList_reciveName" class="inputWd260" value="${dto.join_name }" maxlength="10" data-user="" /></td>
                                            <th scope="row"><span class="starBg">휴대전화</span></th>
                                            <td id="tel1"><input type="text" id="tel" name="orderList_recivePhone" class="inputWd260" value="${dto.join_phone }" maxlength="11" data-user="" /></td>
                                        </tr>
                            </tbody>
                        </table>
                        <table>
                            <colgroup>
                                <col width="143px" />
                                <col width="" />
                            </colgroup>
                            <tbody>

                                    <th scope="row"><span class="starBg">주소</span></th>
                                    <td style="position:relative">
                                        <div class="addBox1">
                                            <input type="text" id="zoneCode" name="orderList_reciveAddrNum" class="inbox3" style="width:60px;" value="${dto.join_addrNum }" readonly data-user="" />
                                            <a href="#" class="findBtn_ad" onClick="findPostCode(false); return false;">우편번호 찾기</a>
                                            <span class="checks">
                                                <input type="checkbox" name="saveAddress" value="save" checked='checked' id="saveAddress"/>
                                                <label for="saveAddress"></label>
                                            </span>
                                            <label for="saveAddress">
                                                <p style="cursor:pointer">기본 배송지로 설정합니다.</p>
                                            </label>
                                            <input type="hidden" id="latitude" name="latitude" />
                                            <input type="hidden" id="longitude" name="longitude" />
                                        </div>
                                        <div class="addBox2">
                                            <input type="text" id="address1" name="orderList_reciveAddr1" class="inputGrayBg inputWd330" value="${dto.join_addr1 }" onchange="bgcolor_yellow(this);" data-user="" />
                                            <input type="text" id="address2" name="orderList_reciveAddr2" class="inputWd330" value="${dto.join_addr2 }" maxlength="50" data-user="" />
                                            <!-- <input type="button" value="배송확인" style="width: 80px;" id="addressCheck" class="" onclick="checkJuso();"> -->
                                            <input type="hidden" id="oldAddress1" value="" data-user="" />
                                            <input type="hidden" id="postCode" value="" />
                                        </div>
                                        <p style="padding:15px 0px 10px 0px; color:#E53433; font-weight:bold;" id="deliveryType"></p>
                                        <p style="padding-bottom:5px; font-size:13px;font-weight:bold;"></p>
                                        <input type="hidden" name="deliveryTime" id="deliveryTime" value="" />
                                    </td>
                                </tr>
                            
                            </tbody>
                        </table>
                    </div>
                    
                <h4 class="orderTit2 conS1">3. 배송 방법 선택</h4>
                    <div class="orderTbl2" style="border:solid 1px #ddd">
                        <table style="border-top:1px solid #ddd">
                            <colgroup>
                                <col width="143px" />
                                <col width="" />
                            </colgroup>
                            <tbody>
                                      <tr id="deliveryTypeSelect" style="display: none;">
                                      <th scope="row"><span class="starBg">배송 선택</span></th>
                                            <td>
                                        <div>
                                        <ul>
                                            <div id="deliveryTypeA" style="margin:10px 0">
	                                            <span class="radios">
	                                                <input type="radio" id="deliveryType3" name="orderList_delivery" value="daybreak" onClick="descOasisDeliveryType('daybreak');"/>
	                                                <label for="deliveryType3" />
	                                            </span>
	                                            <label for="deliveryType3">
	                                               <span style="cursor:pointer; padding-right: 10px; font-weight:700;">새벽배송 주문하기 
	                                                   <p style="color:#e53433" id="daybreakDay"></p>
	                                               </span>
	                                            </label>
                                            </div>
                                            <div id="daybreakDescription" class="daybreakDescription">
                                            </div i>
                                            
                                            <div id="deliveryTypeB" style="margin:10px 0">
	                                            <span class="radios">
	                                                <input type="radio" id="deliveryType1" name="orderList_delivery" value="store" onClick="descOasisDeliveryType('store');"/>
	                                                <label for="deliveryType1" />
	                                            </span>
	                                            <label for="deliveryType1" >
	                                                <span style="cursor:pointer; padding-right: 10px; font-weight:700;">매장으로 주문하기
	                                                    <!-- <p style="color:#e53433">(02월07일 목요일부터 배송시작)</p>  -->
	                                                </span>
	                                            </label>
	                                        </div>
	                                        
	                                        <div id="deliveryTypeC" style="margin:10px 0">
	                                            <span class="radios">
	                                                <input type="radio" id="deliveryType2" name="orderList_delivery" value="delivery" onClick="descOasisDeliveryType('delivery');"/>
	                                                <label for="deliveryType2" />
	                                            </span>
	                                            <label for="deliveryType2"  >
	                                               <span style="cursor:pointer; padding-right: 10px; font-weight:700;">택배배송 주문하기
	                                                   <!-- <p style="color:#e53433">(02월07일 목요일부터 발송예정)</p>  -->
	                                               </span>
	                                            </label>
                                            </div>
                                        </ul>
                                        </div>
                                    </td>
                                    </tr>
                                  <tr id="selectDelivery" style=" display:none">
                                    <th scope="row"><span class="starBg">배송 안내</span></th>
                                    <td>
                                        <div id="oasisDelivery" style="display:none">
                                        <ul>
                                          <li style="line-height:24px; padding:4px 0px 20px 0px;">
                                               ▶ 매장배송은 <font color="red">재활용 박스를 활용해 당일 배송</font>하는 방법입니다.</br>
                                               ▶ 고객께서 대형마트등에서 사용하는 자율포장으로 배송 된다고 생각하시면 됩니다.</br>
                                               ▶ <font color="red">새벽배송을 이용하시면 좀 더 편리하고 깔끔한 포장으로 제품을 받으실 수 있습니다. </font></br>
                                               <p style="height:30px;"></p>매장 배송가능 지역은 서울 강남구, 서초구, 송파구, 강동구, 성남시 분당구, 용인시 수지구,위례전지역입니다.</br>
                                               타 지역은 새벽배송 또는 택배로 배송될 예정입니다. 빠른시일 이내에 서비스를 확대하도록 하겠습니다.</br>
                                               <p style="height:30px;"></p>상온/냉동 및 산지직송 상품은 일부 상품에 따라 일반 택배처리 될 수 있습니다.</br>
                                               </li>      
                                               </ul>
                                               </div>        
                                          
                                                   
                                        <div id="daybreakDelivery"  style="display:none">
                                            <div class="daybreakDelivery" >
                                                <ul>
                                                    <li style="line-height:24px; padding:4px 0px 20px 0px;">
                                                        ▶ <span style="font-weight:normal;">한번 선택한 배송은 <font color="red">변경 불가</font>하오니 신중하게 선택하여 주십시오.</span><br/>
                                                        ▶ 오아시스 새벽 배송은 서울 전지역,경기,인천 지역은 <font color="red">오후 8시</font> 이전까지 주문하시면 다음날 새벽 배송됩니다.</br>
                                                        ▶ 서울시 강남구/서초구/송파구/강동구/광진구, 용인시 수지구, 성남시 분당구 전체 지역은 새벽배송 주문마감 시간이 <font color="red">오후 11시</font>로 연장되었습니다. </br>
                                                        ▶ <font color="red">4월 17일부터 서울시 강동구/광진구</font>의 새벽배송 주문마감 시간이 오후 11시로 연장되었습니다. </br>
                                                        ▶ 새벽배송 지역과 시간은 점차 확대 될 예정입니다. </br>
                                                        
                                                    </li>
                                                </ul>
                                            </div>  
                                        </div>
                                            
                                          <div id="deliveryInfo" style="display:none">
                                            <ul>
                                            <li style="line-height:24px; padding:4px 0px 20px 0px;">
                                               ▶ 택배배송은 오후 6시까지 주문한 상품을 당일 발송하며 <font color="red">2~3일</font>정도 소요됩니다.</br>
                                               ▶ 택배배송의 경우 택배 사정에 따라 배송일이 변경 될 수 있습니다.</br>
                                               <span id="deliveryInfoDaybreak" style="display:none">▶ 고객님의 배송지는 <font color="red">'새벽배송'</font>이 적합한 지역입니다.</br></span>
                                               <span style="display:none">▶ 새벽배송의 경우 8시 이전까지 주문하시면 다음날 새벽까지 배송됩니다.</br></span>
                                               </li>      
                                               </ul>
                                               </div>   
                                            <input type="hidden" value="" id="daybreakDeliveryYn"/>
                                          </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><span>포장재 회수요청</span></th>
                                    <td>
                                        <span class="checks" id="recoveryWrapper">
                                            <input type="checkbox" id="recoveryWrapperYn" name="orderList_retrieve" value="Y"/>
                                            <label for="recoveryWrapperYn"> 전에 받았던 포장재(택배박스/아이스팩)를 회수해 주세요.</label>
                                        </span>
                                        <p style="color:#E53433; font-weight:bold; display:none">택배의 경우 택배사 사정으로 인하여 포장재를 회수하지 않습니다.</p>
                                    </td>
                                </tr>
                                <tr id="selectStoreWrap" style="display:none">
                                    <th scope="row"><span class="starBg">매장선택</span></th>
                                    <td>
                                        <p style="font-weight:bold; display:none">배송받기를 원하시는 매장을 선택해주세요.</p>
                                         <select id="deliveryStoreId" name="orderList_store" style="height:30px; width:250px">
                                            <option value="">매장을 선택해주세요</option>
                                            
                                                <option value="광진구 화양동" >광진구 화양동</option>
                                            
                                                <option value="경기도 구리시" >경기도 구리시</option>
                                            
                                                <option value="동대문구 휘경동" >동대문구 휘경동</option>
                                            
                                                <option value="은평구 불광동" >은평구 불광동</option>
                                            
                                                <option value="은평구 구산동" >은평구 구산동</option>
                                            
                                                <option value="사하구 괴정동" >사하구 괴정동</option>
                                            
                                                <option value="관악구 신림동" >관악구 신림동</option>
                                            
                                                <option value="마포구 도화동" >마포구 도화동</option>
                                            
                                                <option value="송파구 신천동" >송파구 신천동</option>
                                            
                                                <option value="동작구 흑석동" >동작구 흑석동</option>
                                            
                                                <option value="도봉구 쌍문동" >도봉구 쌍문동</option>
                                            
                                                <option value="경기도 수원시" >경기도 수원시</option>
                                            
                                        </select>
                                    </td>
                                </tr>      
       
                            </tbody>
                        </table>
                    </div>
  <!-- <div class="orderWrap2">

                    </div>-->
                        
                        <!-- 포장방법선택 -->
                        <h4 class="orderTit2 conS1">4. 포장방법 선택</h4>
                    <div class="orderTbl2" style="border:solid 1px #ddd">
                        <table style="border-top:1px solid #ddd">
                            <colgroup>
                                <col width="143px" />
                                <col width="" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span>포장방법 선택</span></th>
                                     <td>
                                           <span style="color:#e93433;font-weight:bold; padding-bottom:5px; display:block">
                                            * 포장 하나도 자연에 가깝게!
                                            </span>
                                    
                                        <div class="payment">
                                            <div style="margin:5px 0">
	                                            <span class="radios">
	                                                <input type="radio" id="P1" name="orderList_naturePackage" value="naturePackage1" />
	                                                <label for="P1" />
	                                            </span>
	                                            <label for="P1" >
	                                                <p style="cursor:pointer">최소포장 ( 냉매와 포장재를 최소한으로 사용합니다 )</p>
	                                            </label>
                                            </div>
                                            <div style="margin:5px 0">
	                                            <span class="radios">
	                                                <input type="radio" id="P2" name="orderList_naturePackage" value="naturePackage2" checked="checked"/>
	                                                <label for="P2" />
	                                            </span>
	                                            <label for="P2" >
	                                                <p style="cursor:pointer">친환경포장 ( 아이스팩과 드라이아이스를 조금 사용합니다 )</p>
	                                            </label>
                                            </div>
                                            <div style="margin:5px 0">
	                                            <span class="radios">
	                                                <input type="radio" id="P3" name="orderList_naturePackage" value="naturePackage3" />
	                                                <label for="P3" />
	                                            </span>
	                                            <label for="P3" >
	                                                <p style="cursor:pointer">친환경포장 + 아이스팩 하나 더</p>
	                                            </label>
                                            </div>
                                        </div>  
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--// 포장방법선택 -->
                        
                        <!-- 재활용 사용 여부 -->
                          <h4 class="orderTit2 conS1">5. 재활용 포장재 사용</h4>
                    <div class="orderTbl2" style="border:solid 1px #ddd">
                        <table style="border-top:1px solid #ddd">
                            <colgroup>
                                <col width="143px" />
                                <col width="" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><span>재활용 포장재</span></th>
                                     <td>
                                        <div class="payment">
                                            <div style="margin:5px 0">
                                                <span class="radios">
                                                    <input type="radio" id="recycleY" name="orderList_recyclePackage" value="Y"/>
                                                    <label for="recycleY" />
                                                </span>
                                                <label for="recycleY" >
                                                    <p style="cursor:pointer">재활용 된 포장재와 아이스팩을 사용해도 좋습니다.</p>
                                                </label>
                                            </div>
                                            <div style="margin:5px 0">
                                                <span class="radios">
                                                    <input type="radio" id="recycleN" name="orderList_recyclePackage" value="N"/>
                                                    <label for="recycleN" />
                                                </span>
                                                <label for="recycleN" >
                                                    <p style="cursor:pointer">재활용 된 포장재와 아이스팩을 사용하지 마세요.</p>
                                                </label>
                                            </div>
                                        </div>  
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--// 재활용 사용 여부 -->
                        
                        <h4 class="orderTit2 conS2"></h4>
                        <!-- 요청사항 -->
                        <div>
                            <h4 class="orderTit2">6. 요청사항</h4>
                            <div class="orderTbl2" style="border:solid 1px #ddd">
                                    <table style="border-top:1px solid #ddd">
                                    <colgroup>
                                        <col width="143px" />
                                        <col width="" />
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                    <th scope="row"><span>배송 메시지</span></th>
                                    <td>
                                        <select class="inputWd790" name="orderList_message" style="height:30px; padding:5px; margin-bottom:5px; width:761px;" id="selDeliveryMessage">
                                            <option value="" style="width:761px">배송 메시지 (선택사항)</option>
                                            
                                            <option value="배송 전, 연락바랍니다." style="width:761px">배송 전, 연락바랍니다.</option>
                                        
                                            <option value="부재시, 전화 또는 문자 주세요." style="width:761px">부재시, 전화 또는 문자 주세요.</option>
                                        
                                            <option value="부재시, 경비실에 맡겨주세요." style="width:761px">부재시, 경비실에 맡겨주세요.</option>
                                        
                                            <option value="direct">직접입력</option>
                                        </select>
                                        <input type="text" class="inputWd790" id="deliveryMessage" name="directWrite" maxlength="100" style="display:none; padding: 5px 10px;"/><br />
                                        
                                    </td>
                                </tr>
                                   
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="orderBtnWrap_green" style="padding-top:20px">
                        <input type="button" class="orderBtngreen" onclick="orderComfirm(); return false;" value=" 주문서 작성 "/>
                    </div>

                    
                </div>
                <!-- //내용 입니다 -->
            </div>
            <!-- //오른쪽 영역 -->
        </div>
        <!-- LayerPopup의 Target DIV 생성 -->
        <div id="kakaopay_layer" style="z-index:9999999; display:none; position:absolute; top:111px; left:50%;margin-left:-200px;width:440px;height:540px;">
            <iframe name="kakaopayLayerIframe" id="kakaopayLayerIframe" src="" style="width:100%; height:100%" frameborder="0" scrolling="no"></iframe>
        </div>
        <!-- <div id="kakaopay_layer" style="z-index:9999999; display:none; position:absolute; top:111px; left:50%;margin-left:-200px;width:440px;height:540px;"></div> -->
        <iframe name="txnIdGetterFrame" id="txnIdGetterFrame" style="height:0; width:0;display:none"></iframe>
    </div>
    <!-- //컨텐츠 -->

        <!-- 매장불가상품 -->
        <div id="storeOrderPop" class="oasisLayerPop" style="height:584px;">
            <div class="oasisLayerPop_in">
                <div class="oasisLPtit" style="position:relatvive">
                    <strong class="comLayerTit">매장배송 불가상품</strong>
                    <div style="position:absolute; width: 27px;height: 27px;top: 27px;right: 26px;">
                        <a href="#" onclick="closeQuestionDialog(); return false;" class="popOasisDeliveryClose"></a>
                    </div>
                </div>
        
                <div class="oasisLPconWrap" style="text-align:center">
                    <!-- 이 안에 팝업 내용 넣기 -->
                    <div class="comLayerCon">
                        <div class="popCartList">
                            <div class="popCartInfo">
                                <span style="font-size:16px; font-weight:600; display:block; text-align:center">아래 상품이 매장 배송이 불가한 상품이기 때문에 주문하실 수 없습니다.</span>
                            </div>
                            <div class="popProductList">
                                <ul class="popProdInfo">
          
                                                  <input type="hidden" class="storeDeliveryProduct" value="3653412" data-cart="3653412"/>
    
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="popCartPageWrap">
                    </div>
                    
                    <div class="popCartBtnWrap oasisLPcon3">
                        <a href="/cart/list" style="height:48px; font-size:15px; margin-top:30px; line-height:48px;">장바구니로 이동</a>
                        <a href="#" onclick="order('store'); return false;" style="height:46px; font-size:15px; color:#6ca435; border:1px solid #6ca435; background:white; line-height:46px">해당상품 제외하기</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- // 매장불가상품 -->
        
        <div id="daybreakNoticePop" class="daybreakNoticePopup" style="display:none;">
            <div class="popLpCon">
                <div class="closeBtn">
                    <a href="#;" onclick="javascript:closeDaybreakNoticePop(); return false;">
                        <img src="/dailychan/resources/images/common/layerPopClose2.png" alt="닫기"/>
                    </a>
                </div>
                <img src="/dailychan/resources/images/order/layerPopNoticeDelivery.png" alt="배송체크알림"/> 
                <div class="popBtn">
                    <a href="#;" onclick="$('#deliveryType3').click();closeDaybreakNoticePop();return false;" class="greenBtn puCloseBtn">새벽 배송 받기</a>
                    <a href="#;" onclick="javascript:closeDaybreakNoticePop(); return false;" class="grayBtn puCloseBtn">일반 택배 받기</a>
                </div>
            </div>
        </div>
        
        <div id="storeDeliveryNoticePop" class="storeDeliveryNoticePopup" style="display:none;">
            <div class="popLpCon">
                <div class="closeBtn">
                    <a href="#;" onclick="javascript:closeStoreDeliveryNoticePop(); return false;">
                        <img src="/dailychan/resources/images/common/layerPopClose2.png" alt="닫기"/>
                    </a>
                </div>
                <img src="/dailychan/resources/images/order/layerPopNoticeStoreDelivery.png" alt="배송체크알림" /> 
                <div class="popBtn">
                    <a href="#;" onclick="$('#deliveryType1').click();closeStoreDeliveryNoticePop();return false;" class="greenBtn puCloseBtn">매장으로 주문하기</a>
                    <a href="#;" onclick="$('#deliveryType3').click();closeStoreDeliveryNoticePop();return false;" class="grayBtn puCloseBtn">새벽 배송 받기</a>
                </div>
            </div>
        </div>
        
        <div id="storeDeliveryDirectPop" class="storeDeliveryNoticePopup" style="display:none; height:auto">
            <div class="popLpCon">
                <div class="closeBtn">
                    <a href="#;" onclick="javascript:closeStoreDirectNoticePop(); return false;">
                        <img src="/dailychan/resources/images/common/layerPopClose2.png" alt="닫기"/>
                    </a>
                </div>
                <img src="/dailychan/resources/images/order/layerPopNoticeDirect.png" alt="배송체크알림" /> 
                <div class="popBtn">
                    <a href="#;" onclick="closeStoreDirectNoticePop();return false;" class="greenBtn puCloseBtn" style="width:100%">확인</a>
                </div>
            </div>
        </div>
        
	<input type="hidden" name="product_price" value="${dto.product_price}"/>
	<input type="hidden" name="join_id" value="${dto.join_id}"/>
	<input type="hidden" name="product_id" value="${dto.product_id} "/>
	<input type="hidden" name="selectedCartIds" value="${selectedCartIds}"/>
	<input type="hidden" name="join_point" value="${dto.join_point }"/>
        
	</form>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>
 
