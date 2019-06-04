<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"><head>
    <title>데일리찬</title>
    
<jsp:include page="/WEB-INF/views/top.jsp"/>
<jsp:include page="/WEB-INF/views/right.jsp"/>

<link rel="shortcut icon" href="/favicon.ico">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72.png">
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-50@2x.png" sizes="96x96">
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72@2x.png" sizes="144x144">
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-60@3x.png" sizes="192x192">
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css">
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css?dummy=5.65">
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css">
<script src="https://connect.facebook.net/signals/config/291411411372810?v=2.8.47&amp;r=stable" async=""></script>
<script src="https://connect.facebook.net/signals/plugins/inferredEvents.js?v=2.8.47" async=""></script>
<script src="https://connect.facebook.net/signals/config/361005804747507?v=2.8.47&amp;r=stable" async=""></script>
<script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script async="" src="//www.google-analytics.com/analytics.js"></script>
<script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-PR5WGG3"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="https://t1.daumcdn.net/postcode/api/core/190515/1557895495730/190515.js"></script>

<script type="text/javascript">
window.onload = function () {

	quickPage('1');
	$('#miniArticle').css("top",450);
	
}

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

function recommendPopUp() {
	
	var join_id = "${join_id}";
	var productRecommandCount = "${recommandCount}";
	
	if(join_id==""){
		
		alert("로그인 후 이용가능한 기능입니다.");
		location.href = "/dailychan/join/login.action";
		return;
		
	}
	
	if(productRecommandCount=="0"){
		
		alert("추천 가능한 상품이 없습니다.");
		return;
		
	}

	$('.popDim').show();
	$('.oasisDim').show();
	$('#custRecommendDialog').show();

}



function sendProductRecommand() {
	
	var product_id = $("#product_subject").children(":selected").attr("id");
	var product_subject = $('#product_subject option:selected').val();
	var productRecommand_reason = $('#productRecommand_reason').val();
	var url = "/dailychan/product/event/insertProductRecommand.action";

	if(product_subject=="select"){
		
		alert("추천 하실 상품을 선택해 주십시오.");
		return;
		
	}else{

		$.post(url,{product_id:product_id,product_subject:product_subject,
			productRecommand_reason:productRecommand_reason},function(data){});
		
		alert("추천 상품 등록이 완료되었습니다.");
		closeProductRecommendForm();
		return;
	}

}

function closeProductRecommendForm() {

	$('.popDim').hide();
	$(".oasisLayerPop").hide();
	$('.oasisDim').hide();
	 
	$('.oasisDim').hide(50, function(){
		$('body').css("overflow-y","auto");
	});
}

function addZzim(product_id) {
	
	var join_id = "${join_id}";
	var url = "/dailychan/product/zzim.action";

	if(join_id==""){
		
		alert("로그인 후 이용가능한 기능입니다.");
		location.href = "/dailychan/join/login.action";
		
	}else{
		
		$.post(url,{product_id:product_id,join_id:join_id},function(data){});
		alert("찜리스트 추가완료!");
		
	}
	
}

function addCart(product_id) {

	var join_id = "${join_id}";

	if(join_id==""){
		
		alert("로그인후 가능합니다.");
		location.href="<%=cp%>/join/login.action";
	}
	
	if(join_id!=""){
		
		var cart_quantity = 1;
		var url = "<%=cp%>/cart/addCart.action";
		
		$.post(url,{product_id:product_id,cart_quantity:cart_quantity},function(data){
		
			var params = "장바구니 추가 완료!"
			alert(params);
			
		});
	}
}

function nowBuy(product_id,product_resultPrice) {

	var join_id = "${join_id}";
	var product_count = 1;

	if(join_id==""){
		
		alert("로그인 후 이용가능한 기능입니다.");
		location.href = "/dailychan/join/login.action";
		return;
		
	}
	
	location.href = "/dailychan/order/nowBuy.action?product_count=" + product_count + "&product_id=" + product_id +
			"&product_price=" + product_resultPrice;

	
}

</script>

<!-- 현우끝 -->

