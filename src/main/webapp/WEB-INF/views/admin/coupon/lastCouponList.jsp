<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<script type="text/javascript">

function deleteAllCoupon() {
	
	var pageNum = ${pageNum};
	
	var url = "<%=cp%>/admin/coupon/coupon_Alldelete.action";
		
	$.post(url,{},function(data){
		
		var params = "삭제완료";
		alert(params);
		
		lastList(pageNum);
		
	});
	
}



</script>

<table style="border-top:1px solid #ddd">				
<colgroup>
	<col width="143" />
	<col width="145" />
	<col width="143" />
	<col width="143" />
	<col width="143" />
</colgroup>
<tbody>
<tr>			                            		
	<td><font style="font-weight: bold">ID</font></td>
	<td><font style="font-weight: bold">쿠폰번호</font></td>
	<td><font style="font-weight: bold">금액</font></td>
	<td><font style="font-weight: bold">발급일</font></td>
	<td><font style="font-weight: bold">마감일</font></td>
</tr>

<c:if test="${dataCount==0 }">
<tr >
	<td colspan="5" >검색된 아이디가 존재하지 않습니다.</td>
</tr>	
</c:if>


<c:if test="${dataCount!=0 }">
					
	<c:forEach var="dto" items="${lists }">
		<tr>	                     
	        <td id="join_id" >${dto.join_id }</td>
	        <td>${dto.coupon_id }</td>		
	        <td><fmt:formatNumber value="${dto.coupon_price }" pattern="#,###" /></td>			                                      
	        <td>${dto.coupon_startDate }</td>
	        <td>${dto.coupon_endDate }</td>                         
		</tr>
	</c:forEach> 
	   
</tbody>
</table>
<div height="30" class="pagingWrap">
	<div align="center" colspan="3">${pageIndexList }</div>
</div>
<br/><br/>
<div align="right">
    <input type="button" class="btn green" value="전체 삭제"  style="width:80px; height: 30px;"
      onclick="deleteAllCoupon();" />
</div>
</c:if>

