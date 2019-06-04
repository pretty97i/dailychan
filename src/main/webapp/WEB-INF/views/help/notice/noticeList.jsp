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





							<!-- //oasisLayerPop (1:1상담신청) -->

							<div class="mypage-lnb">
								<ul>

									<li><a href="/dailychan/help/faqlist.action">FAQ</a></li>

									<li><a href="/dailychan/help/deliveryrule.action">이용안내</a>


										<ul>

											<li><a href="/dailychan/help/deliveryrule.action">배송정책</a></li>

											<li><a href="/dailychan/cancelRule.action">취소/교환/반품</a></li>

											<li><a href="/dailychan/help/selfrefund.action">Self환불서비스</a></li>

										</ul></li>

									<li><c:if test="${join_id eq null }">
											<a href="/dailychan/join/login.action">
										</c:if> <c:if test="${join_id ne null }">
											<a href="/dailychan/help/qnalist.action">
										</c:if> 1:1 친절상담</a>



										<ul>

											<li><c:if test="${join_id eq null }">
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
									<li class="on"><a href="/dailychan/help/notice.action">공지사항</a>


									</li>

								</ul>
							</div>

							<!-- 서브 카테고리 -->
							<div class="mypage-contents">


								<div class="mypage-subtit" style="margin-bottom: 0">
									<h4 style="float: left; padding-top: 5px">공지사항</h4>


								</div>



								<!-- 검색영역 -->
								<div class="notice_search_area">
									<script type="text/javascript">
	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "/dailychan/help/notice.action";
		f.submit();
		
	}
	</script>

									<form action="" name="searchForm" method="post">

										<select name="searchKey" class="selectField">
											<option value="notice_subject">제목</option>
											<option value="notice_content">내용</option>
										</select> <input type="text" name="searchValue"> <a href=""
											onclick="sendIt(); return false;"><span>검색</span></a> <a
											href="/dailychan/help/notice.action"><span>목록보기</span></a>
								</div>
								<input type="hidden" name="saveFileName"
									value="${saveFileName }">
								</form>




								<!-- //검색영역 -->

								<!-- 게시판 , 리스트 -->
								<div class="notice_list_area">
									<table cellpadding="0" cellspacing="0" border="0"
										class="notice_table">
										<colgroup>
											<col width="105" />
											<col width="*" />
											<col width="165" />
										</colgroup>
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>등록일</th>
											</tr>
										</thead>
										<tbody>



											<c:forEach var="dto" items="${lists }">
												<tr>
													<td>${dto.notice_id }</td>
													<td class="td_left" style="margin-left: 30px;"><a
														href="${articleUrl}&notice_id=${dto.notice_id}">[공지]
															${dto.notice_subject }</a></td>
													<td>${dto.notice_created }</td>
												</tr>
											</c:forEach>



										</tbody>
									</table>
								</div>
								<!-- //게시판 , 리스트 -->



								<!--페이징-->
								<div class="pagingWrap">

									<c:if test="${dataCount!=0 }">
						${pageIndexList }
					</c:if>

									<c:if test="${dataCount==0 }">
						등록된게시물이 없습니다.
					</c:if>

								</div>
								<c:if test="${join_id eq 'admin' }">
								<div class="btn_center btn_green ">
									<a href="/dailychan/help/noticeRegister.action">등록하기</a>

								</div>
								</c:if>


								<form id="contentSearchForm">
									<input type="hidden" name="page" value="1" /> <input
										type="hidden" name="keyword" value="" />
								</form>

								<form id="faqContentForm" method="get">
									<input type="hidden" name="keyword" value="" /> <input
										type="hidden" name="page" value="" /> <input type="hidden"
										name="categoryNo" value="" />
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
		<input type="hidden" name="keyword" value=""> <input
			type="hidden" name="page" value="1"> <input type="hidden"
			name="categoryNo" value="17">
	</form>



</body>
</html>