<body>
<div class="allWrap">
    
    <!-- 컨텐츠 -->
    <div class="contentsArea" id="sec_product_list">
        <div class="contentsWrap">
            
            <div class="list_top_banner" style="background:url('/dailychan/resources/images/shopBanner/img_top_1_62.jpg?dummy=0.01') no-repeat center top;">
                <div class="contents">
                    &nbsp;
                </div>
            </div>
            
            <!-- 오른쪽 영역 -->
            <div class="content">
                <!-- 내용 입니다 -->
                
                <div class="productList">
                     
				<!-- 카테고리선택 -->

					<div class="sec_list_area">
						
						<span>
							<a href="/dailychan/main.action">홈</a>
						</span>
						
								<c:if test="${secondSelect eq '' }">
									<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|" /></span>							
									<span>
										<strong><a href="/dailychan/product/event/list.action?firstSelect=${firstSelect }&secondSelect=${secondSelect }&categoryId=1&page=${numPerPage}">${secondSelect }</a></strong>
									</span>
								</c:if>
									
								<c:if test="${secondSelect ne '' }">
									<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|" /></span>
									<span>
										<strong><a href="/dailychan/product/event/list.action?firstSelect=${firstSelect }&secondSelect=${secondSelect }&categoryId=0&page=${numPerPage}">${secondSelect }</a></strong>
									</span>
									<!-- 
									<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|" /></span> -->
									
								</c:if>
						
						<div class="clear"></div>
					</div>
					
		                    <!-- 서브 카테고리 -->
		                    <div class="prod_list_category">
		                    	<ul>
		                    		<c:forEach var="dto" items="${lists3 }">
		                    			<c:if test="${dto.productTag_secondSelect eq secondSelect }">
		                        		<li class="on">
		                        			<a href="/dailychan/product/event/list.action?firstSelect=${dto.productTag_firstSelect }&secondSelect=${dto.productTag_secondSelect }&categoryId=1&sort=${sort }&direction=${direction }&page=${numPerPage}">
		                        			<span>${dto.productTag_secondSelect }</span>
		                        			</a>
		                        		</li>
		                        		</c:if>
		                        		
		                        		<c:if test="${dto.productTag_secondSelect ne secondSelect }">
		                        		<li>
		                        			<a href="/dailychan/product/event/list.action?firstSelect=${dto.productTag_firstSelect }&secondSelect=${dto.productTag_secondSelect }&categoryId=1&sort=${sort }&direction=${direction }&page=${numPerPage}">
		                        			<span>${dto.productTag_secondSelect }</span>
		                        			</a>
		                        		</li>
		                        		</c:if>
		                        		
		                        	</c:forEach>
		                        </ul>
		                    </div>
		                	<!--// 서브 카테고리 -->

                    <!-- //카테고리선택 -->

                    <div class="prodList">
                
                        <div class="recommend01">
                            <div class="boxarea">
	                            
	                            
	                                <a href="#;" onclick="javascript:recommendPopUp();return false;">      
	                            
	                                   <img src="/dailychan/resources/images/etc/w_banner_recommend.jpg">
	                                </a>
                            </div>
                            <div>
                                <ul> 
	                                
	                                    <!-- Best 추천 상품 -->
	                                    <!--판매중지 클래스명 : stopSell / 신상품 : newSellTxt / 세일 : saleSellTxt / 세일+신상품 : saleNewSellTxt -->
	                                    <c:forEach var="dto" items="${bestRecommandLists }">
	                                    <li class="saleSellTxt" style="padding: 10px 0 0 15px; border: none;">
	                                        <div class="thum">
	                                            <c:if test="${dto.product_lastSelect != null }">
	                                            
				                                    <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect }&secondSelect=${dto.product_secondSelect }&lastSelect=${dto.product_lastSelect}">
				                                    </c:if>
				                                    <c:if test="${dto.product_lastSelect == null }">
				                                    <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect }&secondSelect=${dto.product_secondSelect }">
				                                    </c:if>
				                                    <c:if test="${dto.product_secondSelect == null }">
				                                    <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect }">
				                                    </c:if>
	                                                <img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품이미지">
	                                                
	                                                <!-- ico : 할인률 -->
	                                                <span class="saleSellTxt"><span>${dto.product_discount }<em>%</em></span></span>

	                                                
	                                                <div class="pdLikeWrap">
	                                                    <img src="/dailychan/resources/images/shop/pd_like.png">
	                                                    <span>
	                                                        
	                                                      <c:if test="${dto.product_like!=null }">
                                                              ${dto.product_like }%
                                                          </c:if>
                                                          
                                                          <c:if test="${dto.product_like==null }">
                                                              100%
                                                          </c:if>
	                                                          
	                                                    </span>
	                                                </div>
	                                            </a>
	                                        </div>
	                                        <a href="/product/detail/3221-4915?categoryId=62" class="prodName">
	                                          ${product_subject }
	                                        </a>
	                                        <div class="prodPrice">
	                                            <span class="prodPrice2"><fmt:formatNumber value="${dto.product_price }" pattern="#,###" /><em>원</em><span></span></span>
	                                            <span class="prodPrice1"><fmt:formatNumber value="${dto.product_resultPrice }" pattern="#,###" /><em>원</em></span>
	                                        </div>
	                                        <!-- 상품 오버시 노출 -->
	                                        <div class="pop_view" style="display: none;">
	                                            <div class="positionR">
	                                                <div class="icList">
	                                                    <ul>
	                                                        <li>
	                                                            <a href="#" onclick="addZzim('${dto.product_id}'); return false;">
																	<img src="/dailychan/resources/images/shop/shopIcon1.png" alt="찜하기">
																</a>
	                                                        </li>
	                                                        <li>
	                                                            <a href="#" onclick="addCart('${dto.product_id}'); return false;">
																	<img src="/dailychan/resources/images/shop/shopIcon2.png" alt="장바구니 넣기">
																</a>
	                                                        </li>
	                                                        <li>
	                                                            <a href="#" onclick="nowBuy('${dto.product_id}','${dto.product_resultPrice }'); return false;">
																	<img src="/dailychan/resources/images/shop/shopIcon3.png" alt="바로구매">
															    </a>
	                                                        </li>
	                                                    </ul>
	                                                </div>
	                                                <p>
	                                                    <a href="/product/detail/3221-4915?categoryId=62">
	                                                        <img src="/images/shop/pop_product_more.png" alt="">
	                                                    </a>
	                                                </p>
	                                            </div>
	                                        </div>
	                                        <!-- //상품 오버시 노출 -->
	                                    </li>
	                                    </c:forEach>
	                                    <!-- //상품 1set -->
		                                
		                            
		                            
		                            <div class="clear"></div>
                                </ul>
                            </div>
                        </div>
                        <ul style="overflow:hidden">
                            
                            
	                                    <!-- 추천상품 -->
	                                    <!--판매중지 클래스명 : stopSell / 신상품 : newSellTxt / 세일 : saleSellTxt / 세일+신상품 : saleNewSellTxt -->
	                                    
	                                    <c:forEach var="dto" items="${recommandLists }">
	                                    <li class="saleSellTxt">
	                                        <div class="thum">
	                                        
	                                            	<c:if test="${dto.product_lastSelect != null }">
				                                    <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect }&secondSelect=${dto.product_secondSelect }&lastSelect=${dto.product_lastSelect}">
				                                    </c:if>
				                                    <c:if test="${dto.product_lastSelect == null }">
				                                    <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect }&secondSelect=${dto.product_secondSelect }">
				                                    </c:if>
				                                    <c:if test="${dto.product_secondSelect == null }">
				                                    <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect }">
				                                    </c:if>
				                                    
	                                                <img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품이미지">
	                                                
	                                                <!-- ico : 할인률 -->
	                                                
	                                                     <span class="saleSellTxt"><span>${dto.product_discount }<em>%</em></span></span>
	                                                 
	                                                <div class="pdLikeWrap">
	                                                    <img src="/dailychan/resources/images/shop/pd_like.png">
	                                                    <span>
	                                                        
	                                                      <c:if test="${dto.product_like!=null }">
                                                              ${dto.product_like }%
                                                          </c:if>
                                                          
                                                          <c:if test="${dto.product_like==null }">
                                                              100%
                                                          </c:if>
	                                                          
	                                                    </span>
	                                                </div>
	                                            </a>
	                                        </div>
	                                        <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}" class="prodName">
	                                        ${dto.product_subject }
	                                        </a>
	                                        <div class="prodPrice">
	                                            <span class="prodPrice2"><fmt:formatNumber value="${dto.product_price }" pattern="#,###" /><em>원</em><span></span></span>
	                                            <span class="prodPrice1"><fmt:formatNumber value="${dto.product_resultPrice }" pattern="#,###" /><em>원</em></span>
	                                        </div>
	                                        <!-- 상품 오버시 노출 -->
	                                        <div class="pop_view" style="display: none;">
	                                            <div class="positionR">
	                                                <div class="icList">
	                                                    <ul>
	                                                        <li>
	                                                            <a href="#" onclick="addZzim('${dto.product_id}'); return false;">
																	<img src="/dailychan/resources/images/shop/shopIcon1.png" alt="찜하기">
																</a>
	                                                        </li>
	                                                        <li>
	                                                            <a href="#" onclick="addCart('${dto.product_id}'); return false;">
																	<img src="/dailychan/resources/images/shop/shopIcon2.png" alt="장바구니 넣기">
																</a>
	                                                        </li>
	                                                        <li>
	                                                           <a href="#" onclick="nowBuy('${dto.product_id}','${dto.product_resultPrice }'); return false;">
																<img src="/dailychan/resources/images/shop/shopIcon3.png" alt="바로구매">
															   </a>
	                                                        </li>
	                                                    </ul>
	                                                </div>
	                                                <p>
	                                                    <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}">
	                                                        <img src="/dailychan/resources/images/shop/pop_product_more.png" alt="">
	                                                    </a>
	                                                </p>
	                                            </div>
	                                        </div>
	                                        <!-- //상품 오버시 노출 -->
	                                    </li>
	                                    </c:forEach>
	                                    <!-- //상품 1set -->

                        
                            <div class="clear"></div>
                        </ul>
                        <div class="clear"></div>
                    </div>
                    <!--// 상품리스트 -->

                    
                </div>
                
                <!-- //내용 입니다 -->
            </div>
            <!-- //오른쪽 영역 -->
        </div>
    </div>
    <!-- //컨텐츠 -->

