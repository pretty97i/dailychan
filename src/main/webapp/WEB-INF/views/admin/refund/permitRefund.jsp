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

<jsp:include page="/WEB-INF/views/top.jsp">
	<jsp:param value="${sort }" name="sort"/>
</jsp:include>

<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />
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

<script type="text/javascript">

window.onload=function name() {
	refundList();
}

function refundList() {
	
	var url = "refundList.action";
	
	$.post(url,{},function(data){

		$("#refundList").html(data);

	});
}

</script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.04"></script>

	<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_mypage.css" />
	
</head>

<body>
<div class="allWrap">
	
	<!-- 컨텐츠 -->
	<div class="contentsArea">
		<div class="contentsWrap">
			
			<div class="content"> 
				<!-- mypage -->
				<div class="mypage-wrap">

					<div class="mypage-personal">
						<div class="personal-info">
							<div class="grade">

								<i class="icon-grade family">family</i>
	
							</div>
							<div class="name"><b>관리자</b><em>님</em></div>

						</div>

						<div class="personal-status">
							<ul>
								<li>
									<a href="/dailychan/admin/orderList.action">
										<i class="icon-mypage ps-order"></i>
										<font size="15pt"><b>최근 주문내역</b></font>
										<span><em>${orderDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/productQna/productQuestion.action">
										<i class="icon-mypage ps-chat"></i>
										<b>상품 문의내역</b>
										<span><em>${productQnaDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/qnaList.action">
										<i class="icon-mypage ps-chat"></i>
										<b>1:1 상담내역</b>
										<span><em>${qnaDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/refund/permitRefund.action">
										<i class="icon-mypage ps-point"></i>
										<b>환불 요청내역</b>
										<span><em>${refundDataCount }건</em></span>							
									</a>
								</li>						
							</ul>
						</div>
					</div>

					<div class="mypage-contents-wrap">
					
							<div class="mypage-lnb">
							<a href="/dailychan/admin/main.action">
								<h3>Admin</h3>
							</a>
							<ul>
									<li>
										<a href="/dailychan/admin/productRegister.action">상품등록</a>
										
									</li>
									
									<li>
										<a href="/dailychan/admin/recipeRegister.action">레시피등록</a>
										
									</li>
								
									<li>
										<a href="/dailychan/admin/orderList.action">주문관리</a>
										
									</li>
								
									<li>
										<a href="/dailychan/admin/coupon.action">쿠폰 발급</a>
										
									</li>
									
									<li>
										<a href="/dailychan/admin/productRecommand.action">상품추천내역</a>									
																			
									</li>
								
									<li>
										<a href="/dailychan/admin/productQna/productQuestion.action">상품문의내역</a>									
										
									</li>
								
									<li>
										<a href="/dailychan/admin/qnaList.action">1:1상담내역</a>
										
										
									</li>
								
									<li class="on">
										<a href="/dailychan/admin/refund/permitRefund.action">환불서비스</a>
										
									</li>
								
									<li>
										<a href="/dailychan/admin/info.action">회원정보 관리</a>

										
									</li>

							</ul>
						</div>

						
						<div class="mypage-contents">
						<!--1. 환불요청리스트-->
						<div class="mypage-cblock">
							<div class="mypage-subtit">
								<h4>환불 요청 리스트</h4><br/><br/>
								<div class="mypage-orderinfo-wrap"><!-- 얘 -->
								<div class="orderTbl2" style="border:solid 1px #ddd">
								
									<span id="refundList"></span>
								</div>
							</div>
						</div>
					</div>	
				
				
				
	

							</div>

					</div>
				</div>


			</div>

		</div>
	</div>

</div>
</body>
</html>