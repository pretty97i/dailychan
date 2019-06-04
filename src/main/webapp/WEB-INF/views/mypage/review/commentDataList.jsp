<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>데일리찬::믿을 수 있는 먹거리</title>
<script type="text/javascript">
	
	function toggle(review_id) {
	
		$("#content" + review_id).toggle();
	}
	
</script>
</head>
<body>

		<table>
			<colgroup>
				<col style="width:100px;">
				<col style="width:200px;">
				<col style="width:80px;">
				<col style="width:110px;">
				<col style="width:90px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" colspan="2">상품정보</th>
					<th scope="col">포인트</th>
					<th scope="col">작성일</th>
					<th scope="col">구매후기</th>
				</tr>
			</thead>
			<tbody>
				<!-- 등록할 구매 후기가 없을 경우 -->
	                  <c:if test="${dataCount==0 }">
	                      <tr>
	                      	<td colspan="5">
	                          	<div class="maQnaNon">
	                                  <div class="empty-msg">등록할 구매후기가 없습니다.</div>
	                            </div>
	                           </td>
	                      </tr>
                      </c:if>
                      
                <!-- 등록할 구매 후기가 있는 경우 -->    
                      <c:if test="${dataCount!=0 }">
                      <c:forEach var="dto" items="${lists }">
                      	  <tr>
                          	 <th>
                                 <img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품 섬네일" class="thum" style="width: 70px;height: 70px;vertical-align: middle;"/>
                             </th>
                             <th>  
                                 ${dto.product_subject }
                                
                             </th>
                             
                             <th>
	                            ${dto.point_score }
	                         </th>
	                         
	                         <th>
	                         	${dto.review_created }
	                         </th>

	                         <th>
	                         	<input type="hidden" name="${dto.review_id }" value="${dto.review_id }"/>
	                            <input type="button" class="btn green" id="check${dto.review_id }" value="확인" onclick="javascript:toggle('${dto.review_id }')"/>
	                         </th>
	                      </tr>
	                      <tr id="content${dto.review_id }" style="display: none;">
	                      	<th colspan="5">
	                      	
	                      		<div class="orderTbl2" style="border:solid 1px #ddd">
								<div class="mypage-orderinfo-wrap">
         
								<table style="border-top:1px solid #ddd">
		                            <colgroup>
		                                <col width="120px" />
		                            </colgroup>
		                            
		                            <tbody>	                            		

	                                    <tr>
	                                        <th scope="row"><span class="starBg">&nbsp;&nbsp;&nbsp;내&nbsp;&nbsp;&nbsp;용&nbsp;&nbsp;&nbsp; </span></th>
	                                        <td>
		                                       	<textarea style="border :solid 1px #BDBDBD; width: 450px; height: 100px;" rows="4" cols="100" id="review_content" readonly="readonly">${dto.review_content }</textarea>
		                                       	&nbsp;&nbsp;
		                                       	<c:if test="${dto.review_saveFileName ne null }">
		                                       		<img src="/dailychan/resources/images/review/${dto.review_saveFileName}" alt="상품 섬네일" class="thum" style="width: 100px;height: 100px;vertical-align: middle;">
		                                       	</c:if>
	                                        </td>
		                            	</tr>    	
				                            	
		                             </tbody>
		                         </table>
		                         
		                         </div>
		                         </div>
	                      	
	                      	</th>
	                      </tr>
	                   </c:forEach>
									
						  <tr height="30" style="border-top: 1px #bbb;">
								<th align="center" colspan="5">
									${pageIndexList }
						  		</th>
						  </tr>
	                      
                      </c:if>

			</tbody>
		</table>

</body>
</html>