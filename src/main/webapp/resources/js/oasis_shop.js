jQuery(document).ready(function(){

//s:오아시스 추가

	//퀵메뉴
	/*
	var quick_menu = $("#miniArticle");
    var quick_top = 50;
	quick_menu.css( "top", 227 );
	
	$(window).scroll(function( ){  
	 	if($(window).scrollTop() > 50){ 
			quick_menu.stop();
      		quick_menu.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 200 ); //스크롤 내려갈 때의 속도
		}else{
			quick_menu.animate( { "top": $(document).scrollTop() + 227 +"px" },  100 ); 
		}
	 });
	 */


     //familySite
	 $(".familyDiv .familySite").click(function(){
		if($(this).next().is(":hidden")) {
			$(this).addClass("on");
			$(this).next().stop(true, true).slideDown(300);
		} else {
			$(this).removeClass("on");
			$(this).next().stop(true, true).slideUp(300);
		}
	});
	  
	//selectbox 디자인 적용  
	var select = $(".selectBoxWrap select");
		
	select.change(function(){
		var select_name = $(this).children("option:selected").text();
		$(this).siblings("label").text(select_name);
	});
	
	//상품리스트 - 상품 서브 카테고리 선택 박스
	$('.pListSubCateBox a').click(function(){
		 $('.pListSubCateBox li a').removeClass("on");
		 $(this).addClass("on");
	 });
	
	//상품상세 - tab
	$('.pViewTab li').click(function(){
		 $('.pViewTab li').removeClass("on");
		 $(this).addClass("on");
	 });
	 
	 /*$('.pViewTab .btn01').click(function(){
		 $('.pViewCon .wd900').hide();
		 $('.pViewCon .tab1').show();
	 });
	 $('.pViewTab .btn02').click(function(){
		 $('.pViewCon .wd900').hide();
		 $('.pViewCon .tab2').show();
	 });
	 $('.pViewTab .btn03').click(function(){
		 $('.pViewCon .wd900').hide();
		 $('.pViewCon .tab3').show();
	 });
	 $('.pViewTab .btn04').click(function(){
		 $('.pViewCon .wd900').hide();
		 $('.pViewCon .tab4').show();
	 });
	 $('.pViewTab .btn05').click(function(){
		 $('.pViewCon .wd900').hide();
		 $('.pViewCon .tab5').show();
	 });*/

	//고객센터- tab
	$('.qnaTab li').click(function(){
		 $('.qnaTab li').removeClass("on");
		 $(this).addClass("on");
	 });

	//고객센터- faq 리스트
	$('.qnaList li strong').click(function(){
		 if($(this).next().css("display") == "none"){
			 $('.qnaList li').removeClass("q_on");
			 $(this).parent().addClass("q_on");
		 }else{
			 $('.qnaList li').removeClass("q_on");
		 }
	 });
	 
	//고객센터- 상담내역
	$('.myQ th').click(function(e){
		 if($(this).parent().next().css('display') == 'none'){
			 $('.myA').hide();
			 $(this).parent().next().show();
			 e.preventDefault();
		 }else{
			 $(this).parent().next().hide();
			 e.preventDefault();
		 }
	 });
	 
	//회원정보수정- tab
	$('.mamberTab1 li').click(function(){
		 $('.mamberTab1 li').removeClass("on");
		 $(this).addClass("on");
	 });
	 
	 $('.mamberTab2 li').click(function(){
		 $('.mamberTab2 li').removeClass("on");
		 $(this).addClass("on");
	 });
	 
	 //gnb
	 $(".headerArea").append("<div class='oasisDim_gnb'></div>");
	 
	 $('.grCategoryBtn').click(function(){
	 	if($('.grCategoryWrap').css('display') == 'none'){
		    $('.grCategoryWrap').stop(true, true).slideDown(300);
		    $('.oasisDim_gnb').stop(true, true).slideDown(300);
		}else{
			$('.grCategoryWrap').stop(true, true).slideUp(300);
		    $('.oasisDim_gnb').stop(true, true).slideUp(300);
			$('.grCategoryWrap').removeClass('grCategory_over');
			$('.grCategorySub').hide();
			$('.grCategoryMenu li .tit').removeClass('on');
		}
	 });
	 $('.oasisDim_gnb').click(function(){
	 	if($('.grCategoryWrap').css('display') == 'block'){
		    $('.grCategoryWrap').stop(true, true).slideUp(300);
		    $('.oasisDim_gnb').stop(true, true).slideUp(300);
			$('.grCategoryWrap').removeClass('grCategory_over');
			$('.grCategorySub').hide();
			$('.grCategoryMenu li .tit').removeClass('on');
		}
	 });
	 
	 $(window).scroll(function( ){  
	 	if($('.grCategoryWrap').css('display') == 'block'){ 
			$(window).scrollTop(0);
			$(window).scrollLeft(0);
		}
	 });
	 
	 $('.grCategoryMenu li .tit').mouseover(function(){
	 	$('.grCategoryWrap').addClass('grCategory_over');
		$('.grCategorySub').hide();
		$(this).next().show();
		$('.grCategoryMenu li .tit').removeClass('on');
		$(this).addClass('on');
	 });
	 
	//메인 slide
	var mainSlide = $('.main-slide .slide').bxSlider({
		pagerCustom: '#bx-pager',
		auto:true,
		pause:4000
	});
	$('.main-slide .stop').on('click',function(){
		mainSlide.stopAuto();
		$(this).css("display","none");
		$(".play").css("display","inline-block");
	});
	$('.main-slide .play').on('click',function(){
		mainSlide.startAuto();
		$(this).css("display","none");
		$(".stop").css("display","inline-block");
	});
	
	
	//layerpopup
	//레이어팝업 열기(공통)
	$('.layerpopBtn').click(function(){
		 $('.oasisLayerPop').show();
		 $('.oasisDim').show(50, function(){
			$('body').css("overflow-y","hidden");
		 });
		 $('body').bind('touchmove', function(e){
			e.preventDefault();
		}); //스크롤방지
	 });
	$('.oasisLayerPop .oasisMapClose2').click(function(){
		$('.oasisLayerPop').hide();
		$('.oasisDim').hide(50, function(){
			$('body').css("overflow-y","auto");
		 });
	 });
	 
	 
	 //1:1상담신청
	 $('.qnaLayerBtn').click(function(){
		 $('.oasisLPtit > strong').hide();
		 $('.oasisLPconWrap > div').hide();
		 $('.qnaLayerTit').show();
		 $('.qnaLayerCon').show();
	 });
	
	//상품평쓰기, 상품문의하기
	 $('.comLayerBtn').click(function(){
		 $('.oasisLPtit > strong').hide();
		 $('.oasisLPconWrap > div').hide();
		 $('.comLayerTit').show();
		 $('.comLayerCon').show();
	 });
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 //이용약관, 개인이용정보 보기 (회원가입, 하단공통)
	$('.oasisTermsBtn').click(function(){
		 $('.oasisLayerPop2').show();
		 $('.oasisDim').show(50, function(){
			$('body').css("overflow-y","hidden");
		 });
		 $('body').bind('touchmove', function(e){
			e.preventDefault();
		}); //스크롤방지
	 });
	 
	$('.oasisLayerPop2 .oasisMapClose2').click(function(){
		$('.oasisLayerPop2').hide();
		$('.oasisDim').hide(50, function(){
			$('body').css("overflow-y","auto");
		 });
	 });
	 
	 $('.joinTerms1').click(function(){
		 $('.oasisTermsPop1').show();
		 $('.oasisTermsPop2').hide();
		 $('.oasisTermsPop3').hide();
		 $('.terms2Btn').removeClass('on');
		 $('.terms3Btn').removeClass('on');
		 $('.terms1Btn').addClass('on');
	 });
	 
	  $('.joinTerms2').click(function(){
		 $('.oasisTermsPop1').hide();
		 $('.oasisTermsPop2').show();
		 $('.oasisTermsPop3').hide();
		 $('.terms1Btn').removeClass('on');
		 $('.terms3Btn').removeClass('on');
		 $('.terms2Btn').addClass('on');
	 });
	  
	  $('.joinTerms3').click(function(){
		 $('.oasisTermsPop1').hide();
		 $('.oasisTermsPop2').hide();
		 $('.oasisTermsPop3').show();
		 $('.terms1Btn').removeClass('on');
		 $('.terms2Btn').removeClass('on');
		 $('.terms3Btn').addClass('on');
	  });


	 
	 



//e:오아시스 추가




	
	 
	
	
	


  	//20170307 2차 추가 - 회원가입 탭
	$('.oasisJoinBtn_p').click(function(){
		 $('.oasisJoin_phone').show();
		 $('.oasisJoin_email').hide();
		 $('.oasisJoinTab li').removeClass("on");
		 $(this).addClass("on");
		 $("#password3").val("");
		 $("#password4").val("");
		 $("#email").val("");
		 $("#joinType").val("tel");
		 $(".messageBox").hide();
	 });
	 
	 $('.oasisJoinBtn_e').click(function(){
		 $('.oasisJoin_phone').hide();
		 $('.oasisJoin_email').show();
		 $('.oasisJoinTab li').removeClass("on");
		 $(this).addClass("on");
		 $("#tel").val("");
		 $("#authNo").val("");
		 $("#password").val("");
		 $("#password2").val("");
		 $("#authNo").data("checkd","false");
		 $("#joinType").val("email");
		 $("#tel").removeAttr("readonly");
		 $("#authNo").removeAttr("readonly");
		 $("#authOk").hide();
		 $(".messageBox").hide();
	 });
	
	//메인 롤링 배너
	$('.banner1Play').hide();
	$('.banner1Stop').click(function(){
		 $('.banner1Play').show();
		 $('.banner1Stop').hide();
	 });
	$('.banner1Play').click(function(){
		$('.banner1Play').hide();
		$('.banner1Stop').show();
	 });
	 
	 //$('.headerArea').addClass('oasisTopFix');
	 //20170207 추가 : 스크롤시 상단메뉴영역 위치고정
	 /*$(window).scroll(function(){
			if ($(window).scrollTop() > 1) {
				 if($(document).height() - 215 > $('.allWrap').height() ) {
					 $('.headerArea').addClass('oasisTopFix');
					 $('.contentsArea').addClass('oasisTopFix_con');
				 }
			} else{
				$('.headerArea').removeClass('oasisTopFix');
				$('.contentsArea').removeClass('oasisTopFix_con');
			}
	});*/
		 
	 
	 $('.allCateView_weekSale').hide();
	 
	 $('.allCateBtn_weekSale').click(function(){
		 $('.grCategoryMenu li').removeClass("grCtSub_on");
		 $('.grCategoryMenu li.grCtList1').addClass("grCtSub_on");
		 $('.grCategoryWrap').show();
		 $('.oasisDim').show();
	 });
	 
	 //20170328삭제
	 /*$('.grCategoryBtn').click(function(){
		 $('.grCategoryMenu li').removeClass("grCtSub_on");
		 $('.grCategoryMenu li.grCtList1').addClass("grCtSub_on");
		 $('.grCategoryWrap').show();
		 $('.oasisDim').show();
	 });
	 
	 $('.grCategoryClose').click(function(){
		 $('.grCategoryWrap').hide();
		 $('.oasisDim').hide();
	 });
	 
	 $('.grCategoryMenu li .tit').click(function(){
		 $('.grCategoryMenu li').removeClass("grCtSub_on");
		 $(this).parent().addClass("grCtSub_on");
	});*/
	 
	//20170223(로그인)추가 : 메인 배너 우측 더보기 버튼 / 초기값, focus out 일경우
	    var clzName = "xxx_on";
		var maxIdx  = 3;//li갯수
		var currIdx = 0;
		var interValSec = 3;//실행주기(초)
		var rolling_timer; 
		  
	   //시작시 돌려!!!!!
	   rolling_timer = setInterval(fnc_rolling, (interValSec*1000)); 
	   
	   //롤링 Start!!
	   $(".weekSaleBannerBtn").mouseleave(function(){
		  rolling_timer = setInterval(fnc_rolling, (interValSec*1000)); 
		  $(".weekSaleBannerBtn ul li").removeClass("wsbBtnFocusOut");
		  $(".weekSaleBannerBtn ul li.wbBtn1").addClass("wsbBtnFocusOut");
	   });
	   //롤링 Stop!!
	   $(".weekSaleBannerBtn").mouseover(function(){
		  if(rolling_timer !== null){
			 clearInterval(rolling_timer); 
		  }
		  $(".weekSaleBannerBtn ul li").removeClass("wsbBtnFocusOut");
	   });
		
		function fnc_rolling(){
		   $(".weekSaleBannerBtn ul li").removeClass("wsbBtnFocusOut");
		   $(".weekSaleBannerBtn ul li:eq(" + currIdx + ")").addClass("wsbBtnFocusOut");
		   currIdx++; //다음번 실행을 위해 인덱스 증가
		   if(currIdx >= maxIdx){
			  currIdx = 0;//max값을 초과하면 초기화
		   }
		}
		//20170228추가 : 프로모션 비주얼 배너 sliders
		var slider = $('.main-slider').bxSlider({
			speed: 500,
			auto: true,  
			moveSlides: 1,
			minSlides: 1,
			maxSlides: 1,
			pager: true,
			controls: true
		});

		$('.bx-controls-direction a').click(function(e){
			slider.stopAuto();
			restart=setTimeout(function(){
				slider.startAuto();
				},500);
			return false;
		});

		$('.min-slider').bxSlider({
			speed: 500,
			auto: true,  
			moveSlides: 1,
			minSlides: 1,
			maxSlides: 1,
			pager: true,
			controls: false
		});
		
		
		//20170228추가 : 프로모션 상단 배너
		
		$('.pmTopBaannerClose').click(function(){
			 $('.pmTopBaanner').hide();
		});




	
	/* ================ add / TH KIM ================ */


	// 퀵메뉴
	var sideMenuOffset = $('#miniArticle').offset();
	if(sideMenuOffset) {
		var sideMenu = $('#miniArticle').offset().top;
		
		$(window).scroll(function(){
			 var top = $(this).scrollTop();
			 if(top < sideMenu){
				 $('#miniArticle').css({'position':'absolute','top':sideMenu});
			 }else{
				 $('#miniArticle').css({'position':'fixed','top':'10px'});
			 }
		 });
	}

	// 퀵메뉴 상품 오버
	$('#quickMenuContent li').each(function(idx){
		$(this).hover(function(){
			$(this).find('.pop_quick').show()
		},
		function(){
			$('#quickMenuContent .pop_quick').hide();
		})
	});

	// 퀵메뉴 특가할인 슬라이드
	$('#quickSlide .bxslider').bxSlider({
		auto: true,
		speed: '500',
		controls:false
	});


	//메인 - 간편식품관 왼쪽
	$('.grocery_1 a').hover(function(){
		$(this).find('.grocery_on').show()
	},
	function(){
		$('.grocery_1 .grocery_on').hide();
	});

	//메인 - 간편식품관 오른쪽
	$('.grocery_2 ul > li').each(function(idx){
		$(this).hover(function(){
			$(this).find('.grocery_on').show()
		},
		function(){
			$('.grocery_2 .grocery_on').hide();
		});
	});


	//상품리스트 - 상단 BEST 3 hover
	$('.list_best_3 .btn_best3_prev a img, .list_best_3 .btn_best3_next a img, .mainConWrap .btn_best_prev a img, .mainConWrap .btn_best_next a img').hover( function(){

		if($(this).is('.fixed')==false){
			$(this).attr('src', $(this).attr('src').replace('.png','_on.png'));
		}
	}, function() {
		if($(this).is('.fixed')==false){
			$(this).attr('src', $(this).attr('src').replace('_on.png','.png')); 
		}
	});

	//상품리스트 - 상단 BEST 3
	$('.list_best_3 ul > li').each(function(idx){
		$(this).hover(function(){
			$(this).find('.ico_best_3_view').show()
		},
		function(){
			$('.list_best_3 .ico_best_3_view').hide();
		});
	});


	// 상품 상세페이지 슬라이드
	$('#pViewSlide .bxslider').bxSlider({
		auto: true,
		speed: '500',
		controls:false
	});

	// 상품리스트 오버
	$('#sec_product_list .prodList > ul > li').each(function(idx){
		$(this).hover(function(){
			$(this).find('.pop_view').show()
		},
		function(){
			$('#sec_product_list .pop_view').hide();
		})
	});

	// 베스트50 상품리스트 오버
	$('#sec_best50 .prodList > ul > li').each(function(idx){
		$(this).hover(function(){
			$(this).find('.pop_view').show()
		},
		function(){
			$('#sec_best50 .pop_view').hide();
		})
	});

	// 베스트50 오버
	$('.best01_05_list > div').each(function(idx){
		$(this).hover(function(){
			$(this).find('.pop_view').show();
		},
		function(){
			$('.best01_05_list .pop_view').hide();
		})
	});

	// 산지직송
	$('#sec_direct .prodList > ul > li').each(function(idx){
		$(this).hover(function(){
			$(this).find('.pop_view').show()
		},
		function(){
			$('#sec_direct .pop_view').hide();
		})
	});

		// 2017-11-20 오!감동
	$('#sec_oh_hot_deal .prodList > ul > li').each(function(idx){
		$(this).hover(function(){
			$(this).find('.pop_view').show()
		},
		function(){
			$('#sec_oh_hot_deal .pop_view').hide();
		})
	});

	// 상품리스트 오버
	$('#sec_paper .prodList > ul > li').each(function(idx){
		$(this).hover(function(){
			$(this).find('.pop_view').show()
		},
		function(){
			$('#sec_paper .pop_view').hide();
		})
	});

	// 전단행사
	$('#sec_paper .product_3 dt, .product_3 dd').hover(function(){
		$('#sec_paper .product_3 dd').show()
	},
	function(){
		$('#sec_paper .product_3 dd').hide();
	})

	$('.tab_2days li').click(function(){
		 $('.tab_2days li').removeClass("on");
		 $(this).addClass("on");
	 });

	// 친환경 특가 오버
	$('.list_organic .prodList > ul > li').each(function(idx){
		$(this).hover(function(){
			$(this).find('.pop_view').show();
		},
		function(){
			$('.list_organic .pop_view').hide();
		})
	});
	/* ================ //add / TH KIM ================ */

});



