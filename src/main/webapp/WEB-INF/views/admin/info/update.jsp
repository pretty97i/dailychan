<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<%
	String join_id = request.getParameter("join_id");
	String join_name = request.getParameter("join_name");
	String join_email = request.getParameter("join_email");

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
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.04"></script>
<script type="text/javascript" charset="utf-8" >
function update() {
		
		var join_id="${dto.join_id }";
		var userName = $.trim( $("#userName").val() );
		var tel = $("#tel").val();
		var email = $("#email").val();
		var zoneCode = $("#zoneCode").val();
		var address1 = $("#address1").val();
		var address2 = $("#address2").val();
		
		if (tel == "") {
			alert("휴대전화 번호를 입력해주세요.");
			$("#tel").focus();
		}
		else if (email == "") {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
		}
		else if (zoneCode == "") {
			alert("우편번호를 입력해주세요.");
		}
		else if (address1 == "") {
			alert("주소를 입력해주세요.");
		}
		else if (address2 == "") {
			alert("세부주소를 입력해주세요.");
			$("#address2").focus();
		}
		else {
			
			$.ajax({
				
				url : "update_ok.action",
				type: "POST",
				async: false,
				data: { 
					join_id: join_id,
					join_name: userName,
					join_phone: tel,
					join_email: email,
					join_addrNum: zoneCode,
					join_addr1: address1,
					join_addr2: address2
				
					},
				complete: function(data) {
					
					
					
					window.location.replace("<%=cp%>/admin/info.action");

					
				}
			});
			
		}
		
	}
		
	</script>
	<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_mypage.css" />


</head>

<body>
<!-- <form action="" method="post"> -->
<div class="allWrap">
	
	<!-- 컨텐츠 -->
	<div class="contentsArea">
		<div class="contentsWrap">
			
			<div class="content"> 
				<!-- mypage -->
				<div class="mypage-wrap">

					<div class="mypage-personal">
						<div class="personal-info">
							<div class="grade">

									<i class="icon-grade family">family</i>

							</div>
							<div class="name"><b>관리자</b><em>님</em></div>

						</div>

						<div class="personal-status">
							<ul>
								<li>
									<a href="/dailychan/admin/orderList.action">
										<i class="icon-mypage ps-order"></i>
										<font size="15pt"><b>최근 주문내역</b></font>
										<span><em>${orderDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/productQna/productQuestion.action">
										<i class="icon-mypage ps-chat"></i>
										<b>상품 문의내역</b>
										<span><em>${productQnaDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/qnaList.action">
										<i class="icon-mypage ps-chat"></i>
										<b>1:1 상담내역</b>
										<span><em>${qnaDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/refund/permitRefund.action">
										<i class="icon-mypage ps-point"></i>
										<b>환불 요청내역</b>
										<span><em>${refundDataCount }건</em></span>							
									</a>
								</li>						
							</ul>
						</div>
					</div>


					<div class="mypage-contents-wrap">
					


						<div class="mypage-lnb">
							<a href="/dailychan/admin/main.action">
								<h3>Admin</h3>
							</a>
							<ul>
									<li>
										<a href="/dailychan/admin/productRegister.action">상품등록</a>
										
									</li>
									
									<li>
										<a href="/dailychan/admin/recipeRegister.action">레시피등록</a>
										
									</li>
								
									<li>
										<a href="/dailychan/admin/orderList.action">주문관리</a>
	
										
									</li>
								
									<li>
										<a href="/dailychan/admin/coupon.action">쿠폰 발급</a>

										
									</li>
									
									<li>
										<a href="/dailychan/admin/productRecommand.action">상품추천내역</a>									
																			
									</li>

								
									<li>
										<a href="/dailychan/admin/productQna/productQuestion.action">상품문의내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/admin/qnaList.action">1:1상담내역</a>
										
										
									</li>
								
									<li>
										<a href="/dailychan/admin/refund/permitRefund.action">환불서비스</a>
										
									</li>
								
									<li class="on">
										<a href="/dailychan/admin/info.action">회원정보 관리</a>

										
									</li>

							</ul>
						</div>
							
					
						<!-- 회원정보 if문 시작 -->
					
						<div class="mypage-contents">

							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>회원관리 내역</h4>
								</div>
								<div class="mypage-form-table green">
									<table>
										<colgroup>
											<col style="width:144px;">
											<col>
										</colgroup>
										<tbody>

													<tr>
														<th scope="row">아이디</th>
														<td>
															<p><%=join_id %></p>
														</td>
													</tr>
												
											
											<tr>
												<th scope="row">성명</th>
												<td>
													<p class="fe-row">
														<input type="text" id="userName" value="${dto.join_name }" readonly="readonly">
													</p>
												</td>
											</tr>
											<tr>
												<th scope="row">휴대전화</th>
												<td>
													<p class="fe-row">
														<input type="text" id="tel" value="${dto.join_phone }">	
													</p>
												</td>
											</tr>
											<tr>
												<th scope="row">주소</th>
												<td>
													<p class="fe-row">
														<input type="text" id="zoneCode" value="${dto.join_addrNum }" >
														<!-- <a href="#;" class="btn" onclick="findPostCode(); return false;">우편번호 찾기</a> -->
													</p>
													<p class="fe-row">
														<input type="text" id="address1" value="${dto.join_addr1 }" >
														<input type="text" id="address2" value="${dto.join_addr2 }">
														<input id="oldAddress1" type="hidden"/>
														<input id="postCode" type="hidden"/>
													</p>
												</td>
											</tr>
											<tr>
												<th scope="row">이메일</th>
												<td>
													<p class="fe-row">
														<input type="text" id="email" value="${dto.join_email }">
													</p>
												</td>
											</tr>
											<tr>
												<th scope="row">SMS</th>
												<td>
													<p>
														<b>데일리찬의 다양한 정보를 보시겠습니까?</b>
													</p>
													<div class="label-set">
														<p class="fe-row">
															<span class="tit">이메일 : </span>
															<label class="radio">
																<input type="radio" name="receiveEmail"  value="Y" id="email_y">
																<i></i><span>예</span>
															</label>
															<label class="radio">
																<input type="radio" name="receiveEmail" checked='checked' value="N" id="email_n">
																<i></i><span>아니오</span>
															</label>
														</p>
														<p class="fe-row">
															<span class="tit">SMS : </span>
															<label class="radio">
																<input type="radio" name="receiveSms"  value="Y" id="sms_y">
																<i></i><span>예</span>
															</label>
															<label class="radio">
																<input type="radio" name="receiveSms" checked='checked' value="N" id="sms_n">
																<i></i><span>아니오</span>
															</label>
														</p>
													</div>
													<p class="guide">
														이메일/SMS 수신 동의를 하시면 다양한 할인혜택과<br>이벤트/신상품 등의 정보를 빠르게 만나실 수 있습니다.<br><br>단,주문 및 배송관련 정보는 수신동의와 상관없이 자동 발송됩니다.
													</p>

												</td>
											</tr>
											<tr>
												<th scope="row">가입일</th>
												<td>
													<p>

														${dto.join_created }	
													</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="btn-wrap">
									<a href="#" class="btn gray md" onclick="update(); return false;">정보수정</a>
								</div>
							</div>
						</div>
						
						<!-- 회원정보 if문 끝 -->
										
<!-- </form> -->
</body>
</html>