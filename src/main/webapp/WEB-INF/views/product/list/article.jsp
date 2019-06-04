<%@page import="com.chan.dto.ProductDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"><head>
    <title>데일리찬::믿을 수 있는 먹거리</title>

<jsp:include page="../../top.jsp"/>
<jsp:include page="../../right.jsp"/>

<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js"></script>


<script type="text/javascript">

	
	//현진이가 만든 스크립트
	function addCart1() {

		var join_id = "${join_id}";

		if(join_id==""){

			alert("로그인후 가능합니다.");
			location.href="<%=cp%>/join/login.action";
			
		}
		
		if(join_id!=""){
			
			var cart_quantity = document.getElementById("quantity").innerHTML;
			cart_quantity = cart_quantity.trim();
			 
			var product_id = "${product_id}";
			
			var url = "<%=cp%>/cart/addCart.action";
			
			$.post(url,{product_id:product_id,cart_quantity:cart_quantity },function(data){
			
				var params = "장바구니 추가 완료!"
				alert(params);
				
			});
		}
	}
	//현진이가 만든 스크립트 끝
	
	//현우가 만든 스크립트
	window.onload = function () {
		
		qnaDataCount('all');
		reviewDataCount('all');
		quickPage('1');

	}
	
	$('.quickMenu').css("top",180);
	
	function productQnaInsert() {
		
		var type = $('[name="productQuestion_type"]:checked').val();
		var content = $('[name="productQuestion_content"]').val();
		var id = "${product_id}";
		var secret = $('[name="productQuestion_secret"]:checked').val();
		var subject = $('[name="product_subject"]').val();
		var mode = "all";
		var join_id = "";
		
		var url = "/dailychan/p_qna/insert.action";
		
		$.post(url,{productQuestion_type:type,productQuestion_content:content,product_id:id,
			productQuestion_secret:secret,product_subject:subject},function(data){
			
				qnaDataCount(mode,join_id);
				
				$("#productQuestion").html(data);
				
				closeProductQnaForm();
	
		});
		
	}
	
	function productQnaAllList(qnaPageNum,product_id) {
		
		var mode = "all";
		var url = "/dailychan/p_qna/list.action";
		var join_id = "";
		
		$.post(url,{qnaPageNum:qnaPageNum,product_id:product_id,mode:mode},function(data){

			qnaDataCount(mode,join_id);
			$("#productQuestion").html(data);
	
		});
		
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab3").hide();
		$("#tab4").hide();
		$("#tab5").show();

	}
	
	function productQnaMyList(qnaPageNum,product_id,join_id) {
		
		var mode = "my";
		var url = "/dailychan/p_qna/list.action";
		var join_id = "${join_id}";
		
		$.post(url,{qnaPageNum:qnaPageNum,product_id:product_id,join_id:join_id,mode:mode},function(data){
	
			qnaDataCount(mode,join_id);
			$("#productQuestion").html(data);
	
		});
		
	}
	
	function showAnswer(answer_id) {
	
		$("#" + answer_id).toggle();
		
	}
	
	function productReviewAllList(qnaPageNum,product_id) {
		
		var mode = "all";
		var url = "/dailychan/review/list.action";
		
		$.post(url,{qnaPageNum:qnaPageNum,product_id:product_id,mode:mode},function(data){
	
			reviewDataCount(mode);
			
			$("#productReview").html(data);
	
		});
		
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab3").hide();
		$("#tab4").show();
		$("#tab5").hide();
		
	}
	
	function productReviewPhotoList(qnaPageNum,product_id) {
		
		var mode = "photo";
		var url = "/dailychan/review/list.action";
		
		$.post(url,{qnaPageNum:qnaPageNum,product_id:product_id,mode:mode},function(data){
	
			reviewDataCount(mode);
			
			$("#productReview").html(data);
	
		});
	}
	
	function showReviewContent(review_id) {
		
		$("#review" + review_id).toggle();
		
	}
	
	function bestReviewInsert(review_id,product_id) {
		
		var url = "/dailychan/review/bestReviewInsert.action";
		
		$.post(url,{review_id:review_id,product_id:product_id},function(data){});
		
		alert("베스트리뷰 선정완료!!");
		
	}
	
	function zzimList(product_id) {
		
		var join_id = "${join_id}";
		var url = "/dailychan/product/zzim.action";
		
		if(join_id==""){
			
			alert("로그인 후 이용가능한 기능입니다.");
			location.href = "/dailychan/join/login.action";
			
		}else{
			
			$.post(url,{product_id:product_id,join_id:join_id},function(data){});
			alert("찜 리스트에 추가되었습니다.");
			
		}
		
	}
	
	function qnaDataCount(mode,join_id) {
		
		var product_id = "${product_id}";
		var url = "/dailychan/product/qnaDataCount.action";
		
		$.post(url,{product_id:product_id,mode:mode,join_id:join_id},function(data){

			var message = "상품문의(" + data + ")";
			
			$("#qnaCount").html(message);
	
		});
		
	}
	
	function reviewDataCount(mode) {
		
		var product_id = "${product_id}";
		var url = "/dailychan/product/reviewDataCount.action";
		
		$.post(url,{product_id:product_id,mode:mode},function(data){
			
			var message = "구매후기(" + data + ")";
			var message2 = data + "개 보기";
			
			$("#reviewCount").html(message);
			$("#reviewCountContent").html(message2);
	
		});
		
	}
	
	function nowBuy() {

		var join_id = "${join_id}";
		var product_id = "${product_id}";
		var f = document.content;
		var product_count = document.getElementById('quantity').innerHTML;

		if(join_id==""){
			
			alert("로그인 후 이용가능한 기능입니다.");
			location.href = "/dailychan/join/login.action";
			return;
			
		}
		
		f.action = "/dailychan/order/nowBuy.action?product_count=" + product_count + "&product_id=" + product_id;
		f.submit();
		
	}
	
	function tab(tabNum) {
	
		if(tabNum==1){
			
			$("#tab1").show();
			$("#tab2").hide();
			$("#tab3").hide();
			$("#tab4").hide();
			$("#tab5").hide();
			
		}else if(tabNum==2){
			
			$("#tab1").hide();
			$("#tab2").hide();
			$("#tab3").show();
			$("#tab4").hide();
			$("#tab5").hide();
			
		}else if(tabNum==3){
			
			$("#tab1").hide();
			$("#tab2").show();
			$("#tab3").hide();
			$("#tab4").hide();
			$("#tab5").hide();
			
		}
		
	}
	
	function openProductQnaForm() {
		
   	 cleanProductQnaForm();
   	 
   	 $('.oasisDim').show();
   	 $('.oasisLayerPop4').show();
   	 
    }
    
    function cleanProductQnaForm() {
    	
   	 $("#qnaType").val("1");
   	 $("#openYn").val("Y");
   	 $("#question").val("");
   	 
   	 $("input:radio[name='radioQnaType']:input[value='1']").attr("checked", true);
   	 $("input:checkbox[id='productQnaOpenYn']").attr("checked", false);
   	 $("input:checkbox[id='productQnaSmsAlarmYn']").attr("checked", true);
   	 
    }

    function closeProductQnaForm() {
    	
   	 $('.oasisLayerPop4').hide();
   	 $(".oasisLayerPop").hide();
   	 $('.oasisDim').hide();
   	 
   	 $('.oasisDim').hide(50, function(){
			$('body').css("overflow-y","auto");
		 });
   	 
    }
	
	//현우가 만든 함수 끝
	
