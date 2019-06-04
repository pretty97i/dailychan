<%@ page contentType="text/html; charset=UTF-8"%>
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

							<script type="text/javascript">
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
</script>
							<!-- lpopStyWrap (1:1상담신청) -->
							<div id="questionDialog" class="oasisLayerPop new-layerpop pop-question" style="height: auto">
								<div class="oasisLayerPop_in">
									<div class="oasisLPtit">
										<strong>1:1상담신청</strong>
									</div>

									<div class="oasisLPconWrap">
										<!-- 이 안에 팝업 내용 넣기 -->
										<div class="comLayerCon">
											<div class="oasisLPcon1">
												<ul class="paymentTxt">
													<li style="font-weight: bold; color: #333333;">통화량이 많아
														온라인으로 문의 남겨주시면 최대한 빠른 시간내에 답변 드리겠습니다.</li>
													<li>문의하실 분야를 선택하신 후 내용을 입력하신 다음 "신청하기 " 버튼을 눌러주세요.</li>
													<li>한번 등록한 상담내용은 수정이 불가능합니다. 수정을 원하시는 경우, 삭제 후 재등록 하셔야
														합니다.</li>
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
																		<input type="file" id="attachFile1" name="attachFile1"
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
																<td><span class="checks"> <input type="checkbox" id="qnaSmsAlarmYn" checked="checked">
																		<label for="qnaSmsAlarmYn"></label>
																</span>&nbsp; <label for="qnaSmsAlarmYn">답변 후 문자보내주세요</label></td>
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
									<li class="on">
										<a href="/dailychan/help/deliveryrule.action">이용안내</a>

										<ul>

											<li><a href="/dailychan/help/deliveryrule.action">배송정책</a></li>

											<li><a href="/dailychan/help/cancelrule.action">취소/교환/반품</a></li>

											<li class="on"><a
												href="/dailychan/help/selfrefund.action">Self환불서비스</a></li>

										</ul></li>

									<li><c:if test="${join_id eq null }">
											<a href="/dailychan/join/login.action">
										</c:if> <c:if test="${join_id ne null }">
											<a href="/dailychan/help/qnalist.action">
										</c:if> 1:1 친절상담</a></li>

									<li><a href="/dailychan/help/notice.action">공지사항</a></li>

								</ul>
							</div>

							<!-- 서브 카테고리 -->
							<!-- 서브 카테고리 -->
							<div class="mypage-contents">
								<!-- 서브 카테고리 -->
								<div class="infoMenuBlock infolist">
									<ul id="menu_2">
										<li><a href="/dailychan/help/deliveryrule.action">배송정책</a>
										</li>
										<li><a href="/dailychan/help/cancelrule.action">취소/교환/반품</a>
										</li>
										<li class="on"><a
											href="/dailychan/help/selfrefund.action">Self환불서비스</a></li>
									</ul>
								</div>
								<!--// 서브 카테고리 -->
								<div id="tab_cnt_area">


									<!-- 바로가기 -->
									<div class="info_selfbox">
										<h4>지금바로 Self환불기 클릭 한번으로 간편하게 환불 할 수 있습니다.</h4>
										<div style="text-align: center">
											<a href="/dailychan/myPage/refundProductList.action?refundGbn=R0"
												style="text-algin: center"><div class="info_btn"
													style="padding: 5px 15px">Self환불기 바로가기</div></a>
										</div>
									</div>

									<!--// 바로가기 -->
									<!-- 환불방법 -->
									<div class="info_txt" style="padding-top: 50px">
										<h4>업계최초 내맘대로 Self환불 계산기</h4>
										<p>
											데일리찬는 불만족 상품에 대한 반품과 환불이 용이하도록 Self 환불 서비스를 제공하고 있습니다. </br> 구매하신
											상품의 불만족 시 아래 규정을 먼저 확인해주세요.
										</p>
									</div>
									<div class="info_boxs">
										<table>
											<colgroup>
												<col style="width: 20%">
												<col style="width: 80%;">
											</colgroup>
											<tbody>
												<tr>
													<th>환불기간</th>
													<td>배송완료부터 1주일 이내 환불 요청이 가능합니다.</br> 환불 요청 후 담당자의 검토/승인 까지
														최대 하루 정도 소요됩니다.(영업일 기준)

													</td>
												</tr>
												<tr>
													<th>환불절차</th>
													<td>1. 마이페이지에서 환불서비스를 선택합니다.</br> 2. 환불가능상품 리스트에서 환불해당 상품에
														환불요청을 클릭합니다.</br> &nbsp;&nbsp;&nbsp; 환불가능상품은 상품의 배송완료 일자가 1주일
														이내인 상품에 대해 가능합니다.</br> 3. 환불유형선택 후 상품 하자일 경우 환불액을 직접 선택할 수
														있습니다.</br> &nbsp;&nbsp;&nbsp; 상품하자의 경우 사진 첨부 후 환불 요청을 해주세요.</br>
														&nbsp;&nbsp;&nbsp; 상품 미수령일 경우 상품구매가격의 100%를 포인트로 환불해 드립니다.</br>
														4. 최종환불은 최대 하루 정도 소요됩니다.</br> &nbsp;&nbsp;&nbsp; 사실과 다른 환불 요청의
														경우 반려처리 될 수 있습니다.</br>
													</td>
												</tr>
												<tr>
													<th>지급방법</th>
													<td>환불 요청 시 포인트로 지급됩니다.</br> 결제수단으로 환불을 원하실 경우 고객센터로 연락주시기
														바랍니다.</br>
													</td>
												</tr>
											</tbody>
										</table>
										<div style="padding: 10px 0 0 20px">
											*보다 자세한 Self환불기 이용방법이 궁금하시면 환불기 이용안내를 참고 하세요. <a
												href="/dailychan/selfRefundDetail.action" class="btn">Self환불서비스
												안내 바로가기</a>
										</div>
									</div>
									<!--// 환불가능 -->

									<!--상담 -->
									<div class="help_box" style="margin-top: 50px">
										<div class="help_box_left">
											<ul>
												<li class="tit">고객센터</li>
												<li class="number">1577-0098</li>
												<li>평일 09:30~18:30, 토요일 09:30~15:00(일요일/공휴일 휴무)</li>
											</ul>
										</div>
										<div class="help_box_right">
											<ul>
												<li class="tit">1:1 친절상담</li>
												<li class="stit">궁금한 사항은 언제든 문의하세요.</li>
												<li style="padding-top: 10px;">
													<div class="help_btn_left">


														<a href="/dailychan/help/qnaregister.action">상담하기</a>

													</div>
													<div class="help_btn_right">
														<a href="/dailychan/help/qnalist.action">상담내역보기</a>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<!--//상담 끝-->
									<!--// 상품품절-->
								</div>

							</div>
							<!--// self환불기-->
						</div>
					</div>

				</div>
				<!-- //오른쪽 영역 -->
			</div>
		</div>
	</div>

	<!-- //컨텐츠 -->
	<form id="faqContentForm" method="get">
		<input type="hidden" name="keyword" value="" /> <input type="hidden"
			name="page" value="" /> <input type="hidden" name="categoryNo"
			value="" />
	</form>

</body>
</html>