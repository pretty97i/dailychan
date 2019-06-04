<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp=request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../top.jsp" />
<title>데일리찬</title>
<link rel="stylesheet" type="text/css"
	href="/dailychan/resources/css/oasis_shop.css" />
<link rel="icon" href="/dailychan/resources/images/x-icon.ico"
	type="/dailychan/resources/images/x-icon.ico" />
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/placeholders.js"></script>
<script type="text/javascript" charset="utf-8"
	src="/dailychan/resources/js/clipboard.min.js"></script>
<script type="text/javascript"
	src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
	
	
<script type="text/javascript">

// test
function findPostCode1(type) {
    new daum.Postcode({
    	 oncomplete: function(data) {
         	  
         	   var q,w,e;
               var value;
               var jusoSangsae="";
               var str = data.jibunAddress;   
               str = str.split(" ");          

               if(data.userSelectedType == "J"){
                   for(var i =0;i<str.length;i++){
                       if(str[i]==data.bname){     
                           value=i;
                       }
                   }
               }else{
                   str = data.roadAddress;       
                   str = str.split(" ");         
                   for(var i=0;i<str.length;i++){
                       if(str[i]==data.roadname){ 
                           value=i;
                       }
                   }
               }

               for(var i=value;i<str.length;i++){
            	   
                   jusoSangsae = jusoSangsae+str[i];
                  
               }
               
               document.myForm.addr1.value = data.sido+data.sigungu+jusoSangsae;
               
           },
       shorthand : false
       }).open();
       
   }
    
    
var oldVal = "";

setInterval(function() {
		
    var addr1 = $('#addr1').val();
    
    if(addr1 == oldVal) {
        return;
    }
    
    $.ajax({
        url:"/dailychan/event/deliveryarea.action?addr1=" + addr1,
        type:'post',
        data: addr1,
        success:function(data){
            if($.trim(data)==1){
                $('#chkMsg').html("새벽배송 가능지역입니다");
                $('#chkMsgFlag').val("true");
            }else{
                $('#chkMsg').html("새벽배송 불가지역입니다");
                $('#chkMsgFlag').val("false");
            }
        },
        error:function(){
                alert("에러입니다");
        }
    });
	
	oldVal = addr1;

}, 100);

</script>

<script type="text/javascript">

function findPostCode2(type) {
    new daum.Postcode({
    	 oncomplete: function(data) {
         	  
         	  var q,w,e;
               var value;
               var jusoSangsae="";
               var str = data.jibunAddress;   
               str = str.split(" ");          


               if(data.userSelectedType == "J"){   
                   for(var i =0;i<str.length;i++){
                       if(str[i]==data.bname){     
                           value=i;                
                       }
                   }
               }else{
                   str = data.roadAddress;       
                   str = str.split(" ");         
                   for(var i=0;i<str.length;i++){
                       if(str[i]==data.roadname){ 
                           value=i;               
                       }
                   }
               }

               for(var i=value;i<str.length;i++){  
                   jusoSangsae = jusoSangsae+str[i];
                  
               
               }
             
               document.myForm.addr2.value = data.sido+data.sigungu+jusoSangsae;

           },
       shorthand : false
       }).open();
       
   }
   
var oldVal1 = "";

setInterval(function() {

	var addr2 = $('#addr2').val();
	
	if(addr2 == oldVal1) {
        return;
    }
	
	$.ajax({
	    url:"/dailychan/event/deliveryarea.action?addr2=" + addr2,
	    type:'post',
	    data: addr2,
	    success:function(data){
	        if($.trim(data)==1){
	            $('#chkMsg2').html("매장배송 가능지역입니다");
	            $('#chkMsgFlag').val("true");
	        }else{
	            $('#chkMsg2').html("매장배송 불가지역입니다");
	            $('#chkMsgFlag').val("false");
	        }
	    },
	    error:function(){
	            alert("에러입니다");
	    }
	});

	oldVal1 = addr2;

}, 100);

</script>

