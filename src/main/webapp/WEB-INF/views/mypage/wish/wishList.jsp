<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<title>데일리찬::믿을 수 있는 먹거리</title>
	
<jsp:include page="../../top.jsp"/>
<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72.png" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-50@2x.png" sizes="96x96" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72@2x.png" sizes="144x144" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-60@3x.png" sizes="192x192" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css?dummy=6.12" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.12"></script>

	<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_mypage.css" />
	
	<script type="text/javascript">
		$(document).ready(function() {
			// 전체 선택.
			//$("#checkAll, #checkAll2").click(function() {
			$("#checkAll2").click(function() {
				var flag = this.checked;
				
				$("#checkAll").get(0).checked = flag;
				$("#checkAll2").get(0).checked = flag;
				
				$(".chk_product").each(function() {
					this.checked = flag;
				});
			});
			
			// 부분 선택.
			$(".chk_product").click(function() {
				if ($(".chk_product:not(:checked)").length == 0) {
					$("#checkAll").get(0).checked = true;
					$("#checkAll2").get(0).checked = true;
				} else {
					$("#checkAll").get(0).checked = false;
					$("#checkAll2").get(0).checked = false;
				}
			});
		});
		
		function addToCart() {
			var selectedProductKeies = [];
			
			$(".chk_product:checked").each(function() {
				selectedProductKeies.push($(this).parents("tr").data("product_id"));
			});
			
			if (selectedProductKeies.length == 0) {
				alert("상품을 선택해 주세요.");
			} else {
				
	            var url = "<%=cp%>/myPage/addCart.action";            

	            $.post(url,{selectedProductKeies:selectedProductKeies},function(data){
	            	
	            	window.location.reload(true);	            
	            	
	            });
				
			}
		}
		
		function deleteToWishList() {
			var selectedProductKeies = [];
			
			$(".chk_product:checked").each(function() {
				selectedProductKeies.push($(this).parents("tr").data("product_id"));
			});
			
			if (selectedProductKeies.length == 0) {
				alert("상품을 선택해 주세요.");
			} else {
				
	            var url = "<%=cp%>/myPage/deleteZzim.action";            

	            $.post(url,{selectedProductKeies:selectedProductKeies},function(data){
	            	
	            	window.location.reload(true);	            
	            	
	            });
				
			}
		}
			
		function checkAllBtn(){
			var flag;
			if($("#checkAll").get(0).checked){
				$("#checkAll").get(0).checked = false;
				$("#checkAll2").get(0).checked = false;
				flag = false;
			}else{
				$("#checkAll").get(0).checked = true;
				$("#checkAll2").get(0).checked = true;
				flag = true;
			}
	
			$(".chk_product").each(function() {
				this.checked = flag;
			});
			
		}
	</script>
</head>