</script>

<script type="text/javascript">
	var add = false;
	var slider;
	var checkOrderedProduct = false;
	var orderedProductInd = false;
	$(document).ready(function() {
		$(window).scroll(function(){fixDiv1(); fixDiv2()});
		paging('2646', '1', '1');
	    var $tab5 = $("#tab5");
	    var $tabList = $(".tabList");
	 
		slider = $('.bxslider').bxSlider({
              minSlides: 3,
              maxSlides: 6,
              slideWidth: 143,
              slideMargin: 7,
              captions: false,
              moveSlides: 1,
              pager: false,
              touchEnabled: false
        });
		// category
	    $(".prodDetailTop .now").click(function() {
			if ( $(this).next(":visible").length == 0 ) {
				$(".prodDetailTop .now").next().hide();
				$(this).next().show();
			} else {
				$(".prodDetailTop .now").next().hide();
			}
			return false;
		});
		
		$tabList.find("a").click(function() {
			$tabList.find("li").removeClass("on");
			$(this).parent().addClass("on");
			
			var tab = $(this).data("tab");
			$(".wd900").hide();
			$(".tab" + tab).show();
			
			var offset = $("#pViewTabCon").offset();
			$('html, body').animate({scrollTop : offset.top}, 200);
			
			return false;
		});
		
		$(".cmMoreBtn").click(function() {

	        var more = $(this).parent().parent().next();
	        if (more.css("display") == "none") {
	            $(this).parent().parent().parent().find(".comMore").hide();
	            more.show();
	        } else {
	            $(this).parent().parent().parent().find(".comMore").hide();
	            more.hide();
	        }
	        
	    })
					
		$(".cmMoreCloseBtn").click(function() {
			$(this).parent().parent().removeClass("cmMoreLi");
			if ($(this).attr("id") == "moreClose1") {
				$(this).parent().parent().addClass("cmImgLi");
			}
		});
		
		$(".now").click(function() {
			$(this).next().toggle();
			return false;
        });
		
		$("#commentFile").change(function () {
			var file = $("#commentFile").val().split("\\");
			$("#photoName").val(file[file.length-1]);
        });
		

		
		
		
	});
	 
			
	// 수량 Up
	function btnPlusClick(obj) {
		var isOption = $(obj).hasClass("option");
		var $quantity = $(obj).parent().find(".quantity");
		var quantity = parseInt($quantity.text()) + 1;
		var discountPrice = parseInt($(obj).parents().data("discount_price"));

			if(quantity > "${saleLimit}") {
				alert("${saleLimit}개 이상은 구매 할 수 없습니다.");
				return false;
			}

		// optionPrice
		$quantity.text(quantity);
		
		if(isOption)
			setOptionPrice( obj, discountPrice * quantity );
		else
			setTotalPrice( discountPrice * quantity );
		return false;
	}
	
	// 수량 Down
	function btnMinusClick(obj) {
		var isOption = $(obj).hasClass("option");
		var $quantity = $(obj).parent().find(".quantity");
		var quantity = parseInt($quantity.text()) - 1;
		var discountPrice = parseInt($(obj).parents().data("discount_price"));
		
		if (quantity < 1)
			quantity = 1;
		
		$quantity.text(quantity);
		
		if(isOption)
			setOptionPrice( obj, discountPrice * quantity );
		else
			setTotalPrice( discountPrice * quantity );
		return false;
	}
	
	function setOptionPrice(obj, p) {
		$(obj).parent().parent().find(".optionPrice").html(comma( p ) + "&nbsp;<span>원</span>");
		setOptionTotal();
	}
	
	function setOptionTotal(){
		var totalP = 0;
		$(".optionPrice").each(function() {
			var txt = $(this).text();
			totalP +=parseInt(txt.replace("&nbsp;<span>원</span>", "").replace(",", ""));
		});
		setTotalPrice(totalP);
	}
	
	function setTotalPrice(p) {
		$("#totalPrice").html(comma( p ) + "&nbsp;<em>원</em>");
	}
	
	function productQnaPaging(productId, productQnaGbn, productQnaPage) {
		$.ajax({
			url : contextPath + "/product/productQnaPaging/" + productId + "/" + productQnaGbn + "/" + productQnaPage,
			type: "GET",
		    dataType: "html",
		    success: function(data) {
		        $("#qnaList").html(data);
		        if (productQnaGbn == 'all') {
		        	$("#all").addClass("cmTit_on");
                       $("#my").removeClass("cmTit_on");
		        } else {
		        	$("#my").addClass("cmTit_on");
                       $("#all").removeClass("cmTit_on");
		        }
		        // var offset = $(".view5").offset();
				// $('html, body').animate({scrollTop : offset.top}, 200);
		    }
		});
	}

	function checkComment(productId) {
		$.ajax({
			url : contextPath + "/myPage/checkComment/" +  productId,
			type : "GET",
			dataType : "json",
			success : function(response) {
				checkOrderedProduct = true;
				if (response.status == "OK") {
					if (response.data) {
						$("#orderId").val(response.data.orderId);
                        $("#orderProductId").val(response.data.orderProductId);	
					}
					 
					 $("#commentFile").val("");
					 $("#commentContent").val("");
					 starRating(5);
					 setDeliveryRate("FAST","빨라요");
					 setPriceRate("LOW","싸게 샀어요");
					 $('.oasisDim').show();
					 $('.oasisLayerPop3').show();
					 $('.oasisLPcon1').show();
					 $('.oasisLPcon2').show();
					 $('.oasisLPcon3').show();
					 $('.oasisLPtit > strong').show(); 
					 
			         $("body").bind("touchmove", function(e){
			            e.preventDefault();
			        }); //스크롤방지
			         orderedProductInd = true;
				} else {
					alert(response.message);
				}
			}
		});
	}
	
	function closeCommentPop() {
		$('.oasisLayerPop3').hide();
           $('.oasisDim').hide();
	}
	
	function imageUpload() {
		document.getElementById("commentFile").click();
    };
       
    function setDeliveryRate(code,status) {
    	$("#deliveryRate").val(code);
    	$("#deliveryText").text(status).next().hide();
    }
       
    function setPriceRate(code,status) {
    	$("#priceRate").val(code);
    	$("#priceText").text(status).next().hide();
    }
    
    function starRating(num) {
    	var star = new Array();
    	star[0] = $("#star1");
		star[1] = $("#star2");
		star[2] = $("#star3");
		star[3] = $("#star4");
		star[4] = $("#star5");
		
		var starBg = new Array();
		starBg[0] = $(".starBg01");
		starBg[1] = $(".starBg02");
		starBg[2] = $(".starBg03");
		starBg[3] = $(".starBg04");
		starBg[4] = $(".starBg05");
           
		for(i = 0; i < num; i++) {
			star[i].addClass("on");
			starBg[i].hide();
		}
           
		for(i = num; i < 5; i++) {
			star[i].removeClass();
			starBg[i].hide();
		}
		
		if (num == 1) {
			starBg[0].show();
		} else if (num == 2) {
			starBg[1].show();
		} else if (num == 3) {
			starBg[2].show();   
		} else if (num == 4) {
			starBg[3].show();
		} else if (num == 5) {
			starBg[4].show();
		}
		
		$("#starRating").val(num);
		$("#rate").text(num+".0");
		
	}
     
     function writeProductQna() {
    	 var $form = $("#productQnaForm");
    	 
    	 if($("input:checkbox[id='productQnaOpenYn']").is(":checked"))
    		 $("#openYn").val("N");
    	 else
    		 $("#openYn").val("Y");
    	 
    	 var qnaType = $("input:radio[name='radioQnaType']:checked").val();
    	 $("#qnaType").val(qnaType);
    	 
    	 var smsAlarmYn = "Y";
    	 if(!$("input:checkbox[id='productQnaSmsAlarmYn']").is(":checked"))
    		 smsAlarmYn = "N";

            $.ajax({
         		url : contextPath + "/myPage/writeProductQna",
         		type: "POST",
         		dataType: "json",
         		data: {
         			productId	: 2646
         			, qnaType	: $("#qnaType").val()
         			, openYn	: $("#openYn").val()
         			, question	: $("#question").val()
         			, smsAlarmYn: smsAlarmYn
        		},
         		success: function(response) {
         			if (response.status == "OK") {
         				closeProductQnaForm();
         				productQnaPaging(2646, 'all', 1);
         			}
         			else
         				alert(response.message);
         		},  
               error: function() {
               	alert("오류가 발생했습니다.");
               }
         	});
     }
     
	function copyUrlToClipboard(){
    	 try {
	    	 var $temp = $("<input>");
	    	 $("body").append($temp);
	    	 $temp.val(document.location.href).select();
	    	 document.execCommand("copy");
	    	 $temp.remove();
	    	 alert("URL이 복사 되었습니다.");
    	 }
    	 catch(err) {
    		 alert('이 브라우저는 지원하지 않습니다.');
    	 }
   	}
	
	function openProductCommentPop(pCommentId) {
		$("#productCommentContent").val("");
		if(checkOrderedProduct) {
			if(orderedProductInd) {
				$('.oasisDim').show();
				$('.productCommentPop').show();
				$("#ppCommentId").val(pCommentId);
				$("#pCommentId").val(pCommentId);
			}
			else {
				alert("구매 내역이 있는 분만 작성 가능합니다.");
			}
		}
		else {
			$.ajax({
				url : contextPath + "/myPage/checkComment/2646",
				type : "GET",
				dataType : "json",
				success : function(response) {
					checkOrderedProduct = true;
					if (response.status == "OK") {
						orderedProductInd = true;
						$('.oasisDim').show();
						$('.productCommentPop').show();
						$("#ppCommentId").val(pCommentId);
						$("#pCommentId").val(pCommentId);
					} else {
						alert(response.message);
					}
				}
			});
		}
	}
	
	function closeProductCommentPop(){
		$('.productCommentPop').hide();
		$('.oasisDim').hide();
		$('.oasisDim').hide(50, function(){
			$('body').css("overflow-y","auto");
		});
	}
	
	function addProductComment() {
		$.ajax({
         		url : contextPath + "/myPage/writeProductComment",
         		type: "POST",
         		dataType: "json",
         		data: {
         			productId			: 2646
         			, ppCommentId		: $("#ppCommentId").val()
         			, pCommentId		: $("#pCommentId").val()
         			, commentContent	: $("#productCommentContent").val()
        		},
         		success: function(response) {
         			if (response.status == "OK") {
         				closeProductCommentPop();
         				$(".productCommentPaging").find("a.on").click();
         			}
         			else
         				alert(response.message);
         		},  
               error: function() {
               	alert("오류가 발생했습니다.");
               }
         	});
	}
     

