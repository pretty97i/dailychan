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
<!-- 

    <script type="text/javascript">
        $(document).ready(function() {
            $('.mypage-toggle-list a').on('click',function(e) {
                e.preventDefault();
                if( $(this).closest('tr').next('.answer-tr , .review-tr').length > 0 ) {
                    $(this).closest('tr').next('.answer-tr , .review-tr').toggle();
                }
                return false;
            });
        });
        
        
        function removeQna(qnaNo) {
            if(confirm("삭제 하시겠습니까?")) {
                //removeProductQna
                
                $.ajax({
                    url : contextPath + "/myPage/removeQna",
                    type : "POST",
                    data : {qnaNo:qnaNo},
                    dataType : "json",
                    success : function(response) {
                        if (response.status == "OK") {
                            window.location.reload(true);
                        } else {
                            alert(response.message);
                        }
                    }
                });
            }
        }
        
        function faqSearch() {
            var keyword = $("#faqKeyword").val();
            $("#faqContentForm input[name='keyword']").val(keyword);
            $("#faqContentForm input[name='page']").val(1);
            $("#faqContentForm input[name='categoryNo']").val('');
            $("#faqContentForm").attr("action", "/help/faqList");
            $("#faqContentForm").submit();
        }
    </script>
 -->
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

							<!-- mypage-contents-wrap -->
							<div class="mypage-contents-wrap">


								<!-- <script type="text/javascript">
$(document).ready(function() {
        $("#targetStoreId").val();
})
    
function descQuestionType(questionType) {
        if (questionType == "common") {
            $("#questionStore").hide();
        } else {
            $("#questionStore").show();
        }
    }
</script> -->
								<!-- lpopStyWrap (1:1상담신청) -->
								<div id="questionDialog"
									class="oasisLayerPop new-layerpop pop-question"
									style="height: auto">
									<div class="oasisLayerPop_in">
										<div class="oasisLPtit">
											<strong>1:1상담신청</strong>
										</div>

										<div class="oasisLPconWrap">
											<!-- 이 안에 팝업 내용 넣기 -->
											<div class="comLayerCon">
												<div class="oasisLPcon1">
													<ul class="paymentTxt">
														<li style="font-weight: bold; color: #333333;">통화량이
															많아 온라인으로 문의 남겨주시면 최대한 빠른 시간내에 답변 드리겠습니다.</li>
														<li>문의하실 분야를 선택하신 후 내용을 입력하신 다음 "신청하기 " 버튼을 눌러주세요.</li>
														<li>한번 등록한 상담내용은 수정이 불가능합니다. 수정을 원하시는 경우, 삭제 후 재등록
															하셔야 합니다.</li>
													</ul>
												</div>

												<div class="oasisLPcon2">
													<form id="questionForm" method="post"
														action="/help/question" enctype="multipart/form-data">
														<table class="tableComWrite">
															<colgroup>
																<col width="110">
																<col width="*">
															</colgroup>
															<tbody>
																<tr>
																	<th>문의분야</th>
																	<td>
																		<ul class="faqSelectList">

																		</ul>
																	</td>
																</tr>
																<tr>
																	<th>문의유형</th>
																	<td>
																		<ul class="faqSelectList">
																			<li class="ea3"><span class="radios"> <input
																					type="radio" name="questionType" id="targetCommon"
																					value="common" checked="checked"
																					onclick="descQuestionType('common')" /> <label
																					for="targetCommon"></label>
																			</span> <label for="targetCommon">
																					<p style="cursor: pointer">일반문의</p>
																			</label></li>
																			<li class="ea3"><span class="radios"> <input
																					type="radio" name="questionType" id="targetStore"
																					value="store" onclick="descQuestionType('store')" />
																					<label for="targetStore"></label>
																			</span> <label for="targetStore">
																					<p style="cursor: pointer">매장에 직접문의</p>
																			</label></li>
																		</ul>
																	</td>
																</tr>
																<tr style="display: none" id="questionStore">
																	<th>문의매장</th>
																	<td>
																		<div class="oasisJoinInput_store">
																			<select id="targetStoreId" name="targetStoreId"
																				style="height: 28px; border: 1px solid #bbbbbb;">

																			</select>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th>제목</th>
																	<td><input name="title" type="text" /></td>
																</tr>
																<tr>
																	<th>내용</th>
																	<td>
																		<div class="cmTxtInput">
																			<textarea name="question" class="cmMtinput"
																				placeholder="상담과 무관한 내용이나 동일 문자의 반복 등 부적합한 내용일 때는 
