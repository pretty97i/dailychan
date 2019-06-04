<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<div class="bestTabCon${tabIdx }" >
	<ul>
			<c:forEach var="dto" items="${bestLists }">
				<li class="saleSellTxt">
					<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}">

						<div class="product_off gray_border">
							<!-- img : 243 * 243 -->
							<div class="thumnail_area">

								<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품이미지">

							</div>
							<!-- txt : 상품명 -->
							<strong>${dto.product_subject }</strong>
							<!-- txt : 할인가 -->
							<div class="txt_discount_won" style="background-colr:#ffffff">
								<span class="price_before">
									<del><fmt:formatNumber value="${dto.product_price }" pattern="#,###" />원</del>
								</span>
									&nbsp;&nbsp;
								<span class="price_after">
									<strong><fmt:formatNumber value="${dto.product_resultPrice }" pattern="#,###" />원</strong>
								</span>
							</div>
						</div>

					</a>
				</li>
			</c:forEach>
		
	</ul>
</div>