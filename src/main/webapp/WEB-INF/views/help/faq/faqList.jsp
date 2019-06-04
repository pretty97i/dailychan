<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../top.jsp"/>
<jsp:include page="../../right.jsp"/>
<link rel="stylesheet" type="text/css"
	href="/dailychan/resources/css/oasis_mypage.css" />
<link rel="stylesheet" type="text/css"
	href="/dailychan/resources/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css"
	href="/dailychan/resources/css/oasis_shop.css" />
<link rel="stylesheet" type="text/css"
	href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<link rel="icon" href="/dailychan/resources/images/x-icon.ico"
	type="/dailychan/resources/images/x-icon.ico" />

<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/jquery.min.js"></script>

<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/clipboard.min.js"></script>

<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/oasis_common.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/oasis_shop.js"></script>

<script type="text/javascript">
window.onload = function () {
	var search="${search}";

	faqselect('1','');
}

       $(document).ready(function(){
        	
        	$('ul.tabs li').click(function(){
        		var tab_id = $(this).attr('data-tab');

        		$('ul.tabs li').removeClass('on');
        		$('ul.qnaList').removeClass('on');

        		$(this).addClass('on');
        		$("#"+tab_id).addClass('on');
        		
        	});

        });        
       
 function faqselect(pageNum,faq_division){
	
	 
	 var search=$('#faqKeyword').val();
	 var url="/dailychan/help/faqbox.action";
 
	 if(pageNum==""){
		 pageNum="1";
		
	 }
	 
	 $.post(url,{pageNum:pageNum,faq_division:faq_division,search:search},function (data){
		 
		 $("#productQuestion").html(data);
		 
	 });
		    		
}

	 function showanswer(faq_id){
		 
		 $("#" + faq_id).toggle();
		 
	 }

    </script>
</head>
<body>

	<div class="allWrap">

		<!-- 컨텐츠 -->
		<div class="contentsArea">
			<div class="contentsWrap">


				<div class="content">
					<!-- 내용 입니다 -->

					<!-- mypage -->
					<div class="mypage-wrap">
						<div class="mypage-personal">
							<div class="personal-info" style="height: 141px;">
								<p class="help_title">고객센터</p>
							</div>
	
                        <div class="personal-status" style=" height: 140px; padding-top:50px;">
                            <ul>
                                <p class="help_search">FAQ검색</p>
                                    <div class="cusBannerSearch" style="width: 60%;float: left;margin-top: 0px;">       
                                        <input type="text" id="faqKeyword" class="inputWd710 help_input" name="search"  placeholder="자주 찾는 질문을 검색해 보세요~^^" />
                                        <a type="submit" href="#" onclick="faqselect('');" style="height: 40px;color: #fff;">검색하러가기</a>
                                        <!-- <button type="submit" onclick="faqselect('');" style="height: 40px;color: #fff;">검색</button> -->                  
                                    </div>
                            </ul>
                        </div>
                        
						</div>
						<div class="mypage-contents-wrap">


							<div class="mypage-lnb">
								<ul>

									<li class="on"><a href="/dailychan/help/faqlist.action">FAQ</a>


									</li>

									<li><a href="/dailychan/help/deliveryrule.action">이용안내</a>


										<ul>

											<li><a href="/dailychan/deliveryRule.action">배송정책</a></li>

											<li><a href="/dailychan/cancelRule.action">취소/교환/반품</a></li>

											<li><a href="/dailychan/selfRefund.action">Self환불서비스</a></li>

										</ul></li>

									<li><c:if test="${join_id eq null }">
											<a href="/dailychan/join/login.action">
										</c:if> <c:if test="${join_id ne null }">
											<a href="/dailychan/help/qnalist.action">
										</c:if>1:1 친절상담</a>


										<ul>

											<li><c:if test="${join_id eq null }">
													<a href="/dailychan/join/login.action">
												</c:if> <c:if test="${join_id ne null }">
													<a href="/dailychan/help/qnalist.action">
												</c:if>상담내역</a></li>

											<li><c:if test="${join_id eq null }">
													<a href="/dailychan/join/login.action">
												</c:if> <c:if test="${join_id ne null }">
													<a href="/dailychan/help/qnaregister.action">
												</c:if>상담하기</a></li>

										</ul></li>

									<li><a href="/dailychan/help/notice.action">공지사항</a></li>

								</ul>
							</div>

						
							<!-- 서브 카테고리 -->
							<div class="mypage-contents">
								<!-- 서브 카테고리 -->
								<form action="" name="myForm" method="post">
									<div class="faqMenuBlock faqlist">
										<ul class="tabs">

											<li class="on" data-tab="tab-1">
												<a style="text-decoration: none;" onclick="faqselect('','')">전체보기</a>
											</li>

											<li class="" data-tab="tab-2">
												<a style="text-decoration: none;" onclick="faqselect('','회원/정보')">회원/정보</a>
											</li>

											<li class="" data-tab="tab-3"><a
												style="text-decoration: none;" onclick="faqselect('','주문/결제')">주문/결제</a></li>

											<li class="" data-tab="tab-4"><a
												style="text-decoration: none;" onclick="faqselect('','배송')">배송</a></li>

											<li class="" data-tab="tab-5"><a
												style="text-decoration: none;" onclick="faqselect('','취소/교환/반품')">취소/교환/반품</a></li>

											<li class="" data-tab="tab-6"><a
												style="text-decoration: none;" onclick="faqselect('','서비스/기타')">서비스/기타</a></li>
										</ul>
									</div>
									<!--// 서브 카테고리 -->

								</form>
								
								
								<ul id="productQuestion">

								</ul>

								<div id="view_icon" style="margin: 0; padding: 0">
									<ul class="list_icon">
										<li><a href="/dailychan/help/faqlist.action"
											class="bg_main link_item1"> FAQ</a></li>
										
										<li><a href="/dailychan/help/notice.action"
											class="bg_main link_item2"> 공지사항</a></li>

										<li><a href="/dailychan/help/deliveryrule.action"
											class="bg_main link_item4">이용안내</a></li>
										
										<li><a href="/dailychan/myPage/orderList.action"
											class="bg_main link_item6">주문배송조회</a></li>
										
										<li style="margin-right: 0px"><a href="/dailychan/myPage/wishList.action" class="bg_main link_item7">찜내역</a>
										</li>
															
										<li><a href="/dailychan/myPage/pointList.action?accGubun=M"
											class="bg_main link_item9">포인트내역</a></li>

										<li><a href="/dailychan/myPage/commentList.action"
											class="bg_main link_item11">구매후기</a></li>

										<li><a href="/dailychan/myPage/productQnaList.action"
											class="bg_main link_item12">상품문의내역</a></li>
										
										
										<li><a href="/dailychan/myPage/main.action" class="bg_main link_item13">마이페이지</a>
										</li>
										
										<li style="margin-right: 0px"><a
											href="/dailychan/review/bestReviewList.action" class="bg_main link_item15">베스트구매후기</a>
										</li>
									</ul>
								</div>
								<!--아이콘 끝-->
								<form id="contentForm" method="get">
									<input type="hidden" name="keyword" value=""> <input
										type="hidden" name="page" value="1"> <input
										type="hidden" name="categoryNo" value="17">
								</form>


								<!-- //내용 입니다 -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





								<!-- //내용 입니다 -->
s
</body>
</html>