<body>
<div class="allWrap">
	
	<!-- 컨텐츠 -->
	<div class="contentsArea">

		<div class="contentsWrap">

			<div class="content"> 
				<!-- mypage-wrap -->
				<div class="mypage-wrap">

					<div class="mypage-personal">
						<div class="personal-info">
							<div class="grade">

								<i class="icon-grade basic">member</i>
	
							</div>
							<div class="name"><b>${dto.join_name }</b><em>님</em></div>
							<div class="edit">
								<a href="/dailychan/myPage/info.action?check=0">
									<i class="icon-mypage tools"></i>회원정보관리
								</a>
							</div>
						</div>

						<div class="personal-status">
							<ul>
								<li>
									<a href="/dailychan/myPage/orderList.action">
										<i class="icon-mypage ps-order"></i>
										<b>주문/배송</b>
										<span><em>${buySu}건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/pointList.action?accGubun=M">
										<i class="icon-mypage ps-point"></i>
										<b>포인트</b>
										<span><em>${dto.join_point }P</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/couponList.action?couponGubun=USE">
										<i class="icon-mypage ps-coupon"></i>
										<b>쿠폰</b>
										<span><em>${coupon }장</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/qnaList.action">
										<i class="icon-mypage ps-chat"></i>
										<b>1:1 상담</b>
										<span><em>${consultingSu }건</em></span>							
									</a>
								</li>						
							</ul>
						</div>
					</div>

					<!-- mypage-contents-wrap -->
					<div class="mypage-contents-wrap">

	
						<div class="mypage-lnb">
							<a href="/dailychan/myPage/main.action">
								<h3>MY 쇼핑</h3>
							</a>
							<ul>
								
									<li>
										<a href="/dailychan/myPage/orderList.action">주문관리</a>
										
									</li>
								
									<li class="on">
										<a href="/dailychan/myPage/wishList.action">찜내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/frequencyList.action">자주구매상품</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/pointList.action?accGubun=M">포인트 내역</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/couponList.action?couponGubun=USE">쿠폰 내역</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/commentList.action">구매후기</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/productQnaList.action">상품문의내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/qnaList.action">1:1상담내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/refundProductList.action?refundGbn=R0">환불서비스</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/info.action?check=0">회원정보 관리</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/invite.action">친구추천</a>				
										
									</li>
								
							</ul>
						</div>


						<div class="mypage-contents">
							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>찜내역</h4>
								</div>
								<div class="mypage-order-info auto">
									<div class="row">
										<ul class="dash">
											<li>찜목록에 담긴 상품은 바로 장바구니에 담으실 수 있으며 폴더로 구분하여 관리하실 수 있습니다.</li>
											<li>찜목록에 담은 시점과 구매시점에서 상품가격 및 이벤트가 변경될 수 있으며 조기품절 될 수 있습니다.</li>
											<li>최대 50개까지 등록가능 합니다. 50개 이상의 상품을 담으면 가장 오래 저장된 상품이 자동으로 삭제됩니다.</li>
										</ul>
									</div>
								</div>
								<div class="mypage-table mypage-goods-list">
									<table>
										<colgroup>
											<col style="width:45px;">
											<col style="width:100px;">
											<col style="width:200px;">
											<col style="width:90px;">
											<col style="width:140px;">
											<col style="width:100px;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">
													<label class="checkbox">
														<input type="checkbox" id="checkAll2">
														<i></i>
													</label>
												</th>
												<th scope="col" colspan="2">상품정보</th>
												<th scope="col">판매가</th>
												<th scope="col">할인금액</th>
												<th scope="col">구매가</th>
											</tr>
										</thead>
										<tbody>
											
											<c:if test="${dataCount==0 }">
											
												<tr>
													<td colspan="6">
						                                <div class="empty-msg">찜 내역이 없습니다.</div>
													</td>
												</tr>
											
											</c:if>
											
											<c:if test="${dataCount!=0 }">
												<c:forEach var="dto" items="${zzimList }">
													<tr data-product_id="${dto.product_id }" data-product_resultPrice=${dto.product_resultPrice }>
														<th>
															<label class="checkbox">
															<input type="checkbox" id="checkbox" class="chk_product">
															<i></i>
														</label>
														</th>
														<th>
															<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품 섬네일" class="thum" style="width: 70px;height: 70px;vertical-align: middle;"/>
														</th>
														<th>	
															${dto.product_subject }
														</th>
														<th>${dto.price }원</th>
														<th>
															${dto.discount_price }원<br/>
															<font color="red">[${dto.product_discount }%]</font>
															<font color="gray">할인가</font>
														</th>
														<th>${dto.result_price }원</th>
													</tr>
												</c:forEach>

											</c:if>
											
										</tbody>
									</table>
								</div>
								
								<div class="paging-wrap">
									<c:if test="${dataCount!=0 }">
										${pageIndexList }
									</c:if>
								</div>
								
								<div class="mypage-table-action">
									<a href="#" class="btn gray" onclick="checkAllBtn(); return false;">전체선택</a>
									<a href="#" class="btn gray" onclick="addToCart(); return false;">선택상품 장바구니 담기</a>
									<a href="#" class="btn gray" onclick="deleteToWishList(); return false;">선택삭제</a>
									<input type="checkbox" id="checkAll" style="width:0;height:0;"/>
								</div>
								
							</div>
						</div>
					</div>
					<!--// mypage-contents-wrap -->
				</div>
				<!--// mypage-wrap -->
			</div>
		</div>
	</div>
	<!-- //컨텐츠 -->
	
</div>
</body>
</html>