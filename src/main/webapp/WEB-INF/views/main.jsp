<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>

<jsp:include page="top.jsp" />
<jsp:include page="right.jsp"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html>
  <head>
    <title>데일리찬</title>

<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="/dailychan/resources/dist/css/swiper.min.css"/>
<link rel="stylesheet" href="/dailychan/resources/dist/css/swiper.css"/>
  
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/common.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/jquery.bxslider.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/jquery.flipster.min.css" />

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js"></script>

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

//<![CDATA[

var contextPath = "";
var imgUrl = "http://www.oasis.co.kr:8580";
(function($) {
	$.ajaxSetup({
		beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", "true");
		},
		error: function(xhr, status, err) {
			if (xhr.status == 403) {
				location.href = contextPath + "/login?redirect=true";
			}
			else {
				console.log("error: " + xhr.status);
			}
		}
	});
	
	$(document).ajaxStart(function() {
		$("#isolationField").show();
		
	}).ajaxStop(function() {
		$("#isolationField").hide();
	});
	
})(jQuery);
//]]>
</script>

    <script type="text/javascript" src="/dailychan/resources/js/instafeed.min.js"></script> <!-- js 파일 로드 -->
	<script type="text/javascript">    

	
	jQuery(function($) {  
		 var tocken = "13146801098.504a3b7.692d2ef6e39a49d290ee3c4e231aed6a"; /* Access Tocken 입력 */  
		 var count = "10";  
		 $.ajax({  
		  type: "GET",  
		  dataType: "jsonp",  
		  cache: false,  
		  url: "https://api.instagram.com/v1/users/self/media/recent/?access_token=" + tocken + "&count=" + count,  
		  success: function(response) {  
		   if ( response.data.length > 0 ) {  
		     for(var i = 0; i < response.data.length; i++) {  
		       var insta = '<div class="insta-box">';  
		       insta += "<a target='_blank' href='" + response.data[i].link + "'>";  
		       insta += "<div class='image-layer'>";  
		       //insta += "<img src='" + response.data[i].images.thumbnail.url + "'>";  
		       insta += '<img class="imageth" src="' + response.data[i].images.thumbnail.url + '">';  
		       insta += "</div>";  
		       //console.log(response.data[i].caption.text);  
		       if ( response.data[i].caption !== null ) {  
		      insta += "<div class='caption-layer'>";  
		      if ( response.data[i].caption.text.length > 0 ) {  
		        insta += "<p class='insta-caption'>" + response.data[i].caption.text + "</p>"  
		      }  
		      insta += "<span class='insta-likes'><img src='/dailychan/resources/images/common/like.png' width='20px;' height='20px;'>&nbsp;" + response.data[i].likes.count + " Likes</span>";  
		      
		      
		      insta += "</div>";  
		       }  
		       insta += "</a>";  
		       insta += "</div>";  
		       $("#instaPics").append(insta);  
		     }  
		   }  
		   $(".insta-box").hover(function(){  
		     $(this).find(".caption-layer").css({"backbround" : "rgba(255,255,255,0.7)", "display":"block"});  
		   }, function(){  
		     $(this).find(".caption-layer").css({"display":"none"});  
		   });  
		  }  
		    });  
		});  
</script>

<!-- 현우 -->
<script type="text/javascript">
function recommendPopUp() {
	
	var join_id = "${join_id}";
	var productRecommandCount = "${recommandCount}";
	
	if(join_id==""){
		
		alert("로그인 후 이용가능한 기능입니다.");
		location.href = "/dailychan/join/login.action";
		return;
		
	}
	
	if(productRecommandCount=="0"){
		
		alert("추천 가능한 상품이 없습니다.");
		return;
		
	}

	$('.popDim').show();
	$('.oasisDim').show();
	$('#custRecommendDialog').show();

}

function closeProductRecommendForm() {

	$('.popDim').hide();
	$(".oasisLayerPop").hide();
	$('.oasisDim').hide();
	 
	$('.oasisDim').hide(50, function(){
		$('body').css("overflow-y","auto");
	});
}

function invite() {
	
	var join_id = "${join_id}";
	
	if(join_id==""){
		
		location.href = "/dailychan/join/login.action";
		
	}else{
		
		location.href = "/dailychan/myPage/invite.action";
		
	}
	
}

function sendProductRecommand() {
	
	var product_id = $("#product_subject").children(":selected").attr("id");
	var product_subject = $('#product_subject option:selected').val();
	var productRecommand_reason = $('#productRecommand_reason').val();
	var url = "/dailychan/product/event/insertProductRecommand.action";

	if(product_subject=="select"){
		
		alert("추천 하실 상품을 선택해 주십시오.");
		return;
		
	}else{

		$.post(url,{product_id:product_id,product_subject:product_subject,
			productRecommand_reason:productRecommand_reason},function(data){});
		
		alert("추천 상품 등록이 완료되었습니다.");
		closeProductRecommendForm();
		return;
	}

}

</script>

</head>
<body>

