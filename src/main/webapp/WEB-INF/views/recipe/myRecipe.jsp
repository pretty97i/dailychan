<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데일리찬</title>
<jsp:include page="../top.jsp"/>

<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css">
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css">
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css">
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

/* var baseUrl = window.location.protocol+"//"+window.location.host;
var kakaoApiKey = "dfbf5a4b6da726da4f8a82df7be6d6e9";

Kakao.init(kakaoApiKey);

function sendLink() {
    Kakao.Link.sendScrap({
           requestUrl:  baseUrl + contextPath + '/company/story/recipeDetail/BRD3/408',
           fail: function (res) {
                 console.log(res)
               }
         });
}

function searchCategory() {
	
}

function addCartRecipeProducts() {
    var selectedProductKeies = [];
    
    $(".recipe_products").each(function() {
        selectedProductKeies.push($(this).data("product_key"));
    });
    addCarts(selectedProductKeies);
} */
function setRecipeWishlist(contentNo, btnObj) {
    if($(btnObj).hasClass('receipe_view_on')) {
        //Off
        deleteRecipeWishlist(contentNo, function(response) {
            $(btnObj).removeClass('receipe_view_on');
            $(btnObj).addClass('receipe_view_off');
            $("#wishCount").html(response.data);
        });
    }
    else {
        //On
        addRecipeWishlist(contentNo, function(response) {
            $(btnObj).removeClass('receipe_view_off');
            $(btnObj).addClass('receipe_view_on');
            $("#wishCount").html(response.data);
        });
    }
}

function myrecipe(recipe_id) {
	
	var join_id = "${join_id}";
	var url = "/dailychan/recipe/deletemyrecipe.action";
	
	if(join_id==""){
		
		alert("로그인 후 이용가능한 기능입니다.");
		location.href = "/dailychan/join/login.action";
		
	}else{
		
		$.post(url,{recipe_id:recipe_id,join_id:join_id},function(data){});
		alert("마이레시피 삭제완료!");
		location.reload(true);
		
			
			
	}
	
	
}

