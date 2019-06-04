<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <title>DailyChan::믿을 수 있는 먹거리</title>

<link rel="icon" href="/dailychan/resources/images/x-icon.ico" type="/dailychan/resources/images/x-icon.ico" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72.png" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-50@2x.png" sizes="96x96" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-72@2x.png" sizes="144x144" />
<link rel="apple-touch-icon-precomposed" href="/dailychan/resources/images/webicon/Icon-Small-60@3x.png" sizes="192x192" />
<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/notosanskr.css" />

<link rel="stylesheet" type="text/css" href="/dailychan/resources/css/oasis_shop.css?dummy=5.99" /><link rel="stylesheet" type="text/css" href="/dailychan/resources/css/flick/jquery-ui.min.css" />
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/clipboard.min.js"></script>
<script type="text/javascript" src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_shop.js"></script>
<script type="text/javascript" charset="utf-8" src="/dailychan/resources/js/oasis_common.js?dummy=0.9"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>


<script type="text/javascript" charset="utf-8">

    function signUp() {
		
   
		var f = document.myForm
		var join_id = $("#join_id").val();
		var join_password = $("#join_password").val();
		var password2 = $("#password2").val();
		var join_name = $("#join_name").val();
		var join_email = $("#join_email").val();
		var join_phone = $("#join_phone").val();
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,15}$/;
		var reg1 = /^(?=.*?[0-9]).{6,15}$/;
		var regExp = /[a-z0-9]{2,}@[a-z0-9-]{2,}.[a-z0-9]{2,}/i;// --이메일 체크
		var regPhone = /^\d{3}-\d{3,4}-\d{4}$/;	//휴대번호 체크


		if(join_id.length < 1 ){
			
			alert ("아이디를 입력해주시기 바랍니다.");
			f.join_id.focus();
			return;
		}
		
		if(false==reg1.test(join_id)){
			alert("아이디는 6자이상 15자이하며, 아이디에는 숫자가 포함되어야 합니다.")
			return;
		}
		
		
		if(join_password.length <1){
			alert("비밀번호를 입력해주시기 바랍니다.");
			return;
		}
		if(false==reg.test(join_password)){
			
			alert("비밀번호는 6자이상 15자이하이며, 숫자,대문자,소문자 모두 포함해야 합니다.")
			return;
		}
	
		if(password2.length <1 || join_password!= password2){
	
			alert("비밀번호 확인을 입력해 주시기 바랍니다.");
			return;		
		}

		if(join_name.length<1){
			alert("이름을 입력해주시기 바랍니다.");
			return;
		}
		if(join_phone.length<1 ){
			alert("휴대폰번호를 입력해주시기 바랍니다.");
			return;
		}
		if(false==regPhone.test(join_phone)){
			alert("휴대폰 형식에 맞게 입력해주시기 바랍니다.");
			return;
		}
	
		if(join_email.length<1 ){
			alert("이메일을 입력해주시기 바랍니다.");
			return;
		}
		if(false==regExp.test(join_email)){
			alert("이메일 형식에 맞게 입력해주세요");
			return;
		}

		
		
		f.action = "<%=cp%>/join/complete.action";
		f.submit();
		
	}    
    

	//아이디 중복
	function checkUserId() {
		
		var join_id = $("#join_id").val();
		var getCheck= RegExp(/^(?=.*?[0-9]).{6,15}$/);
		
		if(join_id.length < 1){
			
			alert("아이디를 입력해주시기 바랍니다.");
		
		}else if(!getCheck.test($("#join_id").val())){
	        alert("아이디는 6자이상 15자이하며, 아이디에는 숫자가 포함되어야 합니다.");
	        $("#join_id").val("");
	        $("#join_id").focus();
	        return false;
	      
		}else{
			
			var url = "<%=cp%>/join/checkUserId.action";
			
			$.post(url,{join_id:join_id},function(args){
				
				var checkId = decodeURIComponent(args).replace(/\+/g, ' ');
				
				/* $("#checkIdOk").html(checkId);
				$("#checkIdOk").show(); */
				alert(checkId);
				
			});
			
		}
	};
	
	//추천인
	function checkRecommendId() {
		
    	var join_recommender = $("#join_recommender").val();
   
		var url = "<%=cp%>/join/checkRecommendId.action";
		
		$.post(url,{join_id:join_recommender},function(args){
			
			var checkrecommender = decodeURIComponent(args).replace(/\+/g, ' ');
			
			$("#checkRecommendIdOk").html(checkrecommender);
			$("#checkRecommendIdOk").show();
			
			
		});
	
		
	}

	
  //휴대폰중복
  
    function checkTelAlreadyExists() {
		
    	var join_phone = $("#join_phone").val();
    	var regPhone = /^\d{3}-\d{3,4}-\d{4}$/;	//휴대번호 체크
    	
    	
		if(join_phone.length < 1){
			
			alert("휴대폰을 입력해주시기 바랍니다.");
		}else if(!regPhone.test($("#join_phone").val())){
	        alert("휴대폰 형식에 맞게 입력해주시기 바랍니다.");
	        $("#join_phone").val("");
	        $("#join_phone").focus();
	        return false;
	
		}else{
			
			var url = "<%=cp%>/join/checkTelAlreadyExists.action";
			
			$.post(url,{join_phone:join_phone},function(args){
				
				var checkPhone = decodeURIComponent(args).replace(/\+/g, ' ');
				
				/* $("#checkIdOk").html(checkId);
				$("#checkIdOk").show(); */
				alert(checkPhone);
				
				
			});
			
		}

	}

