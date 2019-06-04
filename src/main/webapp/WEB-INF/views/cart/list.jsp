<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <title>데일리찬::믿을 수 있는 먹거리</title>

<jsp:include page="/WEB-INF/views/top.jsp"/>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="title" content="오아시스마켓::믿을 수 있는 먹거리" />
<meta name="description" content="세상에는 없는 가격! 오아시스에는 있습니다! 업계 최초 24시간 배송서비스!" />

<meta property="og:title" content="오아시스마켓::믿을 수 있는 먹거리" />
<meta property="og:type" content="website" />
<meta property="og:description" content="세상에는 없는 가격! 오아시스에는 있습니다! 업계 최초 24시간 배송서비스!" />
<meta property="og:url" content="www.oasis.co.kr" />
<meta property="og:image" content="/dailychan/resources/images/etc/oasis_kakao.jpg"/>
<meta name="naver-site-verification" content="3899c51fb285431259219d5399363f4ef440e1b6"/>

<link rel="shortcut icon" href="/favicon.ico">
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
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
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/commons.css" />
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js"></script>

<!-- <script type="text/javascript">
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
</script> -->

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/js/oasis_shop.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/js/oasis_common.js"></script>

 
<script type="text/javascript">

    $(document).ready(function() {
        // 부분 선택.
        $(".chk_product").click(function() {
            var $corpProducts = $(this).parents(".corp_products");
            
            if ($corpProducts.find(".chk_product:not(:checked)").length == 0) {
                $corpProducts.find(".chk_group").get(0).checked = true;
            } else {
                $corpProducts.find(".chk_group").get(0).checked = false;
            }
            
            if ($(".chk_product:not(:checked)").length == 0) {
                $("#checkAll").get(0).checked = true;
            } else {
                $("#checkAll").get(0).checked = false;
            }
            calculate();
        });
        
        // 그룹 선택.
        $(".chk_group").click(function() {
            var flag = this.checked;
            var $corpProducts = $(this).parents(".corp_products");
            $corpProducts.find(".chk_product").each(function() {
                this.checked = flag;
            });
            
            if ($(".chk_product:not(:checked)").length == 0) {
                $("#checkAll").get(0).checked = true;
            } else {
                $("#checkAll").get(0).checked = false;
            }
            plusCount();
        });
        
        // 수량 Up
        $(".btnUp").click(function() {
            var $row = $(this).parents("tr");
            var $quantity = $(this).parent().find(".quantity");
            var quantity = parseInt($quantity.val()) + 1;
            var buyLimit = $row.data("buylimit")?parseInt($row.data("buylimit")):0;
            
            
            if(buyLimit > 0 && quantity > buyLimit) {
                //alert(buyLimit + "개 이상은 구매 할 수 없습니다.");
                return false;
            }
            
            
            $quantity.val( quantity );
            return false;
        });
        
        // 수량 Down
        $(".btnDown").click(function() {
            var $quantity = $(this).parent().find(".quantity");
            var quantity = parseInt($quantity.val()) - 1;
            if (quantity < 1) quantity = 1;
            $quantity.val( quantity );
            return false;
        });
        
        // 수량 Update
        $(".btnUpdate").click(function() {
        	var $row = $(this).parents("tr");
            var cartId = $row.data("cart_id");
            var quantity = $row.find(".quantity").val();
            var buyLimit = $row.data("data-buylimit")?parseInt($row.data("data-buylimit")):0;
            
            
            if(buyLimit > 0 && quantity > buyLimit) {
                alert(buyLimit + "개 이상은 구매 할 수 없습니다.");
                quantity = buyLimit;
            }
            
            
            location.href = "/dailychan/cart/changeOrderCount.action?cart_id="+cartId+"&cart_quantity="+quantity;
           
        	
            
            return false;
        });
       /*  $(".btnUpdate").click(function() {
            var $row = $(this).parents("tr");
            var cartId = $row.data("cartid");
            var quantity = $row.find(".quantity").val();
            var buyLimit = $row.data("buylimit")?parseInt($row.data("buylimit")):0;
            
            
            if(buyLimit > 0 && quantity > buyLimit) {
                alert(buyLimit + "개 이상은 구매 할 수 없습니다.");
                quantity = buyLimit;
            }
            
            
            location.href = "update/" + cartId + "/" + quantity;
            
            return false;
        }); */
        
        // 상품 삭제.
         $(".btnDeleteRow").click(function() {
            if (confirm("삭제하시겠습니까?")) {
                var $row = $(this).parents("tr");
                
                var cartId = $row.data("cart_id");
                location.href = "/dailychan/cart/cartDelete.action?cart_id=" + cartId; 
            }
            
            return false;
        });
        
        // 전체상품 계산.
        calculate();
    });
    
    //전체상품 삭제
    function deleteCarts() {
        var $selectedRows = $(".chk_product:checked");
        var deleteLength = $selectedRows.length;
        
        if ($selectedRows.length == 0) {
            alert("삭제 할 상품을 선택해주세요.");
        }
        else if (confirm("삭제하시겠습니까?")) {
            var selectedCartIds = [];
            
            $selectedRows.each(function() {
                selectedCartIds.push($(this).parents("tr").data("cart_id"));
                
            });
            
            $.ajax({
                url : "<%=cp%>/cart/allCartDelete.action",
                type: "POST",
                dataType: "json",
                data: { deleteLength : deleteLength,
                		selectedCartIds: selectedCartIds },
                success: function(data) {
                	
                }
            });
            
            window.location.reload(true);
        }
    }
    
    /* function deleteCarts() {
        var $selectedRows = $(".chk_product:checked");
        
        if ($selectedRows.length == 0) {
            alert("삭제 할 상품을 선택해주세요.");
        }
        else if (confirm("삭제하시겠습니까?")) {
            var selectedCartIds = [];
            
            $selectedRows.each(function() {
                selectedCartIds.push($(this).parents("tr").data("cartid"));
            });
            
            $.ajax({
                url : contextPath + "/cart/delete",
                type: "POST",
                dataType: "json",
                data: { cartIds: selectedCartIds },
                success: function(response) {
                    if (response.status == "OK") {
                        window.location.reload(true);
                    }
                    else {
                        alert(response.message);
                    }
                }
            });
        }
    } */
    
    
    
    //전체찜리스트
    function selectedProductToWishList() {
        var $selectedRows = $(".chk_product:checked");
        
        var wishLength = $selectedRows.length;
        
   
        if ($selectedRows.length == 0) {
            alert("상품을 선택해주세요.");
        }
        else {
        	
			var selectedProductKeies = [];
            
            $selectedRows.each(function() {
                selectedProductKeies.push($(this).parents("tr").data("product_id"));
           		
                
            });
            
            alert(selectedProductKeies);
            
            var url = "<%=cp%>/cart/selectedZzim.action";
            
            
            
            $.post(url,{selectedProductKeies:selectedProductKeies,wishLength:wishLength},function(data){
            	
            });
            
            
            
            addWishLists(selectedProductKeies);
            
            
        }
    }
    /* function selectedProductToWishList() {
        var $selectedRows = $(".chk_product:checked");
        
        if ($selectedRows.length == 0) {
            alert("상품을 선택해주세요.");
        }
        else {
            var selectedProductKeies = [];
            
            $selectedRows.each(function() {
                selectedProductKeies.push($(this).parents("tr").data("product_id"));
            });
            
            addWishLists(selectedProductKeies);
        }
    } */
    
	
    
    
    function calculate() {
        var totalPrice = 0;
        var totalDeliveryPrice = 0;
        var totalDiscount = 0;
        
        var corpPrice = 0;
        var corpDiscount = 0;

        var sanjiPrice = 0;
        var sanjiDiscountedPrice = 0;
        var sanjiDeliveryPrice = 0;
        
        var totSanjiPrice = 0;
        var totSanjiDiscountedPrice = 0;
        var totSanjiDeliveryPrice = 0;
        
        var isNotDelivery = false;
        var isNotDaybreakDelivery = false;
        var isOnlyDelivery = false;
        
        $(".corp_products").find(".corpDelivery").text(0);
        
        $(".corp_products").each(function() {
            var price = 0;
            var discountedPrice = 0;
            var deliveryPrice = 0;
            
            var oldDeliveryGroup;
            $(this).find(".chk_product:checked").each(function() {
                var $row = $(this).parents("tr");
                
                price           += parseInt($row.data("price"));
                discountedPrice += parseInt($row.data("discountedprice"));
                
                if ($row.data("gbn") != 'sanji' && parseInt($row.data("deliveryprice")) > deliveryPrice)
                    deliveryPrice = parseInt($row.data("deliveryprice"));
                
                if ($row.data("gbn") == 'sanji') {
                    if(oldDeliveryGroup && $row.data("delivery_group") != oldDeliveryGroup) {
                        totSanjiPrice += sanjiPrice;
                        totSanjiDiscountedPrice += sanjiDiscountedPrice;
                        
                        if (sanjiDiscountedPrice >= 30000)
                            sanjiDeliveryPrice = 0;
                        
                        totSanjiDeliveryPrice += sanjiDeliveryPrice;
                        $(".corp_products").find(".corpDeliveryPrice_" + oldDeliveryGroup).text(comma(sanjiDeliveryPrice));
                        
                        sanjiPrice = 0;
                        sanjiDiscountedPrice = 0;
                        sanjiDeliveryPrice = 0;
                    }
                    
                    sanjiPrice += parseInt($row.data("price"));
                    sanjiDiscountedPrice += parseInt($row.data("discountedprice"));
                    
                    if (parseInt($row.data("deliveryprice")) > sanjiDeliveryPrice)
                        sanjiDeliveryPrice = parseInt($row.data("deliveryprice"));
                }
                
                if(!isNotDelivery && $row.data("isnotdelivery") )
                    isNotDelivery = true;
                
                if(!isNotDaybreakDelivery && $row.data("isnotdaybreakdelivery") )
                    isNotDaybreakDelivery = true;
                
                oldDeliveryGroup = $row.data("delivery_group");
            });
            
            if (discountedPrice >= 30000) deliveryPrice = 0;
            
            //totalPrice += discountedPrice;
            totalDeliveryPrice += deliveryPrice;
            totSanjiPrice += sanjiPrice;
            totSanjiDiscountedPrice += sanjiDiscountedPrice;
            
            if (sanjiDiscountedPrice >= 30000)
                sanjiDeliveryPrice = 0;
            totSanjiDeliveryPrice += sanjiDeliveryPrice;
            
            $(this).find(".corpDeliveryPrice_" + oldDeliveryGroup).text(comma(deliveryPrice));
            if("corp_products" == $(this).attr("id")){
                corpPrice = price;
                corpDiscount = discountedPrice;
                
                $(".groupPrice").text(comma(price));
                $(".deliveryPrice").text(comma(deliveryPrice));
                $(".discount").text(comma(price - discountedPrice));
                $(".groupTotalPrice").text(comma(discountedPrice + deliveryPrice));
            }
            
            
            if(sanjiDeliveryPrice > 0)
                $(this).find(".corpDeliveryPrice_" + oldDeliveryGroup).text(comma(sanjiDeliveryPrice));
        });
        //판매자 직배송 상품
        
        Number(totalPrice) = Number(corpPrice) + Number(totSanjiPrice);
        Number(totalDiscount) = Number(corpPrice - corpDiscount) + Number(totSanjiPrice - totSanjiDiscountedPrice);
        
        $("#totalPrice").text(comma(totalPrice - totalDiscount));
        $("#totalDiscount").text(comma(totalDiscount));
        $("#totalDeliveryPrice").text(comma(totalDeliveryPrice + totSanjiDeliveryPrice));
        //$("#totalPayment").text(comma(totalPrice + totalDeliveryPrice + totSanjiDeliveryPrice));
        $("#totalPayment").text(comma(totalPrice - totalDiscount + totalDeliveryPrice + totSanjiDeliveryPrice));
        
        if(isNotDelivery || isNotDaybreakDelivery)
            $(".isNotDelivery").show();
        else
            $(".isNotDelivery").hide();
    }
    
    function order(cartId) {
        var $orderForm = $("#orderForm").empty();
        
        if (cartId) {
            $orderForm.append("<input type='text' name='cartId' value='" + cartId + "' />");
        } else {
            if ($(".chk_product:checked").length == 0) {
                alert("주문 할 상품을 선택해주세요.");
                return;
            }
            
            $(".chk_product:checked").each(function() {
                var cartId = $(this).parents("tr").data("cartid");
                $orderForm.append("<input type='text' name='cartId' value='" + cartId + "' />");
            });
        }
        
        $orderForm.submit();
        
        return;
    }
    
    function orderAll() {
        $(".chk_product").each(function() {
            this.checked = true;
        });
        selectOrder();
    }
    
    function checkAllBtn(){
        var flag;
        if($("#checkAll").get(0).checked){
            $("#checkAll").get(0).checked = false;
            flag = false;
        }else{
            $("#checkAll").get(0).checked = true;
            flag = true;
        }
        
        $(".chk_product, .chk_group").each(function() {
            this.checked = flag;
        });
        plusCount();
    }