</script>
</head>
<body>
<div class="allWrap">
    

    
    <!-- 컨텐츠 -->
    <div class="contentsArea" id="sec_cs_common">
        <div class="contentsWrap">
            
            <!-- 오른쪽 영역 -->
            <div class="content">
                <!-- 내용 입니다 -->
                
                <h3 class="pListTit">맛있는 요리/간편한 주문</h3>
                
                <!-- 오아시스 산지소식 서브카피 -->
                <h3 class="pListSubTit">데일리찬 제품으로 즐길 수 있는 레시피</h3>
                <!-- 오아시스 산지소식 서브카피 -->
                
                <!-- 검색영역 -->
                <div class="notice_search_area" style="border-top:none;padding-top: 20px;">
                    <ul class="recipe_tab" style="font-size: 16px; font-weight: bold; padding: 5px;">
                       <li style="border-right: solid 1px #ddd">
                            <a href="/dailychan/recipe/list.action?categoryId=0">요리별 레시피</a>
                        </li>
                      	<c:if test="${join_id eq null }">
                      		<li>
								<a href="/dailychan/join/login.action">나의 관심 레시피</a>
							</li>
						</c:if>
						<c:if test="${join_id ne null }">
                            <li class="on">
                               <a href="/dailychan/recipe/myrecipe.action?categoryId=0&join_id=${join_id }">나의 관심 레시피</a>
                            </li>
                        </c:if>
                        
                    </ul>
                    <form action="/dailychan/recipe/list.action" method="post">
                    	<input type="text" id="contentKeyword" name="searchValue">
                    	<a href="#" onclick=""><span>검색</span></a>
                    
                    </form>
                </div>
                
                <div class="prodListTop" style="height:30px">
                        
                    
                    </div>
                <!-- //검색영역 -->
                
                <script type="text/javascript">
                
                $(document).ready(function(){
                	
                /* 	$('ul.category_list li').click(function(){
                		
                		var tab_id = $(this).attr('data-tab');
                		
                		$('.category_list li').removeClass('menuon')
                		
                		$(this).addClass('menuon')
                		$("#"+tab_id).addClass('menuon');
                	}); */
                	
                	$('ul.category_list li').click(function(){
                		$('ul.category_list li').removeClass()
                			$(this).removeClass('menuon')
                			$(this).addClass('menuon')
                		
                		
                	})

                });
                </script>
    		<form action="" method="post">            
               <div id="recipe_category">
                    <ul class="category_list">
                    
                    
                    <c:if test="${categoryId eq '0'}">
                        	<li class="menuon">
                          		  <a href="/dailychan/recipe/myrecipe.action?categoryId=0&join_id=${join_id}" class="ico-menu1on">전체보기</a>
                       		 </li>
                     </c:if>    
                     
                      <c:if test="${categoryId ne '0'}">
                        	<li class="">
                          		  <a href="/dailychan/recipe/myrecipe.action?categoryId=0&join_id=${join_id}" class="ico-menu1">전체보기</a>
                       		 </li>
                     </c:if>    
                     <c:if test="${categoryId eq '1' }">
                            <li class="menuon" >
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=1&join_id=${join_id}&recipe_select=국/찌개/전골" class="ico-menu2on">국/찌개/전골</a>
                            </li>
                       </c:if> 
                        <c:if test="${categoryId ne '1' }">
                            <li class="" >
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=1&join_id=${join_id}&recipe_select=국/찌개/전골" class="ico-menu2">국/찌개/전골</a>
                            </li>
                       </c:if> 
                       
                       <c:if test="${categoryId eq '2' }">
                       
                            <li class="menuon">
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=2&join_id=${join_id}&recipe_select=밥/죽" class="ico-menu3on">밥/죽</a>
                            </li>
                         </c:if>
                         
                            <c:if test="${categoryId ne '2' }">
                       
                            <li class="">
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=2&join_id=${join_id}&recipe_select=밥/죽" class="ico-menu3">밥/죽</a>
                            </li>
                         </c:if>
                         
                         <c:if test="${categoryId eq '3' }">
                            <li class="menuon">
                               <a href="/dailychan/recipe/myrecipe.action?categoryId=3&join_id=${join_id}&recipe_select=반찬/김치" class="ico-menu4on">반찬/김치</a>
                            </li>
                         </c:if>
                         <c:if test="${categoryId ne '3' }">
                            <li class="">
                               <a href="/dailychan/recipe/myrecipe.action?categoryId=3&join_id=${join_id}&recipe_select=반찬/김치" class="ico-menu4">반찬/김치</a>
                            </li>
                         </c:if>
                         
                         <c:if test="${categoryId eq '4' }">
                            <li class="menuon" >
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=4&join_id=${join_id}&recipe_select=일품요리" class="ico-menu5on">일품요리</a>
                            </li>
                         </c:if>
                         
                          <c:if test="${categoryId ne '4' }">
                            <li class="" >
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=4&join_id=${join_id}&recipe_select=일품요리" class="ico-menu5">일품요리</a>
                            </li>
                         </c:if>
                         
                         <c:if test="${categoryId eq '5' }">
                            <li class="menuon" >
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=5&join_id=${join_id}&recipe_select=간단요리" class="ico-menu6on">간단요리</a>
                            </li>
                         </c:if>
                         
                         <c:if test="${categoryId ne '5' }">
                            <li class="" >
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=5&join_id=${join_id}&recipe_select=간단요리" class="ico-menu6">간단요리</a>
                            </li>
                         </c:if>
                         
                         <c:if test="${categoryId eq '6' }">
                            <li class="menuon" >
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=6&join_id=${join_id}&recipe_select=면류/파스타" class="ico-menu7on">면류/파스타</a>
                            </li>
                         </c:if>
                         
                          <c:if test="${categoryId ne '6' }">
                            <li class="" >
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=6&join_id=${join_id}&recipe_select=면류/파스타" class="ico-menu7">면류/파스타</a>
                            </li>
                         </c:if>
                         
                         
                          <c:if test="${categoryId eq '7' }">
                            <li class="menuon">
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=7&join_id=${join_id}&recipe_select=간식/음료" class="ico-menu8on">간식/음료</a>
                            </li>
                         </c:if>
                         
                           <c:if test="${categoryId ne '7' }">
                            <li class="">
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=7&join_id=${join_id}&recipe_select=간식/음료" class="ico-menu8">간식/음료</a>
                            </li>
                         </c:if>
                         
                          <c:if test="${categoryId eq '8' }">
                            <li class="menuon">
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=8&join_id=${join_id}&recipe_select=베이킹" class="ico-menu9on">베이킹</a>
                            </li>
                        	</c:if>
                        	
                        	 <c:if test="${categoryId ne '8' }">
                            <li class="" >
                                <a href="/dailychan/recipe/myrecipe.action?categoryId=8&join_id=${join_id}&recipe_select=베이킹" class="ico-menu9">베이킹</a>
                            </li>
                        	</c:if>
                     </ul>
                </div>
                
           </form>
                <div style="clear:both"></div>
                <div class="notice_list_area">
                    
                    <!-- 상품리스트 -->
                    <div class="prodListWrap mgT20 newProdList">
                        <ul class="prodList2">
                        <c:choose>
                        
                        
							<c:when test="${categoryId eq null}"> 
                                <c:forEach var="dto" items="${lists }">
		                          <!-- 상품 1set -->
		                          <li class="" style="height:auto">
		                              <!-- 상품 1set -->
		                              <div class="prodWrap3">
		                                  <div class="thum">
		                                      
		                                      <a href="#;" onclick="myrecipe('${dto.recipe_id}')"  class="receipe_on">찜</a>
		                                      
		                                      
		                                      <a href="/dailychan/recipe/recipedetail.action?recipe_id=${dto.recipe_id}&categoryId=${categoryId}">
                                                <img src="/dailychan/resources/images/recipe/${dto.recipe_mainSaveFileName }" alt="섬네일" />
		                                      </a>
		                                  </div>
		                                  <a href="#" class="prodName" style="padding:0">${dto.recipe_subject } </a>
		                                  <div class="info1" style="padding-bottom:15px"><!--2018-10-04--></div>
		                              </div>
		                              <!-- //상품 1set -->
		                         </li>
		                       </c:forEach>   
		             		 </c:when>

							<c:when test="${categoryId eq '0'}"> 
                                <c:forEach var="dto" items="${lists }">
		                          <!-- 상품 1set -->
		                          <li class="" style="height:auto">
		                              <!-- 상품 1set -->
		                              <div class="prodWrap3">
		                                  <div class="thum">
		                                      
		                                      <a href="#;" onclick="myrecipe('${dto.recipe_id}')"  class="receipe_on">찜</a>
		                                      <a href="/dailychan/recipe/recipedetail.action?recipe_id=${dto.recipe_id}&categoryId=${categoryId}">
                                                <img src="/dailychan/resources/images/recipe/${dto.recipe_mainSaveFileName }" alt="섬네일" />
		                                      </a>
		                                  </div>
		                                  <a href="#" class="prodName" style="padding:0">${dto.recipe_subject } </a>
		                                  <div class="info1" style="padding-bottom:15px"><!--2018-10-04--></div>
		                              </div>
		                              <!-- //상품 1set -->
		                         </li>
		                       </c:forEach>   
		             		 </c:when>
		    		
		    		<c:otherwise> 
		    		       <c:forEach var="dto" items="${lists }">
		                          <!-- 상품 1set -->
		                          <li class="" style="height:auto">
		                              <!-- 상품 1set -->
		                              <div class="prodWrap3">
		                                  <div class="thum">
		                                      
		                                      <a href="#;" onclick="myrecipe('${dto.recipe_id}')"  class="receipe_on">찜</a>
		                                      <a href="/dailychan/recipe/recipedetail.action?recipe_id=${dto.recipe_id}&categoryId=${categoryId}&pageNum=${pageNum}">
                                                <img src="/dailychan/resources/images/recipe/${dto.recipe_mainSaveFileName }" alt="섬네일" />
		                                      </a>
		                                  </div>
		                                  <a href="#" class="prodName" style="padding:0">${dto.recipe_subject } </a>
		                                  <div class="info1" style="padding-bottom:15px"><!--2018-10-04--></div>
		                              </div>
		                              <!-- //상품 1set -->
		                         </li>
		                      
		                       </c:forEach>   
                        </c:otherwise>  
                   </c:choose>     
                        
                        
                        
                     </ul>
                  </div>
                  <!-- //상품리스트 -->
                    
                    <form id="contentSearchForm">
                        <input type="hidden" name="searchValue"  value="searchValue" />
                        <input type="hidden" name="keyword" value="" />
                        <input type="hidden" name="productId" value="" /> 
                        <input type="hidden" name="isMyRecipe" value="N" />
                        <input type="hidden" name="categoryNo" value="25" />
                        <input type="hidden" name="sort" value="regDate" />
                        <input type="hidden" name="recipeDirection" value="asc" />
                        <input type="hidden" name="isVideoRecipe" value="N" />                              
                    </form>
                </div>
                <!-- //내용 입니다 -->
                
                    <!--페이징-->
                 <div class="pagingWrap">
                    
               		 <c:if test="${dataCount!=0 }">
						${pageIndexList }
					</c:if>
					
					<c:if test="${dataCount==0 }">
						등록된게시물이 없습니다.
					</c:if>
				
				  </div>
                <!--//페이징-->
            </div>
            <!-- //오른쪽 영역 -->
        </div>
    </div>
    <!-- //컨텐츠 -->
    </div>
   
</body>
</html>