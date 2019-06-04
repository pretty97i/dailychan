<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<script type="text/javascript">

function openOpinion() {
	
	$('.oasisDim').show();
	$('.oasisLayerPop4').show();
}

function closeOpinion() {
	 $('.oasisLayerPop4').hide();
	 $(".oasisLayerPop").hide();
	 $('.oasisDim').hide();
	 
	 $('.oasisDim').hide(50, function(){
		$('body').css("overflow-y","auto");
	 });
}

function sendData(orderList_id) {
	
	openOpinion();
	
	var url = "<%=cp%>/admin/refund/detailRefund.action";
	
	
	$.post(url,{orderList_id:orderList_id},function(data){

		$('#detailRefund').html(data);
	
	});
}

function permit(orderList_id,join_id) {
	
	var mode = "permit";
	var url = "<%=cp%>/admin/refund/refundPermit.action";
	
	$.post(url,{orderList_id:orderList_id,mode:mode,join_id:join_id},function(data){

		alert("환불승인 완료!");
		location.reload(true);

	});	
	
}

function refuse(orderList_id) {
	
	var mode = "refuse";
	var url = "<%=cp%>/admin/refund/refundPermit.action";
	
	$.post(url,{orderList_id:orderList_id,mode:mode},function(data){	 
		alert("환불반려 완료!");
		location.reload(true);
	});
	
	
}

function permitAllRefund(dataCount) {
	
	if(dataCount!=0){
	
		var orderList_id = 0;
		var mode = "allRefund";
		var url = "<%=cp%>/admin/refund/refundPermit.action";
		
		$.post(url,{mode:mode,orderList_id:orderList_id},function(data){
			alert("전부환불 완료!");
			location.reload(true);
		});	
	
		return;
	
	}else { alert("환불 내역이 없습니다.")}
}

</script>

<table style="border-top:1px solid #ddd" >				
<colgroup>
	<col width="90">
	<col width="80">
	<col width="70">
	<col width="150">
	<col width="90">
	<col width="90">
	
</colgroup>
<tbody>
<tr >		                       		
	<td><font style="font-weight: bold; padding-left: 6px;">요청일</font></td>
	<td><font style="font-weight: bold; padding-left: 20px;">ID</font></td>
	<td><font style="font-weight: bold;" >주문번호</font></td>
	<td><font style="font-weight: bold; padding-left: 40px;">제품명</font></td>
	<td><font style="font-weight: bold">구매가</font></td>
	<td></td>
</tr>

<c:if test="${dataCount==0 }">
<tr>
	<td colspan="7">환불 요청 내역이 없습니다.</td>
</tr>
</c:if>

<c:if test="${dataCount!=0 }">
<c:forEach var="dto" items="${lists }">
<tr align="center">
	<td>${dto.refund_created }</td>
	<td>${dto.join_id }</td>
	<td>${dto.orderList_id }</td>
	<td><a href="#" onclick="javascript:sendData('${dto.orderList_id }'); return false;"> ${dto.refund_subject }</a></td>
	<td>${dto.orderList_resultPrice }</td>
	<td>
		<ul>
			<li><input type="button" style="height:25px;" value="환불승인" onclick="permit('${dto.orderList_id }','${dto.join_id }');" /></li>
			<li><input type="button" style="height:25px;" value="환불불가" onclick="refuse('${dto.orderList_id}');" /></li>
		</ul>
	</td>		
	         
</tr>
</c:forEach>		
</c:if>
   
</tbody>
</table>
<div height="30" class="pagingWrap">
	<div align="center" colspan="3">${pageIndexList }</div>
</div>
<br/><br/>
<div align="right">
    <input type="button" class="btn green" value="전체 승인"  style="width:80px; height: 30px;" onclick="permitAllRefund('${dataCount}'); return false;" />
</div>


<div class="oasisDim"></div>

<!-- 팝업 (환불 상세내역 )  -->	   
<div class="oasisLayerPop4" id="detailRefund" style="height:580px"></div>