<div class="allWrap mainConWrap">
    <!-- ico : 잎사귀 -->
    
    <!-- header -->
 
	<script type="text/javascript">
		function setKeyword(keyword) {
	        $("#keyword").val(keyword);
	        searchProduct('keyword');
	    }
	
		function jsFixedLayerHide() { 
			$('.fixedLayer').hide();
		};
		
        
        function addCookie(keyword) {
            //검색어 쿠키 설정
            var d = new Date();
            var cookieVal = escape( keyword );
            var name = "keywordSearchProduct" + new Date().getTime();
            var todayDate = new Date(); 
            todayDate.setDate( todayDate.getDate() + 1 ); //24시간
            document.cookie = name + "=" + cookieVal + "; path=/; expires=" + todayDate.toGMTString() + ";";            
        }
        
        function removeCookie(name){
            var todayDate = new Date(); 
            todayDate.setDate( todayDate.getDate() - 1 );
            document.cookie = name + "=" + escape( '' ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
        }

	
		$(document).ready(function() {

			var ww = $('.btnOpenAllBanner').width() / 2;
			$('.btnOpenAllBanner').css('margin-left', -ww);
			
			$('.btnCloseAllBanner').click(function(){
				$('.allPageBanner').slideUp('slow');
			});
	
			$('.btnOpenAllBanner').click(function(){
				$('.allPageBanner').slideToggle('slow');
			});
			
			$('.tpbClose').click(function(){
				setBannerHideCookie();
				$('.topPmBanner').hide();
			});
			
			$("#keyword").focus( function() {
				  
		    });
			
			$("#keyword").blur( function() {
				if (!$('#scWordListWrap').is(':hover')) {
					$("#scWordListWrap").hide();
                }
		    });
		});
		
		function setBannerHideCookie(){
			var name = "bannerHideCookie";
            var value = "Y";
			var todayDate = new Date(); 
            todayDate.setDate( todayDate.getDate() + 1 ); //24시간
            document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toGMTString() + ";";
		}
		
		function switchPlatform(p, refUrl) {
			
			if(refUrl.indexOf("?") > 0)
				location.replace(refUrl + "&isMobileUrl=" + p);
			else
				location.replace(refUrl + "?isMobileUrl=" + p);
			
			/* $.ajax({
				url : contextPath + "/switchPlatform",
				type: "GET",
				dataType: "json",
				data: { isMobileUrl : p },
				success: function(html) {
					location.replace(refUrl);
				}
			}); */
		}
		
		function movePromotion() {
			
		}
		
		function findDeliveryArea() {
			$("#findDeliveryPop").show();
			$(".popDim").show();
		}
	</script>
    
    <!-- 컨텐츠 -->
    <div class="contentsArea">
        <div class="contentsWrap">
            
<!-- 메인 상단 슬라이드 영역 : 배내추가시 순번에따라 id='mainBanner00' 형태로 지정(구글태그매니저사용)-->
            <div id="mainTopSlide">
                <ul class="bxslider">
                    <li>
                        <a href="/dailychan/ecoService.action" id="mainBanner14">
                            <div style="background:url('/dailychan/resources/images/shopBanner/Web_main_banner_ecowrap_0418.png') no-repeat center top;">&nbsp;</div>
                        </a>
                    </li>
                    <li>
                        <a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=농산물&lastSelect=과일&categoryId=1" id="mainBanner12">
                        <div style="background:url('/dailychan/resources/images/shopBanner/Web_main_banner_ecowrap_0517_1.jpg') no-repeat center top;">&nbsp;</div>
                        </a>
                    </li>

                    <li>
                        <a href="/dailychan/help/selfrefundDetail.action" id="mainBanner15">
                        <div style="background:url('/dailychan/resources/images/shopBanner/Web_main_banner_1015.jpg') no-repeat center top;">&nbsp;</div>
                        </a>
                    </li>                   

                    <li>
                        <a href="/dailychan/event/promotion/deliveryevent.action" id="mainBanner03">
                        <div style="background:url('/dailychan/resources/images/shopBanner/Web_main_banner_0722_2.jpg') no-repeat center top;">&nbsp;</div>
                        </a>
                    </li>
                    <li>
                        <a href="#" onclick="invite();" id="mainBanner05">
                        <div style="background:url('/dailychan/resources/images/shopBanner/Web_main_banner_0615_1.jpg') no-repeat center top;">&nbsp;</div>
                        </a>
                    </li>
                    <li>
                        <a href="/dailychan/event/eventMain.action" id="mainBanner07">
                        <div style="background:url('/dailychan/resources/images/shopBanner/Web_main_banner_0614_2.jpg') no-repeat center top;">&nbsp;</div>
                        </a>
                    </li>

                </ul>
            </div>
            <script type="text/javascript">
                $(document).ready(function(){
                    // 메인 상단 슬라이드
                    $('#mainTopSlide .bxslider').bxSlider({
                        auto: true,
                        speed: 500,
                        pause: 5000,
                        moveSlides:1,
                        pager:true,
                        controls:true,
                        touchEnabled: false
                    });
                });
                
                $("#mainTopSlide").hover( function () { 
                    $('#mainTopSlide .bx-controls-direction').show();
                }, function () { 
                    $('#mainTopSlide .bx-controls-direction').hide();
                } );
            </script>
            <!-- //메인 상단 슬라이드 영역 -->
            
            
            

  <!-- 오!감동 특가 영역 -->
            
			<div class="deal_area oh_hot_deal_area">
				<dl>
					<!-- 상단 텍스트 -->
					<dt>
						<!-- title -->
						<span class="tit_area_main"style="padding-top:20px;">
							<img src="/dailychan/resources/images/main/h3_oh_hot_deal_new.png" alt="오! 감동 특가" />
						</span>
						<!-- sub title -->
						<div class="txt_area_main">
							<!-- txt : 가운데 텍스트 -->
							<p class="txt_sub_main">
								<span>품목당 2개씩 구매 하실 수 있는 데일리찬 감동특가</span>
							</p>
						</div>
					</dt>
					<!-- //상단 텍스트 -->

					<!-- 하단 리스트 -->
					<dd>
						<ul>
							<c:forEach var="dto" items="${ohLists }">
                    			<!-- 상품 1set -->
								
								<li class="saleSellTxt">
									<a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect}&secondSelect=${dto.product_secondSelect}&lastSelect=${dto.product_lastSelect}">
										<!-- 상품리스트 / off -->
										<div class="product_off">
											<!-- img : 243 * 243 -->
											<div class="thumnail_area">
												<img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="" >
												<span>&nbsp;</span>
											</div>
											<!-- txt : 상품명 -->
											<strong>${dto.product_subject }</strong>
											<!-- txt : 할인가 -->
											<div class="txt_discount_won">
												<span class="price_before">
													<del><fmt:formatNumber value="${dto.product_price }" pattern="#,###" />원</del>
												</span>
													&nbsp;&nbsp;
												<span class="price_after">
													<strong><fmt:formatNumber value="${dto.product_resultPrice }" pattern="#,###" />원</strong>
												</span>
											</div>
										</div>
										<!-- //상품리스트 / off -->

									</a>
								</li>
							</c:forEach>
							
						</ul>
					</dd>
					<!-- //하단 리스트 -->
				</dl>
				<span class="btn_view_main2 mgT30">
					
					
                    
                    
					<div class="hashtag">
						
						<div>
							<a href="/dailychan/product/article.action?product_id=155&firstSelect=%EC%98%A4!%EA%B0%90%EB%8F%99">
							#데일리찬의선물
							</a>
						</div>
						
						<div>
							<a href="/dailychan/product/article.action?product_id=117&firstSelect=%EC%98%A4!%EA%B0%90%EB%8F%99">
							#감동해서 고구마
							</a>
						</div>
						
						<div>
							<a href="/dailychan/product/article.action?product_id=107&firstSelect=%EC%98%A4!%EA%B0%90%EB%8F%99">
							#감동우유
							</a>
						</div>
						
					</div>
					<a class="only_top_border" href="/dailychan/product/origin/list.action?firstSelect=%EC%98%A4!%EA%B0%90%EB%8F%99">
						<span>오! 감동 특가 전체보기</span>
					</a>
				</span>
			</div>
            <!-- //오!감동 특가 영역 -->
            
                   <!-- 외식같은 집밥 영역 & 기획전 영역 -->   
