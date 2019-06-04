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
																<td><span class="checks"> <input
																		type="checkbox" id="qnaSmsAlarmYn" checked="checked">
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
									<li class="on"><a
										href="/dailychan/help/deliveryrule.action">이용안내</a>


										<ul>

											<li><a href="/dailychan/help/deliveryrule.action">배송정책</a></li>

											<li class="on"><a
												href="/dailychan/help/cancelrule.action">취소/교환/반품</a></li>

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
										<li><a href="/dailychan/help/deliveryrule.action">배송정책</a>
										</li>
										<li class="on"><a
											href="/dailychan/help/cancelrule.action">취소/교환/반품</a></li>
										<li><a href="/dailychan/help/selfrefund.action">Self환불서비스</a>
										</li>
									</ul>
								</div>
								<!--// 서브 카테고리 -->
								<div id="tab_cnt_area">
									<!-- 배송정책-->
									<!-- 매장직배송 -->

									<!--// 배송정책-->
									<!-- 취소/교환/반품-->

									<!-- 가능기간 -->
									<div class="info_txt" style="padding-bottom: 0">
										<h4>교환, 반품, 환불 가능기간</h4>
									</div>
									<div class="info_boxs">
										<table>
											<colgroup>
												<col style="width: 100%;">
											</colgroup>
											<tbody>
												<tr>
													<td><span>상품 수령일로부터 7일 이내에 이내에 가능합니다.</span>
														<p>
															- 채소/과일류, 냉장/냉동식품, 베이커리 제품, 유제품, 양곡 등은 상품 수령일로부터
															다음날까지(영업일 기준) 접수해 주세요.</br> - 일반 가공식품, 건강기능식품, 생활용품은 상품 수령일로부터
															7일 이내에 접수해 주세요.
														</p></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!--// 가능기간 -->
									<!-- 환불방법 -->
									<div class="info_txt"
										style="padding-bottom: 0; padding-top: 50px">
										<h4>교환, 반품, 환불 방법</h4>
									</div>
									<div class="info_boxs">
										<table>
											<colgroup>
												<col style="width: 100%;">
											</colgroup>
											<tbody>
												<tr>
													<td><span>마이페이지 > 주문관리 선택 후 해당 주문내역에서 1:1 상담신청</span>
														버튼을 클릭합니다.</br>
														<p>
															1:1 상담 신청 페이지에서 문의 분야를 취소/교환/반품 선택 후 내용을 작성해주세요.</br> 상품 하자시
															사진 첨부를 꼭 해주세요.
														</p></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!--// 환불방법 -->
									<!-- 환불가능 -->
									<div class="info_txt" style="padding-top: 50px">
										<h4>교환, 반품, 환불 가능 안내</h4>
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
													<th>불량 및 오배송</th>
													<td>1. 상품에 하자가 있거나 불량인 경우 변질, 불량, 파손, 표기오류, 이물혼입, 중량미달
														등</br> 2. 주문한 내역과 다른 상품이 배송 된 경우
													</td>
												</tr>
												<tr>
													<th>단순변심</th>
													<td>1. 일반 가공식품 및 생활용품만 반품가능</br> 2. 포장 및 구성품이 훼손되지 않은 경우
														(단, 반송 시 발생하는 비용은 고객부담)</br> <span>※ 고객부담 배송비 : 3,000원</span>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!--// 환불가능 -->
									<!-- 환불불가 -->
									<div class="info_txt"
										style="padding-top: 50px; padding-bottom: 0px">
										<h4>교환, 반품, 환불 불가 안내</h4>
									</div>
									<div class="info_boxs">
										<table>
											<colgroup>
												<col style="width: 100%;">
											</colgroup>
											<tbody>
												<tr>
													<td>1. 접수기간이 지난 경우</br> 2. 본인의 과실로 상품이 없어지거나 훼손 된 경우</br> 3.
														개봉하여 이미 사용한 경우</br> 4. 단순 기호차이에 의한 경우 (맛, 향, 색등)</br> 5. 시간이 경과되어
														상품의 가치가 현저히 떨어진 경우</br> 6. 예약상품: 취소 및 반품이 어렵습니다. 단, 예약마감 전
														고객센터로 연락하시면 취소 가능</br> 7. 신선식품: 채소, 청과, 일부 신선가공식품 (두부 / 빵 외) 가능
														내역</br>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!--// 환불불가-->
									<!-- 상품품절 -->
									<div class="info_txt"
										style="padding-bottom: 0px; padding-top: 50px;">
										<h4>상품 품절 시 보상 정책</h4>
									</div>
									<div class="info_boxs">
										<table>
											<colgroup>
												<col style="width: 100%;">
											</colgroup>
											<tbody>
												<tr>
													<td><span>포인트 5% 추가 보상 환불 제도</span></br> - 구매 후 품절로 인하여 카드
														취소/환불/입금 등이 필요한 경우, </br> &nbsp;&nbsp;&nbsp;고객님의 불편을 최소화 하기 위해
														결제 금액의 5%를 포인트로 보상해 드리고 있습니다.</br> - 적립 추가 5%+환불 금액은 마이페이지에서 확인
														가능합니다.</br> - 포인트 보상 대신 결제 부분 취소를 원하시는 경우</br> &nbsp;&nbsp;&nbsp;1:1
														고객센터에 메모 남겨주시면 24시간 이내에 취소가 가능합니다.</br></td>
												</tr>
											</tbody>
										</table>
									</div>
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


														<a href="javascript:openQuestionDialog();">상담하기</a>

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
								<!--// 취소 교환 반품-->
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

	<!-- //컨텐츠 -->
	<form id="faqContentForm" method="get">
		<input type="hidden" name="keyword" value="" /> <input type="hidden"
			name="page" value="" /> <input type="hidden" name="categoryNo"
			value="" />
	</form>

</body>
</html>