<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<script type="text/javascript">



function add(join_id) {
	
		var coupon_price = "coupon_price" + join_id;	
	
		var coupon = document.getElementById(coupon_price);		
		var coupon_index = coupon.options.selectedIndex;
		
		if(coupon_index=="0"){
			alert("쿠폰을 선택하세요!");
			return;
		}
	
	
		var params = "쿠폰 발급 성공!";
		var coupon_price = "#coupon_price" + join_id;
		
		coupon_price1 = $(coupon_price).val();

		alert(params);
		
		var url = "<%=cp%>/admin/coupon/coupon_insert.action";
		
		$.post(url,{join_id:join_id,coupon_price1:coupon_price1},function(args){
			
			addListOpen(join_id,coupon_price1);
			var params = "쿠폰 발급 완료!"
			alert(parmas);
			
		});
		
	}

</script>




<table style="border-top:1px solid #ddd">

<colgroup >
	<col width="143" />
	<col width="145" />
	<col width="100" />
</colgroup>
<tbody>
<tr>					                            		
	<td><font style="font-weight: bold">ID</font></td>
	<td><font style="font-weight: bold">쿠폰금액</font></td>
	<td><font style="font-weight: bold">발급</font></td>
</tr>    

<c:if test="${dataCount==0 }">
<tr >
	<td colspan="3" >검색된 아이디가 존재하지 않습니다.</td>
</tr>	
</c:if>


<c:if test="${dataCount!=0 }">					
<c:forEach var="dto" items="${lists }">						
<tr>
	<td id="list">
	<input type="text" id="join_id" value="${dto.join_id }"> 
	</td>
<td>
  	<select id="coupon_price${dto.join_id }" >
		<option value="">선택하세요</option>
		<option value="10000">쿠폰A:10,000원</option>
		<option value="5000">쿠폰B:5,000원</option>
		<option value="1000">쿠폰C:1,000원</option>
	</select>			                                        
</td>
<td>
	<input type="button"  id="insert"   style="height: 30px;" value="쿠폰발급"  onclick="javascript:add('${dto.join_id }')">
</td> 
</tr> 
</c:forEach>    
       
</tbody>		
</table>
<div height="30" class="pagingWrap">
	<div align="center" colspan="3">${pageIndexList }</div>
</div> 
</c:if>
