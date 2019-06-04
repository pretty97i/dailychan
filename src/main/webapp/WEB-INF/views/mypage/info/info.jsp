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
	
		$(document).ready(function() {
			if("${dto.join_emailAgree}==Y"){
				$("#email_y").prop("checked", true);
				$("#email_n").prop("checked", false);
			}else {
				$("#email_n").prop("checked", true);
				$("#email_y").prop("checked", false);
			}
			
			if("${dto.join_snsAgree}==Y"){
				$("#sns_y").prop("checked", true);
				$("#sns_n").prop("checked", false);
			}else {
				$("#sns_n").prop("checked", true);
				$("#sns_y").prop("checked", false);
			}
			
			$("#password").on("keydown", function(e) {
				if (e.keyCode == 13) {
					checkPassword();
				}
			});
		});
		
		function checkPassword() {
			var password = $("#password").val();
			
			if (password == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
			}
			else {
				
				$.ajax({
					url : "checkPassword.action",
					type: "POST",
					async: false,
					data: { password: password },
					success: function(data) {
						
						alert(data.message);
						
						window.location.replace("<%=cp%>/myPage/info.action?&check=" + data.check);

					}
				});
				
			}
		}
	
	function updateInfo() {
		
		var join_id="${dto.join_id }";
		var userName = $.trim( $("#userName").val() );
		var tel = $("#newTel").val();
		var email = $("#email").val();
		var zoneCode = $("#zoneCode").val();
		var address1 = $("#address1").val();
		var address2 = $("#address2").val();
		var emailAgree = $("#join_emailAgree").val();
		var snsAgree = $("#join_snsAgree").val();
		
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
				url : "infoUpdate.action",
				type: "POST",
				async: false,
				data: { 
					join_id: join_id,
					join_name: userName,
					join_phone: tel,
					join_email: email,
					join_addrNum: zoneCode,
					join_addr1: address1,
					join_addr2: address2,
					join_emailAgree: emailAgree,
					join_snsAgree: snsAgree
					},
				success: function(data) {
					
					alert(data.message);
					
					window.location.replace("<%=cp%>/myPage/info.action?&check=" + data.check);
				}
			});			
		}		
	}
	
	  //휴대폰중복
	  
    function checkTelAlreadyExists() {
		
    	var join_phone = $("#newTel").val();
    	var regPhone = /^\d{3}-\d{3,4}-\d{4}$/;	//휴대번호 체크
    	
    	
		if(join_phone.length < 1){
			
			alert("휴대폰을 입력해주시기 바랍니다.");
		}else if(!regPhone.test($("#newTel").val())){
	        alert("휴대폰 형식에 맞게 입력해주시기 바랍니다.");
	        $("#join_phone").val("${join_phone}");
	        $("#join_phone").focus();
	        return false;
	
		}else{
			
			var url = "<%=cp%>/join/checkTelAlreadyExists.action";
			
			$.post(url,{join_phone:join_phone},function(args){
				
				var checkPhone = decodeURIComponent(args).replace(/\+/g, ' ');
				
				/* $("#checkIdOk").html(checkId);
				$("#checkIdOk").show(); */
				alert(checkPhone);
				
				
			});
			
		}

	}
	  
    function findPostCode(isOrder) {
        new daum.Postcode({
            oncomplete : function(data) {
                if (isOrder) {
                    $("#orderZoneCode").val(data.zonecode);
                    $("#orderAddress1").val(data.roadAddress);
                                            
                    if (data.jibunAddress.length > 0) {
                        $("#orderOldAddress1").val(data.jibunAddress);
                    } else {
                        $("#orderOldAddress1").val(data.autoJibunAddress);
                    }
                    $("#orerPostCode").val(data.postcode);
                    $("#orderAddress2").val("").focus();
                } else {
                    $("#zoneCode").val(data.zonecode);
                    
                    if (data.jibunAddress.length > 0) {
                        $("#oldAddress1").val(data.jibunAddress);
                    } else {
                        $("#oldAddress1").val(data.autoJibunAddress);   
                    }
                    
                    if (data.roadAddress.length > 0) {
                        $("#address1").val(data.roadAddress);
                    } else {
                        $("#address1").val($("#oldAddress1").val());
                    }
                    
                    $("#postCode").val(data.postcode);
                    $("#address2").val("").focus();
                }
                checkDeliveryTimeStatus($("#address1").val(), $("#oldAddress1").val());
            }
        }).open();
    }
		
	</script>