<div class="banner_m_area main_banner_m_area">
                <ul>
                    <li>
                        <div class="banner_new_area" id="banner_new_area">
                            <ul class="bxslider">
                             <li>
                                  <a href="/dailychan/product/article.action?product_id=230&firstSelect=이벤트&secondSelect=외식 같은 집밥">
                                      <div style="background:url('/dailychan/resources/images/main/new_banner_1.jpeg') no-repeat center top;">&nbsp;</div>
                                  </a>
                              </li>
                                 <li>
                                  <a href="/dailychan/product/article.action?product_id=227&firstSelect=이벤트&secondSelect=외식 같은 집밥">
                                      <div style="background:url('/dailychan/resources/images/main/new_banner_2.jpeg') no-repeat center top;">&nbsp;</div>
                                  </a>
                              </li>          
                              <li>
                              
                                  <a href="/dailychan/product/article.action?product_id=290&firstSelect=이벤트&secondSelect=외식 같은 집밥">
                                      <div style="background:url('/dailychan/resources/images/main/new_banner_3.jpeg') no-repeat center top;">&nbsp;</div>
                                  </a>
                              </li>
                              <li>                              
                                  <a href="/dailychan/product/article.action?product_id=250&firstSelect=이벤트&secondSelect=외식 같은 집밥">
                                      <div style="background:url('/dailychan/resources/images/main/new_banner_4.jpeg') no-repeat center top;">&nbsp;</div>
                                  </a>
                              </li>
                              <!-- <li>
                                  <a href="/product/detail/2878-3584">
                                      <div style="background:url('/images/main/new_banner_0706_2.jpg') no-repeat center top;">&nbsp;</div>
                                  </a>
                              </li> -->
                            </ul>
                        </div>
                        <!--  <a href="/product/detail/2788-3346">
                          <img src="/images/main/new_banner_0529_1.jpg" width="506" height="210" alt="신상품" />
                        </a> -->
                        <span class="banner_view btn_view_main2">
                            
                            
                            
                            <div class="hashtag">
                                
                                <div>
                                    <a href="/dailychan/product/article.action?product_id=388&firstSelect=이벤트&secondSelect=아침식사대용">
                                    #든든한 한끼
                                    </a>
                                </div>
                                
                                <div>
                                    <a href="/dailychan/product/article.action?product_id=325&firstSelect=전체상품&secondSelect=축산물&lastSelect=육가공품">
                                    #콜라겐 듬뿍
                                    </a>
                                </div>
                                
                            </div>
                            <a href="/dailychan/product/event/list.action?firstSelect=이벤트&secondSelect=외식%20같은%20집밥&categoryId=1">
                                <span>외식같은 집밥 전체보기</span>
                            </a>
                        </span>
                    </li>
                    <li>
                        <div class="banner_plan_area" id="banner_plan_area">
                            <ul class="bxslider">
                             <li>
                                  <a href="/dailychan/product/article.action?product_id=447&firstSelect=이벤트&secondSelect=간편선물세트">
                                      <div style="background:url('/dailychan/resources/images/main/new_banner_5.jpeg') no-repeat center top;">&nbsp;</div>
                                  </a>
                              </li>
                              <li>
                                  <a href="/dailychan/product/article.action?product_id=476&firstSelect=이벤트&secondSelect=환절기 건강식품">
                                      <div style="background:url('/dailychan/resources/images/main/new_banner_6.jpeg') no-repeat center top;">&nbsp;</div>
                                  </a>
                              </li>
                              <li>
                                  <a href="/dailychan/product/article.action?product_id=394&firstSelect=이벤트&secondSelect=아침식사대용">
                                      <div style="background:url('/dailychan/resources/images/main/new_banner_7.jpeg') no-repeat center top;">&nbsp;</div>
                                  </a>
                              </li>
                              <li>
                                  <a href="/dailychan/product/article.action?product_id=509&firstSelect=이벤트&secondSelect=우리아이안심">
                                      <div style="background:url('/dailychan/resources/images/main/new_banner_8.jpeg') no-repeat center top;">&nbsp;</div>
                                  </a>
                              </li>
                            </ul>
                        </div>
                        <span class="banner_view btn_view_main2">
                            
                            
                            
                            <div class="hashtag">
                                
                                <div>
                                    <a href="/dailychan/product/article.action?product_id=451&firstSelect=이벤트&secondSelect=간편선물세트">
                                    #간단한 아침
                                    </a>
                                </div>
                                
                                <div>
                                    <a href="/dailychan/product/article.action?product_id=390&firstSelect=이벤트&secondSelect=아침식사대용">
                                    #정성가득
                                    </a>
                                </div>
                                
                            </div>
                            <a href="/dailychan/product/event/list.action?firstSelect=이벤트&secondSelect=아침식사대용&categoryId=1">
                                <span>기획전 전체보기</span>
                            </a>
                        </span>
                    </li>
                </ul>
            </div>
            <script type="text/javascript">
                $(document).ready(function(){
                    // 메인 상단 슬라이드
                    $('#banner_new_area .bxslider').bxSlider({
                        auto: true,
                        speed: 500,
                        pause: 5000,
                        moveSlides:1,
                        pager:true,
                        controls:true,
                        touchEnabled: false
                    });
                    
                    $('#banner_plan_area .bxslider').bxSlider({
                        auto: true,
                        speed: 500,
                        pause: 5000,
                        moveSlides:1,
                        pager:true,
                        controls:true,
                        touchEnabled: false
                    });
                });
                
                $("#banner_new_area").hover( function () { 
                    $('#banner_new_area .bx-controls-direction').show();
                }, function () { 
                    $('#banner_new_area .bx-controls-direction').hide();
                } );
                
                $("#banner_plan_area").hover( function () { 
                    $('#banner_plan_area .bx-controls-direction').show();
                }, function () { 
                    $('#banner_plan_area .bx-controls-direction').hide();
                } );
            </script>
            <!-- //외식같은 집밥 영역 & 기획전 영역 -->  
            
            
            
            <!-- 베스트 영역 -->
			<!-- 내가 제일 잘나가! 영역 -->
			
			<script type="text/javascript">
			
			window.onload = function () {
				
				quickPage('1');
				goCategoryBestTab('1','');
				
			}
			
			var currentTabIdx = 1;
			var maxTabIdx = 10;
			function goCategoryBestTab(tabIdx) {
				currentTabIdx = tabIdx;

				$("#bestTotalSlideList > div").hide();
				$(".bestTabCon" + tabIdx).show();
				$(".bestCategoryTab li").removeClass("on");
				$(".bestTab" + tabIdx).addClass("on");
				
				var url="/dailychan/main/bestList.action";
				
				 $.post(url,{tabIdx:tabIdx},function (data){

					 $("#bestTotalSlideList").html(data);
					 
				 });	
				
			}
			</script>
			
				<div class="deal_area oh_hot_deal_area">
					<dl>
						<!-- 상단 텍스트 -->
						<dt>
							<span class="tit_area_main" style="padding-top:40px;">
								<img src="/dailychan/resources/images/main/h3_best_deal.png" alt="내가 제일 잘나가!" />
							</span>
							<div class="txt_area_main">
								<p class="txt_sub_main">
									<span>데일리찬에서 가장 많이 팔린 인기상품을 지금 만나보세요</span>
								</p>
							</div>
						</dt>
						<!-- //상단 텍스트 -->
						
						<!-- 카테고리 탭  -->
						<div class="bestCategoryTab">
	                    	<ul>
	                    		
	                        		<li class="bestTab1 on">
	                        			<a href="#" onclick="javascript:goCategoryBestTab(1);return false;">농산물</a>
	                        		</li>
	                        	
	                        		<li class="bestTab2 ">
	                        			<a href="#" onclick="javascript:goCategoryBestTab(2);return false;">축산물</a>
	                        		</li>
	                        	
	                        		<li class="bestTab3 ">
	                        			<a href="#" onclick="javascript:goCategoryBestTab(3);return false;">수산물</a>
	                        		</li>
	                        	
	                        		<li class="bestTab4 ">
	                        			<a href="#" onclick="javascript:goCategoryBestTab(4);return false;">양념류</a>
	                        		</li>
	                        	
	                        </ul>
	                        <div class="clear"></div>
	                    </div>
						<!--// 카테고리 탭  -->
	
						<!-- 하단 리스트 -->
						<dd id="bestTotalSlideList"></dd>
						<!-- //하단 리스트 -->
						
					</dl>
					
										<span class="btn_view_main2 mgT30">
                        
						<div class="hashtag">
							
							<div>
								<a href="/dailychan/product/article.action?product_id=260&firstSelect=전체상품&secondSelect=수산물&lastSelect=수산진미">
								#건강한 먹거리
								</a>
							</div>
							
							<div>
								<a href="/dailychan/product/article.action?product_id=36&firstSelect=전체상품&secondSelect=축산물&lastSelect=닭/오리/유정란">
								#행복한닭의알
								</a>
							</div>
							
							<div>
								<a href="/dailychan/product/article.action?product_id=208&firstSelect=전체상품&secondSelect=축산물&lastSelect=우유/치즈/요구르트">
								#제주푸른초원
								</a>
							</div>
							
						</div>
						<a class="only_top_border" href="/dailychan/product/best.action">
							<span>베스트 상품 전체보기</span>
						</a>
	                </span>
				</div>
			
			<!-- //내가 제일 잘나가! 영역 -->


            <!-- //베스트 영역 -->
            
            
			<!-- 고객 추천(현우) -->
            <div class="custRecommend_area">
	            <div class="deal_area oh_hot_deal_area">
	           		<span class="tit_area_main">
	           			<strong>데일리찬 상품추천</strong>
					</span>
					<div class="txt_area_main">
						<p class="txt_sub_main">
							<span>구매하신 상품중에 맛있었던 상품을 추천해주세요!</span>
						</p>
					</div>
				</div>		
                <div style="border:solid 1px #ddd">
                <dd> 
                    <div class="custRecommend_2">
                        
                        
                        <a href="#;" onclick="javascript:recommendPopUp();return false;">      
                        
                            <img src="/dailychan/resources/images/main/main_recommend_img.jpg?dummy=0.01" alt="고객상품추천">
                        </a>
                    </div>
                  <div class="custRecommend_1" id="custRecommendSlide" ><!-- 여기가 시작  -->
                            <!-- 테마쇼핑 영역 -->
                            
            <div class="custdeal_area">
                <dl>
                    <!-- 상단 텍스트 -->
                    
                    <!-- //상단 텍스트 -->

                    <!-- 하단 리스트 -->
                    <dd>
                        <ul>
                            
                                    
                                
                                <!-- 상품 1set -->
                                <c:forEach var="dto" items="${recommendLists }">
                                <li class="stopSell">
                                	<c:if test="${dto.product_lastSelect != null }">
                                    <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect }&secondSelect=${dto.product_secondSelect }&lastSelect=${dto.product_lastSelect}">
                                    </c:if>
                                    <c:if test="${dto.product_lastSelect == null }">
                                    <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect }&secondSelect=${dto.product_secondSelect }">
                                    </c:if>
                                    <c:if test="${dto.product_secondSelect == null }">
                                    <a href="/dailychan/product/article.action?product_id=${dto.product_id }&firstSelect=${dto.product_firstSelect }">
                                    </c:if>
                                    
                                        <!-- 상품리스트 / off -->
                                        <div class="product_off">
                                            <!-- img : 243 * 243 -->
                                            <div class="thumnail_area">
                                                <img src="/dailychan/resources/images/product/${dto.product_mainSaveFileName}" alt="상품이미지">
                                                <span class="bg_light_gray">&nbsp;</span>
                                            </div>
                                            <!-- txt : 상품명 -->
                                            <strong>
           
                                                    ${dto.product_subject }
                                                
                                            </strong>
                                            
                                            <!-- txt : 할인가 -->
                                            <div class="txt_discount_won">
                                                <span class="price_before">
                                                    <del><fmt:formatNumber value="${dto.product_price }" pattern="#,###" />원</del>
                                                </span>
                                                    &nbsp;&nbsp;
                                                <span class="price_after">
                                                    <strong><fmt:formatNumber value="${dto.product_resultPrice }" pattern="#,###" />원</strong>
                                                </span>
                                            </div>
                                        </div>
                                        <!-- //상품리스트 / off -->
    
                                        <!-- 상품리스트 / on -->
                                        <div class="product_on" style="display:none;">
                                            <!-- txt : 상품명 -->
                                            <div class="tit_product_name">
                                                <div>${dto.product_subject }</div>
                                            </div>
                                            <!-- txt : 할인률 -->
                                            <div class="txt_discount_per">
                                                ${dto.product_discount }%
                                            </div>
                                            <!-- txt : 할인가 -->
                                            <div class="txt_discount_won">
                                                <span class="price_before"><del><fmt:formatNumber value="${dto.product_price }" pattern="#,###" />원</del></span>
                                                    &nbsp;&nbsp;
                                                <span class="price_after"><strong><fmt:formatNumber value="${dto.product_discount }" pattern="#,###" />원</strong></span>
                                            </div>
    
                                            <!-- btn : 장바구니로 -->
                                            <div class="btn_cart">
                                                <a href="#" onclick="addCart(2822, 3397); return false;">
                                                    <img src="/dailychan/resources/images/main/btn_cart_add.png" alt="장바구니 담기" />
                                                </a>
                                                <a href="#" onclick="buyItNow(2822, 3397); return false;">
                                                    <img src="/dailychan/resources/images/main/btn_pay_now.png" alt="지금 결재하기" />
                                                </a>
                                            </div>
    
                                        </div>
                                        <!-- //상품리스트 / on -->
                                    </a>
                                </li>
                            	</c:forEach>
                            
                        </ul>
                    </dd>
                    <!-- //하단 리스트 -->
                </dl>
            </div>
        
