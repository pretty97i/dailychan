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
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />
<script src="/dailychan/resources/js/star.js"></script>

<script> 

	function inputReview() {
		
		var f = document.myForm;
		
		f.action = "/dailychan/myPage/inputReview.action";
		f.submit();
	
	}
	
	//팝업 관련 메소드
	function reviewSendIt(orderList_id,productOrder_id,reviewCheck_id) {
		
		 var url = "/dailychan/myPage/reviewProductData.action";
			
			$.post(url,{orderList_id:orderList_id,productOrder_id:productOrder_id,reviewCheck_id:reviewCheck_id},
				
				function(data){
				
				$("#reviewData").html(data);
	
			});
	
		 $('.oasisDim').show();
		 $('.oasisLayerPop4').show();
	}
	
	function closeReviewForm() {
		 $('.oasisLayerPop4').hide();
		 $(".oasisLayerPop").hide();
		 $('.oasisDim').hide();
		 
		 $('.oasisDim').hide(50, function(){
			$('body').css("overflow-y","auto");
		 });
	}

    //리뷰 작성
    function inputReview() {  

    	 $("#imageUploadForm").ajaxForm({
             url : "/dailychan/myPage/inputReview.action",
             enctype : "multipart/form-data",
             dataType : "json",
             complete : function(){
                 alert("리뷰 작성 되었습니다.") ;
                 location.reload(true);
             }
         });
  
    	 $("#imageUploadForm").submit();
	 
	}

</script>

</head>
<body>
<form action="" name="myForm" method="post" enctype="multipart/form-data">

		<table class="">
			<colgroup>
				<col style="width:100px;">
				<col style="width:100px;">
				<col>
				<col style="width:100px;">
				<col style="width:100px;">
				<col style="width:100px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">주문번호</th>
					<th scope="col" colspan="2">상품정보</th>
					<th scope="col">구매수량</th>
					<th scope="col">구매금액</th>
					<th scope="col">구매후기</th>
				</tr>
			</thead>
			<tbody>
				<!-- 등록할 구매 후기가 없을 경우 -->
	                  <c:if test="${dataCount==0 }">
	                      <tr>
	                      	<td colspan="6">
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
	                            ${dto.orderList_id }
	                         </th>
                      	  	 <th>
                      	  	 	<a href="">
                                    <img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품 섬네일" class="thum" style="width: 70px;height: 70px;vertical-align: middle;">
                                </a>
                      	  	 </th>
                          	 <th scope="row">
                                <a href="">
                                    ${dto.product_subject }
                                </a>
                             </th>
                             <th>
	                            ${dto.cart_quantity }
	                         </th>
	                         <th>
	                            ${dto.result_price }
	                         </th>
	                      	 <th scope="row">
	                      	 	<a href="#" class="btn green" onclick="reviewSendIt('${dto.orderList_id}','${dto.productOrder_id}','${dto.reviewCheck_id }'); return false;">작성</a>          
	                         </th>
	
	                      </tr>
	                      
	                   </c:forEach>
									
						  <tr height="30" style="border-top: 1px #bbb;">
								<th align="center" colspan="6">
									${pageIndexList }
						  		</th>
						  </tr>
	                      
                      </c:if>

			</tbody>
		</table>
</form>

	<!-- 팝업창 -->
	<div class="oasisDim"></div>
	
	<div class="oasisLayerPop4" style="height:585px">
	    <div class="oasisLayerPop_in">
			<div class="oasisLPtit" >
				<strong class="comLayerTit">리뷰작성</strong>
				 <div style="position:absolute; width: 27px;height: 27px;top: 27px;right: 26px;">
                        <a href="#" onclick="closeProductQnaForm(); return false;" class="popOasisDeliveryClose"></a>
                    </div>
			</div>
			
			<div class="oasisLPconWrap">
			    <form id="imageUploadForm" name="imageUploadForm" method="post" enctype="multipart/form-data">
					<div class="comLayerCon">
						 <div class="oasisLPcon2" style="padding: 0 20px; text-align: left;">
							<table class="tableComWrite">
								<colgroup>
									<col width="100">
									<col width="*">
								</colgroup>
								<tbody id="reviewData">
								
								</tbody>
							</table>
			
						</div>
			
						<div style="height: 20px;">
							
						</div>
						
						<div class="oasisLPcon3">
							 <a href="#" onclick="inputReview();">답변</a>
							 <a href="#" class="oasisMapClose2" onclick="closeReviewForm();">취소</a>
						</div>
					
						<input type="hidden" id="qnaType" name="qnaType" value="1">
						<input type="hidden" id="openYn" name="openYn" value="Y">
						<input type="hidden" id="productId" name="productId" value="2646">
			    	</div>
			    </form>
			</div>
		</div>
	</div>


</body>
</html>