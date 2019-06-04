<%@ page contentType="text/html; charset=UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
	<title>데일리찬::믿을 수 있는 먹거리</title>

<jsp:include page="/WEB-INF/views/top.jsp"/>

<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72.png" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-50@2x.png" sizes="96x96" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72@2x.png" sizes="144x144" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-60@3x.png" sizes="192x192" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.04"></script>

	<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_mypage.css" />
	
<!-- 현우 -->
<script type="text/javascript">
$(document).ready(function() {
	// 전체 선택.
	//$("#checkAll, #checkAll2").click(function() {
	$("#checkAll2").click(function() {
		var flag = this.checked;
		
		$("#checkAll").get(0).checked = flag;
		$("#checkAll2").get(0).checked = flag;
		
		$(".chk_product").each(function() {
			this.checked = flag;
		});
	});
	
	// 부분 선택.
	$(".chk_product").click(function() {
		if ($(".chk_product:not(:checked)").length == 0) {
			$("#checkAll").get(0).checked = true;
			$("#checkAll2").get(0).checked = true;
		} else {
			$("#checkAll").get(0).checked = false;
			$("#checkAll2").get(0).checked = false;
		}
	});
	
	$("#allConfirm").click(function() {
		var flag = true;
		
		$("#checkAll").get(0).checked = flag;
		$("#checkAll2").get(0).checked = flag;
		
		$(".chk_product").each(function() {
			this.checked = flag;
		});
		
		choiceConfirm();
		
	});
	
});

function choiceConfirm() {
	
	var $selectedRows = $(".chk_product:checked");
    var deleteLength = $selectedRows.length;
    var url = "/dailychan/admin/productRecommandConfirm.action";

    if ($selectedRows.length == 0) {
        alert("선택된 추천 글이 없습니다.");
    }else{
        var selectedRecommandIds = [];
        
        $selectedRows.each(function() {
        	selectedRecommandIds.push($(this).parents("tr").data("recommand_id"));
        });

        $.post(url,{selectedRecommandIds:selectedRecommandIds},function(data){});
        
        window.location.reload(true);
 
    }
    
}

function confirm(productRecommand_id) {
	
	var url = "/dailychan/admin/productRecommandConfirm.action";
	var selectedRecommandIds = [productRecommand_id];
	
	$.post(url,{selectedRecommandIds:selectedRecommandIds},function(data){});
    
    window.location.reload(true);
	
}

function recommandSelect(join_id,productRecommand_id) {
	
	var url = "/dailychan/admin/productRecommandSelect.action";
	
	$.post(url,{join_id:join_id,productRecommand_id:productRecommand_id},function(data){});
	
	alert("상품추천 채택완료!");
	
	window.location.reload(true);
	
}
	


</script>
</head>