</script>

<!-- 현진 시작 -->
<script type="text/javascript">

window.onload=function name() {
	plusCount();
}

function doZzim(product_id) {
	
	var join_id = "${join_id}";
	var url = "/dailychan/product/zzim.action";
	
	if(join_id==""){
		
		alert("로그인 후 이용가능한 기능입니다.");
		location.href = "/dailychan/join/login.action";
		
	}else{
		
		$.post(url,{product_id:product_id,join_id:join_id},function(data){});
		alert("찜 리스트에 추가되었습니다.");
		
	}
	
	
}

function plusCount() {
	
	
	var totalPrice = Number(0);
	
	var totalDeliveryPrice = Number(0);
	
	var $selectedRows = $(".chk_product:checked");
    var pricelength = $selectedRows.length;
    var regexp = /\B(?=(\d{3})+(?!\d))/g;
   
    if ($selectedRows.length != 0) {
        
        $selectedRows.each(function() {        	
        	
        	var price = Number($(this).val());
        	totalPrice = Number(totalPrice) + Number(price);
        	
        });
    } 
    
    $("#totalPrice").html(totalPrice.toString().replace(regexp, ','));
    var totalLastPrice= Number(totalPrice)+Number('3000');
   
	if(totalPrice>50000 || totalPrice==0){

   	 	totalDeliveryPrice = "0";
   	    $("#totalDeliveryPrice").html(totalDeliveryPrice.toString().replace(regexp, ','));
   	    $("#totalLastPrice").html(totalPrice.toString().replace(regexp, ','));
		
    }else if(totalPrice<50000 || totalPrice>0){

    	totalDeliveryPrice = "3000";
    	$("#totalDeliveryPrice").html(totalDeliveryPrice.toString().replace(regexp, ','));
    	$("#totalLastPrice").html(totalLastPrice.toString().replace(regexp, ','));
    	
    }
    
}