</script>	

</head>
<body>
<div class="allWrap">
	<!-- header -->
		<jsp:include page="/WEB-INF/views/top.jsp">
			<jsp:param value="${sort }" name="sort"/>
		</jsp:include>
	
	<div id="header">
		<!--top banner-->
		
		<!-- //top banner-->

	</div>
	<!-- header -->
	<!-- 컨텐츠 -->
		    <div class="contentsArea loginJoinBg" id="sec_join">
		        <div class="contentsWrap">
		            <div class="list_top_banner img_join" > 
		            	
						<div class="contents">
							<p>
								&nbsp;
							</p>
						</div>
					</div>
		       		<!-- 오른쪽 영역 -->
		          <!-- 내용 입니다 -->
           	<div class="oasisLoginWrap oasisJoinWrap">
                	
                	<!-- 2018-06-12 -->  
                    <div class="newJoinTitle">Daily 회원 가입</div>           
                    <div class="newJoinSubTitle">
                    	세상을 바꾸겠다는 거창한 철학보다는 한 사람의 작은 바람을 담은 소비가 가족을 행복하게 하고,<br>
						행복한 가족이 모여 행복한 사회를 만들 수 있다는 단순하고 소박한 가치를 실천합니다.
                    </div>       
                    <!-- 2018-06-12 -->  

                    <ul class="oasisLoginInputLi oasisJoinInputLi">
                    
                        <li>
                        	<!-- <form action="" method="POST" novalidate="" name="myForm"> -->
                        	<form action="" method="post" name="myForm">
                            <div class="oasisJoinInput_in">            
                          
                              <%-- <c:set var="join_id" value="아이디"/> --%>
                         			<c:choose>
	                          			<c:when test="${naver_id ne null || naver_id != null}">	
	                          				<input type="hidden" id="join_id" name="join_id" value="${naver_id}"/><!-- onkeydown="fnNotInputHan(this);" -->
				                        	 <input type="text" placeholder="소셜:naver" id="join_id" name="join_id" readonly="readonly" />	
				                        	 	<input type="hidden" name="naver_id" value="${naver_id}"/>
				                        </c:when>
				                        	<c:when test="${kakao_id ne null || kakao_id != null}">	
	                          				<input type="hidden" id="join_id" name="join_id" value="${kakao_id}"/><!-- onkeydown="fnNotInputHan(this);" -->
				                        	 <input type="text" placeholder="소셜:Kakao" id="join_id" name="join_id" readonly="readonly" />	
				                        	 	<input type="hidden" name="id" value="${kakao_id}"/>
				                        </c:when>
				                        
				                        
	                          			<c:otherwise>
	                          				<input type="text" placeholder="아이디 (숫자 포함 조합 6~15자 입력)" id="join_id" name="join_id"  maxlength="15" />
				                          	 <a href="#" onclick="checkUserId(); return false;">중복확인</a>
	                          			</c:otherwise>
	                          		</c:choose>
                            </div>
                          	
                        </li>
                        <li>
                            <input type="password" placeholder="비밀번호 (영문소문자,대문자, 숫자 조합 6~15자 입력)" maxlength="15"   id="join_password" name="join_password"/>
                       
                            
                          <input type="password" placeholder="비밀번호확인"  maxlength="15" id="password2" name="password2"/>
                            
                        </li>
                        <li>
                            <input type="text" placeholder="이름"  id="join_name" name="join_name" value="${join_name}" maxlength="40"/>
                           <%-- 	<input type="text" id="join_name" name="join_name" value="${join_name}" readonly="readonly"/> --%>
                           	
                        </li>
						
						<!-- 2018-06-12 -->  
						<li>
                            <div class="oasisJoinInput_in">
                                <input type="text" placeholder="휴대폰번호 (010-xxxx-xxxx)" id="join_phone" name="join_phone"/>
                                 <a href="#" onclick="checkTelAlreadyExists(); return false;">중복확인</a> <!-- checkIdOk -->
                            </div>
                            
                        </li>
                        <!-- 2018-06-12 -->  
                        
                        <li>
                            <div class="oasisJoinInput_in">
                                <input type="text" placeholder="이메일 (abc1234@naver.com)" id="join_email" name="join_email" value="${join_email}"/>
                            </div>
                            
                        </li>
                       
                       <li class="btn_select_branch">
                            <div>
								<p>
									SMS, E-mail 수신동의 고객에 한하여 할인쿠폰을 받으실 수 있습니다.<br/>
                                    수신동의 후 이벤트/신상품 등의 정보를 빠르게 만나세요<br/>
								</p>
								
								<span class="radios">
									<input type="radio" name="join_snsAgree" id="sms_y" value="Y" checked="checked">
									<label for="sms_y"></label>
								</span>
								<label for="sms_y">SMS 동의</label>
								<span class="radios">
									<input type="radio" name="join_snsAgree" id="sms_n" value="N">
									<label for="sms_n"></label>
								</span>
								<label for="sms_n">SMS 동의안함</label>
								<span class="radios">
									<input type="radio" name="join_emailAgree" id="email_y" value="Y" checked="checked">
									<label for="email_y"></label>
								</span>
								<label for="email_y">E-mail 동의</label>
								<span class="radios">
									<input type="radio" name="join_emailAgree" id="email_n" value="N">
									<label for="email_n"></label>
								</span>
								<label for="email_n">E-mail 동의안함</label>
							</div>
                        </li>
                        
                        <li>
                            <div class="oasisJoinInput_in">
                                <input type="text" placeholder="추천인 아이디" id="join_recommender" name="join_recommender" maxlength="40" value="${join_recommender }"/>
                      
                              <!--   <input type="hidden" id="recommendNo" name="recommendNo"/> -->
                               <strong style="display:none" id="checkRecommendIdOk">추천인 아이디가 확인되었습니다.</strong>
                                <a href="#" onclick="checkRecommendId(); return false;">ID 확인</a>
                            </div>
                         
                        </li>
								
                        <li>
                           <img src="/dailychan/resources/images/loginJoin/join_info.png"> <!-- 2018-06-12 -->
                        </li>
                        </form>
                        <li class="btn_select_branch">
							<div id="infoMembership">
								
							</div>
                        </li>
                    <div class="oasisLoginBtn2">
                        <a href="#" onclick="signUp(); return false;">가입하기</a> <!-- 2018-06-12 -->
                    </div>
                    </ul>
                    </div>
                    
                    </div>
                    
        

                </div>
                <!-- //내용 입니다 -->

			
			   
    <!-- //컨텐츠 -->
 
    	<!-- footer -->
 		<jsp:include page="/WEB-INF/views/footer.jsp">
			<jsp:param value="${sort }" name="sort"/>
		</jsp:include>
		<!-- // footer -->

</body>

</html>


