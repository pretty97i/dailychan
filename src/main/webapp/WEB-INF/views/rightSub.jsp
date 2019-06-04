<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/js/oasis_shop.js" />
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js"></script>

		<div class="quickList">
				<div class="txt_branch">			
							
					<span><font size="4" style="font-family:'Nanum Gothic';"><b>DailyChan</b></font></span>		
					
					<a href="/dailychan/event/promotion/deliveryevent.action" class="titBtnGray">배송지역안내</a>
					
				</div>
		<strong class="quickTit">최근 본 상품</strong>

			<!--쇼핑목록 있는 경우 : 한페이지 상품 최대 5개까지-->
		<c:if test="${cookieLists.size() ne 0 }">
			<c:forEach var="dto" items="${cookieLists }">
			<ul id="quickMenuContent">
				 <li>
					 <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect}"> 
						<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName }" alt="상품이미지">
					 </a>
					<div class="pop_quick" style="display: none;">
						<span class="btn_quick_close"> 
						<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect}">	
							<img src="/dailychan/resources/images/common/gnbSearch.png" alt="살펴보기">			
						</a>	
						</span>
						<div class="txt_product">
							<p>${dto.product_subject }</p>
							<p>
								<strong>${dto.result_price}</strong> 원
							</p>
						</div>
						<p>
							<img src="/dailychan/resources/images/common/bg_quick_cnt.png" alt="">
						</p>
					</div>
				</li> 				
			</ul>
			</c:forEach>
	</c:if>
			<!--//쇼핑목록 있는 경우-->

	<c:if test="${cookieLists.size() eq 0 }">	
		
		<p class="quickTxt">"최근 쇼핑 <br>히스토리가 <br>없습니다."</p>
	
	</c:if> 

<br />
</div>

	<div style="text-align: center;">
		${cookiePageList }
	</div>

			<a href="#" class="quickBtnTop">
				<img src="/dailychan/resources/images/common/quickBtnTop.png" alt="상단 바로가기">
				<a href="http://pf.kakao.com/_GGjQj"><img src="https://developers.kakao.com/assets/img/about/logos/plusfriend/question_large_mono_pc.png" style="width: 96px; height: 45px;"></a>
			</a>
			<!--초특가할인-->

			<div class="quickBanner">
				<!-- 초특가할인 슬라이드 영역 -->
				<div id="quickSlide" style="visibility: visible;">
					<!--<ul > -->
					<ul>
						
							<li>
								<div>
									<a href="/dailychan/myPage/invite.action">
										<img src="/dailychan/resources/images/common/quick_img_7_RaEj.png" alt="링크 이미지">
									</a>
								</div>
							</li>
						
					</ul>
				</div>
				<!-- //초특가할인 슬라이드 영역 -->
			</div>
			<!--//초특가할인-->
			