// 레이어팝업 공통
function popHeightControl(divID,display){
	// black bg
	if(display=='block'){
		$('#' + divID)
		.css('top', ($(window).scrollTop() + (($(window).height() / 2) - ($('#' + divID).height() / 2))))
		.show(50, function(){
			$('body').css("overflow-y","hidden");
		 });
		$('#bg_layer').css('height', $(document).height()).show();
	}
	else if(display=='none'){
		$('#bg_layer').hide(50, function(){
			$('body').css("overflow-y","auto");
		 });
		$('body').css("overflow-y","auto");
	}
	document.getElementById(divID).style.display=display;
}

//배송권 조회를 위한 다음 우편번호 검색 팝업
function searchDeliveryArea() {
	new daum.Postcode({
		oncomplete : function(data) {
			checkOasisDeliveryStore(data.zonecode, callbackSearchDeliveryArea);
		}
	}).open();
}

// 배송권역 확인 결과
function callbackSearchDeliveryArea(response) {
	// 배송권
	if (response.status == "OK") {
		alert("오아시스 배송 가능 지역입니다.");
	// 배송권 아님
	} else {
		alert("오아시스 배송 불가능 지역입니다.\r\n주문시 일반 택배로 배송됩니다.");
	}	
}


// 배송권 확인
function checkOasisDeliveryStore(zoneCode, callback) {
	var param = {zoneCode : zoneCode};
	
	$.ajax({
		url : contextPath + "/checkOasisDeliveryStore",
		type : "POST",
		data : param,
		dataType : "json",
		success : function(response) {
			if ($.isFunction(callback)) {
				callback(response);
			}
		}
	});
}

