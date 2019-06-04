<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<tr>
	<th>문의분야</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px;">
			<input type="hidden" name="qna_select" value="${dto.qna_select }">${dto.qna_select }
			</li>
		</ul>
	</td>
</tr>

<tr>
	<th>문의유형</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px;">
			<input type="hidden" name="qna_type" value="${dto.qna_type }">${dto.qna_type }
			</li>
		</ul>
	</td>
</tr>

<tr>
	<th>문의자</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px;">
			<input type="hidden" name="join_id" value="${dto.join_id }">${dto.join_id }
			</li>
		</ul>
	</td>
</tr>

<tr>
	<th>문의제목</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px;">
			<input type="hidden" name="qna_subject" value="${dto.qna_subject }">${dto.qna_subject }
			</li>
		</ul>
	</td>
</tr>

<c:if test="${dto.qna_saveFileName ne null }">
<tr>
	<th>이미지</th>
	<td>
		<div class="faqSelectList2">
			<img src="/dailychan/resources/images/qna/${dto.qna_saveFileName}" alt="상품 섬네일" class="thum" style="width: 150px;height: 150px;vertical-align: middle;">
		</div>
	</td>
</tr>
</c:if>

<tr>
	<th>문의 내용</th>
	<td>
		<div class="faqSelectList2">
		<input type="hidden" name="qna_content" value="${dto.qna_content }">${dto.qna_content }
		<input type="hidden" name="qna_id" value="${dto.qna_id }">
		</div>
	</td>
</tr>

<tr>
	<th>답변 내용</th>
	<td>
		<div class="cmTxtInput">
		<textarea class="cmMtinput" name="qna_reply" placeholder="내용을 입력해주세요. (3,000자 미만)" id="question"></textarea>
		</div>
	</td>
</tr>
