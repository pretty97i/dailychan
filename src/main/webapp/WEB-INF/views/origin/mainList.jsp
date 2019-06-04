<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>

<jsp:include page="/WEB-INF/views/top.jsp">
	<jsp:param value="${sort }" name="sort"/>
</jsp:include>
<jsp:include page="../right.jsp"/>
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js"></script>

<script type="text/javascript">

window.onload = function () {

	quickPage('1');
	
}

function pageChange(str) {

	var firstSelect = "${firstSelect}";
	//var secondSelect = "${secondSelect}";
	//var categoryId = "${categoryId}";
	var param;
		
	if(secondSelect==null){
		param = "?firstSelect=" + firstSelect + "&page=" + str;
	}else{
		param = "?firstSelect=" + firstSelect + "&page=" + str;
	}
	
	location.href = "/dailychan/product/origin/list.action" + param;

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

function addCart1(product_id) {

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

</head>

<body>


<div class="allWrap">
	<!-- header -->
	

	<!-- 컨텐츠 -->
	<div class="contentsArea" id="sec_direct">
		<div class="contentsWrap">
			
		<c:if test="${firstSelect eq '산지직송' }">	
			<div class="list_top_banner img_direct">
				<div class="contents">
					&nbsp;
				</div>
			</div>
			
		</c:if>
		
			<c:if test="${firstSelect eq '오!감동' }">	
			<div class="list_top_banner img_oh_hot_deal">
				<div class="contents">
					&nbsp;
				</div>
			</div>
			
		</c:if>

			
			<!-- 오른쪽 영역 -->
			<div class="content">
				<!-- 내용 입니다 -->
				
				<div class="productList">
					 
					<!-- 카테고리선택 -->

					<div class="sec_list_area">
						
						
						<span>
							<a href="/dailychan/main.action">홈</a>
						</span>
						
								<c:if test="${firstSelect eq '' }">
									<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|" /></span>							
									<span>
										<strong><a href="/dailychan/product/origin/list.action?firstSelect=${firstSelect }&page=${numPerPage}">${firstSelect }</a></strong>
									</span>
								</c:if>
									
								<c:if test="${firstSelect ne '' }">
									<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|" /></span>
									<span>
										<a href="/dailychan/product/origin/list.action?firstSelect=${firstSelect }&page=${numPerPage}">${firstSelect }</a>
									</span>
									<!-- 
									<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|" /></span> -->
									
								</c:if>
						
					
					</div>

		<div class="productList">
                    
					<div class="prodList">
					
					
							<ul>
										
								<c:forEach var="dto" items="${lists }">	
										
										<!-- 상품 1set -->
										<!--판매중지 클래스명 : stopSell / 신상품 : newSellTxt / 세일 : saleSellTxt / 세일+신상품 : saleNewSellTxt -->
										<li class="saleSellTxt">
											<div class="thum">
												<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${firstSelect}">
													<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품이미지">
													
		                    						
			                    						<!-- ico : 할인률 -->
			                    						<span class="saleSellTxt"><span>${dto.product_discount }<em>%</em></span></span>
		                    						
		                    						
												</a>
											</div>
											<div class="like_review_list">
	                                          <div class="likeWrap">
	                                              <img src="/dailychan/resources/images/shop/ico_like.png" alt="만족도">
	                                              <span>
	                                                
                                                          <c:if test="${dto.product_like!=null }">
                                                              ${dto.product_like }%
                                                          </c:if>
                                                          
                                                          <c:if test="${dto.product_like==null }">
                                                              100%
                                                          </c:if>
	                                                
	                                              </span>
	                                          </div>
	                                          <div class="commentWrap">
	                                              <img src="/dailychan/resources/images/shop/ico_review.png" alt="구매후기">
	                                              <span>
	                                                   ${dto.reviewDataCount }
	                                              </span>
	                                          </div>
	                                        </div>
											<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${firstSelect}" class="prodName">
												${dto.product_subject }
											</a>
											
											<div class="prodPrice">
												<span class="prodPrice2">
													${dto.price }<em>원</em><span></span>
												</span>
												<span class="prodPrice1">
													${dto.result_price }<em>원</em>
												</span>
											</div>
											
											<div class="icList">
												<ul>
													<li>
														<a href="#" onclick="addZzim('${dto.product_id}'); return false;">
															<img src="/dailychan/resources/images/shop/shopIcon1_2.png" alt="찜하기">
														</a>
													</li>
													<li>
														<a href="#" onclick="addCart1('${dto.product_id}'); return false;">
															<img src="/dailychan/resources/images/shop/shopIcon2_2.png" alt="장바구니 넣기">
														</a>
													</li>
													<li>
														<a href="#" onclick="nowBuy('${dto.product_id}','${dto.product_resultPrice }'); return false;">
															<img src="/dailychan/resources/images/shop/shopIcon3_2.png" alt="바로구매">
														</a>
													</li>
												</ul>
											</div>
		
											<!-- 상품 오버시 노출 -->
											<div class="pop_view" style="display: none;">
												<div class="positionR">
													<p>
														<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${firstSelect}">
															<img src="/dailychan/resources/images/shop/pop_direct_more.png" alt="">
														</a>
													</p>
												</div>
											</div>
											<!-- //상품 오버시 노출 -->
										</li>
										
										</c:forEach>
									
									</ul>
							
							
						
			
					</div>
					<!--// 상품리스트 -->
					
				<div class="pagingWrap">

					<c:if test="${dataCount!=0 }">
						${pageIndexList }
					</c:if>

					<c:if test="${dataCount==0 }">
						등록된게시물이 없습니다.
					</c:if>

				</div>
					
				</div>
				
				<!-- //내용 입니다 -->
			</div>
			<!-- //오른쪽 영역 -->
		</div>
	</div>
	<!-- //컨텐츠 -->
	
	<form action="/dailychan/product/article.action" method="post"> 
		<input type="hidden" name="firstSelect"/>
		<input type="hidden" name="secondSelect"/>
	</form>

</div>

	

  
</div>
</body>
</html>

    