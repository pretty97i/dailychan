<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<title>데일리찬::믿을 수 있는 먹거리</title>

<jsp:include page="/WEB-INF/views/top.jsp">
	<jsp:param value="${sort }" name="sort"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/right.jsp"/>

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
	<!-- 컨텐츠 -->
	<div class="contentsArea" id="sec_best50">
		<div class="contentsWrap">
			 
			<!-- top banner-->
			<div class="list_top_banner img_best50">
				<div class="contents">
					<p></p>
				</div>
			</div>
			<!-- //top banner-->

			<!-- BEST 01 ~ 05 area -->
			<div class="best01_05_area">
				<div class="contents">

					<!-- section list -->
					<div class="sec_list_area">
						<span><a href="/">홈</a></span>
						<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|" /></span>
						<span><strong>베스트샵</strong></span>
					</div>
					<!-- //section list -->

					<!-- BEST 01 ~ 05 -->
					<div class="best01_05_list">
						
						
					<c:forEach var="dto" items="${best5Lists }">
					<c:choose>
						<c:when test="${dto.bestNum eq '01' }">
							<!-- BEST 01 -->
								<div class="best_01">
									<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}">
									<!-- img : thumnail -->
									<div class="thumnail_area">
										<p>
											<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName }" alt="상품이미지">
										</p>
										<!-- ico : BEST 01 -->
										<div class="ico_best_1">
											<span>BEST</span>
											<strong>${dto.bestNum }</strong>
										</div>
										<span class="bg_light_gray">&nbsp;</span>
									</div>
									<!-- //img : thumnail -->
									<div class="tit_product">
										${dto.product_subject }
									</div>
									<div class="txt_discount_won">
										<span class="price_before"><del>${dto.price }</del></span>
										<span class="price_after">${dto.result_price }원</span>
									</div>
									<div class="pop_view">
										<a href="#" onclick="addCart1('${dto.product_id}'); return false;">
											<img src="/dailychan/resources/images/shop/btn_cart_circle.png" alt="장바구니 담기" />
										</a>
										<a href="#" onclick="nowBuy('${dto.product_id}','${dto.product_resultPrice }'); return false;">
											<img src="/dailychan/resources/images/shop/btn_paynow_circle.png" alt="바로 구매" />
										</a>
									</div>
									</a>	
								</div>
							<!-- //BEST 01 -->
						</c:when>	
							
						<c:when test="${dto.bestNum ne '01' }">
						<!-- BEST 02 ~ 05 -->
								<div class="best_list best_${dto.bestNum }">
									<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}">
										<!-- img : thumnail -->
										<div class="thumnail_area">
											<p>
												<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName }" alt="상품이미지">
											</p>
											<span class="bg_light_gray">&nbsp;</span>
										</div>
										<!-- //img : thumnail -->
										<!-- ico : BEST 03 -->
										<div class="ico_best_5">
											<span>BEST</span>
											<strong>${dto.bestNum }</strong>
										</div>
										<div class="tit_product">
											${dto.product_subject }
										</div>
										<div class="txt_discount_won">
											<span class="price_before"><del>${dto.price }원</del></span>
											<span class="price_after">${dto.result_price }원</span>
										</div>
										<div class="pop_view">
											<a href="#" onclick="addCart1('${dto.product_id}'); return false;">
												<img src="/dailychan/resources/images/shop/btn_cart_circle.png" alt="장바구니 담기" />
											</a>
											<a href="#" onclick="nowBuy('${dto.product_id}','${dto.product_resultPrice }'); return false;">
												<img src="/dailychan/resources/images/shop/btn_paynow_circle.png" alt="바로 구매" />
											</a>
										</div>
									</a>
								</div>
							<!-- //BEST 02 ~ 05 -->	
							</c:when>

						</c:choose>		
	
						</c:forEach>			
						
						<!-- //BEST 02 ~ 05 -->
					</div>
					<!-- //BEST 01 ~ 05 -->

				</div>
			</div>
			<!-- //BEST 01 ~ 05 area -->

			<!-- 오른쪽 영역 -->
			<div class="content"> 
				<!-- 내용 입니다 -->

				<div class="productList">
					<!-- 상품리스트 -->
					<div class="prodList">
						<ul>
							
							<c:forEach var="dto" items="${bestLists }">
										
										<!-- 상품 1set -->
										<!--판매중지 클래스명 : stopSell / 신상품 : newSellTxt / 세일 : saleSellTxt / 세일+신상품 : saleNewSellTxt -->
										<li class="saleSellTxt">
											<div class="thum">
												<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}">
													<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName }" alt="상품이미지">
													<!-- img : thum bg -->
													<span class="bg_light_gray">&nbsp;</span>
													<!-- txt : count -->
													<span class="ico_best50">${dto.bestNum }</span>
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
											<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}" class="prodName">
												${dto.product_subject }
											</a>
											<div class="prodPrice">
												<span class="prodPrice2">${dto.price }<em>원</em><span></span></span>
												<span class="prodPrice1">${dto.result_price }<em>원</em></span>
											</div>
											<!-- 상품 오버시 노출 -->
											<div class="pop_view">
												<div class="positionR">
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
														<p>
															<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}">
																<img src="/dailychan/resources/images/shop/pop_product_more.png" alt="" />
															</a>
														</p>
												</div>
											</div>
											<!-- //상품 오버시 노출 -->
										</li>
										<!-- //상품 1set -->
										
									</c:forEach>
								
									<li ></li>
								
									<li ></li>
								
									<li ></li>
								
							
						</ul>
						<!--// 상품리스트 -->
						<div class="clear"></div>
					</div>

				</div>

				<!-- //내용 입니다 -->
			</div>
			<!-- //오른쪽 영역 -->
			
		</div>
	</div>
	<!-- //컨텐츠 -->

<form id="orderForm" action="/order/prepare/delivery" method="post" style="display: none;"></form>

<div id="isolationField" style="position: fixed; top: 0; bottom: 0; right: 0; left: 0; display: none; z-index: 999;"></div>
	<!-- // footer -->
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>