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

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="title" content="데일리찬::믿을 수 있는 먹거리" />
<meta name="description" content="세상에는 없는 가격! 데일리찬에는 있습니다! 업계 최초 24시간 배송서비스!" />

<meta property="og:title" content="데일리찬::믿을 수 있는 먹거리" />
<meta property="og:type" content="website" />
<meta property="og:description" content="세상에는 없는 가격! 데일리찬에는 있습니다! 업계 최초 24시간 배송서비스!" />
<meta property="og:url" content="http://192.168.16.2:8080/dailychan/" />
<meta property="og:image" content="/dailychan/resources/images/etc/oasis_kakao.jpg"/>
<meta name="naver-site-verification" content="3899c51fb285431259219d5399363f4ef440e1b6"/>

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
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_mypage.css" />
	
	

<!-- 현진이 스크립트 -->

<script type="text/javascript">
window.onload = function () {
	addListOpen('hdsajfklhsdajkfhjlsdfhk');
	removeListOpen('aewtw');
	lastList();
}

<!-- 1.쿠폰발급 idList AJax Script -->


function insertCoupon(pageNum,search_join_id) {
	
	var search_join_id = $("#search_join_id").val() ;  	 	

	
	var url = "coupon/searchID_lists.action";
	
	$.post(url,{search_join_id:search_join_id,pageNum:pageNum},function(data){

		$("#idList").html(data);


	});
	
}

function addListOpen(str) {
	
	var url = "coupon/searchID_lists.action";

	
	$.post(url,{search_join_id:str},function(data){

		$("#idList").html(data);

	});
}


</script> 


<!-- 2. 아이디 검색후 삭제 -->
<script type="text/javascript">



function deleteCoupon(pageNum,search_join_id) {
	
	var search_join_id = $("#search_join_id2").val() ;  	 	

	
	var url = "coupon/removeIdList.action";
	
	$.post(url,{pageNum:pageNum,search_join_id:search_join_id},function(data){
		
		$("#removeIdList").html(data);


	});
	
}

function removeListOpen(str) {
	
	var url = "coupon/removeIdList.action";
	
	$.post(url,{search_join_id:str},function(data){

		$("#removeIdList").html(data);

	});
}

</script>

<!-- 3. 유효기간 지난거 -->
<script type="text/javascript">

function lastList(pageNum) {
	
	
	
	var url = "coupon/lastCouponList.action";
	
	$.post(url,{pageNum:pageNum},function(data){
		
		
		$("#lastList").html(data);
		
	});
	
}

</script> 

<!-- 쿠폰발급시 다 눌렀는지 체크 -->

<!-- //현진이 스크립트 -->


</head>

