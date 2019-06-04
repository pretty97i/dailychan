<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<title>데일리찬</title>
	
<jsp:include page="../../top.jsp"/>




<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_mypage.css" />
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

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js"></script>


<div class="allWrap">
    

    
    
    
    
    
    
    
    <!-- 컨텐츠 -->
    <div class="contentsArea">
           <!-- 내용 입니다 -->

	<!-- 컨텐츠 -->
	<div class="contentsArea" id="sec_product_list">
		<div class="contentsWrap">
			
			<!-- 오른쪽 영역 -->
			<div class="content">
				<!-- 내용 입니다 -->
				
				<div class="productList">
				
					<!-- 검색결과 -->
					<div class="search_result_area">
						<h2>검색결과</h2>
						<!-- input : 검색어 입력 -->
						<div class="search_area">
							<h1><strong><font color="red">"${keyword }"</font></strong> 검색결과 총 <strong><font color="red">${dataCount }</font></strong>개의 상품</h1>
						
						</div>
					</div>
					<!-- //검색결과 -->
					
					<!-- 상품리스트 -->
					<div class="prodListTop">
						
						<div class="sort_area">
						
							<ul>
							
							<c:if test="${sort=='product_id' }">
								<li class='on'>
									<a href="/dailychan/searchPage.action?keyword=${keyword }&sort=product_id&direction=desc&page=${numPerPage}"> 기본</a>
								</li>
							</c:if>
							
							<c:if test="${sort!='product_id' }">
								<li>
									<a href="/dailychan/searchPage.action?keyword=${keyword }&sort=product_id&direction=desc&page=${numPerPage}"> 기본</a>
								</li>
							</c:if>
								<!-- 베스트 -->
								<c:if test="${sort=='product_saleCount' }">
									<li class='on'>
										<a href="/dailychan/searchPage.action?keyword=${keyword }&sort=product_saleCount&direction=desc&page=${numPerPage}"> 베스트순</a>
									</li>
								</c:if>
								
								<c:if test="${sort!='product_saleCount' }">
									<li>
										<a href="/dailychan/searchPage.action?keyword=${keyword }&sort=product_saleCount&direction=desc&page=${numPerPage}"> 베스트순</a>
									</li>
								</c:if>
								
								<!-- 상품명 -->
								<c:if test="${sort=='product_subject' }">
									<li class='on'>
										<a href="/dailychan/searchPage.action?keyword=${keyword }&sort=product_subject&direction=asc&page=${numPerPage}"> 상품명순</a>
									</li>
								</c:if>
								
								<c:if test="${sort!='product_subject' }">
									<li>
										<a href="/dailychan/searchPage.action?keyword=${keyword }&sort=product_subject&direction=asc&page=${numPerPage}"> 상품명순</a>
									</li>
								</c:if>
								
								<!-- 낮은 가격순 -->
								<c:if test="${sort=='product_price' and direction=='asc'}">
									<li class='on'>
										<a href="/dailychan/searchPage.action?keyword=${keyword }&sort=product_price&direction=asc&page=${numPerPage}"> 낮은가격순</a>
									</li>
								</c:if>
								
								<c:if test="${sort=='product_price' and direction=='desc' or sort=='product_id' or sort=='product_saleCount' or sort=='product_subject'  }">
									<li>
										<a href="/dailychan/searchPage.action?keyword=${keyword }&sort=product_price&direction=asc&page=${numPerPage}"> 낮은가격순</a>
									</li>
								</c:if>
				
								<!-- 높은 가격순 -->
								<c:if test="${sort=='product_price' and direction=='desc'}">
									<li class='on'>
										<a href="/dailychan/searchPage.action?keyword=${keyword }&sort=product_price&direction=desc&page=${numPerPage}"> 높은가격순</a>
									</li>
								</c:if>
								
								<c:if test="${sort=='product_price' and direction=='asc' or sort=='product_id' or sort=='product_saleCount' or sort=='product_subject' }">
									<li>
										<a href="/dailychan/searchPage.action?keyword=${keyword }&sort=product_price&direction=desc&page=${numPerPage}"> 높은가격순</a>
									</li>
								</c:if>
								
							</ul>
							<span class="selectBoxWrap">
								<label for="selectNumber">10개씩 보기</label>
								<select id="selectNumber" onChange="changeRows(this.value, true); return false;">
	                            <c:if test="${numPerPage==10 }">
	                                <option value="10" selected='selected'>&nbsp;&nbsp;10개씩</option>
	                                <option value="20" >&nbsp;&nbsp;20개씩</option>
	                                <option value="30" >&nbsp;&nbsp;30개씩</option>
	                            </c:if>
	                            <c:if test="${numPerPage==20 }">
	                               <option value="10" selected='selected'>&nbsp;&nbsp;10개씩</option>
	                                <option value="20" >&nbsp;&nbsp;20개씩</option>
	                                <option value="30" >&nbsp;&nbsp;30개씩</option>
	                            </c:if>
	                            <c:if test="${numPerPage==30 }">
	                                <option value="10" selected='selected'>&nbsp;&nbsp;10개씩</option>
	                                <option value="20" >&nbsp;&nbsp;20개씩</option>
	                                <option value="30" >&nbsp;&nbsp;30개씩</option>
	                            </c:if>
	                                
	                            </select>
							</span>
						</div>
					</div>

                    <div class="prodList">
                    	<ul>







								<c:if test="${dataCount ==0  }">

									<div class="prodList">
										<ul>


											<!--20170404 추가 : 검색결과 없음-->
											<li class="searchNon">
												<div class="maQnaNon">
													<img
														src="/dailychan/resources/images/customer/myQnaImg.png"
														alt="">
													<p>
														<em>"${keyword }"</em> (으)로 검색한 결과가 없습니다.
													</p>
												</div>
											</li>
											<!--//20170404 추가 : 검색결과 없음-->




										</ul>

										<!--// 상품리스트 -->
										<div class="clear"></div>
									</div>
								</c:if>

















								<!-- 상품 1set -->
			                    			
												
												
												
										<c:if test="${dataCount != 0 }">		
												
											<c:forEach var="dto" items="${searchLists }">
											<li class="saleSellTxt">
			                    				<div class="thum">
			                    				
			                    				<c:if test="${secondSelect eq null }">
			                    					<a href="/dailychan/product/article.action?product_id=${dto.product_id}&firstSelect=${dto.product_firstSelect}">
			                    					
			                    				</c:if>
			                    				
			                    				<c:if test="${secondSelect ne null }">
			                    					<a href="/dailychan/product/article.action?product_id=${dto.product_id}&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}">
			                    					
			                    				</c:if>
			                    				
			                    				<c:if test="${lastSelect ne null }">
			                    					<a href="/dailychan/product/article.action?product_id=${dto.product_id}&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}">
			                    					
			                    				</c:if>
			                    				
			                    				
			                    						<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품이미지">
			                    						
			                    						
				                    						<!-- ico : 할인률 -->
				                    						<span class="saleSellTxt"><span>${dto.product_discount }<em>%</em></span></span>
			                    						
														
														
			                    					</a>
			                    				</div>
			                    				
			                    				<c:if test="${secondSelect eq null }">
			                    					<a href="/dailychan/product/article.action?product_id=${dto.product_id}&firstSelect=${dto.product_firstSelect}" class="prodName">
			                    					
			                    				</c:if>
			                    				<c:if test="${secondSelect ne null }">
			                    					<a href="/dailychan/product/article.action?product_id=${dto.product_id}&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}" class="prodName">
			                    					
			                    				</c:if>
			                    				
			                    					
			                    				<c:if test="${lastSelect ne null }">
			                    					<a href="/dailychan/product/article.action?product_id=${dto.product_id}&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}" class="prodName">
			                    					
			                    				</c:if>
			                    				${dto.product_subject }
			                    				</a>
			                    				<div class="prodPrice">
			                    					<span class="prodPrice2">${dto.product_price }<em>원</em><span></span></span>
			                    					<span class="prodPrice1"><fmt:formatNumber value="${dto.product_resultPrice  }" pattern="#,###" /><em>원</em></span>
			                    					
			                    					
			                    					
			                    				</div>
			                    				
			                    				<!-- 상품 오버시 노출 -->
			                    				<div class="pop_view">
			                    					<div class="positionR">
			                    						<div class="icList">
			                    							<ul>
			                    								<li>
			                    									<a href="#" onclick="addWishList(3239, 4679); return false;">
			                    										<img src="/dailychan/resources/images/shop/shopIcon1.png" alt="찜하기">
			                    									</a>
			                    								</li>
			                    								<li>
			                    									<a href="#" onclick="addCart(3239, 4679); return false;">
			                    										<img src="/dailychan/resources/images/shop/shopIcon2.png" alt="장바구니 넣기">
			                    									</a>
			                    								</li>
			                    								<li>
			                    									<a href="#" onclick="buyItNow(3239, 4679); return false;">
			                    										<img src="/dailychan/resources/images/shop/shopIcon3.png" alt="바로구매">
			                    									</a>
			                    								</li>
															</ul>
														</div>
														<p>
															<c:if test="${secondSelect eq null }">
			                    					<a href="/dailychan/product/article.action?product_id=${dto.product_id}&firstSelect=${dto.product_firstSelect}">
			                    					
			                    				</c:if>
			                    				
			                    				<c:if test="${secondSelect ne null }">
			                    					<a href="/dailychan/product/article.action?product_id=${dto.product_id}&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}">
			                    					
			                    				</c:if>
			                    				
			                    				<c:if test="${lastSelect ne null }">
			                    					<a href="/dailychan/product/article.action?product_id=${dto.product_id}&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}">
			                    					
			                    				</c:if>
			                    				
																<img src="/dailychan/resources/images/shop/pop_product_more.png" alt="" />
															</a>
														</p>
													</div>
												</div>
												<!-- //상품 오버시 노출 -->
			                    			</li>
			                    			<!-- //상품 1set -->
			                    		
			                    	
				                    	
			                    			
			                    			
			                    			
			                    			
			                    			
			                    			
			                    			
			                    			
			                    			
			                    			</c:forEach>
												
												
										</c:if>			
												
													
												
			                    			
			                    			
			                    			
			                    			
			                    			
			                    			
			                    			
												
												
													
												
												
													
													
														
														
													
												
											
			                    		
			                    	
				                    	
			                    			
                    	</ul>
                  
			
          <!--페이징-->
               
				<!-- //내용 입니다 -->
			</div>
			<!-- //오른쪽 영역 -->
		</div>
		
		
		 <div class="pagingWrap">
                    
               		 <c:if test="${dataCount!=0 }">
						${pageIndexList }
					</c:if>
					
				
				  </div>
	</div>
	<!-- //컨텐츠 -->
	</div>
	</div>
	</div>
	<form action="/dailychan/product/event/article.action"method="post">
	<input type="hidden" name="firstSelect" value="${firstSelect }">
	<input type="hidden" name="secondSelect" value="${secondSelect }">
	<input type="hidden" name="lastSelect" value="${lastSelect }">
	
	</form>

</div>
</body>
</html>