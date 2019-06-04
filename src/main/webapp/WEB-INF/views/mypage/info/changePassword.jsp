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
	
		function updatePassword() {	
			var password = "${dto.join_password}";
			var oldPassword = $("#oldPassword").val();
			var join_password = $("#join_password").val();
			var password2 = $("#password2").val();
			
			var txt = $("#join_password").val();
            var num = txt.search(/[0-9]/g);
            var eng = txt.search(/[a-z]/ig);
            var spe = txt.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
            
			if (oldPassword == "") {
				alert("기존 비밀번호를 입력해주세요."); 
				$("#oldPassword").focus();
			}
			else if (oldPassword != password) {
				alert("기존 비밀번호를 확인해주세요.");
				$("#oldPassword").val("");
				$("#oldPassword").focus();
			}			
			else if (join_password == "") {
				alert("비밀번호를 입력해주세요.");
				$("#join_password").focus();
			}
			else if (join_password.length < 6 || join_password.length > 15) {
				alert("영문 또는 영문과 숫자 조합 6~15자리로 비밀번호를 입력해 주세요");
				$("#join_password").focus();
			}
			else if (eng < 0 && num >= 0) {
				alert("숫자만으로는 비밀번호를 사용 할 수 없습니다");
				$("#join_password").focus();
			}
			else if (join_password != password2) {
				alert("새 비밀번호를 확인해주세요.");
				$("#password2").focus();
			}
			else {
				
				var params = "join_password="+$("#join_password").val();
				
				$.ajax({
					url : "changePassword_ok.action",
					type: "POST",
					dataType: "json",
					data: params,
					success: function(args) {
						
						alert("비밀번호가 변경되었습니다.");

					},
					error : function(e){
						alert(e.responseText);
						window.location.reload(true);
					}
				
				});
			}
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
								<a href="/dailychan/myPage/info.action">
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
										<span><em>${buySu }건</em></span>
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
									<a href="/dailychan/myPage/info.action">회원정보 관리</a>

										<ul>
										
											<li><a href="/dailychan/myPage/info.action?check=0">회원정보 수정</a></li>
										
											<li class="on"><a href="/dailychan/myPage/changePassword.action">비밀번호 변경</a></li>

										</ul>
									
								</li>
								<li>
									<a href="/dailychan/myPage/invite.action">친구추천</a>

								</li>						
							</ul>
						</div>


						<div class="mypage-contents">
							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>회원정보 변경</h4>
								</div>
								<div class="mypage-order-info auto">
									<div class="row icon-guide for-password">
										<h5>비밀번호 변경</h5>
										<p>비밀번호는 주민등록번호, 생일, 학번, 전화번호 등 개인정보와 관련된 숫자나 연속된 숫자, <br>통일 반복된 숫자 등 다른 사람이 쉽게 알아 낼 수 있는 비밀번호는 사용하지 않도록 주의하여 주시기 바랍니다.</p>
									</div>
								</div>
							</div>
							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>비밀번호 변경</h4>
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
												<th scope="row">현재 비밀번호</th>
												<td>
													<p class="fe-row">
														<input type="password"  id="oldPassword" autocomplete="off">
														<span class="pholder">비밀번호를 입력해 주세요</span>
													</p>
												</td>
											</tr>
											<tr>
												<th scope="row">신규 비밀번호</th>
												<td>
													<p class="fe-row">
														<input type="password" id="join_password" autocomplete="off">
														<span class="pholder">영문, 숫자 조합 6~15자리로 비밀번호를 입력해 주세요</span>
													</p>
												</td>
											</tr>
											<tr>
												<th scope="row">신규 비밀번호 확인</th>
												<td>
													<p class="fe-row">
														<input type="password" id="password2" autocomplete="off">
														<span class="pholder"><i class="ic-atten"></i>비밀번호 확인을 위해 한 번 더 입력해 주세요</span>
													</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="btn-wrap">
									<a href="#" class="btn lred md" onclick="updatePassword(); return false;">수정</a>
									<a href="/dailychan/myPage/main.action" class="btn gray md">메인으로</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //컨텐츠 -->

</div>
</body>
</html>