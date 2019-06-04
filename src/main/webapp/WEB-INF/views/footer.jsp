<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<div class="footerArea" style="border-top:0px">
		<div class="footerWrap">
			<ul class="footerList">
				<li><a href="/dailychan/introduce/info.action">데일리찬 소개</a></li>
				<li><a href="/dailychan/help/terms.action">약관 및 정책</a></li>
				<li><a href="/dailychan/help/helpmain.action">고객센터</a></li>
				
				<li><a href="/dailychan/company/contactUs.action">입점 문의</a></li>
			</ul>
		</div>
		<div class="contents">
			<div class="footerCopy">
			<div class="footersns">
			    
			        <div class="snsList">
						<img src="/dailychan/resources/images/common/w_footer_sns.png?dummy=0.01">
						<a href="${url }"><img src="/dailychan/resources/images/common/w_footer_sns1.png"></a>
						<a href="/join/social/facebook"><img src="/dailychan/resources/images/common/w_footer_sns2.png"></a>
						<a href="/join/social/google"><img src="/dailychan/resources/images/common/w_footer_sns3.png"></a>
						 <a href="/dailychan/join/naverlogin.action"><img src="/dailychan/resources/images/common/w_footer_sns4.png"></a>
					</div>
			    
			</div>
			<p>
					<span>본사 : 서울특별시 테헤란로 123 &nbsp;&nbsp; 주소 : 서울특별시 테헤란로 123 지어소프트빌딩 15층 아이티윌</span><br>
					물류센터 : 서울특별시 테헤란로 123 &nbsp;&nbsp; 고객센터 : 1577-0098 <span class="operatingTime">(평일 09:30~18:30, 토요일,일요일/공휴일 휴무)</span>
					<br>데일리찬 대표자 : 황병열 &nbsp;&nbsp; 사업자등록번호 : 123-45-67890 &nbsp;&nbsp; 통신판매업신고번호 : 제 2019-서울시-1506호
				</p>
			</div>
		</div>
	</div>