</script>
	
	<!-- Facebook Pixel Code -->
	
	
	<!-- End Facebook Pixel Code -->
</head>

<body>
<div class="allWrap">

<form action="" method="post" name="content">
	<!-- 컨텐츠 -->
	<div class="contentsArea" id="sec_product_view">
		<div class="contentsWrap">
			
			<!-- 오른쪽 영역 -->
			<div class="content">
				<!-- 내용 입니다 -->
				
				<div class="productView">
				
					<!-- 카테고리선택 -->

					<div class="sec_list_area">
						
						
						<span>
							<a href="/dailychan/main.action">홈</a>
						</span>
						
						
						<c:if test="${firstSelect eq '전체상품' }">
						
						<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|"></span>
									<span>
										
										<a href="/dailychan/product/list.action?firstSelect=${firstSelect }&secondSelect=${secondSelect }&lastSelect=${dto.product_lastSelect }&categoryId=0">${dto.product_secondSelect }</a>
										
									</span>
						</c:if>
						
						<c:if test="${firstSelect eq '이벤트'}">
						<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|"></span>
									<span>
										
										<a href="/dailychan/event/eventMain.action">${dto.product_firstSelect }</a>
										
									</span>
						</c:if>
						
						
							
							<c:if test="${firstSelect eq '산지직송' || firstSelect eq '오!감동' }">
								<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|"></span>
									<span>
										<strong>
										<a href="/dailychan/product/origin/list.action?firstSelect=${firstSelect }&categoryId=0">${dto.product_firstSelect }</a>
										</strong>
									</span>
							
							
							
							</c:if>
							
						
							<c:if test="${firstSelect eq '이벤트'}">
									<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|"></span>
									<span>
										<strong>
										<a href="/dailychan/product/event/list.action?firstSelect=${firstSelect }&secondSelect=${secondSelect }&categoryId=0">${dto.product_secondSelect }</a>
										</strong>
									</span>
							</c:if>
								
							
							<c:if test="${firstSelect eq '전체상품'}">
									<span class="sec_arrow"><img src="/dailychan/resources/images/shop/ico_arrow_sec.png" alt="|"></span>
									<span>
										<strong>
										<a href="/dailychan/product/list.action?firstSelect=${firstSelect }&secondSelect=${secondSelect }&categoryId=0">${dto.product_lastSelect }</a>
										</strong>
									</span>
							</c:if>
							
								
									
						<div class="clear"></div>
					</div>
	
					<!-- //카테고리선택 -->
					
					<!-- 상품구매선택 -->
					<div class="pViewInfo">
						
						<div class="pvImg">
                        	
                        	<div>
								<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품이미지">
							</div>
                        </div>
                        
						<div class="pvNamePrice">
							<div class="pvName">
								<h4><span style="float:left;width:75%;line-height:30px;">${dto.product_subject }</span>
								<div class="shareSnsWrap">
									<a href="javascript:snsPostScript('kakaotalk', '<4월 정기Sale특가>제주청정우유 900ml', 'http://www.oasis.co.kr:8580/product/2646/thumb/thumb_2646d79c1e73-5983-4d66-98a2-6ff8a0b32f15.jpg', false);" class="shareKakao"></a>
									<a href="javascript:snsPostScript('facebook', '<4월 정기Sale특가>제주청정우유 900ml', 'http://www.oasis.co.kr:8580/product/2646/thumb/thumb_2646d79c1e73-5983-4d66-98a2-6ff8a0b32f15.jpg', false);" class="shareFacebook"></a>
									<a href="javascript:copyUrlToClipboard();" class="shareLink"></a>
    							</div>
								</h4>
							</div>
							<ul class="pvPriceList">
								<li>
									<div class="infoTxt">
										<strong>일반가</strong>
										<p>${dto.price }원</p>
									</div>
								</li>
								<li class="orderOasisPrice">
									<strong>오!감동</strong>
									<p><span>${dto.result_price }원</span><em class="oasisPc">${dto.product_discount }%</em></p>
								</li>
								<!--  <li>
                                	<strong>상품코드</strong>
                                    <p>8809135204473</p>
                                </li>-->
                                <li>
                                    <strong>보관방법</strong>
                                    
                                    <c:if test="${dto.product_keep=='ice' }">
                                    <p>냉동</p>
                                    </c:if>
                                    
                                    <c:if test="${dto.product_keep=='cool' }">
                                    <p>냉장</p>
                                    </c:if>
                                    
                                    <c:if test="${dto.product_keep=='normal' }">
                                    <p>실온</p>
                                    </c:if>
                                    
                                </li>
                                <li>
                                	<strong>배송구분</strong>
									<div class="deliveryInfo">
										<ul>
										
											<c:if test="${dto.product_delivery1=='storeDelivery' }">
			                        		<li class="on">매장배송</li>
			                        		</c:if>
										
											<c:if test="${dto.product_delivery1=='no' }">
			                        		<li class="off">매장배송</li>
			                        		</c:if>
			                        		
			                        		<c:if test="${dto.product_delivery2=='homeDelivery' }">
			                        		<li class="on">택배배송</li>
			                        		</c:if>
										
											<c:if test="${dto.product_delivery2=='no' }">
			                        		<li class="off">택배배송</li>
			                        		</c:if>
			                        		
			                        		<c:if test="${dto.product_delivery3=='earlyDelivery' }">
			                        		<li class="on">새벽배송</li>
			                        		</c:if>
			                        		
			                        		<c:if test="${dto.product_delivery3=='no' }">
			                        		<li class="off">새벽배송</li>
			                        		</c:if>
			                        	</ul>
		                        	</div>
                                </li>
								<li class="orderPM">
                                	<strong>구매수량</strong>
                                	
                                    <div class="orderPMBtn" data-discount_price="${dto.product_resultPrice }">
                                    	<div class="ea quantity" id="quantity">1</div>
                                        <a href="#" class="orderPMBtn_p btnPlus" onclick="javascript:btnPlusClick(this); return false;">
                                        	<img src="/dailychan/resources/images/shop/shopBtn_p.png" alt="수량 더하기">
                                        </a>
                                        <a href="#" class="orderPMBtn_m btnMinus" onclick="javascript:btnMinusClick(this); return false;">
                                        	<img src="/dailychan/resources/images/shop/shopBtn_m.png" alt="수량 빼기">
                                        </a>
                                    </div>
                                    
                                    
                                    	<p class="orderPMTxt">
                                    		
	                                    	<span class="fontBlack mgLeftm5 mgRight10"></span>
	                                    	
											본 상품은 ${dto.product_saleLimit }개까지 구매 할 수 있습니다.
										
										</p>
									
                                </li>
                                
                                	<li class="orderCaution">
	                                	<strong><b>구매포인트</b></strong>
	                                    <p><b>${dto.product_buypoint }</b></p>
	                                </li>
                                
                                
                                <li class="orderTotal">
                                	<strong>합계금액</strong>
                                    <p>
                                    	<span id="totalPrice">
                          
	                                    			${dto.result_price }
	                                    		
                                    		<em>원</em>
                                    	</span>
                                    </p>
                                </li>
							</ul>
							<div class="pvBtnWrap">
            
	                            		<a href="#" class="pvBtn3" onclick="zzimList('${dto.product_id}'); return false;">찜</a>
	                            		<a href="#" class="pvBtn1" onclick="addCart1(); return false;">장바구니</a>
	   
									
									    <a href="#" class="pvBtn2" onclick="nowBuy(); return false;">바로구매</a>
									
								
                            </div>
                            <div class="clear"></div>

						</div>
                    </div>
                    <!--// 상품구매선택 -->
                    
  					<!--관련 상품 -->
					<div class="pViewrelated">


								<div class="recommend" style="width: 100%;">
									<h4 style="padding-left: 65px;">MD 추천상품</h4>

									<div class="bx-wrapper" style="max-width: 893px;">

										<div class="" aria-live="polite"
											style="width: 100%; overflow: hidden; position: relative; height: 169px;">
											<div class=""
												style="width: 7215%; position: relative;">

												<c:forEach var="dto" items="${mdSelect }">

													<div style="float: left; list-style: none; position: relative; width: 143px; margin-right: 7px;" class="bx-clone" aria-hidden="true">

														<div class="start">
															<a href="/dailychan/product/article.action?product_id=${dto.product_id }${mdParam}">
																<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName }" alt="상품이미지">
															</a>
														</div>

														<div class="txt" style="text-align: center;">${dto.product_subject }</div>

													</div>
											
												</c:forEach>

											</div>

										</div>

									</div>

								</div>
							</div>
				<!--//관련 상품 -->
				
				
                    <!-- 상품상세정보 -->
                    <div class="pViewTabCon" id="pViewTabCon">
                    	<div class="pViewTab" id="pViewTab">
                    		<ul class="tabList">
                                <li data-idx="1" class="on"><a href="#" onclick="tab('1'); return false;" class="tabBtn btn01" data-tab="1">상품정보</a></li>
                                <li data-idx="3"><a href="#" onclick="tab('2'); return false;" class="tabBtn btn03" data-tab="3">상품상세정보</a></li>
                                <li data-idx="2"><a href="#" onclick="tab('3'); return false;" class="tabBtn btn02" data-tab="2">상품관리</a></li>
                                <!-- <li data-idx="4"><a href="#" class="tabBtn btn04" data-tab="4">배송정보</a></li> -->
                                <li data-idx="4"><a href="#" id="reviewCount" class="tabBtn btn05" onclick="productReviewAllList('1','${product_id}'); return false;" data-tab="4"></a></li>
                                <li data-idx="5">
                                	<a href="#" class="tabBtn btn06" id="qnaCount" onclick="productQnaAllList('1','${product_id}'); return false;" data-tab="5" id="tab6"></a>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </div>
                    
						<div class="pViewCon">
							<!--기존 컨텐츠와 동일 (일부수정 / 주석검색어 20170324) -->
							<!-- 컨텐츠 Tab -->
							<div class="wd900 tab1" id="tab1" style="min-height:700px">
								
								<p style="text-align: center; " align="center"><img src="/dailychan/resources/images/product/${dto.product_contentSaveFileName}" alt="상세정보 이미지">&nbsp;</p>
								
								<!--고객만족도-->
								<div class="like_review ">
					    		  	<ul>
									<li style="float: left;padding-right: 30px;">
									<img src="/dailychan/resources/images/common/ico_like.png">
									<span>
										
											
					                    		<c:if test="${dto.product_like!=null }">
                                                    ${dto.product_like }%
                                                </c:if>
                                                
                                                <c:if test="${dto.product_like==null }">
                                                    100%
                                                </c:if>
					                    	
					                    	
				                    	만족
			                    	</span>
									</li>
									<li style="display:inline-block;">
									<img src="/dailychan/resources/images/common/ico_review.png">
									<span>
										<a href="#;" onclick="$('.btn05').click();" id="reviewCountContent" style="color: #6ca437;"></a>
									</span>
									</li>
									<li style="float:right; display:inline-block">
								    <img src="/dailychan/resources/images/common/ico_self.png">
									<span>
                                        <a href="/company/serviceRefund" style="color: #6ca437;">
                                            self환불기
                                        </a>
                                    </span>
                                    </li>
									</ul>
								</div>
								<div class="wrapMoreOasis">
									<h3>알고 사면 더욱 좋은 데일리찬</h3>
									<ul class="more_oasis">
										<li>
											<div class="careWrap" style="height:380px">
												<div class="img"><img src="/dailychan/resources/images/shop/ico_view_01.png" alt=""></div>
												<div class="tit">믿고 먹을 수 있는<br>데일리찬</div>
												<div class="bar"></div>
												<div class="txt">
													전국 각지의 친환경 유기농<br>
													재배 농가와 계약 재배를 통해<br>
													안전하고 신선한 제품을 철저히 관리하여<br>
													제공하고 있습니다.
												</div>
											</div>
										</li>
										<li>
											<div class="careWrap" style="height:380px">
												<div class="img"><img src="/dailychan/resources/images/shop/ico_view_02.png" alt=""></div>
												<div class="tit">신선함이 가득한<br>데일리찬</div>
												<div class="bar"></div>
												<div class="txt">
													건강한 신선식품 위주로<br>
													매일 다양한 제품을 제공해 드리고<br>
													있습니다.
												</div>
											</div>
										</li>
										<li>
											<div class="careWrap" style="height:380px">
												<div class="img"><img src="/dailychan/resources/images/shop/ico_view_03.png" alt=""></div>
												<div class="tit">화학첨가물 없는<br>데일리찬</div>
												<div class="bar"></div>
												<div class="txt">
													향미증진제<br>
													(화학조미료/L-글루타민산), 방부제 등<br>
													화학첨가제를 사용하지 않은 제품만을<br>
													엄선하여 건강한 제품을 제공해<br>
													드립니다.
												</div>
											</div>
										</li>
									</ul>
								</div>
								
								<div class="wrapMoreOasis">
									<h3>데일리찬이 드리는 감동</h3>
									<ul class="more_oasis">
										<li>
											<div class="careWrap">
												<div class="img"><img src="/dailychan/resources/images/shop/ico_view_04.png" alt=""></div>
												<div class="tit">가격감동</div>
												<div class="bar"></div>
												<div class="txt">
													   생산자 직거래를 통해 유통과정을 줄여<br>
													   저렴한 가격으로 감동을 전해 드립니다.
												</div>
											</div>
										</li>
										<li>
											<div class="careWrap">
												<div class="img"><img src="/dailychan/resources/images/shop/ico_view_05.png" alt=""></div>
												<div class="tit">품질감동</div>
												<div class="bar"></div>
												<div class="txt">
													친환경 유기농 농가와 계약재배를 통하여<br>
													생산과정을 철저하게 관리하며<br>
													화학첨가물 제로인 식품만을 고집하여<br>
													최고의 맛을 제공하고 있습니다.
												</div>
											</div>
										</li>
										<li>
											<div class="careWrap">
												<div class="img"><img src="/dailychan/resources/images/shop/ico_view_06.png" alt=""></div>
												<div class="tit">서비스감동</div>
												<div class="bar"></div>
												<div class="txt">
													고객님들의 건강하고 신선한 먹거리를<br>
													위해 데일리찬는 5시간 이내의 빠른<br>
													배송을 24시간 쉬지 않고<br>
													제공하여 드립니다.   
												</div>
											</div>
										</li>
									</ul>
								</div>
								
							</div>
						
							<!----//  20170207 수정 : 디자인 및 구성 변경  ---->
							<div class="wd900 tab2" id="tab2" style="display: none;">
								<ul class="prodCareWrap">
									<li>
										<div class="careWrap">
											<div class="img"><img src="/dailychan/resources/images/shop/view_img_01.jpg" alt="" style="width:100%"></div>
											<div class="tit"><img src="/dailychan/resources/images/shop/prod_img_07.gif" alt="유전자 재조합식품 (GMO)제한관리"></div>
											<div class="txt">
												한 생물의 유용한 유전자를 다른 생물에 삽입하여 새로운  품종을 만드는 유전자 재조합 기술로 인류의 식품생산량에는 일대 혁신이 일어났지만, 인체에 의부작용을 우려하는 목소리는 사그라지지 않고 있습니다. 국내에서 시판되는 유전자 재조합 식품의 대부분을 차지하는 것은 미국에서 수입된 콩과 옥수수를 원료로 하는 것으로, 유전자 재조합 식품의 안전성에 논란을 불러 오는 것이 바로 이 유전자 재조합을 거친 콩이 알레르기를 일으킬 확률이 높다는 연구결과와 사례들입니다. <br>
												유전자 재조합 기술을 가하는 식품에 새로운 단백질이 생성되면서 이 이질적인 단백질이 우리 몸속에서 알레르기를 일으키게 되는데, 이는 특히 면연력이 약한 유아들에게는 치명적일 수도 있습니다.<br>
												데일리찬는 100% 국내산 친환경 방식으로 재배된 콩과 옥수수를 원재료로 사용한 식품만을 엄격하게 선별하여 제조, 제공, 관리하고 있으므로 안심하고 드실 수 있습니다.
											</div>
										</div>
									</li>
									<li>
										<div class="careWrap">
											<div class="img"><img src="/dailychan/resources/images/shop/view_img_02.jpg" alt="" style="width:100%"></div>
											<div class="tit"><img src="/dailychan/resources/images/shop/prod_img_08.gif" alt="잔류농약 속성검사"></div>
											<div class="txt">
												데일리찬에서 판매하는 모든 농산물은 농림수산부의 농산물 품질관리원에서 잔류농약 검사와 안정성 검사를 거쳐 합격인증을 받은 식품들입니다.<br>
												하지만 여러분께 더욱 안전한 먹거리를 제공하기 위해 사내 안전검사센터를 설치하여 주기적으로 다시 한번 자체검사를 실시, 인체에 유해한 농약성분이 남아있지 않은지 여부를 철저하게 검사하고 있습니다.<br>
												잔류농약 속성검사는 집파리의 머리에서 추출한 신경전달 효소와 농산물에서 채취한 잔류농약을 반응시켜 효소의 저해 정도로 잔류농약 유무의 판별 기준으로 삼으며, 이러한 검사를 통해 양성반응을 보이는 농산물은 즉시 출고가 금지됩니다.<br>
											</div>
										</div>
									</li>
									<li>
										<div class="careWrap">
											<div class="img"><img src="/dailychan/resources/images/shop/view_img_03.jpg" alt="" style="width:100%"></div>
											<div class="tit"><img src="/dailychan/resources/images/shop/prod_img_09.gif" alt="방사능 검사"></div>
											<div class="txt">
												2011년 3월 일본에서 원전사고가 있은 후 국내에서도 방사능에 대한 우려의 목소리가 높아지고 있습니다.<br>
												이에 데일리찬에서는 2011년 4월부터 사내 안전검사 검사센터에서 잔류농약의 검사와 더불어 방사능 검사 또한 엄격하게 실시하고 있습니다.<br>
												데일리찬의 방사능 검출 기준은 서울시 식품안전과의 기준과 같은 단위 면적당 0.5베크럴로, 다행히 현재까지 이러한 기준치를 넘는 식품은 발견되지 않고 있습니다.<br>
												앞으로도 만전을 기해 안전한 먹거리만을 전달하도록 노력하는 데일리찬가 되겠습니다.   
											</div>
										</div>
									</li>
								</ul>
								<!-- // -->
								
								<div class="wrapMoreOasis2">
									<h3>알고 사면 더욱 좋은 데일리찬</h3>
									<ul class="more_oasis2">
										<li>
											<div class="careWrap">
												<div class="tit">믿고 먹을 수 있는<br>데일리찬</div>
												<div class="txt">
													전통있는 친환경 유기농 농가와 직거래, 계약재배를 통해 철저하게 품질을 관리하고 있습니다.<br>
													안전하고 신선한 친환경 유기농 농산물을 일반 농산물과 비교해도 될 만큼 저렴하게 제공해 드립니다.<br>
													<br>
													단, 유기농 파프리카, 애호박, 가지 등 뿌리열매 채소는 동절기 수확량 부족에 따른 가격 폭등으로 인하여 최상급 품질의 일반채소를 산지가격 그대로 유기농 채소와 함께 공급하고 있습니다. 
												</div>
											</div>
										</li>
										<li>
											<div class="careWrap">
												<div class="tit">신선함이 가득한<br>데일리찬</div>
												<div class="txt">
													신선식품은 취급이 까다로워 전자상거래 업계에서 비중이 적으나 저희 데일리찬는 고객님께 건강하고 신선한 제품을 제공하기 위한 고집을 지키기 위해 전체 상품중 신선 식품의 비중을 전제품의 70% 이상으로 유지하여 다양한 신선식품을 제공해 드립니다. 
												</div>
											</div>
										</li>
										<li>
											<div class="careWrap">
												<div class="tit">화학첨가물 없는<br>데일리찬</div>
												<div class="txt">
													데일리찬의 제품에는 일체의 화학첨가제를 사용하지 않습니다.<br>
													특히 향미증진제는 재료 본연의 맛을 내는 첨가제로서 뿐만 아니라 신선도의 구분을 감추는 첨가제로 데일리찬의 제품에서는 절대 사용하지 않습니다.<br>
													화학첨가물을 일체 사용하지 않고 신선한 재료로 만들어 격이 다른 가공 식품을 제공해 드립니다. 
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						
							<div class="wd900 tab3" id="tab3" style="display: none;">
								<!-- 배송안내 -->
								
									<div style="text-align:center">
	                                    <table width="900" border="0" cellspacing="0" cellpadding="0" sizset="18" style="display:inline-block">
	                                        <tbody sizset="18">
	                                            <tr sizset="18">
	                                                <td sizset="18">
	                                                    <img src="/dailychan/resources/images/common/info_t01.jpg">
	                                                </td>
	                                            </tr>
	                                            <tr sizset="19">
	                                                <td sizset="19">
	                                                    <table width="900" border="0" cellspacing="0" cellpadding="0">
	                                                        <tbody> 
	                                                            <tr>
	                                                                <td height="1" bgcolor="#e1e2e3" colspan="3"></td>
	                                                            </tr>
	                                                            
	                                                                
	                                                                    <tr align="center">
	                                                                        <td width="250" height="30" style="padding: 7px 25px 7px 25px;" bgcolor="#f7f7f7">
	                                                                            <font color="#625c56"><strong>상품명</strong></font>
	                                                                        </td>
	                                                                        <td width="1" bgcolor="#e1e2e3"></td>
	                                                                        <td style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px;">
	                                                                            ${dto.productDetail_name }
	                                                                        </td>
	                                                                    </tr>
	                                                                    <tr>
	                                                                        <td height="1" bgcolor="#e1e2e3" colspan="3"></td>
	                                                                    </tr>
	                                                                
	                                                            
	                                                                
	                                                                    <tr align="center">
	                                                                        <td width="250" height="30" style="padding: 7px 25px 7px 25px;" bgcolor="#f7f7f7">
	                                                                            <font color="#625c56"><strong>용량/수량/크기</strong></font>
	                                                                        </td>
	                                                                        <td width="1" bgcolor="#e1e2e3"></td>
	                                                                        <td style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px;">
	                                                                            ${dto.productDetail_volume }
	                                                                        </td>
	                                                                    </tr>
	                                                                    <tr>
	                                                                        <td height="1" bgcolor="#e1e2e3" colspan="3"></td>
	                                                                    </tr>
	                                                                
	                                                            
	                                                                
	                                                                    <tr align="center">
	                                                                        <td width="250" height="30" style="padding: 7px 25px 7px 25px;" bgcolor="#f7f7f7">
	                                                                            <font color="#625c56"><strong>생산자 및 소재지</strong></font>
	                                                                        </td>
	                                                                        <td width="1" bgcolor="#e1e2e3"></td>
	                                                                        <td style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px;">
	                                                                            ${dto.productDetail_made }
	                                                                        </td>
	                                                                    </tr>
	                                                                    <tr>
	                                                                        <td height="1" bgcolor="#e1e2e3" colspan="3"></td>
	                                                                    </tr>
	                                                                
	                                                            
	                                                                
	                                                                    <tr align="center">
	                                                                        <td width="250" height="30" style="padding: 7px 25px 7px 25px;" bgcolor="#f7f7f7">
	                                                                            <font color="#625c56"><strong>원산지</strong></font>
	                                                                        </td>
	                                                                        <td width="1" bgcolor="#e1e2e3"></td>
	                                                                        <td style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px;">
	                                                                            ${dto.productDetail_origin }
	                                                                        </td>
	                                                                    </tr>
	                                                                    <tr>
	                                                                        <td height="1" bgcolor="#e1e2e3" colspan="3"></td>
	                                                                    </tr>
	                                                                
	                                                                
	                                                            
	                                                                
	                                                                    <tr align="center">
	                                                                        <td width="250" height="30" style="padding: 7px 25px 7px 25px;" bgcolor="#f7f7f7">
	                                                                            <font color="#625c56"><strong>제조년월일/품질유지기한</strong></font>
	                                                                        </td>
	                                                                        <td width="1" bgcolor="#e1e2e3"></td>
	                                                                        <td style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px;">
	                                                                            ${dto.productDetail_created }
	                                                                        </td>
	                                                                    </tr>
	                                                                    <tr>
	                                                                        <td height="1" bgcolor="#e1e2e3" colspan="3"></td>
	                                                                    </tr>
	                                                          
	                                                            
	                                                                
	                                                                    <tr align="center">
	                                                                        <td width="250" height="30" style="padding: 7px 25px 7px 25px;" bgcolor="#f7f7f7">
	                                                                            <font color="#625c56"><strong>상품구성</strong></font>
	                                                                        </td>
	                                                                        <td width="1" bgcolor="#e1e2e3"></td>
	                                                                        <td style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px;">
	                                                                            ${dto.productDetail_configuration }
	                                                                        </td>
	                                                                    </tr>
	                                                                    <tr>
	                                                                        <td height="1" bgcolor="#e1e2e3" colspan="3"></td>
	                                                                    </tr>
	                                                                
	                                                                
	                                                                    <tr align="center">
	                                                                        <td width="250" height="30" style="padding: 7px 25px 7px 25px;" bgcolor="#f7f7f7">
	                                                                            <font color="#625c56"><strong>소비자상담문의</strong></font>
	                                                                        </td>
	                                                                        <td width="1" bgcolor="#e1e2e3"></td>
	                                                                        <td style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px;">
	                                                                            ${dto.productDetail_counseling }
	                                                                        </td>
	                                                                    </tr>
	                                                                    <tr>
	                                                                        <td height="1" bgcolor="#e1e2e3" colspan="3"></td>
	                                                                    </tr>
	                                                                
	                                                            
	                                                        </tbody>
	                                                    </table>
	                                                </td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
                                    </div>
                            
							</div>
							
					<div class="wd900 tab4" id="tab4" style="display: none;">
                        <div class="commentWrap">
                            <p class="gTxt">
                              <img src="/dailychan/resources/images/shop/prod_txt_01.jpg" alt="배송완료 상품은 주문일로 부터 100일 이내에 작성이 가능합니다. 일반평 100포인트/ 포토평 300포인트 오픈 프로모션 기간동안 지급 됩니다.">
                           </p>

                           <!--구매후기-->
                           <div id="commentList" style="min-height:700px">