function selectOrder() {
	
	 var $selectedRows = $(".chk_product:checked");
     var totalPrice = $("#totalPrice").html();

     //콤마제거
     totalPrice = parseInt(totalPrice.replace(/,/g,""));
     
     if ($selectedRows.length == 0) {
         alert("주문 할 상품을 선택해주세요.");
     }else if (confirm("주문하시겠습니까?")) {
         var selectedCartIds = [];
         
         $selectedRows.each(function() {
             selectedCartIds.push($(this).parents("tr").data("cart_id"));
             
         });

         location.href = "<%=cp%>/order/buy.action?selectedCartIds=" + selectedCartIds + "&totalPrice=" + totalPrice;
         
     }

}

</script>


<!-- 현진 끝 -->



</head>

<body>
<div class="allWrap">
		
	<!-- // header -->
	
    <!-- // header -->
    
    <!-- 컨텐츠 -->
    <div class="contentsArea" id="sec_order_cart">
        <div class="contentsWrap">
            <!-- 오른쪽 영역 -->
            <div class="content">
                <!-- 내용 입니다 -->
                <div class="orderStepWrap">
            
                    <!-- 주문단계 -->
                    <div class="orderStepImg" style="padding-bottom:58px" >
                        <img src="/dailychan/resources/images/order/order_ico_step1.png" alt="주문단계 - 1.장바구니" />
                    </div>
                    <!--// 주문단계 -->
                    <!-- 안내문구  --> 
                    <ul style="padding-bottom:30px;">
                        <li style="font-size:20px; font-weight:bold; float:left; color:#333">장바구니 상품 <span style="color:#6ca437">${dataCount }</span>건</li>
                        <li style="float:right">장바구니에 담긴 상품은 14일간 보관되며, 이후 찜목록으로 이동됩니다.</li>
                    </ul>
                    <div style="clear:both"></div>
                    <!--// 안내문구  --> 
                    <!-- 주문상품 -->
                <div style="border: 1px solid #ddd; padding:20px">              
                    <div class="orderTbl">
                        <div style="border-top:2px solid #6ca437"></div>
                        <table class="corp_products" id="corp_products">
                            <colgroup>
                                <col width="40px">
                                <col width="">
                                <col width="105px">
                                <col width="135px">
                                <col width="95px">
                                <col width="109px">
                                <%-- <col width="100px"> --%>
                                <col width="110px">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col"><span class="checks"><input type="checkbox" id="order11" class="chk_group" checked="checked"><label for="order11"></label></span></th>
                                    <th>상품정보</th>
                                    <th>판매가</th>
                                    <th>할인금액</th>
                                    <th>수량</th>
                                    <th>구매가</th>
                              <!--       <th>배송정보</th> -->
                                    <th>주문하기</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                             	<!-- <tr data-cartid="4325178" data-productid="2367-2282" data-price="9600" data-discountedprice="5200" data-deliveryprice="3000" data-buylimit="0" data-delivery_group="OASIS" data-isnotdelivery="false" data-isnotdaybreakdelivery="false"> -->
	                            <c:if test="${dataCount!=0 }">
	                            <c:forEach var="dto" items="${lists }">
	                            <tr data-cart_id="${dto.cart_id }"  data-product_id="${dto.product_id }" data-buylimit="${dto.product_saleLimit }" >
	                            	<td><span class="checks">
										<input type="checkbox" id="${dto.cart_id }" value="${dto.product_resultPrice*dto.cart_quantity }" class="chk_product" checked="checked"  onclick="plusCount(); return false();">
										<label for="${dto.cart_id }"></label></span>
									</td>
	                                <th scope="row" class="odTh">
	                                    <span class="odThImg">
	                                        <a href="<%=cp %>/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect }&secondSelect=${dto.product_secondSelect }&lastSelect=${dto.product_lastSelect }">	                                            
	                                            <img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품섬네일" class="thum">
	                                        </a>
                                        </span>
	                                        <a href="/product/detail/2367-2282">${dto.product_subject }</a>
	                                            <div class="deliveryNoti"></div>
	                                </th>
                                    <td class="odTd1"><fmt:formatNumber value="${dto.product_price }" pattern="#,###" /></td>
                                    <td class="odTd2"><fmt:formatNumber value="${dto.product_price-dto.product_resultPrice }" pattern="#,###" /> <p><em>[${dto.product_discount}]</em> </p></td>
                                    <td class="odTd3">
                                        <div class="orderPMWrap">
                                            <div class="orderPM">
                                                <div class="orderPMBtn">
                                                    <input type="text" id="count${dto.cart_id }" value="${dto.cart_quantity }" class="quantity" style="text-align:center;width:48px;height:28px;">
                                                    <a href="#" class="btnUp orderPMBtn_p"><img src="/dailychan/resources/images/shop/shopBtn_p.png" alt="수량 1개 더하기"></a>
                                                    <a href="#" class="btnDown orderPMBtn_m"><img src="/dailychan/resources/images/shop/shopBtn_m.png" alt="수량 1개 빼기"></a>
                                                </div>
                                            </div>
                                            <a href="#;" class="orderBtn btnUpdate">변경</a>
                                        </div>
                                    </td>
	                                <td class="odTd4 "><fmt:formatNumber value="${dto.product_resultPrice }" pattern="#,###" /></td>
	                                	                       
	                                <!-- 배송비 -->
	                               <%-- <td class="odTd5" rowspan="${dataCount }"><p class="fnB"><span class="fnB corpDelivery corpDeliveryPrice_OASIS">3,000</span></p></td> --%>
                                   
                                   <td class="odTd6">
	                                	<a href="#" class="orderBtn" onclick="doZzim('${dto.product_id}'); return false;">찜하기</a>
	                                  	<%-- <a href="<%=cp %>/cart/cartDelete.action?cart_id=${dto.cart_id }" class="orderBtn">삭제</a> --%> 
	                                  <a href="#" class="orderBtn btnDeleteRow">삭제</a>
	                                </td>
	                              
	                           		 
	                            </tr>
	                            </c:forEach>	           
								
	                            </c:if>
                                <!-- 반복문끝 -->   
                                
                                <c:if test="${dataCount==0 }">
                                <tr>
                                	<td colspan="7" class="chk_group">장바구니에 담긴 물건이 없습니다.</td>
                                </tr>
                                
                                
                                </c:if>
                                 
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            
                    <div style="height:30px" align="center" >${pageIndexList }</div>
                        
                    
                    <div class="orderBtnWrap">
                        <div class="selectBtnWrap">
                            <a href="#selectBtnWrap" onclick="checkAllBtn(); return false;">전체선택</a>
                            <input style="display:none;" type="checkbox" id="checkAll" checked="checked" />
                            <a href="#" onclick="selectedProductToWishList(); return false;">선택상품 찜하기</a>
                            <a href="#" onclick="deleteCarts(); return false;">선택삭제</a>
                        </div>
                          <div class="isNotDelivery" style="display:none;">
                        <img src="/images/common/alert.png" alt="택배불가 경고" />
                        <span>배송방법에 따른 배송 불가 상품이 포함되어 있는 경우 해당 상품은 주문 취소 될 수 있습니다.</span>
                       </div>
                    </div>  
                    <div class="orderTotalBox2">
                    	<div class="totalOrderPrice">
                            <span class="totalOrderPriceTit">총 주문금액</span>
                            
                            <span class="priceTxt">총 상품금액 <p id="totalPrice"></p>원</span>
                         
                            <!-- <span class="priceTxt">할인금액 <p id="totalDiscount">0</p>원</span> -->
                            
                            <span class="priceTxt" style="border-bottom:none">배송비 <p id="totalDeliveryPrice"></p>원</span>
                         
                            
                            <div class="clear"></div>
                        </div>
                        <div class="totalOrderPayment">
                                <span class="totalOrderPaymentTit">결제금액</span>
                                <span class="priceTxt"><p id="totalLastPrice"></p>원</span>
                        </div> 
                    
                    </div>
                    <div class="clear"></div>
                    
                            
                    <div class="orderBtnWrap">
                        <a href="${old_url}">계속 쇼핑하기</a>
                        <a href="#" onclick="selectOrder(); return false;">선택상품 주문하기</a>
                        <a href="#" class="orderBtnRed" onclick="orderAll(); return false;">전체상품 주문하기</a>
                                        
                    </div>
                </div>
                <!-- //내용 입니다 -->
            </div>
            <!-- //오른쪽 영역 -->
        </div>
    </div>
    <!-- //컨텐츠 -->
    
        <!-- footer -->
  
 <jsp:include page="/WEB-INF/views/footer.jsp"/>
    <!-- // footer -->

</div>
</body>
</html>