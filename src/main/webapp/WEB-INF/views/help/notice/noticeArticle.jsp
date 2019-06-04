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
<jsp:include page="../../top.jsp" />
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
					<div class="mypage-contents-wrap">
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
                        
								</ul>
							</div>
						</div>
						





							<!-- //oasisLayerPop (1:1상담신청) -->

							<div class="mypage-lnb">
								<ul>

									<li><a href="/dailychan/help/faqlist.action">FAQ</a></li>

									<li><a
										href="/dailychan/event/promotion/deliveryrule.action">이용안내</a>


										<ul>

											<li><a href="/dailychan/help/deliveryrule.action">배송정책</a></li>

											<li><a href="/dailychan/help/cancelrule.action">취소/교환/반품</a></li>

											<li><a href="/dailychan/help/selfrefund.action">Self환불서비스</a></li>

										</ul></li>

									<li><c:if test="${join_id eq null }">
											<a href="/dailychan/join/login.action">
										</c:if> <c:if test="${join_id ne null }">
											<a href="/dailychan/help/qnalist.action">
										</c:if> 1:1 친절상담</a>



										<ul>

											<li><c:if test="${join_id eq null }">
													<a href="/dailychan/join/login.action">
												</c:if> <c:if test="${join_id ne null }">
													<a href="/dailychan/help/qnalist.action">
												</c:if> 상담내역</a></li>

											<li><c:if test="${join_id eq null }">
													<a href="/dailychan/join/login.action">
												</c:if> <c:if test="${join_id ne null }">
													<a href="/dailychan/help/qnaregister.action">
												</c:if>상담하기</a></li>

										</ul></li>
									<li class="on"><a href="/dailychan/help/notice.action">공지사항</a>


									</li>

								</ul>
							</div>

							<!-- 서브 카테고리 -->
							<div class="mypage-contents">



								<!-- 게시판 , 리스트 -->
								<div class="notice_view_area">
									<dl style="border-top: none">
										<!-- title -->
										<dt style="padding: 0 0 30px 0">
											<div style="font-size: 18px">[공지] ${dto.notice_subject }
											</div>
											<span>${dto.notice_created }</span>
										</dt>
										<!-- //title -->
										<!-- contents -->
										<dd style="padding-top: 10px">
											<div class="noticeSnsWrap">
												<a href="#"
													data-clipboard-text="/story/recipeDetail/NTC1/1714"
													class="shareLink"></a> <a id="fbCopyLink"
													href="/story/recipeDetail/NTC1/1714" class="shareFacebook"></a>
												<a href="javascript:sendLink();" class="shareKakao"></a>
											</div>
											<div style="clear: both">
												<p>
													<span id="husky_bookmark_end_1555983402516"></span>&nbsp;&nbsp;
												</p>
												${dto.notice_content }<br>
												<br>
										
												
												<c:if test="${saveFileName ne null }">
													<img src="/dailychan/resources/images/notice/${saveFileName }" width="600" height="600">
												</c:if>
											</div>

										</dd>
										<!-- //contents -->
									</dl>
								</div>

								<!-- //공지사항 보기 -->
								<input type="hidden" id="imagePath"
									value="http://www.oasis.co.kr:8580/">
								<!-- btn : 목록보기 -->
								<!-- 0527, 수정-->
								<div class="btn_center btn_green ">
									<a href="/dailychan/help/notice.action?${params }">목록보기</a>
									
									
									
									<c:if test="${join_id eq 'admin' }">
									<a
										href="/dailychan/help/noticeDelete.action?notice_id=${dto.notice_id }&pageNum=${pageNum}">삭제하기</a>
									</c:if>
								</div>
								<!-- //btn : 목록보기 -->
								<!-- //게시판 , 리스트 -->
								<!-- //내용 입니다 -->

								<!-- //게시판 , 리스트 -->



								<form id="contentSearchForm">
									<input type="hidden" name="page" value="1" /> <input
										type="hidden" name="keyword" value="" />
								</form>

								<form id="faqContentForm" method="get">
									<input type="hidden" name="keyword" value="" /> <input
										type="hidden" name="page" value="" /> <input type="hidden"
										name="categoryNo" value="" />
								</form>
								<!-- //내용 입니다 -->
							</div>







</div>

							<!-- //오른쪽 영역 -->
						</div>
					</div>
				</div>
			</div>


	<!-- //컨텐츠 -->

	<form id="contentForm" method="get">
		<input type="hidden" name="keyword" value=""> <input
			type="hidden" name="page" value="1"> <input type="hidden"
			name="categoryNo" value="17">
	</form>



</body>
</html>