<!-- //테마쇼핑 영역 -->
                    </div> <!-- 여기가 끝-->
                    <span class="btn_view_main2">
                            <div class="hashtag">
                            
                            <div>
                                <a href="/dailychan/product/article.action?product_id=253&firstSelect=전체상품&secondSelect=양념류&lastSelect=소금 식초 설탕 조청">
                                #세균걱정 NO!
                                </a>
                            </div>
                            
                            <div>
                                <a href="/dailychan/product/article.action?product_id=33&firstSelect=전체상품&secondSelect=농산물&lastSelect=과일">
                                #비타민 충전
                                </a>
                            </div>
                            
                            <div>
                                <a href="/dailychan/product/article.action?product_id=133&firstSelect=전체상품&secondSelect=축산물&lastSelect=소고기">
                                #기운없을때 
                                </a>
                            </div>
                            
                        </div>
                        <a class="only_top_border" href="/dailychan/product/event/list.action?firstSelect=이벤트&secondSelect=고객추천&categoryId=1">
                            <span>고객추천 상품 전체보기</span>
                        </a>
                    </span>
                </dd>
                </div>
            </div>
			<!-- //고객 추천 -->
			
			<!-- 인스타그램 영역 -->
			
			<div class="deal_area oh_hot_deal_area">
			   <span class="tit_area_main">
			                             <strong>데일리찬 인스타그램</strong>
			                                              
			</span>
			    <div class="txt_area_main">
			                           
                <p class="txt_sub_main">
                    <span>데일리찬 소식을 Instagram에서 확인 할 수 있습니다!</span>
                </p>
            </div>
            
            <br/>
			
			<div id="instaPics"></div>  

            </div>
            
            <!-- //인스타그램 영역 -->
			
			
			
           <!-- 산지직송 영역 -->
             
			<div class="deal_area oh_hot_deal_area">
			   <span class="tit_area_main">
			       <strong>데일리찬 산지직송</strong>
			                                              
			    </span>
			    <div class="txt_area_main">
                           
                <p class="txt_sub_main">
                    <span>데일리찬의 신선한 제품을 직접 받아보세요!</span>
                </p>
            </div> 
            
            <br/>
            
            <!-- //산지직송 슬라이드 영역 -->
            <div class="direct_area">
                <div class="contents">
            <div id="coverflow" style="display: block;" class="flipster flipster--transform flipster--coverflow flipster--click flipster--active" tabindex="0">             
   
  <script src="/dailychan/resources/dist/js/swiper.js"></script>

    <!-- Swiper JS -->
    <script src="/dailychan/resources/dist/js/swiper.min.js"></script>
  
   <!-- Swiper -->
  <div class="swiper-container" style="">
    <div class="swiper-wrapper">
      <div class="swiper-slide" style="background-image:url('/dailychan/resources/images/main/img_cover_2_2.jpg'); background-size:600px 600px; height: 500px; width: 600px;"></div>
      <div class="swiper-slide" style="background-image:url('/dailychan/resources/images/main/img_cover_2_4.jpg'); background-size:600px 600px; height: 500px; width: 600px;"></div>
      <div class="swiper-slide" style="background-image:url('/dailychan/resources/images/main/img_cover_2_5.jpg'); background-size:600px 600px; height: 500px; width: 600px;"></div>
      <div class="swiper-slide" style="background-image:url('/dailychan/resources/images/main/img_cover_2_6.jpg'); background-size:600px 600px; height: 500px; width: 600px;"></div>
      <div class="swiper-slide" style="background-image:url('/dailychan/resources/images/main/img_cover_2_7.jpg'); background-size:600px 600px; height: 500px; width: 600px;"></div>

    </div>
    <!-- Add Pagination -->
   <div class="swiper-pagination">

   </div>
   
   <script>
    var swiper = new Swiper('.swiper-container', {
      effect: 'coverflow',
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: 'auto',
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows : true,
      },
      pagination: {
        el: '.swiper-pagination',
      },
    });
  </script>
  </div>
  
                    </div>
                            
               
                    </div>
                    <!-- title -->
                    
                    
                    <span class="tit_area_direct">
                        <img src="/dailychan/resources/images/main/h3_direct_deal.png" alt="데일리찬 산지직송" />
                    </span>
                    <span class="txt_area_direct" style="position:absolute; top:200px; left:0;">
                        <img src="/dailychan/resources/images/main/tit_cover_2_7.png" alt="" class="tit_img" />
                    </span>
              
                </div>
             
            
            <!-- 산지직송 더보기 추가 -->
            <div class="more_area">
                <div class="more_area2">
                <span class="btn_view_main2">
                    <div class="hashtag">
                            <div>
                                <a href="/product/detail/2691-3138">
                                #밥도둑
                                </a>
                            </div>
                            <div>
                                <a href="/product/detail/1629-1453">
                                #입맛없을때
                                </a>
                            </div>
                        </div>
                        <a class="only_top_border" href="/dailychan/product/origin/list.action?firstSelect=산지직송">
                            <span>산지직송 전체보기</span>
                        </a>
                  </span>
                  </div>
             </div>  
            <!-- //산지직송 더보기 추가 -->
         
            
            

 
            

			<!-- recipe 영역 -->
   <!-- recipe 영역 -->
