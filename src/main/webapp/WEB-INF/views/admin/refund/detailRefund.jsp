<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">


function detailPermit(join_id,orderList_id) {
	
	var mode = "permit";
	var url = "<%=cp%>/admin/refund/refundPermit.action";
	
	$.post(url,{join_id:join_id,orderList_id:orderList_id,mode:mode},function(data){

		alert("환불승인 완료!");
		location.reload(true);
		
	});
		
	
}

</script>

 <div class="oasisLayerPop_in">
		<div class="oasisLPtit" >
			<strong class="comLayerTit">환불요청내용</strong>			
		</div>
	
		<div class="oasisLPconWrap">
		    <form id="productQnaForm" method="post">
				<div class="comLayerCon">
				 <div class="oasisLPcon2" style="padding: 0 20px;">
				 
					<table class="tableComWrite">
						<colgroup>
							<col width="110">
							<col width="240">
							<col width="120">
							<col width="110">
						</colgroup>
						<tbody>
							<tr>
								<th>ID</th>
								<th>주문번호</th>
								<th>환불요청일</th>
								<th>총 가격</th>
							</tr>													
							<tr>
								<td>${join_id }</td>
								<td>${orderList_id }</td>
								<td>${refund_created }</td>
								<td>${orderList_resultPrice }</td>
							</tr>						
							<tr>
								<th style="padding-left: 50px;">No</th>
								<th style="padding-left: 120px;">상품명</th>
								<th style="padding-left: 50px;">상품가격</th>
								<th style="padding-left: 50px;">갯수</th>
							</tr>							
							<c:forEach var="vo" items="${detailLists}">
							<tr>
								<td>${vo.productOrder_id }</td>
								<td>${vo.product_subject }</td>
								<td><fmt:formatNumber value="${vo.product_resultPrice }" pattern="#,###" /></td>
								<td>${vo.cart_quantity }</td>
							</tr>
							</c:forEach>
								<c:if test="${refund_saveFileName==null}">
								<tr>
									<th>사진 </th>
									<td colspan="3">사진이 없습니다.</td>
								</tr>
								</c:if>
								<c:if test="${refund_saveFileName!=null}">
								<tr>
									<th>사진 </th>
									<td colspan="3"><img src="/dailychan/resources/images/refund/${refund_saveFileName}" class="thum"></td>
								</tr>
								</c:if>
							<tr>
								<th>환불 사유</th>
								<td colspan="3">
									${refund_reason }				
								</td>
							</tr>	
						</tbody>
					</table>
				</div>
				
				<br/><br/><br/>
			
				<div class="oasisLPcon3">
				 	<a href="#" onclick="detailPermit('${join_id}','${orderList_id }');">환불 승인</a>
				 	<a href="#" class="oasisMapClose2" onclick="closeOpinion();">창닫기</a>
				</div>
					<input type="hidden" id="qnaType" name="qnaType" value="1">
					<input type="hidden" id="openYn" name="openYn" value="Y">
					<input type="hidden" id="productId" name="productId" value="2646">
			    </div>
			</form>
		</div>
	</div>