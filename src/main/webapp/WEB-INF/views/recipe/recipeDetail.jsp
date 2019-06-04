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
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script><script charset="UTF-8" type="text/javascript" src="https://t1.daumcdn.net/postcode/api/core/190416/1555410100831/190416.js"></script>


<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js?dummy=5.05"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=5.12"></script>
   <script type="text/javascript">
        var baseUrl = window.location.protocol+"//"+window.location.host;
        var kakaoApiKey = "dfbf5a4b6da726da4f8a82df7be6d6e9";
        
        Kakao.init(kakaoApiKey);
        
        function sendLink() {
            Kakao.Link.sendScrap({
                   requestUrl:  baseUrl + contextPath + '/company/story/recipeDetail/BRD3/406',
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
        }
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

      /*   $(function(){ 

            $("recipe_counter a.receipe_view_off").click(function () {
              $(this).toggleClass("recipe_counter a.receipe_view_on");

            });

        });
 */

        function myrecipe(recipe_id,recipe_select) {

        	var join_id = "${join_id}";
        	var url = "/dailychan/recipe/insertmyrecipe.action";
        	var dama=document.getElementById('')
        	
        	if(join_id==""){
        		
        		alert("로그인 후 이용가능한 기능입니다.");
        		location.href = "/dailychan/join/login.action";
        		
        	}else{

        		$.post(url,{recipe_id:recipe_id,recipe_select:recipe_select},function(data){});
        		alert("마이레시피 추가완료!");
        		location.reload();
        	}
        	
        	
        	
        }
        

 function copyUrlToClipboard() {
	    try {
	        var $temp = $("<input>");
	        $("body").append($temp);
	        $temp.val(document.location.href).select();
	        document.execCommand("copy");
	        $temp.remove();
	        alert("URL이 복사 되었습니다.");
	    } catch (err) {
	        alert('이 브라우저는 지원하지 않습니다.');
	    }
	}
      
    </script>
</head>
<body>

<div class="allWrap">
    <!-- 헤더 -->
    
<div id="header">

		<!-- 상단 헤더 영역 -->
		<div class="header_area">
			<div class="contents">
	
		  <div class="contentsArea" id="sec_notice_view">
        <div class="contentsWrap">
                
<div class="notice_view_area">
                            
               <div id="recipe_category">
                    <ul class="category_list">
                    
                    
                    <c:if test="${categoryId eq '0'}">
                        	<li class="menuon">
                          		  <a href="/dailychan/recipe/list.action?categoryId=0" class="ico-menu1on">전체보기</a>
                       		 </li>
                     </c:if>    
                     
                      <c:if test="${categoryId ne '0'}">
                        	<li class="">
                          		  <a href="/dailychan/recipe/list.action?categoryId=0" class="ico-menu1">전체보기</a>
                       		 </li>
                     </c:if>    
                     <c:if test="${categoryId eq '1' }">
                            <li class="menuon" >
                                <a href="/dailychan/recipe/list.action?recipe_select=국/찌개/전골&categoryId=1" class="ico-menu2on">국/찌개/전골</a>
                            </li>
                       </c:if> 
                        <c:if test="${categoryId ne '1' }">
                            <li class="" >
                                <a href="/dailychan/recipe/list.action?recipe_select=국/찌개/전골&categoryId=1" class="ico-menu2">국/찌개/전골</a>
                            </li>
                       </c:if> 
                       
                       <c:if test="${categoryId eq '2' }">
                       
                            <li class="menuon">
                                <a href="/dailychan/recipe/list.action?recipe_select=밥/죽&categoryId=2" class="ico-menu3on">밥/죽</a>
                            </li>
                         </c:if>
                         
                            <c:if test="${categoryId ne '2' }">
                       
                            <li class="">
                                <a href="/dailychan/recipe/list.action?recipe_select=밥/죽&categoryId=2" class="ico-menu3">밥/죽</a>
                            </li>
                         </c:if>
                         
                         <c:if test="${categoryId eq '3' }">
                            <li class="menuon">
                               <a href="/dailychan/recipe/list.action?recipe_select=반찬/김치&categoryId=3" class="ico-menu4on">반찬/김치</a>
                            </li>
                         </c:if>
                         <c:if test="${categoryId ne '3' }">
                            <li class="">
                               <a href="/dailychan/recipe/list.action?recipe_select=반찬/김치&categoryId=3" class="ico-menu4">반찬/김치</a>
                            </li>
                         </c:if>
                         
                         <c:if test="${categoryId eq '4' }">
                            <li class="menuon" >
                                <a href="/dailychan/recipe/list.action?recipe_select=일품요리&categoryId=4" class="ico-menu5on">일품요리</a>
                            </li>
                         </c:if>
                         
                          <c:if test="${categoryId ne '4' }">
                            <li class="" >
                                <a href="/dailychan/recipe/list.action?recipe_select=일품요리&categoryId=4" class="ico-menu5">일품요리</a>
                            </li>
                         </c:if>
                         
                         <c:if test="${categoryId eq '5' }">
                            <li class="menuon" >
                                <a href="/dailychan/recipe/list.action?recipe_select=간단요리&categoryId=5" class="ico-menu6on">간단요리</a>
                            </li>
                         </c:if>
                         
                         <c:if test="${categoryId ne '5' }">
                            <li class="" >
                                <a href="/dailychan/recipe/list.action?recipe_select=간단요리&categoryId=5" class="ico-menu6">간단요리</a>
                            </li>
                         </c:if>
                         
                         <c:if test="${categoryId eq '6' }">
                            <li class="menuon" >
                                <a href="/dailychan/recipe/list.action?recipe_select=면류/파스타&categoryId=6" class="ico-menu7on">면류/파스타</a>
                            </li>
                         </c:if>
                         
                          <c:if test="${categoryId ne '6' }">
                            <li class="" >
                                <a href="/dailychan/recipe/list.action?recipe_select=면류/파스타&categoryId=6" class="ico-menu7">면류/파스타</a>
                            </li>
                         </c:if>
                         
                         
                          <c:if test="${categoryId eq '7' }">
                            <li class="menuon">
                                <a href="/dailychan/recipe/list.action?recipe_select=간식/음료&categoryId=7" class="ico-menu8on">간식/음료</a>
                            </li>
                         </c:if>
                         
                           <c:if test="${categoryId ne '7' }">
                            <li class="">
                                <a href="/dailychan/recipe/list.action?recipe_select=간식/음료&categoryId=7" class="ico-menu8">간식/음료</a>
                            </li>
                         </c:if>
                         
                          <c:if test="${categoryId eq '8' }">
                            <li class="menuon">
                                <a href="/dailychan/recipe/list.action?recipe_select=베이킹&categoryId=8" class="ico-menu9on">베이킹</a>
                            </li>
                        	</c:if>
                        	
                        	 <c:if test="${categoryId ne '8' }">
                            <li class="" >
                                <a href="/dailychan/recipe/list.action?recipe_select=베이킹&categoryId=8" class="ico-menu9">베이킹</a>
                            </li>
                        	</c:if>
                     </ul>
                </div>
     			  <dl>
                        <!-- title -->
                        <dt>
                            <div>
                                ${dto.recipe_subject }
                            </div>
                            <span><!--2018-10-04--></span>
                        </dt>
                        <!-- //title -->
                        <!-- contents -->
                        <dd style="padding-top:10px">
                            <div class="noticeSnsWrap">
                                <div class="recipe_counter">

						<c:if test="${join_id ne null }">
							<c:if test="${result eq 0 }">
								<a href="#;" onclick="myrecipe('${dto.recipe_id}', '${dto.recipe_select}')" class="receipe_view_on">찜</a>
							</c:if>

							<c:if test="${result eq null }">
								<a href="#;" onclick="myrecipe('${dto.recipe_id}', '${dto.recipe_select}')" class="receipe_view_off">찜</a>

							</c:if>
						</c:if>

						<c:if test="${join_id eq null}">
							<a href="/dailychan/join/login.action" class="receipe_view_off">찜</a>
						</c:if>




											</div>
                                 
                              
                                <a href="javascript:copyUrlToClipboard();" data-clipboard-text="/dailychan/recipe/recipedetail.action?recipe_id=${dto.recipe_id }&categoryId=${categoryId }"class="shareLink"></a>
                                
                                <a id="fbCopyLink" href="https://www.facebook.com/sharer/sharer.php?u=https://www.oasis.co.kr/company/story/recipeDetail/BRD3/406" class="shareFacebook"></a>
                                <a href="javascript:sendLink();" class="shareKakao"></a>
                            </div>
                            <div style="clear:both; margin:70px 0 100px">
                                <p><img src="/dailychan/resources/images/recipe/${dto.recipe_contentSaveFileName}" alt="상세정보 이미지">&nbsp;</p>
                               <!-- 이미지 띄우기! --> 
                            </div>
                            
                               
                                      
                                      
                                        <div class="btn_center btn_green">
                    						<a href="/dailychan/recipe/list.action?categoryId=${categoryId }&recipe_select=${dto.recipe_select}" >목록보기</a>
                    						
                    					<c:if test="${join_id eq 'admin' }">
                    						
                    						<a href="/dailychan/recipe/recipedelete.action?recipe_id=${dto.recipe_id }&categoryId=${categoryId}" >삭제하기</a>
              						 	</c:if>
              						 	</div> 
                              
                            
                        </dd>
                          <!-- btn : 목록보기 -->
                <!-- 0527, 수정-->
                
            <!-- //btn : 목록보기 -->

            
                        <!-- //contents -->
                    </dl>
                     
                    
                </div>
                </div>
                
                </div>
                </div>
                </div>
                
                </div>
                </div>
        
           </form>        
</body>
</html>