//jQuery.noConflict();
jQuery(document).ready(function($){
//Function ==========
	function jQpr9(selector,speed,effect){/* PictureRotator9.animateHorizontal.20121119.MoonYoungShin. mControl< o o o >. */
		var pr1=$(selector);pr1.speed=speed;pr1.stopFlag=false;
		var pr1onnum=0;pr1onnum=parseInt(location.hash.charAt(location.hash.length-1));//초기활성값계산.uri끝값활용
		(!pr1onnum)?pr1.onnum=1:pr1.onnum=pr1onnum;
		pr1.mView=$('.mView',pr1);pr1.mCont=$('.mView>.mCont',pr1);pr1.mContC=$('.mView>.mCont>.mContC',pr1);
		pr1.sum=pr1.mContC.length;
		pr1.prev=$('.mControl .prev',pr1);pr1.next=$('.mControl .next',pr1);pr1.num=$('.mControl .mNum',pr1);
		pr1.stop=$('.mControl .stop',pr1);pr1.play=$('.mControl .play',pr1);
		(pr1.reset=function(){//로딩시
			/* pr1.iw=pr1.mView.innerWidth();
			pr1.mCont.css({width:pr1.iw*(pr1.sum)+'px'});
			pr1.mContC.css({width:pr1.iw+'px'}); */
		})();
		(pr1.changOn=function(){//순번활성온
			pr1.num.each(function(){
				$(this).children().removeClass('on').eq(pr1.onnum-1).addClass('on');
			});
		})();
		(pr1.action=function(effect){//액션
			switch(effect){
			//case'slide':pr1.mCont.animate({left:(1-pr1.onnum)*pr1.iw},'fast','swing',function(){pr1.changOn();});break;
			//default:pr1.mCont.css('left',(1-pr1.onnum)*pr1.iw+'px');pr1.changOn();
			default:pr1.changOn();
			}
		})();
		pr1.prev.click(function(e){e.preventDefault();//이전클릭
			pr1.onnum-=1;if(pr1.onnum<1)pr1.onnum=pr1.sum;pr1.action(effect);
		});
		pr1.next.click(function(e){e.preventDefault();//다음클릭
			pr1.onnum+=1;if(pr1.onnum>pr1.sum)pr1.onnum=1;pr1.action(effect);
		});
		
		/*추가*/
		pr1.next.mouseout(function(){pr1.stopFlag=false;pr1.action(effect);return false;});
		$('.m',pr1.num).click(function(e){e.preventDefault();//순번클릭.20121119
			pr1.onnum=$(this).parent().index()+1;pr1.action(effect);
		});
		
		pr1.find('.mControl .stop').click(function(){
	    pr1.stopFlag=true;pr1.action(effect);return false;
	    $('.play').hide;
	    });
		/**/
		
		pr1.find('.mControl .play').click(function(){pr1.stopFlag=false;pr1.action(effect);return false;});
		$('.m',pr1.num).click(function(e){e.preventDefault();//순번클릭.20121119
			pr1.onnum=$(this).parent().index()+1;pr1.action(effect);
		});
		$(window).resize(function(){pr1.reset();pr1.action(effect);});//창크기변경.oriented,..
		//auto
		pr1.actionNext=function(){if(!pr1.stopFlag)pr1.find('.mControl .next').click();}
		pr1.timer1=setInterval(pr1.actionNext,pr1.speed);
		//accessibility
		//pr1.find('button, a').bind('focus mouseover',function(){clearInterval(pr1.timer1);});
		pr1.stop.click(function(e){e.preventDefault();//멈춤클릭
			pr1.stopFlag=true;
			clearInterval(pr1.timer1);
		});
		pr1.play.click(function(e){e.preventDefault();//재생클릭
			pr1.stopFlag=false;
			clearInterval(pr1.timer1);
			pr1.timer1=setInterval(pr1.actionNext,pr1.speed);
		});
	}
//jQ적용 ==========
	//메인
	jQpr9('.banner1',3000);
	
	jQpr9('#shopBanner1',10000000000000000);
	jQpr9('#shopBanner2',10000000000000000);
	jQpr9('#shopBanner3',10000000000000000);
	jQpr9('#shopBanner4',10000000000000000);
	jQpr9('#shopBanner5',10000000000000000);
	jQpr9('#shopBanner6',10000000000000000);
	jQpr9('#shopBanner7',10000000000000000);
	jQpr9('#shopBanner8',10000000000000000);
	jQpr9('#shopBanner9',10000000000000000);
	jQpr9('#shopBanner10',10000000000000000);
			
});//jQuery end
function randomRange(n1,n2){return Math.floor((Math.random()*(n2-n1+1))+n1);}//Random Integer


