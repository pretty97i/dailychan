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
<jsp:include page="../top.jsp"/>
<jsp:include page="../right.jsp"/>

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
                                        <a type="submit" href="/dailychan/help/faqlist.action" style="height: 40px;color: #fff;">검색하러가기</a>                  
                                    </div>
                            </ul>
                        </div>
 
						</div>
						<div class="mypage-contents-wrap">

							<div class="mypage-lnb">
								<ul>

									<li ><a href="/dailychan/help/faqlist.action">FAQ</a>

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
							</div>  <div class="mypage-contents">
                            <div class="help_maintxt">고객센터를 통해 궁금증을 해결하세요.
                            <p>* 상담 문의량이 많아 통화가 어려울수 있으니 1:1 상담을 통하시면 더욱 빠른 상담이 가능합니다.</p>
                            </div>
                            <div class="help_box">
                                <div class="help_box_left">
                                    <ul>
                                        <li class="tit">고객센터</li>
                                        <li class="number">1577-0098</li>
                                        <li>평일 09:30~18:30, 토요일 09:30~15:00</li>
                                    </ul>
                                </div>   
                                <div class="help_box_right">
                                    <ul>
                                        <li class="tit">1:1 친절상담</li>
                                        <li class="stit">궁금한 사항은 언제든 문의하세요.</li>
                                        <li style=" padding-top: 10px;">
                                            <div class="help_btn_left">
	                                             
	                                                <c:if test="${join_id eq null }">
													<a href="/dailychan/join/login.action">상담하기</a>
												</c:if> 
												<c:if test="${join_id ne null }">
													<a href="/dailychan/help/qnaregister.action">상담하기</a>
												</c:if>
												
	                                             
	                                             
                                            </div>
                                            <div class="help_btn_right">
                                           
                                                 <c:if test="${join_id eq null }">
													<a href="/dailychan/join/login.action">상담내역보기</a>
												</c:if> 
												<c:if test="${join_id ne null }">
													<a href="/dailychan/help/qnalist.action">상담내역보기</a>
												</c:if>

                                            </div>
                                        </li>
                                    </ul>
                                </div> 
                            </div><!--상담 끝-->

								<div id="view_icon" style="margin: 0; padding: 0">
									<ul class="list_icon">
										<li><a href="/dailychan/help/faqlist.action "
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

					
		<jsp:include page="../footer.jsp" />					

</body>
</html>