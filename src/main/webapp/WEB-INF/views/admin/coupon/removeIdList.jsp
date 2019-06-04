<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<script type="text/javascript">

function remove(coupon_id,join_id) {	

	var search_join_id = "${search_join_id}";	
	var pageNum = "${pageNum}";
	
	var url ="<%=cp%>/admin/coupon/coupon_delete.action";	
	
 	$.post(url,{coupon_id:coupon_id,join_id:join_id,pageNum:pageNum,search_join_id:search_join_id},function(data){		
 		
 		deleteCoupon(pageNum,search_join_id);
 		alert("삭제완료");
 		
	});
}
</script>



<table style="border-top:1px solid #ddd" >

<colgroup>
	<col width="143" />
    <col width="145" />
    <col width="143" />
    <col width="143" />
    <col width="143" />
    <col width="80" />
</colgroup>
<tbody>
<tr>					                            		
    <td  ><font style="font-weight: bold">ID</font></td>
    <td><font style="font-weight: bold">쿠폰번호</font></td>
    <td><font style="font-weight: bold">금액</font></td>
    <td><font style="font-weight: bold">발급일</font></td>
    <td><font style="font-weight: bold">마감일</font></td>
    <td><font style="font-weight: bold">쿠폰취소</font></td>
</tr> 
 
<c:if test="${dataCount==0 }">
<tr >
	<td colspan="6" align="center" >검색된 아이디가 존재하지 않습니다.</td>
</tr>	
</c:if>



<c:if test="${dataCount!=0 }">					
<c:forEach var="dto" items="${lists }">
	<tr>
	                     
       <td id="join_id" >${dto.join_id }</td>
       <td>${dto.coupon_id }</td>		
       <td>${dto.coupon_price }</td>			                                      
       <td>${dto.coupon_startDate }</td>
       <td>${dto.coupon_endDate }</td>
       <td><input type="button" style="height: 30px;" value="삭제" onclick="javascript:remove('${dto.coupon_id}','${dto.join_id }')"/> </td>
   
     </tr>
</c:forEach>    
       
</tbody>				
</table>
<div height="30" class="pagingWrap">
	<div align="center" colspan="6">${pageIndexList }</div>
</div> 
</c:if>
   