<div class="deal_area oh_hot_deal_area">
   <span class="tit_area_main">
                              <img src="/dailychan/resources/images/main/recipe_title.png" style="text-align: center;">
                                              
</span>
    <div class="txt_area_main">
                           
                            <p class="txt_sub_main">
                                <span>데일리찬의 신선한 제품들로 직접 요리해보세요!</span>
                            </p>
                        </div>
          
			
            <div class="cook_book">
                <div class="cook_book_area">
                    <div class="title_area"></div>
                    <div class="cook_large_area" style="margin-top: 50px;">
                    <a href="/dailychan/recipe/recipedetail.action?recipe_id=${mainFirstRecipe.recipe_id }&categoryId=0">   
                        <img src="/dailychan/resources/images/recipe/${mainFirstRecipe.recipe_mainSaveFileName }">
                        <div class="cook_menu_area">
                            <li class="cook_title">${mainFirstRecipe.recipe_subject }</li>                            
                        </div>  
                    </a>    
                    </div>
                    <div class="cook_large_area_right" style="margin-top: 50px;">
                        <a href="/dailychan/recipe/recipedetail.action?recipe_id=${mainSecondRecipe.recipe_id }&categoryId=0">
	                        <img src="/dailychan/resources/images/recipe/${mainSecondRecipe.recipe_mainSaveFileName }">
	                        <div class="cook_menu_area">
	                            <li class="cook_title">${mainSecondRecipe.recipe_subject}</li>
	                            <!-- <li>
	                                <span style="padding-right: 10px;"><img src="/images/main/main_recipe_ico1.png" style="padding-right: 5px;">2-3인분</span>
	                                <span style="padding-right: 10px;"><img src="/images/main/main_recipe_ico2.png" style="padding-right: 5px;">30분이내</span> 
	                                <span> 난이도 &nbsp;<img src="/images/main/main_recipe_ico3_1.png" style="padding-right: 5px;"></span>
	                            </li> -->
	                        </div>
                        </a>
                    </div>
                </div>
            </div>

            <div class="more_area2">
                <span class="btn_view_main2">
                    <div class="hashtag">
                        </div>
                        <a class="only_top_border" href="/dailychan/recipe/list.action?categoryId=0">
                            <span>전체보기</span>                        
						</a>
                  </span>
                  </div>
             </div>  
			<!-- //recipe 영역 -->

            <!-- 레이어팝업 -->
            <div class="popup-wrapper" style="display:none;">
                
            </div>
            
        </div>
    </div>
    <!-- //컨텐츠 -->
    
   <!-- footer -->

	<div class="footerArea" >
		
			<!-- 공지사항 / 전화상담 -->
			<div class="mypage_footer_area">
				<div class="contents">
					<!-- 공지사항 -->
					<div class="mypage_list_1">
						<dl>
							<dt>
								<span>공지사항</span>
								<!-- btn : 더보기 -->
								<span class="btn_view_main">
									<a href="/dailychan/help/notice.action">더보기 &nbsp; &gt;</a>
								</span>
							</dt>
						<c:forEach var="dto" items="${noticeLists }">
							<dd>
								<a href="/dailychan/help/notice.action">
									<p>[공지] ${dto.notice_subject }</p>
									<span>${dto.notice_created }</span>
								</a>
							</dd>
						</c:forEach>	
							
						</dl>
					</div>
					<!-- //공지사항 -->
	
					<!-- 회원문의 -->
					<c:if test="${join_id eq 'admin' }">
					
						<div class="mypage_list_2">
							<!-- btn : 회원정보 -->
							<span class="btn_1">
								<a href="/dailychan/admin/info.action">회원정보</a>
							</span>
							<!-- btn : 1:1 상담문의 -->
							<span class="btn_2">
								<a href="/dailychan/admin/qnaList.action">1:1 상담문의</a>
							</span>
							<!-- btn : 취소/교환/반품 -->
							<span class="btn_3">
								<a href="/dailychan/admin/refund/permitRefund.action">환불서비스</a>
							</span>
							<!-- btn : 주문/결제 -->
							<span class="btn_4">
								<a href="/dailychan/madmin/orderList.action">주문/결제</a>
							</span>
						</div>
					
					</c:if>
					
					<c:if test="${join_id ne 'admin' }">
					
						<div class="mypage_list_2">
							<!-- btn : 회원정보 -->
							<span class="btn_1">
								<a href="/dailychan/myPage/info.action?check=0">회원정보</a>
							</span>
							<!-- btn : 1:1 상담문의 -->
							<span class="btn_2">
								<a href="/dailychan/myPage/qnaList.action">1:1 상담문의</a>
							</span>
							<!-- btn : 취소/교환/반품 -->
							<span class="btn_3">
								<a href="/dailychan/myPage/cancelList.action">취소/교환/반품</a>
							</span>
							<!-- btn : 주문/결제 -->
							<span class="btn_4">
								<a href="/dailychan/myPage/orderList.action">주문/결제</a>
							</span>
						</div>
					
					</c:if>
					
					<!-- 회원문의 -->
	
					<!-- 전화상담 -->
					<div class="mypage_list_3">
						<dl>
							<dt>
								고객센터
							</dt>
							<dd>
								<div class="txt_phone">
									1577-0098
								</div>
								<div class="txt_time">
									평일 09:30 ~ 18:30<br>
								    토요일 09:30 ~ 15:00<br>(일요일/공휴일 휴무)
								</div>
							</dd>
						</dl>
					</div>
					<!-- //전화상담 -->
				</div>
			</div>
			<!-- //공지사항 / 전화상담 -->
		
		<jsp:include page="footer.jsp" />