<div class="popDim" style="display: none;"></div>


<!-- lpopStyWrap (고객 추천 상품) -->

<div id="custRecommendDialog" class="oasisLayerPop" style="display: none;">
	<div class="oasisLayerPop_in">
		 <div class="oasisLPtit">
           	<strong class="comLayerTit">상품 추천하기</strong>
           </div>

		<div class="oasisLPconWrap">
			<!-- 이 안에 팝업 내용 넣기 -->
			<div class="comLayerCon">
				<div class="oasisLPcon1" style="text-align:left;">
					&nbsp;&nbsp;추천하신 상품이 채택될 경우 소정의 상품을 지급해드립니다.<br>
					&nbsp;&nbsp;많은 관심과 의견 바랍니다.
                </div>

				<div class="oasisLPcon2">
					<form id="contentForm" name="productRecommand" method="post">
						<table class="tableComWrite">
							<colgroup>
                                <col width="110">
                                <col width="45%">
                                <col width="100">
                                <col width="55%">
                            </colgroup>
							<tbody>
								<tr>
									<th>상품명</th>
									<td colspan="3">
									<select name="product_subject" id="product_subject">
										<option value="select">추천 하실 상품을 선택해 주십시오.</option>
										<c:forEach var="dto" items="${userRecommandLists }">
										<option value="${dto.product_subject }" id="${dto.product_id }">${dto.product_subject }</option>
										</c:forEach>
									</select>
									<input type="hidden" name="product_id" id="product_id" value="">
									</td>
								</tr>
								<tr>
									<th>추천 이유</th>
									<td colspan="3">
										<div class="cmTxtInput">
											<textarea name="productRecommand_reason" id="productRecommand_reason" class="cmMtinput" placeholder="추천 이유를 입력해 주세요." style="height:240px !important"></textarea>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			
			<div class="oasisLPcon3 mgT25">
                 <a href="#" onclick="sendProductRecommand(); return false;">추천하기</a>
                 <a href="#" onclick="closeProductRecommendForm(); return false;" class="oasisMapClose2">취소하기</a>
            </div>
			<!-- //이 안에 팝업 내용 넣기 -->
		</div>
		<div class="comWriteClose">
            <a href="#" onclick="closeProductRecommendForm(); return false;"><span>닫기</span></a>
        </div>
	</div>
</div>

<!-- //oasisLayerPop (고객 추천 상품) -->
<jsp:include page="/WEB-INF/views/footer.jsp"/>

</body>
</html>