</head>
<body>
	<form action="" name="myForm" method="post">
		<div class="allWrap">



			<!-- 컨텐츠 -->
			<div class="contentsArea">
				<div class="contentsWrap">


					<div class="content">
						<div class="openPmWrap">
							<div style="margin-left: -450px;">
								<img src="/dailychan/resources/images/promotion/top_img11.jpg"
									alt="프로모션 메인 배너">
							</div>

							<div style="background: #efefef;; text-align: center"
								id="oasisDelivery">
								<img
									src="/dailychan/resources/images/promotion/txt_06_new.png?dummy=0.06"
									alt="새벽배송 마감연장 ">
							</div>
							<div class="openPmDelivery">
								<a href="javascript:findPostCode1()"> <img
									src="/dailychan/resources//images/promotion/txt_01.png"
									alt="원하시는 배송방법으로 선택하세요">
								</a>
							</div>

							<div style="text-align: center; padding-bottom: 100px;">
								<ul>
									<a href="#daybreakDelivery"><img
										src="/dailychan/resources/images/promotion/delivery_btn2b.png"
										alt="새벽배송" style="padding-right: 20px;"></a>
									<a href="#oasisDelivery"><img
										src="/dailychan/resources/images/promotion/delivery_btn1.png"
										alt="매장직배송"></a>
									<br>
								</ul>
								<ul style="padding-top: 40px;">
									<a href="#deliveryareaCheck"><img
										src="/dailychan/resources/images/promotion/delivery_btn2_2.png"
										alt="새벽배송 가능 지역 확인" style="padding-right: 20px;"></a>
									<a href="#deliveryTimetable"><img
										src="/dailychan/resources/images/promotion/delivery_btn1_2.png"
										alt="매장직배송 시간표 확인"></a>
								</ul>
							</div>
							<div class="openPmFooter" id="daybreakDelivery">
								<img src="/dailychan/resources/images/promotion/txt_04.png"
									alt="오아시스 새벽배송 안내">
							</div>
							<div class="openPmFooter" id="deliveryareaCheck"
								style="background-color: #fff;">

								<a href="#" onclick="findPostCode1('daybreak'); return false;">
									<img src="/dailychan/resources/images/promotion/txt_05.png"
									alt="오아시스 새벽배송가능 지역 확인">
								</a> <input type="hidden" id="addr1" name="addr1" class="inputWd150"
									maxlength="50" oninput="checkId();"
									style="width: 50%; height: 40px; margin-left: 10px; padding-left: 10px; font-size: 13px; border: 1px solid #bbbbbb; color: #666666">
								<!-- <input type="text" id="addr1" name="addr1" title="기본 주소" value="" maxlength="120" placeholder=""/> -->

								<div>
									<!-- <span id = "chkMsg"></span> -->

									<span id="chkMsg"
										style="color: #789b48; font-size: 30px; font-weight: bold; margin-top: 50px; display: block;"></span>

								</div>
								<!-- <input type="text" id="addr2" name="jusodetail" title="상세 주소" value="" maxlength="120" placeholder="상세 주소"/> -->


								<!-- 		<input type="hidden" class="ip_text xl" id="addr1" name="addr1" title="기본 주소" value="" maxlength="120" placeholder="기본 주소"/>
		<input type="hidden" class="ip_text xl" id="addr2" name="addr2" title="상세 주소" value="" maxlength="120" placeholder="상세 주소"/>  -->
								<span id="daybreakDeliveryTxt"
									style="color: #181d7c; font-size: 30px; font-weight: bold; margin-top: 50px; display: block;"></span>
							</div>
							<div class="openPmBenefit" id="oasisDelivery">
								<img
									src="/dailychan/resources/images/promotion/txt_02.png?dummy=0.01"
									alt="오아시스 매장 직배송 안내 ">
							</div>
							<div class="openPmBenefit" id="deliveryTimetable">
								<img src="/dailychan/resources/images/promotion/txt_02_2.png"
									alt="오아시스 매장 직배송 시간표 확인 ">
							</div>
							<div class="openPmBenefit" style="background-color: #fff;">
								<a href="#" onclick="findPostCode2('oasis'); return false;">
									<img
									src="/dailychan/resources/images/promotion/txt_03.png?dummy=0.05"
									alt="오아시스 매장 직배송 가능 지역 확인"></a>
							</div>
							 <input type="hidden" id="addr2" name="addr2" class="inputWd150"
								maxlength="50" oninput="checkId();"
								style="width: 50%; height: 40px; margin-left: 10px; margin-left: 250px; font-size: 13px; border: 1px solid #bbbbbb; color: #666666">
							<!-- <input type="text" id="addr1" name="addr1" title="기본 주소" value="" maxlength="120" placeholder=""/> -->

							<span id="chkMsg2"
								style="color: #181d7c; font-size: 30px; font-weight: bold; text-align: center; margin-top: 50px; display: block;"></span>

						</div>
					</div>
				</div>
			</div>
		</div>





	</form>

</body>

</body>
</html>