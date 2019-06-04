<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${dataCount!=0 }">
<c:forEach var="dto" items="${lists }">

<c:if test="${dto.productQuestion_state=='미답변' }">
<tr>
	<td>상품</td>
	<td><span class="reply_now">[${dto.productQuestion_state }]</span></td>
	
	<c:if test="${dto.productQuestion_secret=='0' or dto.join_id==id }">
	<td class="tL1">${dto.productQuestion_content }</td>
	</c:if>
	
	<c:if test="${dto.productQuestion_secret=='1' and dto.join_id!=id }">
	<td class="tL1">비밀글 입니다.&nbsp;<img src="/dailychan/resources/images/shop/prod_icon_07.png" alt="비밀글" class="icon_photoCom" style="margin-top: 3px;"></td>
	</c:if>
	
	<td>${dto.join_id }</td>
	<td>${dto.productQuestion_created }</td>
</tr>
</c:if>

<c:if test="${dto.productQuestion_state=='답변완료' }">
<tr>
	<td>${dto.productQuestion_type }</td>
	<td><span class="reply_end">[${dto.productQuestion_state }]</span></td>
	
	<c:if test="${dto.productQuestion_secret=='0' or dto.join_id==id }">
	<td class="tL1"><a href="#" onclick="showAnswer('answer${dto.productQuestion_id }'); return false;">
			${dto.productQuestion_content } </a></td>
	</c:if>
	
	<c:if test="${dto.productQuestion_secret=='1' and dto.join_id!=id }">
	<td class="tL1">비밀글 입니다.&nbsp;<img src="/dailychan/resources/images/shop/prod_icon_07.png" alt="비밀글" class="icon_photoCom" style="margin-top: 3px;"></td>
	</c:if>
			
	<td>${dto.join_id }</td>
	<td>${dto.productQuestion_created }</td>
</tr>
</c:if>

<c:if test="${dto.mode=='1' }">
<tr class="comMore" id="answer${dto.productQuestion_id }">
	<td colspan="2"><img src="/dailychan/resources/images/shop/arrow_bottom_red.gif" class="icon_photoCom" style="margin-top: 3px;" height="20px;" width="30px;" align="right"></td>
	<td colspan="3" class="tL1">${dto.productAnswer_content }
	<p class="txt_qna_end">상품담당자 답변 ${dto.productAnswer_created }</p>
	</td>
</tr>
</c:if>

</c:forEach>
</c:if>

<c:if test="${dataCount!=0 }">
<tr class="pagingWrap">
	<td colspan="5">
		${pageIndexList }
	</td>
</tr>
</c:if>

<c:if test="${dataCount==0 }">
<tr>
	<td colspan="5">
		<img src="/dailychan/resources/images/customer/myQnaImg.png" alt=""><br/><br/>
		상품 문의가 없습니다.
	</td>
</tr>
</c:if>