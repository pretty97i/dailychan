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
window.onload=function name() {

	descQuestionType('1');
}

$(document).ready(function() {
        $("#targetStoreId").val(0);
})
    
function descQuestionType(questionType) {
        if (questionType == "1") {
            $("#questionStore").hide();
        } else {
            $("#questionStore").show();
        }
    }

function sendIt(){
	
	var f = document.myForm;
	
	str = f.qna_subject.value;
	str = str.trim();
	if(!str){
		alert("\n제목을 입력하세요.");
		f.qna_subject.focus();
		return;
	}
	f.qna_subject.value = str;
	
	
	str = f.qna_content.value;
	str = str.trim();
	if(!str){
		alert("\n내용을 입력하세요.");
		f.qna_content.focus();
		return;
		
		
	}
	
	if(str.length <20 ){
		str=str.substr(0, 20);
		alert("20자 이상작성해주세요!!");
		
		f.qna_content.focus();
		return;
	}
	f.qna_content.value = str;
	
	
	f.action = "/dailychan/help/qnaregister_ok.action";
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

										</ul>
									</li>

									<li class="on">
										<c:if test="${join_id eq null }">
											<a href="/dailychan/join/login.action">
										</c:if> 
										<c:if test="${join_id ne null }">
											<a href="/dailychan/help/qnalist.action">
										</c:if> 1:1 친절상담</a>

										<ul>
											<li><c:if test="${join_id eq null }">
													<a href="/dailychan/join/login.action">
												</c:if> 
													<c:if test="${join_id ne null }">
													<a href="/dailychan/help/qnalist.action">
												</c:if>상담내역</a>
											</li>

											<li class="on">
												<c:if test="${join_id eq null }">
													<a href="/dailychan/join/login.action">
												</c:if>
												<c:if test="${join_id ne null }">
													<a href="/dailychan/help/qnaregister.action">
												</c:if>상담하기</a>
											</li>

										</ul>
									</li>
									
									<li><a href="/dailychan/help/notice.action">공지사항</a></li>

								</ul>

							</div>

							<div style="height: 36px; color: #6ca437; font-size: 34px; font-weight: bold; text-align: center; padding-top: 50px">1:1 상담하기</div>
							<!-- 서브 카테고리 -->

							<div class="mypage-contents">

								<!-- 게시판 , 리스트 -->


								<div class="notice_view_area">

									<!-- title -->
									<!--// 주문단계 -->

									<form action="" name="myForm" method="post" enctype="multipart/form-data">

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
																문의분야 </span></th>
														<td>
															<ul class="faqSelectList">

																<li class="ea3">
																	<span class="radios">
																		<input type="radio" name="qna_select" id="category.categoryNo1" value="취소/교환/반품" checked="checked">
																		<label for="category.categoryNo1"></label>
																	</span>
																	<label for="category.categoryNo1">
																		<p style="cursor: pointer">취소/교환/반품</p>
																	</label>
																</li>
																
																<li class="ea3">
																	<span class="radios">
																		<input type="radio" name="qna_select" id="category.categoryNo2" value="주문/결제">
																		<label for="category.categoryNo2"></label>
																	</span>
																	<label for="category.categoryNo2">
																		<p style="cursor: pointer">주문/결제</p>
																	</label>
																</li>

																<li class="ea3"><span class="radios"> <input
																		type="radio" name="qna_select"
																		id="category.categoryNo3" value="배송"> <label
																		for="category.categoryNo3"></label>
																</span> <label for="category.categoryNo3">
																		<p style="cursor: pointer">배송</p>
																</label></li>

																<li class="ea3"><span class="radios"> <input
																		type="radio" name="qna_select"
																		id="category.categoryNo4" value="회원/정보"> <label
																		for="category.categoryNo4"></label>
																</span> <label for="category.categoryNo4">
																		<p style="cursor: pointer">회원/정보</p>
																</label></li>

																<li class="ea3"><span class="radios"> <input
																		type="radio" name="qna_select"
																		id="category.categoryNo5" value="서비스/기타"> <label
																		for="category.categoryNo5"></label>
																</span> <label for="category.categoryNo5">
																		<p style="cursor: pointer">서비스/기타</p>
																</label></li>

															</ul>
														</td>
													</tr>
													<tr>
														<th scope="row">
															<span class="inputWd260">문의유형 </span>
														</th>
														<td>
															<ul class="faqSelectList">
																<li class="ea3">
						                                            <span class="radios">
						                                                <input type="radio" name="qna_type" id="targetCommon" checked="checked" value="1" onclick="descQuestionType('1')">
						                                                <label for="targetCommon"></label>
						                                            </span>
						                                            <label for="targetCommon">
						                                                <p style="cursor:pointer">일반문의</p>
						                                            </label>
						                                        </li>
 
	 															<li class="ea3">
														            <span class="radios">
						                                                <input type="radio" name="qna_type" id="targetStore" value="2" onclick="descQuestionType('2')">
						                                                <label for="targetStore"></label>
						                                            </span>
						                                            <label for="targetStore">
						                                                <p style="cursor:pointer">매장에 직접문의</p>
						                                               
						                                            </label>
														        </li>
															</ul>
														</td>
													</tr>
											
													<tr id="questionStore">
					                                    <th><span class="inputWd260">문의매장</span></th>
					                                    <td>
					                                       <div class="oasisJoinInput_store">
					                                           <select id="targetStoreId" name="qna_store" style="height:28px; border:1px solid #bbbbbb;">
					                                               
					                                                   <option value="-1"></option>
					                                               
					                                                   <option value="아이티윌부산">아이티윌 부산</option>
					                                               
					                                                   <option value="아이티윌강남">아이티윌 강남</option>
					                                               		
					                                           </select>
					                                       </div>
					                                    </td>
					                                </tr>
					                                
													<tr>
														<th scope="row">
															<span class="inputWd260">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 </span>
														</th>
														<td>
															<input type="text" class="inputWd370" name="qna_subject" height="50" />
														</td>
													</tr>
													<tr>
														<th scope="row">
															<span class="inputWd260">이미지 </span>
														</th>
														<td>
															<input type="file" class="inputWd370" name="file" value="${dto.qna_saveFileName }" />
															<input type="hidden" name="qna_saveFileName" value="${dto.qna_saveFileName }">
														</td>
													</tr>
													<tr>
														<th scope="row"><span class="inputWd260">내용 </span></th>
														<td>
															<textarea rows="35" cols="50" style="line-height: 18px; padding: 5px; margin-right: 3px; border: 1px solid #bbbbbb"
																name="qna_content" placeholder="상담과 무관한 내용이나 동일 문자의 반복 등 부적합한 내용일 때는 통보없이 삭제 될 수 있습니다. 내용을 입력해 주세요. (20자 이상 3,000자 미만)" maxlength="3000">
															</textarea>
														</td>
													</tr>
												</tbody>
											</table>

											<span>
												<div class="btn_center btn_green ">
													<a href="/dailychan/help/qnalist.action">목록보기</a>
													<input type="reset" value="다시쓰기" onclick="document.myForm.qna_subject.focus();" style="display: inline-block; height: 36px; line-height: 36px; color: #fafafa; background: #6ca435; padding: 0 47px; font-size: 14px; font-weight: 500; border: 1px solid #bbbbbb;">
													<input type="button" value="등록하기" onclick="sendIt();" style="display: inline-block; height: 36px; line-height: 36px; color: #fafafa; background: #6ca435; padding: 0 47px; font-size: 14px; font-weight: 500; border: 1px solid #bbbbbb;">
												</div>
											</span>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- //공지사항 보기 -->
				<input type="hidden" id="imagePath" value="http://www.oasis.co.kr:8580/">
				<!-- btn : 목록보기 -->
				<!-- 0527, 수정-->

				<!-- //btn : 목록보기 -->
				<!-- //게시판 , 리스트 -->
				<!-- //내용 입니다 -->

				<!-- //게시판 , 리스트 -->

				<form id="contentSearchForm">
					<input type="hidden" name="page" value="1" /> 
					<input type="hidden" name="keyword" value="" />
				</form>

				<form id="faqContentForm" method="get">
					<input type="hidden" name="keyword" value="" />
					<input type="hidden" name="page" value="" />
					<input type="hidden" name="categoryNo" value="" />
				</form>
				<!-- //내용 입니다 -->
			</div>

			<!-- //오른쪽 영역 -->
		</div>
	</div>

	<!-- //컨텐츠 -->

	<form id="contentForm" method="get">
		<input type="hidden" name="keyword" value="">
		<input type="hidden" name="page" value="1">
		<input type="hidden" name="categoryNo" value="17">
	</form>

</body>
</html>