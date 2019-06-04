<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데일리찬::믿을 수 있는 먹거리</title>

<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_mypage.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js"></script>


<c:forEach var="dto" items="${lists }">


	<li><strong class="question"> <a href="#"
			onclick="showanswer('${dto.faq_id}'); return false;" > <span class="question_q">
					<img
					src="/dailychan/resources/images/customer/web_ico_q.png"
					alt="질문">
			</span> 
			
			${dto.faq_subject }
		</a>
	</strong>
	
	
	
	
	
	
		<div class="answer" id="${dto.faq_id}">
			<span class="answer_a"><img
				src="/dailychan/resources/images/customer/web_ico_a.png"
				alt="답변"></span>
			<p>
				<span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 11pt;">

					${dto.faq_content } </span>
		</div></li>

</c:forEach>

				
									           <!--페이징-->
                 <div class="pagingWrap">
                    
               		 <c:if test="${dataCount!=0 }">
						${pageIndexList }
					</c:if>
					
					<c:if test="${dataCount==0 }">
						등록된게시물이 없습니다.
					</c:if>
				
				  </div>
