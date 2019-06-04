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



							<!-- mypage-contents-wrap -->
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
										<li class="on"><a
											href="/dailychan/help/deliveryrule.action">이용안내</a>


											<ul>

												<li class="on"><a
													href="/dailychan/help/deliveryrule.action">배송정책</a></li>

												<li><a href="/dailychan/help/cancelrule.action">취소/교환/반품</a></li>

												<li><a href="/dailychan/help/selfrefund.action">Self환불서비스</a></li>

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
											<li class="on"><a
												href="/dailychan/help/deliveryrule.action">배송정책</a></li>
											<li><a href="/dailychan/help/cancelrule.action">취소/교환/반품</a>
											</li>
											<li><a href="/dailychan/help/selfrefund.action">Self환불서비스</a>
											</li>
										</ul>
									</div>
									<!--// 서브 카테고리 -->
									<div id="tab_cnt_area">
										<!-- 배송정책-->
										<!-- 매장직배송 -->
										<div id="tabCnt1">
											<div class="info_txt">
												<h4>데일리찬 매장 직배송</h4>
												<span>매장배송은 재활용 박스를 활용해 당일 배송하는 방법입니다.</span>
												<p>
													고객께서 대형마트등에서 사용하는 자율포장으로 배송 된다고 생각하시면 됩니다.</br> 고급 신선 포장을 원하시는
													고객께서는 새벽배송을 선택하세요. </br> 새벽배송을 이용하시면 좀 더 편리하고 깔끔한 포장으로 제품을 받으실 수
													있습니다.
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
															<th>배송가능지역</th>
															<td>데일리찬 직배송 가능 지역은 <span>서울 강남구, 서초구, 송파구,
																	성남분당구(판교제외),</br>용인수지구(죽전제외), 위례전지역
															</span>입니다.</br> 타 지역은 일반 택배 배송으로 진행됩니다. 빠른시일 이내에 서비스를 확대하도록 하겠습니다.</br> <a
																href="/dailychan/event/promotion/deliveryevent.action"><div
																		class="info_btn">배송가능지역 찾기</div></a>
															</td>
														</tr>
														<tr>
															<th>배송시간표</th>
															<td>*주문 마감시간은 결제 완료 시간 기준입니다.</br> <img
																src="/dailychan/resources/images/etc/info_schedule.png"
																style="padding-top: 5px">
															</td>
														</tr>
														<tr>
															<th>배송비</th>
															<td>주문금액이 3만원 미만 시 배송비 3,000원 부과
														</tr>
													</tbody>
												</table>
											</div>
											<!--// 매장직배송 -->
											<!-- 데일리찬 새벽배송 -->
											<div class="info_txt" style="padding-top: 50px">
												<h4>데일리찬 새벽배송</h4>
												<span>데일리찬 새벽 배송은 서울 전지역,경기,인천 지역은 오후 8시 이전까지 주문하시면
													다음날 새벽 배송됩니다.</span>
												<p>
													새벽배송 선택 후 일부 정보 입력하지 않은 경우, 배송이 불가능하니 주의하시기 바랍니다. </br> 상온/냉동 및
													산지직송 상품은 일부 상품에 따라 일반 택배처리 될 수 있습니다.
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
															<th>배송가능지역</th>
															<td>데일리찬 새벽배송 가능 지역은 <span>서울 전 지역, 경기,인천
																	지역(일부 지역 제외)</span> 입니다.</br> 타 지역은 일반 택배 배송으로 진행됩니다. 빠른시일 이내에 서비스를
																확대하도록 하겠습니다.</br> <a
																href="/dailychan/event/promotion/deliveryevent.action"><div
																		class="info_btn">배송가능지역 찾기</div></a>
															</td>
														</tr>
														<tr>
															<th>배송불가지역</th>
															<td>아래 지역의 경우 검색 결과에 배송 가능 지역으로 표시되더라도 새벽 배송이 불가합니다.</br>
																-남양주(전지역), 시흥시(전지역), 성남시(대장동,동원동)</br>
																-인천광역시(서천동,공촌동,원창동,가좌동,오류동,청라3동,가좌1~4동)</br>
																-고양시(송산동,삼송동,원흥동)
															</td>
														</tr>
														<tr>
															<th>배송필수정보</th>
															<td><span>새벽배송 선택 후 일부 정보 입력하지 않은 경우, 배송이
																	불가능하니 주의하시기 바랍니다. </span></br> (필수) 공동현관 출입방법: 비밀번호 입력, 자유출입, 기타 방법
																작성 중 선택</br> (필수) 연락방법: 전화 또는 문자 선택
														</tr>
														<tr>
															<th>주문마감시간</th>
															<td><img
																src="/dailychan/resources/images/etc/info_timeschedule.png">
														</tr>
														<tr>
															<th>수령가능일</th>
															<td>서울시 강남구/서초구/송파구/광진구/강동구, 용인시 수지구, 성남시 분당구 전체 지역은</br>
																새벽배송 주문마감 시간이 오후 11시로 연장되었습니다.</br> 기타 지역 오후 8시 주문 마감이니
																착오없으시길 바랍니다.
														</tr>
														<tr>
															<th>배송비</th>
															<td>주문금액이 3만원 미만 시 배송비 3,000원 부과
														</tr>
													</tbody>
												</table>
											</div>
											<!--// 데일리찬 새벽배송 -->
											<!-- 데일리찬 일반택배 -->
											<div class="info_txt" style="padding-top: 50px">
												<h4>일반택배</h4>
												<p>
													주말에는 제품의 신선도를 위해 배송을 하지 않습니다.</br> 별도 배송 요청이 있을 경우 별도 요청건을 우선
													배송합니다.</br> 명절, 공휴일 등 택배사의 사정에 따라 다소 지연될 수 있습니다.
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
															<th>배송가능지역</th>
															<td>전지역 가능</td>
														</tr>
														<tr>
															<th>배송가능시간</th>
															<td>6시까지 주문한 상품은 당일 택배 발송 </br> 오후 6시 이후 주문된 제품은 익일
																발송됩니다.
															</td>
														</tr>
														<tr>
															<th>배송비</th>
															<td>주문금액이 3만원 미만 시 배송비 3,000원 부과
														</tr>
													</tbody>
												</table>
											</div>
											<!--// 데일리찬 일반택배 -->
											<!-- 데일리찬 산지직배송 -->
											<div class="info_txt" style="padding-top: 50px">
												<h4>산지직송 배송</h4>
												<p>산지에서 직접배송하며, 생산지의 배송 정책에 따라 다르게 부과됩니다.</p>
											</div>
											<div class="info_boxs">
												<table>
													<colgroup>
														<col style="width: 20%">
														<col style="width: 80%;">
													</colgroup>
													<tbody>
														<tr>
															<th>배송가능지역</th>
															<td>전지역 가능</td>
														</tr>
														<tr>
															<th>수령시간</th>
															<td>주문완료 후 1~2일 소요</td>
														</tr>
														<tr>
															<th>배송비</th>
															<td>생산지의 배송 정책에 따라 다르게 부과됩니다.
														</tr>
													</tbody>
												</table>
											</div>
											<!--// 데일리찬 산지직배송 -->
										</div>
										<!--// 배송정책-->

										<!-- self환불기-->

									</div>
									<!--// self환불기-->
								</div>
							</div>

						</div>
						<!-- //오른쪽 영역 -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- //컨텐츠 -->
	<form id="faqContentForm" method="get">
		<input type="hidden" name="keyword" value="" /> <input type="hidden"
			name="page" value="" /> <input type="hidden" name="categoryNo"
			value="" />
	</form>
	<!-- //오른쪽 영역 -->

	<!-- //컨텐츠 -->

	<form id="contentForm" method="get">
		<input type="hidden" name="keyword" value=""> <input
			type="hidden" name="page" value="1"> <input type="hidden"
			name="categoryNo" value="17">
	</form>



</body>
</html>