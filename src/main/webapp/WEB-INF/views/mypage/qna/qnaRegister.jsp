<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<title>데일리찬::믿을 수 있는 먹거리</title>
	
<jsp:include page="/WEB-INF/views/top.jsp">
	<jsp:param value="${sort }" name="sort"/>
</jsp:include>
	
<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72.png" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-50@2x.png" sizes="96x96" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72@2x.png" sizes="144x144" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-60@3x.png" sizes="192x192" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css?dummy=6.12" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.12"></script>

	<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_mypage.css" />
	
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
		
		
		f.action = "/dailychan/myPage/qnaRegister_ok.action";
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
				<!-- mypage-wrap -->
				<div class="mypage-wrap">

					<div class="mypage-personal">
						<div class="personal-info">
							<div class="grade">

								<i class="icon-grade basic">member</i>
			
							</div>
							<div class="name"><b>${dto.join_name }</b><em>님</em></div>
							<div class="edit">
								<a href="/dailychan/myPage/info.action?check=0">
									<i class="icon-mypage tools"></i>회원정보관리
								</a>
							</div>
						</div>

						<div class="personal-status">
							<ul>
								<li>
									<a href="/dailychan/myPage/orderList.action">
										<i class="icon-mypage ps-order"></i>
										<b>주문/배송</b>
										<span><em>${buySu}건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/pointList.action?accGubun=M">
										<i class="icon-mypage ps-point"></i>
										<b>포인트</b>
										<span><em>${dto.join_point }P</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/couponList.action?couponGubun=USE">
										<i class="icon-mypage ps-coupon"></i>
										<b>쿠폰</b>
										<span><em>${coupon }장</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/myPage/qnaList.action">
										<i class="icon-mypage ps-chat"></i>
										<b>1:1 상담</b>
										<span><em>${consultingSu }건</em></span>							
									</a>
								</li>						
							</ul>
						</div>
					</div>

					<!-- mypage-contents-wrap -->
					<div class="mypage-contents-wrap">

						<div class="mypage-lnb">
							<a href="/dailychan/myPage/main.action">
								<h3>MY 쇼핑</h3>
							</a>
							<ul>
								
									<li>
										<a href="/dailychan/myPage/orderList.action">주문관리</a>										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/wishList.action">찜내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/frequencyList.action">자주구매상품</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/pointList.action?accGubun=M">포인트 내역</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/couponList.action?couponGubun=USE">쿠폰 내역</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/commentList.action">구매후기</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/productQnaList.action">상품문의내역</a>
										
										
									</li>
								
									<li class="on">
										<a href="/dailychan/myPage/qnaList.action">1:1상담내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/refundProductList.action?refundGbn=R0">환불서비스</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/info.action?check=0">회원정보 관리</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/invite.action">친구추천</a>							
										
									</li>
								
							</ul>
						</div>

						<div class="mypage-contents">
							<div class="mypage-subtit" style="border-bottom : solid 2px green;">
								<h4 style="height: 25px;">1:1상담</h4>
							</div>
						
							<!-- 게시판 , 리스트 -->
							<div class="notice_view_area">
					
								<!-- title -->
								<!--// 주문단계 -->
					
								<form action="" name="myForm" method="post" enctype="multipart/form-data">
					
									<div class="orderTbl2">
										<table style="border-top: 1px solid #ddd">
											<colgroup>
												<col width="143px" />
												<col width="" />
												<col width="143px" />
												<col width="" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">
														<span class="inputWd260">문의분야</span>
													</th>
													<td>
														<ul class="faqSelectList">
															<li class="ea3">
																<span class="radios"> 
																	<input type="radio" name="qna_select" id="category.categoryNo1" value="취소/교환/반품" checked="checked"/>
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
					
															<li class="ea3">
																<span class="radios">
																	<input type="radio" name="qna_select" id="category.categoryNo3" value="배송"/>
																	<label for="category.categoryNo3"></label>
																</span> 
																<label for="category.categoryNo3">
																		<p style="cursor: pointer">배송</p>
																</label>
															</li>
					
															<li class="ea3">
																<span class="radios"> 
																	<input type="radio" name="qna_select" id="category.categoryNo4" value="회원/정보"/>
																	<label for="category.categoryNo4"></label>
																</span>
																<label for="category.categoryNo4">
																	<p style="cursor: pointer">회원/정보</p>
																</label>
															</li>
					
															<li class="ea3">
																<span class="radios">
																	<input type="radio" name="qna_select" id="category.categoryNo5" value="서비스/기타">
																	<label for="category.categoryNo5"></label>
																</span>
																<label for="category.categoryNo5">
																	<p style="cursor: pointer">서비스/기타</p>
																</label>
															</li>
					
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
						                                           <input type="radio" name="qna_type" id="targetCommon" checked="checked" value="1" onclick="descQuestionType('1');">
						                                           <label for="targetCommon"></label>
						                                       </span>
						                                       <label for="targetCommon">
						                                           <p style="cursor:pointer">일반문의</p>
						                                       </label>
						                                   </li>
						
															<li class="ea3">
																<span class="radios">
						                                           <input type="radio" name="qna_type" id="targetStore" value="2" onclick="descQuestionType('2');">
						                                           <label for="targetStore"></label>
						                                       </span>
						                                       <label for="targetStore">
						                                           <p style="cursor:pointer">매장에 직접문의</p>
						                                          
						                                       </label>
									       					</li>
														</ul>
													</td>
												</tr>
										
												<tr style="" id="questionStore">
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
													<td><input type="text" class="inputWd370" name="qna_subject" height="50" /></td>
												</tr>
												<tr>
													<th scope="row"><span class="inputWd260">이미지 </span></th>
													<td>
														<input type="file" class="inputWd370" name="file" value="${dto.qna_saveFileName }" />
														<input type="hidden" name="qna_saveFileName" value="${dto.qna_saveFileName }">
													</td>
												</tr>
												<tr>
													<th scope="row"><span class="inputWd260">내용 </span></th>
													<td>
														<textarea rows="35" cols="50"style="line-height: 18px; padding: 5px; margin-right: 3px; border: 1px solid #bbbbbb" name="qna_content"placeholder="상담과 무관한 내용이나 동일 문자의 반복 등 부적합한 내용일 때는 통보없이 삭제 될 수 있습니다. 내용을 입력해 주세요. (20자 이상 3,000자 미만)" maxlength="3000"></textarea>
													</td>
												</tr>
											</tbody>
										</table>
					
					
										<span>
					
											<div class="btn_center btn_green ">
												<a href="/dailychan/myPage/qnaList.action">목록보기</a>
												<input type="reset" value="다시쓰기" onclick="document.myForm.qna_subject.focus();" style="display: inline-block; height: 36px; line-height: 36px; color: #fafafa; background: #6ca435; padding: 0 47px; font-size: 14px; font-weight: 500; border: 1px solid #bbbbbb;">
												<input type="button" value="등록하기" onclick="sendIt();" style="display: inline-block; height: 36px; line-height: 36px; color: #fafafa; background: #6ca435; padding: 0 47px; font-size: 14px; font-weight: 500; border: 1px solid #bbbbbb;">
											</div>
											
										</span>
								</form>
					
							</div>
						</div>
					</div>
					<!--// mypage-contents-wrap -->
				</div>
				<!--// mypage-wrap -->
			</div>
		</div>
	</div>
	<!-- //컨텐츠 -->

</div>
</body>
</html>