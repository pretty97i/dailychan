<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String join_id = (String)session.getAttribute("join_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/commons.css" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css" />

<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />

<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<title>데일리찬</title>
</head>
<body>

<script type="text/javascript" charset="utf-8" src="/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/js/oasis_common.js?dummy=5.04"></script>

</head>

	<script type="text/javascript">
		function setKeyword(keyword) {
	        $("#keyword").val(keyword);
	        searchProduct('keyword');
	    }
	
		function jsFixedLayerHide() { 
			$('.fixedLayer').hide();
		};
        
        /* function addCookie(keyword) {
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
         */
        
	</script>
	<!-- header -->
	<div id="header">

		<!-- 상단 헤더 영역 -->
		<div class="header_area">
			<div class="contents">
	
				<!-- 마이페이지 -->
				<div class="mypage_list">
					
					<c:if test="${join_id eq null }">
					<ul>
						
						<li><a href="/dailychan/join/login.action">로그인</a></li>
						<li><a href="/dailychan/join/list.action" onclick="fbq('track', 'Join');">회원가입</a></li>
						
						<li><a href="/dailychan/review/bestReviewList.action">베스트 후기</a></li>
						<li><a href="/dailychan/myPage/orderList.action">주문/배송조회</a></li>
						<li class="end">
							<a href="/dailychan/cart/list.action">장바구니
								
							</a>
						</li>
					</ul>
					</c:if>
					
					<c:if test="${join_id ne null }">
					<ul>
						
						<li><a href="/dailychan/join/logout.action">로그아웃</a></li>
						
						<li><a href="/dailychan/review/bestReviewList.action">베스트 후기</a></li>
						<c:if test="${join_id eq 'admin' }">
							<li class="end"><a href="/dailychan/admin/orderList.action">주문/배송관리</a></li>
						</c:if>
						<c:if test="${join_id ne 'admin' }">
							<li><a href="/dailychan/myPage/orderList.action">주문/배송조회</a></li>
							<li class="end">
								<a href="/dailychan/cart/list.action">장바구니							
									(<span id="sessionCartCnt" style="color:inherit;">${cartCount }</span>)
								</a>
							</li>
						</c:if>
					</ul>

					</c:if>
	
				</div>

			<div class="mypage_list_left">
					<ul>
						<c:if test="${join_id ne 'admin' || join_id eq null}">
							<li><a href="/dailychan/myPage/main.action">마이페이지</a></li>
						</c:if>
						<c:if test="${join_id eq 'admin' }">
							<li><a href="/dailychan/admin/main.action">관리자페이지</a></li>
						</c:if>
						<li><a href="/dailychan/help/helpmain.action">고객센터</a></li>
						
						
						<li class="end">
						
						<c:if test="${join_id eq null }">
							<a href="/dailychan/join/login.action">
						</c:if>
						<c:if test="${join_id ne null }">
							<a href="/dailychan/help/qnaregister.action">
						</c:if>
						1:1 상담</a>
						
						</li>
                 		
					 </ul>
				</div>
				<!-- btn : h1 logo -->
				<div class="h1_logo">
					<a href="/dailychan/main.action">
						<img src="/dailychan/resources/images/common/h1_logo.png" alt="OASiS" style=""/>
					</a>
				</div>
			<form action="/dailychan/searchPage.action" method="post">
			
				<!-- input : 검색창 / 기존 코드 -->
				<div class="searchBox">
					<input type="text" placeholder="바른먹거리를 찾으세요?" id="keyword" value="" name="keyword"/> 
					<a href="#" onclick="searchProduct('keyword'); return false;">
						<img src="/dailychan/resources/images/common/gnbSearch.png" alt="검색" />
					</a>
				</div>
			</form>	
				<!--최근, 추천검색어-->
		        <div class="scWordListWrap" id="scWordListWrap" style="display:none">
		            <div class="scWordList1">
		                <ul id="keywordHistoryContent" style="padding:10px 10px 10px 15px"></ul>
		            </div>
		        </div>
		        <!--최근, 추천검색어-->
				
				<!-- btn : 전단행사, 산지직송 -->
				<div class="theme_shop_list">
					
					
				</div>
			</div>
		</div>
		<!-- 상단 헤더 영역 -->
	
		<!-- gnb 영역 -->
		

<script type="text/javascript">
    $(document).ready(function() {
    	
        $('#gnbArea .gnb_first').on('mouseenter', function() {
            $('#gnbArea .depth_2').show();
            $('.event_depth').hide();
            $('.ctrList5').removeClass('on');
        })
     
        $('#gnbArea .gnb_list').on('mouseleave', function() {
            $('#gnbArea .depth_2').hide();
            $('.event_depth').hide();
        })
     
        $('#gnbArea .gnb_cate').on('mouseenter', function() {
            if (!$('.gnb_first').is(':hover')) {
                $('#gnbArea .depth_2').hide();
            }
         
            if (!$('.gnb_event').is(':hover')) {
                $('.event_depth').hide();
                $('.ctrList5').removeClass('on');
            }
        })
     
        /* 이벤트 */    
        $('div.event_depth').on('mouseleave', function() {
            if (!$('#gnbArea .gnb_list').is(':hover')) {
                $('.event_depth').hide();
                $('.ctrList5').removeClass('on');
            } 
        })
     
        $('#gnbArea .gnb_event').on('mouseenter', function() {
            $('.event_depth').show();
            $('.ctrList5').addClass('on');
        })
        /*.on('mouseleave', function() {              
            if ($('#gnbArea .gnb_first').is(':hover') || ) {
            if (!$('#gnbArea').is(':hover') && !$('.event_depth').is(':hover')) {
            	$('.event_depth').hide();
                $('.ctrList5').removeClass('on');
            }
                
            } 
        })*/
    });
</script>

<div class="gnb_area" id="gnbArea">
    <div class="contents">
        <div class="gnb_list">
            <ul class="depth_1">
                <li class="gnb_first"><span class="first"><a href="" class="ctrList0"></a></span></li>
        		<li class="gnb_cate gnb_event">
                    <span><a class="ctrList5" href="/dailychan/event/eventMain.action"></a></span>
                </li>
                <li class="gnb_cate"><span><a class="ctrList3 " href="/dailychan/product/origin/list.action?firstSelect=산지직송"></a></span></li>
                <li class="gnb_cate" ><span><a class="ctrList6 " href="/dailychan/recipe/list.action?categoryId=0" ></a></span></li>
                <li class="gnb_cate"><span><a class="ctrList4 " href="/dailychan/product/origin/list.action?firstSelect=오!감동"></a></span></li>    

                <li class="gnb_cate"><span><a class="ctrList2 " href="/dailychan/product/best.action"></a></span></li>
            </ul>
            <div class="depth_2">					   
         
                    <ul>                           
                        <li>
	                        <!-- 선택된 경우 : gnb_on -->
	                        
	                        <span class="first">
	                            <a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=농산물&categoryId=0">
	                                농산물 
	                            </a>
	                        </span>
     
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=농산물&lastSelect=주곡/잡곡&categoryId=1">주곡/잡곡</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=농산물&lastSelect=과일&categoryId=1">과일</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=농산물&lastSelect=채소류&categoryId=1">채소류</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=농산물&lastSelect=버섯/건나물류&categoryId=1">버섯/건나물류</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=농산물&lastSelect=간편샐러드/가루류&categoryId=1">간편샐러드/가루류</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=농산물&lastSelect=견과/병조림&categoryId=1">견과/병조림</a></li>

                        </li>
                    </ul>                           
       
                    <ul>                           
                        <li>
	                        <!-- 선택된 경우 : gnb_on -->
	  
	                        <span class="first">
	                            <a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=축산물&categoryId=0">
	                                축산물 
	                            </a>
	                        </span>

	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=축산물&lastSelect=닭/오리/유정란&categoryId=1">닭/오리/유정란</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=축산물&lastSelect=소고기&categoryId=1">소고기</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=축산물&lastSelect=돼지고기&categoryId=1">돼지고기</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=축산물&lastSelect=우유/치즈/요구르트&categoryId=1">우유/치즈/요구르트</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=축산물&lastSelect=육가공품&categoryId=1">육가공품</a></li>

                        </li>
                    </ul>                           
                    
                    <ul>                           
                        <li>
	                        <!-- 선택된 경우 : gnb_on -->
	                        
	                        <span class="first">
	                            <a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=수산물&categoryId=0">
	                                수산물 
	                            </a>
	                        </span>

	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=수산물&lastSelect=수산진미&categoryId=1">수산진미</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=수산물&lastSelect=젓갈류&categoryId=1">젓갈류</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=수산물&lastSelect=생선/조개류&categoryId=1">생선/조개류</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=수산물&lastSelect=김/해조류&categoryId=1">김/해조류</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=수산물&lastSelect=건어물&categoryId=1">건어물</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=수산물&lastSelect=수산가공&categoryId=1">수산가공</a></li>

                        </li>
                    </ul>                           

                    <ul>                           
                        <li>
	                        <!-- 선택된 경우 : gnb_on -->
    
	                        <span class="first">
	                            <a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=양념류&categoryId=0">
	                                양념류 
	                            </a>
	                        </span>

	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=양념류&lastSelect=참기름/오일류&categoryId=1">참기름/오일류</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=양념류&lastSelect=참깨/양념가루&categoryId=1">참깨/양념가루</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=양념류&lastSelect=된장/고추장/장류&categoryId=1">된장/고추장/장류</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=양념류&lastSelect=천연조미장류/소스류&categoryId=1">천연조미장류/소스류</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=양념류&lastSelect=소금/식초/설탕/조청&categoryId=1">소금/식초/설탕/조청</a></li>
	                            
	                                <li><a href="/dailychan/product/list.action?firstSelect=전체상품&secondSelect=양념류&lastSelect=부침/튀김/곡식가루&categoryId=1">부침/튀김/곡식가루</a></li>

                        </li>
                    </ul>

            </div>

            <div class="event_depth">
                <ul>
                    <li><span><a href="/dailychan/event/eventMain.action">구매후기 이벤트</a></span></li>
                    <li><span><a href="/dailychan/product/event/list.action?firstSelect=이벤트&secondSelect=외식 같은 집밥&categoryId=1">외식 같은 집밥</a></span></li>
                    <li><span><a href="/dailychan/product/event/list.action?firstSelect=이벤트&secondSelect=환절기 건강식품&categoryId=1">환절기 건강식품</a></span></li> 
                    <li><span><a href="/dailychan/product/event/list.action?firstSelect=이벤트&secondSelect=간편선물세트&categoryId=1">간편선물세트</a></span></li>
                    <li><span><a href="/dailychan/product/event/list.action?firstSelect=이벤트&secondSelect=아침식사대용&categoryId=1">아침식사대용</a></span></li>
                    <li><span><a href="/dailychan/product/event/list.action?firstSelect=이벤트&secondSelect=우리아이안심&categoryId=1">우리아이 안심</a></span></li>
                    <li><span><a href="/dailychan/product/event/list.action?firstSelect=이벤트&secondSelect=고객추천&categoryId=1">고객추천</a></span></li>
                    <div class="clear"></div>
                 </ul>
            </div>
        </div>
    </div>
</div>

		<!-- //gnb 영역 -->
		
		<!-- 상품검색 form -->
		<form id="productSearchForm" method="get" action="/dailychan/searchPage.action">
			<input type="hidden" name="keyword"	value="" />
			<input type="hidden" name="pageNum"		value="1" />

		</form>
		<!--// 상품검색 form -->
		
		<!-- 상품 카테고리 form -->
		<form id="productListForm" method="post" action="/product/list">
			<input type="hidden" name="categoryId"	value="" />
			<input type="hidden" name="page"		value="" />
			<input type="hidden" name="sort"		value="" />
			<input type="hidden" name="direction"	value="" />
			<input type="hidden" name="rows" />
		</form>
		<!--// 상품 카테고리 form -->	

		<script	type="text/javascript">
			$("#quickSlide").css("visibility", "visible");
			function removeCookie(name){
				var todayDate = new Date();
			    todayDate.setDate( todayDate.getDate() - 1 );
			    document.cookie = name + "=" + escape( '' ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
			}
		
			totalCnt = 3;
			totalPage = 1;
			
			detailUrl = "/product/detail/";
			imgUrl = "http://www.oasis.co.kr:8580";
	
			cookieArray.push('3432-5135|/product/3432/thumb/thumb_34323e876d25-afd6-4252-afb5-2e8aa2e38836.jpg%7C%uC720%uAE30%uB18D%20%uC6D4%uD5A5%uBBF8%20%uACE8%uB4E0%uD0383%uD638%20%285kg%29%7C32000%7C25600');
			cookieArray.push('1634-1458|/product/1634/thumb/thumb_16340fe7b8ae-219b-49d9-9bad-59dc128959e1.jpg%7C%uC720%uAE30%uB18D%20%uCC30%uBCF4%uB9AC%20%282kg%29%7C11500%7C9200');
			cookieArray.push('3539-5694|/product/3539/thumb/thumb_3539473d6820-799d-418a-84fa-180cb2e94a32.jpg%7C%uC601%uC591%uC7A1%uACE1%20%uD63C%uD5699%uACE1%20%28500g%29%7C6500%7C5200');
			quickMenuContentSetting(1);

	 	</script>


	</div>

<form id="orderForm" action="/order/prepare/delivery" method="post" style="display: none;"></form>

</body>
</html>