function snsPostScript(snsAlias, appnameStr, fullImgaeUrl, cmaMobileCheck) {
	
	var tmp_device_type = "";
	var tmp_app_obj = "";
	var tmp_url = "";
	var tmp_open = "";
	var tmp_winopt = "";
	
	var currentlyFullUrl = document.location.href;
	var msgCommonStr = "오아시스 마켓 상품 추천";
	var val_msg = encodeURIComponent(msgCommonStr);
	var val_url = encodeURIComponent(currentlyFullUrl);
	var val_img = encodeURIComponent(fullImgaeUrl);
	var val_title = encodeURIComponent(appnameStr);

	if(snsAlias == "twitter") {
			tmp_device_type = "";
			tmp_url = "http://twitter.com/home?status="+val_msg;
			tmp_url += " ";
			tmp_url += val_url;

			tmp_winopt = "";
			tmp_open = window.open(tmp_url, "share_"+snsAlias, tmp_winopt);

	} else if(snsAlias == "facebook") {
			tmp_device_type = "";
			tmp_url = "http://www.facebook.com/sharer.php?u="+val_url;
			tmp_url += "&t="+val_msg;
			
			tmp_winopt = "";
			tmp_open = window.open(tmp_url, "share_"+snsAlias, tmp_winopt);

	} else if(snsAlias == "kakaotalk") {
			tmp_device_type = "mobile";
			if(cmaMobileCheck) { // 모바일때만
				Kakao.Link.sendDefault({
					objectType: 'feed',
					content: {
						title: appnameStr,
						imageUrl: fullImgaeUrl,
						link: {
							mobileWebUrl: currentlyFullUrl,
							webUrl: currentlyFullUrl
						}
					},
					buttons: [
					    {
					    	title: '웹으로 보기',
					    	link: {
					    		mobileWebUrl: currentlyFullUrl,
					    		webUrl: currentlyFullUrl
					    	}
					    },
					    {
					    	title: '앱으로 보기',
					    	link: {
					    		mobileWebUrl: currentlyFullUrl,
					    		webUrl: currentlyFullUrl
					    	}
					    }]
					});
			} else {
				https://accounts.kakao.com/login?continue=https://sharer.kakao.com/talk/friends/picker/shortlink/fq`9zh:jO@s22jn5a/w^;i9HidKpllew5KPusJRykzroh?mteexP6Zs^aH97y0e>
				tmp_device_type = "";
				tmp_url = "https://story.kakao.com/share?url="+val_url;
				tmp_winopt = "width=400,height=454,scrollbars=no,resizable=no";
				tmp_open = window.open(tmp_url, "share_"+snsAlias, tmp_winopt);
			}
	} else if(snsAlias == "kakaostory") {
			if(cmaMobileCheck) { // 모바일때만
				tmp_device_type = "mobile";
				
				Kakao.Story.share({
					url: currentlyFullUrl,
					text: appnameStr
				});
				
			} else {
				tmp_device_type = "";
				tmp_url = "https://story.kakao.com/share?url="+currentlyFullUrl;
				tmp_winopt = "width=400,height=454,scrollbars=no,resizable=no";
				tmp_open = window.open(tmp_url, "share_"+snsAlias, tmp_winopt);
			}

	} else if(snsAlias == "gplus") {
			tmp_device_type = "";
			tmp_url = "https://plus.google.com/share?url="+val_url + "&t=" + val_msg;
			tmp_winopt = "resizable=no,status=no,location=no,toolbar=no,menubar=no,fullscreen=no,scrollbars=no,dependent=no,width=600,height=450";
			tmp_open = window.open(tmp_url, "share_"+snsAlias, tmp_winopt);

	} else if(snsAlias == "band") {
		var band_text = val_msg+"\r\n더보기=>\r\n홈페이지 : "+val_url;

			if(cmaMobileCheck) { // 모바일때만
				tmp_device_type = "mobile";
				tmp_app_obj = {
					method:'web2app',
					param:'create/post?text=' + band_text,
					a_store:'itms-apps://itunes.apple.com/app/id542613198?mt=8',
					g_store:'market://details?id=com.nhn.android.band',
					a_proto:'bandapp://',
					g_proto:'scheme=bandapp;package=com.nhn.android.band'
				};

				if(navigator.userAgent.match(/android/i)) {// Android
					setTimeout(function(){ location.href = 'intent://'+tmp_app_obj.param+'#Intent;'+tmp_app_obj.g_proto+';end'}, 100);
				}

				if(navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i)) {// Apple
					setTimeout(function(){ location.href = tmp_app_obj.a_store; }, 200);
					setTimeout(function(){ location.href = tmp_app_obj.a_proto + tmp_app_obj.param }, 100);
				}

			} else {
				tmp_device_type = "";
				tmp_url = "http://www.band.us/plugin/share?body="+band_text;
				tmp_url += "&route="+val_url;
				tmp_winopt = "";
				tmp_open = window.open(tmp_url, "share_"+snsAlias, tmp_winopt);
			}

	}

	if(!tmp_device_type) {
			if (tmp_open) {
				tmp_open.focus();
			}
	}

}

