<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();


	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>

<jsp:include page="../../top.jsp"/>


<jsp:include page="../../right.jsp" flush="false">
	<jsp:param value="${cookieLists }" name="dto"/>
</jsp:include>

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
	$('#miniArticle').css("top",450);
	
}

function pageChange(str) {

	var firstSelect = "${firstSelect}";
	var secondSelect = "${secondSelect}";
	var categoryId = "${categoryId}";
	var param;
		
	if(secondSelect==null){
		param = "?firstSelect=" + firstSelect + "&secondSelect=" + secondSelect;
		param += "&categoryId=" + categoryId + "&page=" + str;
	}else{
		param = "?firstSelect=" + firstSelect + "&secondSelect=" + secondSelect;
		param +="&categoryId=" + categoryId + "&page=" + str;
	}
	
	location.href = "/dailychan/product/event/list.action" + param;

	
}

function zzimList(product_id) {
	
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

function checkCookie(product_id){
	
	var product_subject=getCookie("product_subejct")

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
	<div class="contentsArea" id="sec_product_list">
		<div class="contentsWrap">
			
			<c:if test="${secondSelect eq '외식 같은 집밥' }">
			<div class="list_top_banner"
				style="background:url('/dailychan/resources/images/shopBanner/img_top_1_57.jpg') no-repeat center top;">
				<div class="contents">
					&nbsp;
				</div>
			</div>
			</c:if>		
			
			
			<c:if test="${secondSelect eq '환절기 건강식품' }">	
			<div class="list_top_banner"
				style="background:url('/dailychan/resources/images/shopBanner/img_top_1_59.jpg') no-repeat center top;">
				<div class="contents">
					&nbsp;
				</div>
			</div>
			</c:if>	
			
			
			<c:if test="${secondSelect eq '간편선물세트' }">
			<div class="list_top_banner"
				style="background:url('/dailychan/resources/images/shopBanner/img_top_1_58.jpg') no-repeat center top;">
				<div class="contents">
					&nbsp;
				</div>
			</div>
			</c:if>		
			
			
			<c:if test="${secondSelect eq '아침식사대용' }">	
			<div class="list_top_banner"
				style="background:url('/dailychan/resources/images/shopBanner/img_top_1_60.jpg') no-repeat center top;">
				<div class="contents">
					&nbsp;
				</div>
			</div>
			</c:if>	
			
			
			<c:if test="${secondSelect eq '우리아이안심' }">
			<div class="list_top_banner"
				style="background:url('/dailychan/resources/images/shopBanner/img_top_1_61.jpg') no-repeat center top;">
				<div class="contents">
					&nbsp;
				</div>
			</div>
			</c:if>		
			
			<c:if test="${secondSelect eq '고객추천' }">
			<div class="list_top_banner"
				style="background:url('/dailychan/resources/images/shopBanner/img_top_1_62.jpg') no-repeat center top;">
				<div class="contents">
					&nbsp;
				</div>
			</div>
			</c:if>	
			
			<c:if test="${secondSelect eq '따뜻한 영양간식' }">
			<div class="list_top_banner"
				style="background:url('/dailychan/resources/images/shopBanner/img_top_1_61.jpg') no-repeat center top;">
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

					<%-- 	<!-- best 3 area -->
						<c:if test="${categoryId eq 0 }">
						<div class="deal_area list_best_3">
							<dl>
								<!-- 하단 리스트 -->
								
								<dd id="best3SlideList">
									<ul>
									
									<c:forEach var="dto2" items="${lists2 }">
										<!-- BEST -->
										<li>
											<a href="/dailychan/product/article.action?product_id=${dto2.product_id }">
												<div class="product_list_3">
													<div class="ico_best_3">
														<span>BEST</span>
														<strong>${dto2.bestNum }</strong>
													</div>
													<!-- img : 238 * 238 -->
													<div class="img_best_3">
														<!-- img : cover -->
														<span>&nbsp</span>
														<img src="/dailychan/resources/images/product/${dto2.product_mainSaveFileName}" alt="상품명1">
													</div>
													<!-- img : hover -->
													<div class="ico_best_3_view">
														<img src="/dailychan/resources/images/shop/bg_cover_view.png" alt="" />
													</div>
													<!-- txt : 상품명 -->
													<strong>${dto2.product_subject }</strong>
													<!-- txt : 할인가 -->
													<div class="txt_discount_won">
														<span class="price_before">
															<del>${dto2.price }원</del>
														</span>
															&nbsp;&nbsp;
														<span class="price_after">
															<strong>${dto2.result_price }원</strong>
														</span>
													</div>
												</div>
											</a>
										</li>
									
									<!-- //BEST -->
									</c:forEach>
									
									</ul>
								</dd>
								<!-- btn : 이전 -->
								<span class="btn_best3_prev">
									<a href="#prev">
										<img src="/dailychan/resources/images/shop/btn_best3_prev.png" alt="이전" />
									</a>
								</span>
								<!-- btn : 다음 -->
								<span class="btn_best3_next">
									<a href="#next">
										<img src="/dailychan/resources/images/shop/btn_best3_next.png" alt="다음" />
									</a>
								</span>
								<!-- //하단 리스트 -->
							</dl>
						</div>
						</c:if> --%>
						<script type="text/javascript">
						$(document).ready(function(){

							var slideNow= 1;
							var slidePage = Math.ceil(($('#best3SlideList').find('li').length / 3));
							var slideWidth = (($('#best3SlideList li').width()+74) * 3) - 25 ; //74px 여백

							$('.btn_best3_prev').click(function(){
								if (slideNow == 1){
								} else {
									$('#best3SlideList ul').animate({left: '+='+slideWidth+'px'});
									slideNow -= 1;

									console.log('slidePage = '+slidePage , ' / slideNow = '+slideNow);
								}
							});

							$('.btn_best3_next').click(function(){
								if (slideNow < slidePage){
									$('#best3SlideList ul').animate({left: '-='+slideWidth+'px'});
									slideNow += 1;

									console.log('slidePage = '+slidePage , ' / slideNow = '+slideNow);
								} else {
									
								}
							});

						});
					</script>
						<!-- //best 3 area -->
					
					
					<!-- //카테고리선택 -->

					<!-- 상품리스트 -->
                    <div class="prodListTop">
						
						<div class="sort_area">
							
							<ul>
								<!-- 신상품 -->
								<c:if test="${sort=='product_id' }">
									<li class='on'>
										<a href="${listUrl }"> 신상품순</a>
									</li>
								</c:if>
								
								<c:if test="${sort!='product_id' }">
									<li>
										<a href="${listUrl }"> 신상품순</a>
									</li>
								</c:if>
								
								<!-- 베스트 -->
								<c:if test="${sort=='product_saleCount' }">
									<li class='on'>
										<a href="${listUrl }&sort=product_saleCount&direction=desc&page=${numPerPage}"> 베스트순</a>
									</li>
								</c:if>
								
								<c:if test="${sort!='product_saleCount' }">
									<li>
										<a href="${listUrl }&sort=product_saleCount&direction=desc&page=${numPerPage}"> 베스트순</a>
									</li>
								</c:if>
								
								<!-- 상품명 -->
								<c:if test="${sort=='product_subject' }">
									<li class='on'>
										<a href="${listUrl }&sort=product_subject&direction=asc&page=${numPerPage}"> 상품명순</a>
									</li>
								</c:if>
								
								<c:if test="${sort!='product_subject' }">
									<li>
										<a href="${listUrl }&sort=product_subject&direction=asc&page=${numPerPage}"> 상품명순</a>
									</li>
								</c:if>
								
								<!-- 낮은 가격순 -->
								<c:if test="${sort=='product_price' and direction=='asc'}">
									<li class='on'>
										<a href="${listUrl }&sort=product_price&direction=asc&page=${numPerPage}"> 낮은가격순</a>
									</li>
								</c:if>
								
								<c:if test="${sort=='product_price' and direction=='desc' or sort=='product_id' or sort=='product_saleCount' or sort=='product_subject'  }">
									<li>
										<a href="${listUrl }&sort=product_price&direction=asc&page=${numPerPage}"> 낮은가격순</a>
									</li>
								</c:if>
				
								<!-- 높은 가격순 -->
								<c:if test="${sort=='product_price' and direction=='desc'}">
									<li class='on'>
										<a href="${listUrl }&sort=product_price&direction=desc&page=${numPerPage}"> 높은가격순</a>
									</li>
								</c:if>
								
								<c:if test="${sort=='product_price' and direction=='asc' or sort=='product_id' or sort=='product_saleCount' or sort=='product_subject' }">
									<li>
										<a href="${listUrl }&sort=product_price&direction=desc&page=${numPerPage}"> 높은가격순</a>
									</li>
								</c:if>
								
							</ul>
							<span class="selectBoxWrap">
								<label for="selectNumber">${numPerPage }개씩 보기</label>
								<select id="selectNumber" onchange="pageChange(this.value);">
								<c:if test="${numPerPage==20 }">
	                                <option value="20" selected='selected'>&nbsp;&nbsp;20개씩</option>
	                                <option value="40" >&nbsp;&nbsp;40개씩</option>
	                                <option value="60" >&nbsp;&nbsp;60개씩</option>
	                            </c:if>
	                            <c:if test="${numPerPage==40 }">
	                                <option value="20" >&nbsp;&nbsp;20개씩</option>
	                                <option value="40" selected='selected'>&nbsp;&nbsp;40개씩</option>
	                                <option value="60" >&nbsp;&nbsp;60개씩</option>
	                            </c:if>
	                            <c:if test="${numPerPage==60 }">
	                                <option value="20" >&nbsp;&nbsp;20개씩</option>
	                                <option value="40" >&nbsp;&nbsp;40개씩</option>
	                                <option value="60" selected='selected'>&nbsp;&nbsp;60개씩</option>
	                            </c:if>
	                            </select>
							</span>
						</div>
					</div>
                    
		<div class="prodList">
			<ul>

					<c:forEach var="dto" items="${lists }">
						<li class="saleSellTxt">
							<div class="thum">
								<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${firstSelect }&secondSelect=${secondSelect }">
									<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품이미지">
									
                  						<!-- ico : 할인률 -->
                  						<span class="saleSellTxt"><span>${dto.product_discount }<em>%</em></span></span>
                  						
									
									
									
									
									
									<div class="pdLikeWrap">
									    <img src="/dailychan/resources/images/shop/pd_like.png"/>
									    <span>
                                                     
                                                       
                                                           99.5%
                                                       
                                                       
                                                     
                                                 </span>
									</div>
								</a>
							</div>
							<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${firstSelect }&secondSelect=${secondSelect }" class="prodName" onclick="WriteCookie();">
							${dto.product_subject }
							</a>
							<div class="prodPrice">
								<span class="prodPrice2">${dto.price }<em>원</em><span></span></span>
								<span class="prodPrice1">${dto.result_price}<em>원</em></span>
							</div>
							
							
							<!-- 상품 오버시 노출 -->
							<div class="pop_view">
								<div class="positionR">
									<div class="icList">
										<ul>
											<li>
												<a href="#" onclick="zzimList('${dto.product_id}'); return false;">
													<img src="/dailychan/resources/images/shop/shopIcon1.png" alt="찜하기">
													
												</a>
											</li>
											<li>
												<a href="#" onclick="addCart1('${dto.product_id}'); return false;">
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
										<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${firstSelect }&secondSelect=${secondSelect }">
											<img src="/dailychan/resources/images/shop/pop_product_more.png" alt="" />
										</a>
									</p>
								</div>
							</div>
							<!-- //상품 오버시 노출 -->
						</li>
						<!-- //상품 1set -->
					
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
</body>
</html>

    