<body>
<div class="allWrap">
	<!-- header -->


	<!-- // header -->
	
	<!-- 컨텐츠 -->
	<div class="contentsArea">
		<div class="contentsWrap">
			
			<div class="content"> 
				<!-- mypage -->
				<div class="mypage-wrap">

					<div class="mypage-personal">
						<div class="personal-info">
							<div class="grade">

								<i class="icon-grade family">member</i>

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
								
									<li class="on">
										<a href="/dailychan/admin/coupon.action">쿠폰 발급</a>
										
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
								
									<li>
										<a href="/dailychan/admin/info.action">회원정보 관리</a>

										
									</li>

							</ul>
						</div>

						
						<div class="mypage-contents">
						<!--1.  쿠폰 발급-->
						<div class="mypage-cblock"><!-- 얘 -->
							<div class="mypage-subtit"><!-- 얘 -->
								<h4>쿠폰 발급</h4><br/><br/>
								<div class="mypage-orderinfo-wrap"><!-- 얘 -->
								<div class="orderTbl2" style="border:solid 1px #ddd">
								<table style="border-top:1px solid #ddd">
				                            <colgroup>
				                                <col width="143px" />
				                                <col width="185px" />
				                            </colgroup>
				                            
				                            <tbody>	                            		
			                                    <tr>
			                                        <th scope="row"><span class="starBg">&nbsp;&nbsp;&nbsp;I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; D</span></th>
			                                        <td>
			                                        
			                                        	<input type="text" name="search_join_id" id="search_join_id" style="height: 30px" class="inputWd260" value="" maxlength="50"  />
			                                       		<input type="button" value="검 색" name="btn1" id="btn1"  onclick="insertCoupon();" style="height: 30px"/>
			                                        
			                                        </td>	                                   
			                                    </tr>	                            	
				                            	
		                                    </tbody>
		                         		</table>
									<span id="idList" ></span> 
								</div>
							</div>
						</div>
					</div>	
						
							<%-- <div class="mypage-cblock">
								<div class="mypage-subtit" align="center">
									<font  style=" font-family: 나눔고딕; font-size: 20pt; color: green; font-weight: bolder;"  > 회원별 쿠폰 발급</font>
									<p></p>
								</div>
									<div class="orderTit2 conS1">
									<div class="mypage-subtit">
										<h4>회원 검색</h4>
										<p></p>
									</div>
									<div class="orderTbl2" style="border:solid 1px #ddd">
										<div class="mypage-orderinfo-wrap">
										<form action="" name="insertForm" method="post">
										<table style="border-top:1px solid #ddd">
				                            <colgroup>
				                                <col width="143px" />
				                                <col width="185px" />
				                            </colgroup>
				                            
				                            <tbody>	                            		
			                                    <tr>
			                                        <th scope="row"><span class="starBg">&nbsp;&nbsp;&nbsp;I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; D</span></th>
			                                        <td>
			                                        
			                                        	<input type="text" name="search_join_id" id="search_join_id" style="height: 30px" class="inputWd260" value="" maxlength="50"  />
			                                       		<input type="button" value="검 색" name="btn1" id="btn1"  onclick="insertCoupon();" style="height: 30px"/>
			                                        
			                                        </td>	                                   
			                                    </tr>	                            	
				                            	
		                                    </tbody>
		                         		</table>
		                         		
		                         		</form>
		                         
		                         		</div>	
			                  		</div>
			                  		
			                  		
		                  		</div>
							</div>
							<span id="idList" ></span> --%>
							
							<!-- 2. 쿠폰삭제 -->
						<div class="mypage-cblock"><!-- 얘 -->
							<div class="mypage-subtit"><!-- 얘 -->
								<h4>회원별 쿠폰 삭제 </h4><br/><br/>
								<div class="mypage-orderinfo-wrap"><!-- 얘 -->
								<div class="orderTbl2" style="border:solid 1px #ddd">
								<table style="border-top:1px solid #ddd">
		                            <colgroup>
		                                    <col width="143px" />
			                                <col width="185px" />
			                                <col width="143px" />
		                            </colgroup>
		                            
		                            <tbody>	                            		
	                                    <tr>
	                                        <th scope="row"><span class="starBg">&nbsp;&nbsp;&nbsp;I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; D</span></th>
	                                        <td>
	                                        
	                                        	<input type="text" name="search_join_id2" id="search_join_id2" style="height: 30px" class="inputWd260" value="" maxlength="50"  />
	                                       		<input type="button" value="검 색" name="btn2" id="btn2"  onclick="deleteCoupon();" style="height: 30px"/>
	                                        
	                                        </td>	                                   
	                                    </tr>	                            	
		                            	
                                    </tbody>
                         		</table>
									<span id="removeIdList" ></span>
								</div>
							</div>
						</div>
					</div>	
							
							
							<%-- <div class="mypage-cblock">
								<div class="mypage-subtit" align="center">
								<br/><br/><br/>
									<font  style=" font-family: 나눔고딕; font-size: 20pt; color: green; font-weight: bolder;"  > 회원별 쿠폰 삭제</font>
									<p></p>
								</div>
								
									<div class="orderTit2 conS1">
									<div class="mypage-subtit">
										<h4>쿠폰을 보유한 회원 리스트 검색</h4>
										<p></p>
									</div>
									<div class="orderTbl2" style="border:solid 1px #ddd">
										<div class="mypage-orderinfo-wrap">
										<form action="" name="cancleForm" method="post">
										<table style="border-top:1px solid #ddd">
				                            <colgroup>
				                                <col width="143px" />
				                                <col width="185px" />
				                                <col width="143px" />
				                            </colgroup>
				                            
				                            <tbody>	                            		
			                                    <tr>
			                                        <th scope="row"><span class="starBg">&nbsp;&nbsp;&nbsp;I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; D</span></th>
			                                        <td>
				                                        
				                                       <input type="text" name="search_join_id2" id="search_join_id2" style="height: 30px" class="inputWd260" value="" maxlength="50" />
				                                       <input type="button" value="검 색" name="btn2" id="btn2" onclick="deleteCoupon();" style="height: 30px" />
				                                    </td>                                   
			                                    </tr>	                            	
				                            	
		                                    </tbody>
		                         		</table>
		                         		
		                         		</form>
		                         
		                         		</div>	
			                  		</div>
		                  		</div>
							</div>

							<span id="removeIdList" ></span>
				              --%>
							
							
								<!-- 유효기간 지난거 삭제 -->
								<div class="mypage-cblock"><!-- 얘 -->
									<div class="mypage-subtit"><!-- 얘 -->
										<h4>유효기간 지난 쿠폰 삭제 </h4><br/><br/>
										<div class="mypage-orderinfo-wrap"><!-- 얘 -->
											<div class="orderTbl2" style="border:solid 1px #ddd">
											<table style="border-top:1px solid #ddd">
					                            <colgroup>
					                                <col width="143" />
													<col width="145" />
							                        <col width="143" />
							                        <col width="143" />
							                        <col width="143" />
					                            </colgroup>
					                            
			                         		</table>
												<span id="lastList" ></span>
											</div>
										</div>
									</div>
								</div>	
							</div>
						</div>
					</div>
				</div>


			</div>

		</div>
	</div>

</body>
</html>