<script type="text/javascript">
$(document).ready(function() {
	$(".cmMoreBtn").click(function() {

        var more = $(this).parent().parent().next();
        if (more.css("display") == "none") {
            $(this).parent().parent().parent().find(".comMore").hide();
            more.show();
        } else {
            $(this).parent().parent().parent().find(".comMore").hide();
            more.hide();
        }
        
    })
    
    $(".cmMoreCloseBtn").click(function() {
        $(this).parent().parent().removeClass("cmMoreLi");
        if ($(this).attr("id") == "moreClose1") {
         $(this).parent().parent().addClass("cmImgLi");
         }
    })
});
</script>
 <div class="cmTitWrap">
   <a href="#" class="cmTit" id="reviewAll" onclick="productReviewAllList('1','${product_id}'); return false;">전체</a>
   <a href="#" class="cmTit2" id="reviewPhoto" onclick="productReviewPhotoList('1','${product_id}'); return false;">포토 구매후기</a>
   <div class="clear"></div>
</div>
 <div>
		            </div><div>
		            </div><div>
		            </div><div>
		            </div><div>
		            </div><table class="tableCom mgT10">
    <colgroup>
        <col width="100">
        <col width="100">
        <col width="*">
        <col width="100">
        <col width="125">
    </colgroup>
    <thead>
        <tr>
            <th>번호</th>
            <th>고객만족도</th>
            <th>구매후기</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
    </thead>
    			<tbody id="productReview">


    			</tbody>
			</table>     
		</div>
                           <!--//구매후기-->
                        </div>
                     </div>
							
							<div class="wd900 tab5" id="tab5" style="display: none; margin-bottom: 500px;">
                                <div class="commentWrap">
                                
                                <div class="cmTitWrap">


                                    <!--상품문의-->
                                    <div id="qnaList" >
                                        <div class="cmTitWrap">

                                            <div class="cmTit3">
												상품문의
											</div>
	
	
									    <!-- 선택시 클래스명 cmTit_on -->
									    <c:if test="${join_id ne null }">
									        <a href="#" class="cmTit" id="my" onclick="productQnaMyList('1','${product_id}','${join_id}'); return false;">내 문의 보기</a>
									        <a href="#" class="cmTit2" id="all" onclick="productQnaAllList('1','${product_id}'); return false;">전체 문의 보기</a>
									        <!-- btn : 문의하기 -->
									        <a href="#" class="cmWriteBtn layerpopBtn comLayerBtn" onclick="openProductQnaForm(); return false;">문의하기</a>
									    </c:if>
										</div>
                                            
                                            
									</div>

                                        <!-- txt : 상품문의 안내사항 -->
                                        <div class="txt_cm_area" style="margin-top:10px;">
                                            <div>
                                                - 가격, 판매자, 교환/환불 및 배송 등에 해당 상품 자체와 관련없는 문의는 고객센터 내 1:1 문의하기를 이용하세요.<br>
                                                - "해당 상품 자체" 와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고없이 노출제한, 삭제 등의 조치가 취해질 수 있습니다.<br>
                                                <!-- - 문의 하신 상담내용은 고객님의 메일로도 확인하실 수 있습니다.<br /> -->
                                                - 고객센터 답변가능시간 : 오전 9시 30분 ~오후 6시 30분(토/일/공휴일 제외)
                                            </div>
                                        </div>
                                        <table class="tableCom mgT10">
                                            <colgroup>
                                                <col width="100">
                                                <col width="100">
                                                <col width="*">
                                                <col width="100">
                                                <col width="125">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th co>문의유형</th>
                                                    <th>답변상태</th>
                                                    <th>제목</th>
                                                    <th>문의자</th>
                                                    <th>등록일</th>
                                                </tr>
                                            </thead>

												<tbody id="productQuestion">

													<!-- 요기서 부터 -->
													
													
													<!-- 요기까지 -->

												</tbody>
											</table>

                                    </div>

                                </div>
                            </div>
                             <!--//상품문의-->
                             
							<!-- //컨텐츠 Tab -->
						</div>
					</div>
					<!-- //상품 정보 -->
				
				</div>
				<!-- //내용 입니다 -->
			</div>
			<!-- //오른쪽 영역 -->
		</div>
	</div>
	<!-- //컨텐츠 -->
	
	<input type="hidden" name="product_price" value="${product_resultPrice}" style="border: 1px;"/>
	<input type="hidden" name="join_id" value="${join_id}"/>
	<input type="hidden" name="product_id" value="${product_id} "/>

	</form>

    <div class="oasisDim"></div>
    
    <div class="oasisLayerPop4" style="height:585px">
	    <div class="oasisLayerPop_in">
			<div class="oasisLPtit" >
				<strong class="comLayerTit">상품문의하기</strong>
				 <div style="position:absolute; width: 27px;height: 27px;top: 27px;right: 26px;">
                        <a href="#" onclick="closeProductQnaForm(); return false;" class="popOasisDeliveryClose"></a>
                    </div>
			</div>
			
			<div class="oasisLPconWrap">
			    <form id="productQnaForm" method="post">
					<div class="comLayerCon">
						 <div class="oasisLPcon1" style="margin:15px">
							문의하실 분야를 선택하신 후 내용을 입력하신 다음 "문의" 버튼을 눌러주세요.
						</div>
						 <div class="oasisLPcon2" style="padding: 0 20px;">
							<table class="tableComWrite">
								<colgroup>
									<col width="100">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>문의분야</th>
										<td>
											<ul class="faqSelectList2">
												<li style="padding-bottom:0px;">
													<span class="radios">
														<input type="radio" name="productQuestion_type" id="radioQnaType1" value="상품" checked="checked">
														<label for="radioQnaType1"></label>
													</span>
													<label for="radioQnaType1">상품</label>
												</li>
												<li style="padding-bottom:0px;">
													<span class="radios">
														<input type="radio" name="productQuestion_type" id="radioQnaType2" value="배송">
														<label for="radioQnaType2"></label>
													</span>
													<label for="radioQnaType2">배송</label>
												</li>
												<li style="padding-bottom:0px;">
													<span class="radios">
														<input type="radio" name="productQuestion_type" id="radioQnaType3" value="취소/교환/반품">
														<label for="radioQnaType3"></label>
													</span>
													<label for="radioQnaType3">취소/교환/반품</label>
												</li>
											 	<li style="padding-bottom:0px;">
											 		<span="" class="radios">
														<input type="radio" name="productQuestion_type" id="radioQnaType4" value="주문/결제">
														<label for="radioQnaType4"></label>
													</span>
													<label for="radioQnaType4">주문/결제</label>
												</li>
												<li style="padding-bottom:0px;">
													<span class="radios">
														<input type="radio" name="productQuestion_type" id="radioQnaType5" value="기타">
														<label for="radioQnaType5"></label>
													</span>
													<label for="radioQnaType5">기타</label>
												</li> 
											</ul>
										</td>
									</tr>
									<tr>
										<th>상품명</th>
										<td>
											<div class="product_name">
											<input type="hidden" name="product_subject" value="${dto.product_subject }"/>
												${dto.product_subject }
											</div>
										</td>
									</tr>
									<tr>
										<th>문의 내용</th>
										<td>
											<div class="cmTxtInput">
												<textarea class="cmMtinput" name="productQuestion_content" placeholder="내용을 입력해주세요. (3,000자 미만)" id="question"></textarea>
											</div>
											<div class="txt_textarea">
												“해당 상품 자체”와 관계없는 글,양도,광고성,욕설,비방,도배 등의 글은 예고없이 <br>
												노출제한, 삭제 등의 조치가 취해질 수 있습니다.<br>
												한번 등록한 상담내용은 수정이 불가능합니다. <br>
												수정을 원하시는 경우, 삭제 후 재등록 하셔야 합니다. 
											</div>
										</td>
									</tr>
									<tr>
										<th>답변 알림</th>
										<td>
											<div>
												<span class="checks">
													<input type="checkbox" id="productQnaSmsAlarmYn" checked="checked">
													<label for="productQnaSmsAlarmYn"></label>
												</span>&nbsp;
												<label for="productQnaSmsAlarmYn">답변 후 문자보내주세요</label>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
			
						</div>
			
						<div class="btn_secret_area">
							<div><!-- 문의하신 상담내용은 고객님의 메일로도 확인하실 수 있습니다. --></div>
			
							<!-- btn : 비밀글로 문의하기 -->
							<span class="checks">
								<input type="checkbox" name="productQuestion_secret" id="productQnaOpenYn" value="secret">
								<label for="productQnaOpenYn"></label>
							</span>
							<label for="productQnaOpenYn">비밀글로 문의하기</label>
						</div>
						
						<div class="oasisLPcon3">
							 <a href="#" onclick="productQnaInsert();">문의</a>
							 <a href="#" class="oasisMapClose2" onclick="closeProductQnaForm();">취소</a>
						</div>
					
						<input type="hidden" id="qnaType" name="qnaType" value="1">
						<input type="hidden" id="openYn" name="openYn" value="Y">
						<input type="hidden" id="productId" name="productId" value="2646">
			    	</div>
			    </form>
			</div>
		</div>
	</div>
	
	<div class="productCommentPop" style="height:320px;overflow-y:hidden; display: none;">
    	<form id="productCommentForm" action="/myPage/writeProductComment" method="post">
        <div class="oasisLayerPop_in">
            <div class="oasisLPtit" style="position:relative;">
                <strong>구매후기 답글 작성</strong>
                <div style="position:absolute; width: 27px;height: 27px;top: 27px;right: 26px;">
                	<a href="#" onclick="closeProductCommentPop(); return false;" class="popOasisDeliveryClose"></a>
                </div>
            </div>

            <div class="oasisLPconWrap" style="height:256px">
            	<div class="oasisLPcon2">
            		<table class="tableComWrite" style="border-top:none;">
                        <colgroup>
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="cmTxtInput">
                                    <textarea class="cmMtinput" placeholder="해당상품의 리뷰와 무관한 내용이나 동일 문자의 반복 등 부적합한
									내용일 때는 통보없이 삭제 될 수 있습니다.내용을 입력해 주세요.(20자 이상 3,000자 미만)" id="productCommentContent" name="productCommentContent" style="resize:none;"></textarea>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="oasisLPcon3" style="margin-top: 20px;padding-bottom:0px">
                     <a href="#" onclick="addProductComment(); return false;">등록하기</a>
                     <a href="#" class="oasisMapClose2" onclick="closeProductCommentPop(); return false;">취소하기</a>
                </div>
             </div>
             <input type="hidden" id="ppCommentId" name="ppCommentId">
             <input type="hidden" id="pCommentId" name="pCommentId">
        </div>
    </form>
    </div>

</body>
<jsp:include page="../../footer.jsp"/>
</html>