통보없이 삭제 될 수 있습니다. 
내용을 입력해 주세요. (20자 이상 3,000자 미만)"></textarea>
																		</div>
																	</td>
																</tr>
																<tr>
																	<th>사진 첨부</th>
																	<td>
																		<div class="cmAddPhotoWrap">
																			<input type="file" id="attachFile1"
																				name="attachFile1"
																				style="height: 0; width: 0; display: none"
																				onchange="QuestionUploadChg(1);" /> <input
																				type="file" id="attachFile2" name="attachFile2"
																				style="height: 0; width: 0; display: none"
																				onchange="QuestionUploadChg(2);" /> <input
																				type="file" id="attachFile3" name="attachFile3"
																				style="height: 0; width: 0; display: none"
																				onchange="QuestionUploadChg(3);" /> <input
																				type="file" id="attachFile4" name="attachFile4"
																				style="height: 0; width: 0; display: none"
																				onchange="QuestionUploadChg(4);" /> <input
																				type="file" id="attachFile5" name="attachFile5"
																				style="height: 0; width: 0; display: none"
																				onchange="QuestionUploadChg(5);" />
																			<!-- <input type="text" readonly="readonly" id="photo"> -->
																			<a href="#" class="cmAddPhotoBtn"
																				onclick="QuestionImageUpload(); return false;">사진첨부</a>
																			<p>JPG, PNG 파일 형식의 이미지를 첨부할 수 있습니다.(20MB 이하)</p>
																			<input type="hidden" id="fileCount" name="fileCount"
																				value="0" />
																		</div>
																	</td>
																</tr>
																<tr>
																	<th>답변 알림</th>
																	<td><span class="checks"> <input
																			type="checkbox" id="qnaSmsAlarmYn" checked="checked">
																			<label for="qnaSmsAlarmYn"></label>
																	</span>&nbsp; <label for="qnaSmsAlarmYn">답변 후 문자보내주세요</label>
																	</td>
																</tr>
															</tbody>
														</table>
														<input type="hidden" id="smsAlarmYn" name="smsAlarmYn" />
														<input type="hidden" id="qnaOrderId" name="qnaOrderId"
															value="" />
													</form>
												</div>
											</div>

											<div class="oasisLPcon3 mgT25">
												<a href="#" onclick="sendQuestion(); return false;"
													style="color: white">신청하기</a> <a href="#"
													onclick="closeQuestionDialog(); return false;"
													class="oasisMapClose2" style="color: white">취소하기</a> <input
													type="hidden" value="0" id="isWrite" />
											</div>
											<!-- //이 안에 팝업 내용 넣기 -->
										</div>
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

								<!-- 서브 카테고리 -->

								<form action="" method="post">


									<!-- //검색영역 -->
									<div class="mypage-contents">
										<div class="mypage-cblock">
											<div class="mypage-subtit">
												<h4>1:1상담 내역</h4>
												<a href="/dailychan/help/qnaregister.action"
													class="btn dgray">1:1 상담 신청하기</a>
											</div>
											<div class="mypage-order-info auto">
												<div class="row">
													<ul class="dash">
														<li>한번 등록한 상담내용은 수정이 불가능합니다. 수정을 원하시는 경우, 삭제 후 재등록
															하셔야 합니다.</li>
														<li>1:1 상담신청은 24시간 신청가능하며 접수된 내용은 빠른 시간내에 답변을 드리도록
															하겠습니다.</li>
														<li>고객센터 답변가능시간 : 오전 9시 30분~오후 6시 30분(토/일/공휴일 제외)</li>
													</ul>
												</div>
											</div>

											<div class="mypage-table mypage-toggle-list">
												<table>
													<colgroup>
														<col style="width: 130px;">
														<col style="width: 130px;">
														<col>
														<col style="width: 90px;">
														<col style="width: 100px;">
													</colgroup>


													<thead>
														<tr>
															<th scope="col">문의분야</th>
															<th scope="col">문의유형</th>
															<th scope="col">제목</th>
															<th scope="col">등록일</th>
															<th scope="col">답변여부</th>
														</tr>

														<c:forEach var="dto" items="${lists }">

															<tr>
																<th scope="col">${dto.qna_select }</th>
																<th scope="col">${dto.qna_type }</th>
																<th scope="col"><a
																	href="${articleUrl }&qna_id=${dto.qna_id}">${dto.qna_subject }</a></th>
																<th scope="col">${dto.qna_created }</th>
																<th scope="col">${dto.qna_state }</th>
															</tr>

														</c:forEach>
													</thead>

													<tbody>

														<%-- 
                                        
                                            <c:if test="${dataCount==0 }">
                                                <tr>
                                                    <td colspan="5">
                                                        <div class="empty-msg">1:1 상담 내역이 없습니다.</div>
                                                    </td>
                                                </tr>
                                            </c:if>
                                            
                                            <c:if test="${dataCount!=0 }">
                                            
                                             --%>


													</tbody>
												</table>
											</div>

											<!--페이징-->
											<div class="pagingWrap">

												<c:if test="${dataCount!=0 }">
													${pageIndexList }
												</c:if>

												<c:if test="${dataCount==0 }">
													등록된게시물이 없습니다.
												</c:if>

											</div>

										</div>
									</div>
								</form>
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
				</div>
			</div>
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