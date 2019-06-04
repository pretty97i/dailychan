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
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.04"></script>
<script type="text/javascript" charset="utf-8">

 function sendIt() {	//검색버튼
	
	 var f = document.searchForm;

	 f.action = "<%=cp%>/admin/info.action";
	 f.submit();
	 
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
							
						<div class="mypage-contents">

							<div class="mypage-cblock">

								<div class="mypage-subtit">
									<h4>회원 관리내역</h4>
									
									<span style="float: right"  >
										<form action="" name="searchForm" method="post">
											<select name="searchKey" class="selectField" style="height: 25px">
												<option value="join_id">아이디</option>
												<option value="join_phone">전화번호</option>
												<option value="join_name">이름</option>	
											</select>
											<input type="text" name="searchValue" class="textField"" style="height: 25px; border: solid 1px;  border-color: gray;"/>
											<input type="button" value=" 검색 " class="btn2" onclick="sendIt();" style="height: 25px; color: #bbb ;"/>			
										
										</form>		
									</span>	
									<br/>
								</div>
								
								
								<div class="mypage-table mypage-goods-list row">
								
				
								
								
								<table class="tableCom mgT10">
									<colgroup>
										<col width="40">
										<col width="80">
										<col width="80">
										<col width="120">
										<col width="120">
										<col width="50">
										<col width="80">
										<col width="100">
									</colgroup>
									<thead>
										<tr >
											<th class="num">번호</th>
											<th class="join_id">ID</th>
											<th class="join_name">이름</th>
											<th class="join_phone">전화번호</th>
											<th class="join_email">E-Mail</th>
											<th class="join_snsAgree">SNS 수신</th>
											<th class="join_emailAgree">이메일 수신</th>
											<th>비고</th>
										</tr>
									</thead>

									<tbody id="joinAnswer">
										<c:if test="${joinDataCount==0 }">
						
											<tr>
												<td colspan="8">
					                                <div class="empty-msg">회원을 채워주세요.</div>
												</td>
											</tr>
										
										</c:if>
										
										<c:if test="${joinDataCount!=0 }">
											<div id="joinList">
												<c:forEach var="dto" items="${joinList}">
												<tr>
													<td>${dto.join_num}</td>
													<td>${dto.join_id }</td>
													<td>${dto.join_name}</td>
													<td>${dto.join_phone}</td>
													<td>${dto.join_email}</td>
													<td>${dto.join_snsAgree}</td>
													<td>${dto.join_emailAgree}</td>
													<td>
														<a href="#" class="btn lgray" onclick="javascript:location.href='<%=cp%>/admin/update.action?join_id=${dto.join_id}'">수정</a>
														<a href="#" class="btn red" onclick="javascript:location.href='<%=cp%>/admin/deleted.action?join_id=${dto.join_id}&pageNum=${pageNum}'">탈퇴</a>
														
													</td>
													
												</tr>
												
												</c:forEach>
											</div>
										</c:if>

									</tbody>
								</table>
								</div>

								<div class="paging-wrap">
									<c:if test="${joinDataCount!=0 }">
										${pageIndexList }
									</c:if>
								</div>
								
							</div>

						</div>

					</div>
				</div>

			</div>

		</div>
	</div>

</div>
<!-- </form> -->
</body>
</html>