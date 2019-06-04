<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../top.jsp" />

</head>
<body>

	<div class="allWrap">

		<!-- 컨텐츠 -->
		<div class="contentsArea">
			<div class="contentsWrap">

				<div class="content">

					<!-- reviewEventWrap -->
					<div class="reviewEventWrap" >
						<div class="reviewEventCont top" >
							<a href="/dailychan/myPage/commentList.action"> <img
								src="/dailychan/resources/images/promotion/review_event/review_event_top_0827.jpg" />
							</a>
						</div>

						<!-- event01 -->
						<div class="reviewEventCont reviewEvt1">
							<div class="eventContElement">
								<img
									src="/dailychan/resources/images/promotion/review_event/review_title_1.png" />
							</div>
							<div class="eventContElement">
								<img
									src="/dailychan/resources/images/promotion/review_event/review_coupon.png" />
							</div>
							<div class="eventContElement">
								<a href="/dailychan/myPage/commentList.action"> <img
									src="/dailychan/resources/images/promotion/review_event/review_btn_1.png" />
								</a>
							</div>
						</div>
						<!-- event01 -->

						<!-- event02 -->
						<div class="reviewEventCont reviewEvt2">
							<div class="eventContElement">
								<img
									src="/dailychan/resources/images/promotion/review_event/review_title_2.png" />
							</div>
							<div class="eventContElement">
								<img
									src="/dailychan/resources/images/promotion/review_event/review_icons.png" />
							</div>
							<div class="eventContElement">
								<a href="/dailychan/myPage/commentList.action"> <img
									src="/dailychan/resources/images/promotion/review_event/review_btn_1.png" />
								</a>
							</div>
						</div>
						<!-- event02 -->
					</div>
					<!-- reviewEventWrap -->
				</div>


			</div>
		</div>
	</div>


</body>
</html>