<body>
<form action="" method="post">
<div class="allWrap">
	
	<!-- 컨텐츠 -->
	<div class="contentsArea">
		<div class="contentsWrap">
			
			<div class="content"> 
				<!-- mypage -->
				<div class="mypage-wrap">

					<div class="mypage-personal">
						<div class="personal-info">
							<div class="grade">

									<i class="icon-grade family">family</i>

							</div>
							<div class="name"><b>관리자</b><em>님</em></div>

						</div>

						<div class="personal-status">
							<ul>
								<li>
									<a href="/dailychan/admin/orderList.action">
										<i class="icon-mypage ps-order"></i>
										<font size="15pt"><b>최근 주문내역</b></font>
										<span><em>${orderDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/productQnaList.action">
										<i class="icon-mypage ps-chat"></i>
										<b>상품 문의내역</b>
										<span><em>${productQnaDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/qnaList.action">
										<i class="icon-mypage ps-chat"></i>
										<b>1:1 상담내역</b>
										<span><em>${qnaDataCount }건</em></span>
									</a>
								</li>
								<li>
									<a href="/dailychan/admin/refundProductList.action">
										<i class="icon-mypage ps-point"></i>
										<b>환불 요청내역</b>
										<span><em>0건</em></span>							
									</a>
								</li>						
							</ul>
						</div>
					</div>

					<div class="mypage-contents-wrap">

						<div class="mypage-lnb">
							<a href="/dailychan/admin/main.action">
								<h3>Admin</h3>
							</a>
							<ul>
									<li>
										<a href="/dailychan/admin/productRegister.action">상품등록</a>
										
									</li>
									
									<li>
										<a href="/dailychan/admin/recipeRegister.action">레시피등록</a>
										
									</li>
								
									<li>
										<a href="/dailychan/admin/orderList.action">주문관리</a>
			
									</li>
								
									<li>
										<a href="/dailychan/admin/coupon.action">쿠폰 발급</a>
										
									</li>
									
									<li class="on">
										<a href="/dailychan/admin/productRecommand.action">상품추천내역</a>									
										
									</li>
								
									<li>
										<a href="/dailychan/admin/productQna/productQuestion.action">상품문의내역</a>
										
									</li>
								
									<li>
										<a href="/dailychan/admin/qnaList.action">1:1상담내역</a>		
										
									</li>
								
									<li>
										<a href="/dailychan/admin/refund/permitRefund.action">환불서비스</a>
										
									</li>
								
									<li>
										<a href="/dailychan/admin/info.action">회원정보 관리</a>

										
									</li>

							</ul>
						</div>
						
						<div class="mypage-contents">

							<div class="mypage-cblock">
								<div class="mypage-subtit">
									<h4>상품추천내역</h4>
								</div>
								<div class="mypage-orderinfo-wrap"></div>
							</div>

								<table class="tableCom mgT10">
									<colgroup>
										<col width="40">
										<col width="110">
										<col width="110">
										<col width="285">
										<col width="120">
										<col width="110">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">
												<label class="checkbox">
													<input type="checkbox" id="checkAll2">
													<i></i>
												</label>
											</th>
											<th>추천번호</th>
											<th>추천상품</th>
											<th>추천이유</th>
											<th>추천자</th>
											<th>추천</th>
										</tr>
									</thead>

									<tbody id="productRecommand">
										<c:if test="${dataCount==0 }">
						
												<tr>
													<td colspan="6">
						                                <div class="empty-msg">상품 추천내역이 없습니다.</div>
													</td>
												</tr>
										
										</c:if>

										<c:if test="${dataCount!=0 }">
											<c:forEach var="dto" items="${recommandLists }">
											
											<tr data-recommand_id="${dto.productRecommand_id }" >
												<td>
												<label class="checkbox">
															<input type="checkbox" id="checkbox" class="chk_product">
															<i></i>
												</label>
												
												</td>
												<td>${dto.productRecommand_id }</td>
												<td>${dto.product_subject }</td>
												<td><a href="#" onclick="confirm('${dto.productRecommand_id}'); return false;">${dto.productRecommand_reason }</a></td>
												<td>${dto.join_id }</td>
												<td><input type="button" onclick="recommandSelect('${dto.join_id}','${dto.productRecommand_id }'); return false;" class="btn green" value="선택"/></td>
												
											</tr>
											</c:forEach>
											<tr class="pagingWrap">
												<td colspan="6" align="center">
												${recommandPageIndexList}
												</td>
											</tr>
											
										</c:if>

									</tbody>
								</table><br/><br/>
								<div class="mypage-table-action">
									<a href="#" class="btn dgray" onclick="choiceConfirm(); return false;">선택확인</a>
									<a href="#" id="allConfirm" class="btn dgray" onclick="allConfirm(); return false;">전체확인</a>
									<input type="checkbox" id="checkAll" style="width:0;height:0;"/>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 팝업창 -->
	<div class="oasisDim"></div>
	
	<div class="oasisLayerPop4" style="height:585px">
	    <div class="oasisLayerPop_in">
			<div class="oasisLPtit" >
				<strong class="comLayerTit">상품문의답변</strong>
				 <div style="position:absolute; width: 27px;height: 27px;top: 27px;right: 26px;">
                        <a href="#" onclick="closeProductQnaForm(); return false;" class="popOasisDeliveryClose"></a>
                    </div>
			</div>
			
			<div class="oasisLPconWrap">
			    <form id="productQnaForm" method="post">
					<div class="comLayerCon">
						 <div class="oasisLPcon2" style="padding: 0 20px;">
							<table class="tableComWrite">
								<colgroup>
									<col width="100">
									<col width="*">
								</colgroup>
								<tbody id="productQuestionData">
								
								</tbody>
							</table>
			
						</div>
			
						<div style="height: 20px;">
							
						</div>
						
						<div class="oasisLPcon3">
							 <a href="#" onclick="productAnswer();">답변</a>
							 <a href="#" class="oasisMapClose2" onclick="closeProductQnaForm();">취소</a>
						</div>
					
						<input type="hidden" id="qnaType" name="qnaType" value="0">
						
			    	</div>
			    </form>
			</div>
		</div>
	</div>


</div>
</form>
</body>
</html>