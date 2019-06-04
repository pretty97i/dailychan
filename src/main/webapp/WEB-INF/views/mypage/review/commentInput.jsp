<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<tr>
	<th>상품정보</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px;">
				<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품 섬네일" class="thum" style="width: 70px;height: 70px;vertical-align: middle;"/>
				<input type="hidden" name="refund_subject" value="${dto.product_subject } 등 ${dto.orderList_productCount } 종"/>
				${dto.product_subject } 등 ${dto.orderList_productCount } 종
				<input type="hidden" name="orderList_id" value="${dto.orderList_id }"/>
				<input type="hidden" name="product_id" value="${dto.product_id }"/>
				<input type="hidden" name="productOrder_id" value="${dto.productOrder_id }"/>
				<input type="hidden" name="reviewCheck_id" value="${dto.reviewCheck_id }"/>
			</li>
		</ul>
	</td>
</tr>

<tr>
	<th>구매날짜</th>
	<td>
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px; text-align: left;">
				<input type="hidden" name="orderList_created" value="${dto.orderList_created }"/>${dto.orderList_created }
			</li>
		</ul>
	</td>
</tr>

<tr>
	<th>작성상태</th>
	<td >
		<ul class="faqSelectList2">
			<li style="padding-bottom:0px; text-align: left;">
			<font color="red">[리뷰 미작성]</font>&nbsp;리뷰를 작성해 주세요
			</li>
		</ul>
	</td>
</tr>

<<tr>
	<th>제목</th>
	<td>
		<div class="cmTxtInput">
		<input type="text" name="review_subject" id="review_subject" />
		</div>
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<div class="cmTxtInput">
		<textarea class="cmMtinput" name="review_content" placeholder="내용을 입력해주세요. (2,000자 미만)" id="refund_reason"></textarea>
		</div>
	</td>
</tr>

<tr>
	<th>이미지</th>
	<td style=" text-align: left;">
		<div class="faqSelectList2">
			<input type="file" class="inputWd370" name="review_Image" value="${dto.review_saveFileName }"/>
			<input type="hidden" name="review_saveFileName" id="review_saveFileName" value="${dto.review_saveFileName }""/>
		</div>
		<div>
			<b>이미지를 넣어주시면 포인트가 200점입니다!!</b>
		</div>
	</td>
</tr>

<tr>
	<th>별점</th>
	<td>
		<ul class="starBg">
			<li style="padding-bottom:0px; text-align: left;">
                <span class="star-input">
					<span class="input">
				    	<input type="radio" name="review_grade" value="1" id="p1">
				    	<label for="p1">1</label>
				    	<input type="radio" name="review_grade" value="2" id="p2">
				    	<label for="p2">2</label>
				    	<input type="radio" name="review_grade" value="3" id="p3">
				    	<label for="p3">3</label>
				    	<input type="radio" name="review_grade" value="4" id="p4">
				    	<label for="p4">4</label>
				    	<input type="radio" name="review_grade" value="5" id="p5">
				    	<label for="p5">5</label>
				  	</span>				  			
				</span>

			</li>
		</ul>
	</td>
</tr>