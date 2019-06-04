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





							<!-- //oasisLayerPop (1:1상담신청) -->

							<div class="mypage-lnb">
								<ul>

									<li><a href="/dailychan/help/faqlist.action">FAQ</a></li>

									<li><a href="/dailychan/help/deliveryrule.action">이용안내</a>


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
												</c:if>상담내역</a></li>

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


							<div
								style="background-color: #f5f5f5; height: 36px; color: #6ca437; font-size: 34px; font-weight: bold; text-align: center; padding-top: 22px">공지사항등록
							</div>
							<!-- 서브 카테고리 -->
							<div class="mypage-contents">



								<!-- 게시판 , 리스트 -->


								<div class="notice_view_area">

									<!-- title -->
									<!--// 주문단계 -->





									<form action="/dailychan/help/noticeRegister_ok.action"
										method="post" enctype="multipart/form-data">


										<div class="orderTbl2" style="border: solid 1px #ddd">
											<table style="border-top: 1px solid #ddd">
												<colgroup>
													<col width="143px" />
													<col width="" />
													<col width="143px" />
													<col width="" />
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><span class="inputWd260">
																제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 </span></th>
														<td><input type="text" class="inputWd370"
															name="notice_subject" height="50" /></td>
													</tr>
													<tr>
														<th scope="row"><span class="inputWd260">이미지 </span></th>
														<td><input type="file" class="inputWd370" name="file"
															value="${dto.notice_saveFileName }" /> <input
															type="hidden" name="notice_saveFileName"
															value="${dto.notice_saveFileName }"></td>
													</tr>
													<tr>
														<th scope="row"><span class="inputWd260">내용 </span></th>
														<td><textarea rows="30" cols="50"
																style="line-height: 18px; padding: 5px; margin-right: 3px; border: 1px solid #bbbbbb"
																name="notice_content"></textarea></td>
													</tr>
												</tbody>
											</table>






											<span>


												<div class="btn_center btn_green ">
													<a href="/dailychan/help/notice.action">목록보기</a>
													<input type="reset" value="다시쓰기"
														onclick="document.myForm.notice_subject.focus();"
														style="display: inline-block; height: 36px; line-height: 36px; color: #fafafa; background: #6ca435; padding: 0 47px; font-size: 14px; font-weight: 500; border: 1px solid #bbbbbb;">
													<input type="submit" value="등록하기"
														style="display: inline-block; height: 36px; line-height: 36px; color: #fafafa; background: #6ca435; padding: 0 47px; font-size: 14px; font-weight: 500; border: 1px solid #bbbbbb;">
												</div>



											</span>
									</form>





								</div>
							</div>

						</div>

					</div>
				</div>




				<!-- //공지사항 보기 -->
				<input type="hidden" id="imagePath"
					value="http://www.oasis.co.kr:8580/">
				<!-- btn : 목록보기 -->
				<!-- 0527, 수정-->

				<!-- //btn : 목록보기 -->
				<!-- //게시판 , 리스트 -->
				<!-- //내용 입니다 -->

				<!-- //게시판 , 리스트 -->



				<form id="contentSearchForm">
					<input type="hidden" name="page" value="1" /> <input type="hidden"
						name="keyword" value="" />
				</form>

				<form id="faqContentForm" method="get">
					<input type="hidden" name="keyword" value="" /> <input
						type="hidden" name="page" value="" /> <input type="hidden"
						name="categoryNo" value="" />
				</form>
				<!-- //내용 입니다 -->
			</div>









			<!-- //오른쪽 영역 -->
		</div>
	</div>
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