<form id="orderForm" action="/order/prepare/delivery" method="post" style="display: none;"></form>

<div id="isolationField" style="position: fixed; top: 0; bottom: 0; right: 0; left: 0; display: none; z-index: 999;"></div>
    <!-- // footer -->
    
<div class="popDim" style="display: none;"></div>
    
    <!-- lpopStyWrap (고객 추천 상품) -->

<div id="custRecommendDialog" class="oasisLayerPop" style="display: none;">
	<div class="oasisLayerPop_in">
		 <div class="oasisLPtit">
           	<strong class="comLayerTit">상품 추천하기</strong>
           </div>

		<div class="oasisLPconWrap">
			<!-- 이 안에 팝업 내용 넣기 -->
			<div class="comLayerCon">
				<div class="oasisLPcon1" style="text-align:left;">
					&nbsp;&nbsp;추천하신 상품이 채택될 경우 소정의 상품을 지급해드립니다.<br>
					&nbsp;&nbsp;많은 관심과 의견 바랍니다.
                </div>

				<div class="oasisLPcon2">
					<form id="contentForm" name="productRecommand" method="post">
						<table class="tableComWrite">
							<colgroup>
                                <col width="110">
                                <col width="45%">
                                <col width="100">
                                <col width="55%">
                            </colgroup>
							<tbody>
								<tr>
									<th>상품명</th>
									<td colspan="3">
									<select name="product_subject" id="product_subject">
										<option value="select">추천 하실 상품을 선택해 주십시오.</option>
										<c:forEach var="dto" items="${userRecommandLists }">
										<option value="${dto.product_subject }" id="${dto.product_id }">${dto.product_subject }</option>
										</c:forEach>
									</select>
									<input type="hidden" name="product_id" id="product_id" value="">
									</td>
								</tr>
								<tr>
									<th>추천 이유</th>
									<td colspan="3">
										<div class="cmTxtInput">
											<textarea name="productRecommand_reason" id="productRecommand_reason" class="cmMtinput" placeholder="추천 이유를 입력해 주세요." style="height:240px !important"></textarea>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			
			<div class="oasisLPcon3 mgT25">
                 <a href="#" onclick="sendProductRecommand(); return false;">추천하기</a>
                 <a href="#" onclick="closeProductRecommendForm(); return false;" class="oasisMapClose2">취소하기</a>
            </div>
			<!-- //이 안에 팝업 내용 넣기 -->
		</div>
		<div class="comWriteClose">
            <a href="#" onclick="closeProductRecommendForm(); return false;"><span>닫기</span></a>
        </div>
	</div>
</div>

<!-- //oasisLayerPop (고객 추천 상품) -->
    
    
</div>
</div>

</body>
</html>
