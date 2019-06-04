<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<tr>
	<th>주문번호</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px;">
			<input type="hidden" name="orderList_id" value="${dto.orderList_id }">${dto.orderList_id }
			<input type="hidden" name="refund_state" value="7">
			</li>
		</ul>
	</td>
</tr>

<tr>
	<th>제목</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px;">
				<input type="hidden" name="refund_subject" value="${dto.product_subject } 등 ${dto.orderList_productCount } 종">
				${dto.product_subject } 등 ${dto.orderList_productCount } 종
			</li>
		</ul>
	</td>
</tr>

<tr>
	<th>환불신청자</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px;">
			<input type="hidden" name="join_id" value="${dto.join_id }">${dto.join_id }
			</li>
		</ul>
	</td>
</tr>

<tr>
	<th>환불금액</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px;">
			<input type="hidden" name="orderList_resultPrice" value="${dto.orderList_resultPrice }">${dto.result_price }원
			</li>
		</ul>
	</td>
</tr>

<tr>
	<th>환불이유</th>
	<td>
		<div class="cmTxtInput">
		<textarea class="cmMtinput" name="refund_reason" placeholder="내용을 입력해주세요. (2,000자 미만)" id="refund_reason"></textarea>
		</div>
	</td>
</tr>

<tr>
	<th>이미지</th>
	<td>
		<div class="faqSelectList2">
			<input type="file" name="refund_Image" value="${dto.refund_saveFileName }"/>
			<input type="hidden" name="refund_saveFileName" id="refund_saveFileName" value="${dto.refund_saveFileName }""/>
		</div>
	</td>
</tr>

