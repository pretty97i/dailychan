<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<tr>
	<th>문의분야</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px;">
			<input type="hidden" name="productQuestion_type" value="${dto.productQuestion_type }">${dto.productQuestion_type }
			</li>
		</ul>
	</td>
</tr>

<tr>
	<th>상품명</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px;">
			<input type="hidden" name="product_subject" value="${dto.product_subject }">${dto.product_subject }
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
	<th>문의 내용</th>
	<td>
		<div class="faqSelectList2">
		<input type="hidden" name="productQuestion_content" value="${dto.productQuestion_content }">${dto.productQuestion_content }
		<input type="hidden" name="product_id" value="${dto.product_id }">
		<input type="hidden" name="productQuestion_id" value="${dto.productQuestion_id }">
		</div>
	</td>
</tr>
<tr>
	<th>답변 내용</th>
	<td>
		<div class="cmTxtInput">
		<textarea class="cmMtinput" name="productAnswer_content" placeholder="내용을 입력해주세요. (3,000자 미만)" id="question"></textarea>
		</div>
	</td>
</tr>