</head>

<body>
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
								
									<li>
										<a href="/dailychan/myPage/qnaList.action">1:1상담내역</a>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/refundProductList.action?refundGbn=R0">환불서비스</a>

									</li>
								
									<li class="on">
										<a href="/dailychan/myPage/info.action?check=0">회원정보 관리</a>	
										
											<ul>
											
												<li class="on"><a href="/dailychan/myPage/info.action?check=0">회원정보 수정</a></li>
											
												<li><a href="/dailychan/myPage/changePassword.action">비밀번호 변경</a></li>
											
											</ul>
										
									</li>
								
									<li>
										<a href="/dailychan/myPage/invite.action">친구추천</a>
										
										
									</li>
								
							</ul>
						</div>

						<!-- if문 시작 -->
						<c:if test="${check==0 }">
						<div class="mypage-contents">
							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>회원정보 수정</h4>
								</div>
								<div class="mypage-order-info auto">
									<div class="row icon-guide for-passwordcheck">
										<h5>비밀번호 확인</h5>
										<p>정보를안전하게 보호하기 위해 비밀번호를 다시 한 번 확인 합니다.<br>데일리찬은 회원님의 개인정보를 신중히 취급하며, 회원님의 동의없이는 기재하신 회원정보를 공개 및 변경하지 않습니다.  </p>
									</div>
								</div>
							</div>
							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>필수정보</h4>
								</div>

								<div class="mypage-form-table">
									<table>
										<colgroup>
											<col style="width:144px;">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">아이디</th>
												<td>
													<p>${dto.join_id }</p>
												</td>
											</tr>
											<tr>
												<th scope="row">비밀번호</th>
												<td>
													<p class="fe-row">
														<input type="password" id="password" autocomplete="new-password">
													</p>
												</td>
											</tr>
											
											
										</tbody>
									</table>
								</div>
								<div class="btn-wrap">
									<a href="#" class="btn lred md" onclick="checkPassword(); return false;">확인</a>
									<a href="/dailychan/myPage/main.action" class="btn gray md">메인으로</a>
								</div>
							</div>
						</div>
						</c:if>
						<!-- if문 끝 -->
						
						<!-- 회원정보 if문 시작 -->
						<c:if test="${check==1 }">
						<div class="mypage-contents">

							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>필수정보</h4>
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
													<p>${dto.join_id }</p>
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
														<input type="text" id="newTel" value="${dto.join_phone }">
														<a href="#" class="btn" onclick="checkTelAlreadyExists(); return false;">확인</a>
														<input id="time" readonly="readonly" style="border:0;margin-left:10px"/>
													</p>
												</td>
											</tr>
											<tr>
												<th scope="row">주소</th>
												<td>
													<p class="fe-row">
														<input type="text" readonly class="readonly sm" id="zoneCode" value="${dto.join_addrNum }" readonly="readonly">
														<a href="#" class="btn" onclick="findPostCode(false); return false;">우편번호 찾기</a>
													</p>
													<p class="fe-row">
														<input type="text" class="readonly" id="address1" value="${dto.join_addr1 }" readonly="readonly">
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
																<input type="radio" name="join_emailAgree"  value="Y" id="email_y">
																<i></i><span>예</span>
															</label>
															<label class="radio">
																<input type="radio" name="join_emailAgree" checked='checked' value="N" id="email_n">
																<i></i><span>아니오</span>
															</label>
														</p>
														<p class="fe-row">
															<span class="tit">SMS : </span>
															<label class="radio">
																<input type="radio" name="join_snsAgree"  value="Y" id="sns_y">
																<i></i><span>예</span>
															</label>
															<label class="radio">
																<input type="radio" name="join_snsAgree" checked='checked' value="N" id="sns_n">
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
									<a href="#" class="btn lred md" onclick="updateInfo(); return false;">정보수정</a>
									<a href="#" class="btn gray md" onclick="dropInfo(); return false;">회원탈퇴</a>
									<a href="/dailychan/myPage/main.action" class="btn gray md">메인으로</a>
									
								</div>
							</div>
						</div>
						</c:if>
						<!-- 회원정보 if문 끝 -->
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //컨텐츠 -->

</div>
</body>
</html>