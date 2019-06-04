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


<script type="text/javascript">

function sendIt(){
	
	var f=document.myForm;
	var qna_id=${dto.qna_id};
	
	f.action="/dailychan/help/qnaArticle_ok.action?qna_id="+qna_id;
	f.submit();
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
                        
							</div>



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

									<li class="on"><c:if test="${join_id eq null }">
											<a href="/dailychan/join/login.action">
										</c:if> <c:if test="${join_id ne null }">
											<a href="/dailychan/help/qnalist.action">
										</c:if> 1:1 친절상담</a>



										<ul>

											<li class="on"><c:if test="${join_id eq null }">
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

							<!--                         
  <div style="background-color:#f5f5f5; height:36px; color:#6ca437; font-size:34px; font-weight:bold;text-align:center; padding-top:50px">1:1 상담하기 </div>
 -->
							<!-- 서브 카테고리 -->

							<div class="mypage-contents">



								<!-- 게시판 , 리스트 -->


								<div class="notice_view_area">

									<!-- title -->
									<!--// 주문단계 -->





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
														<th scope="row"><span class=""inputWd140"">
																문의분야 </span></th>
														<td>${dto.qna_select } <input type="hidden"
															name="${dto.qna_id }" value="${dto.qna_id }">
														</td>
													</tr>
													<tr>
														<th scope="row"><span class=""inputWd140"">
																문의유형 </span></th>
														<td>${dto.qna_type }</td>
													</tr>
													
													
													<c:if test="${dto.qna_type eq '매장에 직접문의' }">													
														<tr>
															<th scope="row"><span class="inputWd140">
																문의매장 </span></th>
															<td>${dto.qna_store }</td>
														</tr>
													</c:if>
													
													
													
													
													
													
													
													<tr>
														<th scope="row"><span class="inputWd140">
																제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 </span></th>
														<td>${dto.qna_subject }</td>
													</tr>
													<c:if test="${saveFileName ne null }">
													<tr>
														<th scope="row"><span class="inputWd140">이미지 </span></th>
														<td>
														
														<img
															src="/dailychan/resources/images/qna/${saveFileName }"
															width="400" height="400"></td>
														
													</tr>
													
													</c:if>
													<tr>
														<th scope="row"><span class="inputWd140">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용 </span></th>
														<td>${dto.qna_content }</td>
													</tr>
												
											 
													<c:if test="${dto.qna_reply ne null }"> 
														<tr>
															<th scope="row"><span class="inputWd140"><img alt="" src="/dailychan/resources/images/shop/arrow_bottom_red.gif"  align="right"> </span></th>
															<td><b>관리자 댓글</b> <br>${dto.qna_reply }
															
															<c:if test="${join_id eq 'admin' }">
																
																<input type="button" onclick="javascript:location.href='/dailychan/help/qnaArticlereplydel.action?qna_id=${dto.qna_id}&pageNum=${pageNum }'" value="삭제하기">
															</c:if>
															</td>
															
														</tr>
														
													</c:if>
									
												</tbody>
											</table>
										


												<div class="btn_center btn_green ">
													<a href="/dailychan/help/qnalist.action?pageNum=${pageNum }">목록보기</a> 
													
													<a href="/dailychan/help/qnadelete.action?qna_id=${dto.qna_id }&pageNum=${pageNum}">삭제하기</a>
												
												</div>

									 <c:if test="${join_id eq 'admin' }"> 		
											
											<form action="" name="myForm" method="post">
											
											<table>
												<colgroup>
													<col width="143px" />
													<col width="" />
													<col width="143px" />
								 					<col width="" />
												</colgroup>
												<tbody>
													
													<tr>
														<th scope="row"><span class="inputWd140">답글달기 </span></th>
														<td>
															<textarea name="qna_reply" class="inputWd380" style="border:1px solid #bbbbbb"></textarea>
															
														
														 <div class="btn_blue ">
															<input type="button" onclick="sendIt();"  value="등록하기">
															<input type="hidden" name="pageNum" value="${pageNum }">
														</div>
														
														
														
														
														</td>
													</tr>
										
												

								</tbody>
							</table>
							
									</form>
										
										 </c:if> 
							</div>








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
					<input type="hidden" name="page" value="1" /> 
					<input type="hidden"
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


	<!-- //컨텐츠 -->

	<form id="contentForm" method="get">
		<input type="hidden" name="keyword" value=""> <input
			type="hidden" name="page" value="1"> <input type="hidden"
			name="categoryNo" value="17">
	</form>



</body>
</html>