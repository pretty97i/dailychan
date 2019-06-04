var Base64 = {
	keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
	
	encode: function(input) {
		var output = "";
		var chr1, chr2, chr3;
		var enc1, enc2, enc3, enc4;
		var i = 0;
		
		do {
			chr1 = input.charCodeAt(i++);
			chr2 = input.charCodeAt(i++);
			chr3 = input.charCodeAt(i++);
			
			enc1 = chr1 >> 2;
			enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
			enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
			enc4 = chr3 & 63;
			
			if (isNaN(chr2)) {
				enc3 = enc4 = 64;
			} else if (isNaN(chr3)) {
				enc4 = 64;
			}
			
			output = output 
					+ this.keyStr.charAt(enc1)
					+ this.keyStr.charAt(enc2)
					+ this.keyStr.charAt(enc3)
					+ this.keyStr.charAt(enc4);
		} while (i < input.length);

		return output;
	},
	
	decode: function(input) {
		var output = "";
		var chr1, chr2, chr3;
		var enc1, enc2, enc3, enc4;
		var i = 0;
		
		// remove all characters that are not A-Z, a-z, 0-9, +, /, or =
		input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
		
		do {
			enc1 = this.keyStr.indexOf(input.charAt(i++));
			enc2 = this.keyStr.indexOf(input.charAt(i++));
			enc3 = this.keyStr.indexOf(input.charAt(i++));
			enc4 = this.keyStr.indexOf(input.charAt(i++));
			
			chr1 = (enc1 << 2) | (enc2 >> 4);
			chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
			chr3 = ((enc3 & 3) << 6) | enc4;
			
			output = output + String.fromCharCode(chr1);
			
			if (enc3 != 64) {
				output = output + String.fromCharCode(chr2);
			}
			if (enc4 != 64) {
				output = output + String.fromCharCode(chr3);
			}
		} while (i < input.length);
		
		return output;
	},
	
	encode64Han: function(str) {
		return this.encode(escape(str));
	},
	
	decode64Han: function(str) {
		return unescape(this.decode64(str));
	}
};

if (window.console == undefined) {
	window.console = {};
	window.console.log = function(p) {};
}

// 왼쪽 메뉴
$(document).ready(function() {
	$(".allCateList .depth1").click(function() {
		var $group = $(this).parents(".group");

		if ( $group.find(".sub").length == 0 ) {
			var categoryId = $(this).data("categoryid");
			categoryProducts(categoryId);
		}
		else if ( !$group.hasClass("active") ) {
			$(".cateList .active .sub").slideUp("fast");
			$(".bgActive").removeClass("bgActive");
			$(".allCateList .group").removeClass("active");
			
			$(this).next().slideDown("fast");
			$(this).addClass("bgActive");
			$(this).parent().addClass("active");
		}
		
		return false;
	});
	
	// 왼쪽 퀵메뉴 마우스 롤오버
	$(".sideMenuList .hoverable").hover(function() {
		$(this).attr("src", $(this).attr("src").replace("_off","_on"));
	}, function() {
		$(this).attr("src", $(this).attr("src").replace("_on","_off"));
	});
	
	// 검색.
	$("#keyword").on("keydown", function(e) {
		if (e.keyCode == 13) {
			searchProduct("keyword");
		}
	});
	$("#keyword2").on("keydown", function(e) {
		if (e.keyCode == 13) {
			searchProduct("keyword2");
		}
	});
	
	// 쿠키에 저장된 검색 개수 설정.
	var rows = $.cookie("rows");
	if (!rows) rows = 60;
	changeRows(rows, false);
	
	// 좌측 고정 메뉴.
	$(window).scroll(fixDiv1);
});


// 전체카테고리 보기
function allCateView(){
	$(".allCateView").show();
}
function allCateViewClose(){
	$(".allCateView").hide();
}


// 왼쪽 따라다니는 메뉴
function fixDiv1() {
	var $cache = $('.sideMenuList'); 

	 $cache.css({'position': 'fixed', 'top': '117px', 'left': '50%', 'margin': '0 0 0 -629px'});
	
}

function fixDiv2() {
	var $cache = $('.floatTabWrap'); 
	if ($(window).scrollTop() > 767) 
		$cache.css({'position': 'fixed', 'top': '0', 'left': '50%', 'margin': '0 0 0 -547px'});
	else
		$cache.css({'position': 'absolute', 'top': '-90px', 'left': '50%', 'margin': '0 0 0 -573px'});
}

// 팝업 띄우기
function fnOpenWindow(url, w, h){
	var x = (screen.availWidth - w) / 2;
	var y = (screen.availHeight - h) / 2;
	window.name = "new_window";
	window.open(url, 'popup', 'width=' + w + ', height=' + h + ', top=' + y + ', left=' + x + ', fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbars=yes');
}


/*****************************************************************************
 * 상품 검색.
 *****************************************************************************/

// 검색개수.
function changeRows(rows, isReload) {
	$.cookie("rows", rows, { expires: 7, path: "/" });
	$("input[name='rows']").val(rows);
	if (isReload) page(1);
}

//검색개수. pageGbn : 기획전 2 테마샾 3 브랜드 4 추석장보기 5
function changeRows2(rows, isReload,key,pageGbn) {
	//$.cookie("rows", rows, { expires: 7, path: "/" });
	$("input[name='keyword']").val(key);
	$("input[name='rows']").val(rows);
	if (isReload) page2(1,key,pageGbn);
}

// 카테고리 상품 검색.
function categoryProducts(categoryId) {
	var $listForm = $("#productListForm");
	$listForm.find("input[name='categoryId']").val(categoryId);
	$listForm.find("input[name='page']").val(1);
	$listForm.submit();
}

//카테고리 상품 검색.
function categoryProductSub(categoryId) {
	var $listForm = $("#productListForm");
	$listForm.find("input[name='categoryId']").val(categoryId);
	
	$.ajax({
		url : contextPath + "/product/subList",
		type: "GET",
		dataType: "html",
		data: { categoryId : categoryId, page : 1, rows : 20 },
		success: function(html) {
			$("#productList").html(html);
			
			var pdListImgWd = $(".pdList_1 li .pdListBox .listImg").width();
		    if($(".pdList_1 li .pdListBox").length) {
		        $(".pdList_1 li .pdListBox .listImg").height(pdListImgWd);
		    }
		}
	});
}

// 상품 검색.
function searchProduct(keywordId) {
	if($("#" + keywordId).val() == ""){ //검색어 체크 추가  20150913
		alert("검색어를 입력하세요." );
		$("#" + keywordId).focus();
		return false;
	}
	var $searchForm = $("#productSearchForm");
	$searchForm.find("input[name='keyword']").val($.trim( $("#" + keywordId).val() ));
	$searchForm.find("input[name='page']").val(1);
	$searchForm.find("input[name='sort']").val("priority");
	$searchForm.find("input[name='direction']").val("desc");
	
	$searchForm.submit();
}

// 상품 정렬
function searchProductBySort(formId, sortGbn) {
	var $searchForm = $("#" + formId);
	
	var orderBy = sortGbn.split("|");
	var sort = orderBy[0];
	var direction = orderBy[1];
	
	$searchForm.find("input[name='keyword']").val($.trim( $("#keyword").val() ));
	$searchForm.find("input[name='page']").val(1);
	$searchForm.find("input[name='sort']").val(sort);
	$searchForm.find("input[name='direction']").val(direction);
	
	$searchForm.submit();
}

// 페이지 이동.
function page(no) {
	var $form = null;
	
	if (location.href.lastIndexOf("/search") == -1) {
		$form = $("#productListForm");
	} else {
		$form = $("#productSearchForm");
	}
	
	$form.find("input[name='page']").val(no);
	$form.submit();
}

//페이지 이동. 기획전 2 테마샾 3 브랜드 4 추석장보기 5
function page2(no,key,pageGbn) {
	var $form = null;
	
	/*if (location.href.lastIndexOf("/search2") == -1) {
		$form = $("#productListForm");
	} else {*/
		$form = $("#productSearchForm"+pageGbn);
	/*}*/
	$form.find("input[name='keyword']").val(key);	
	$form.find("input[name='page']").val(no);
	$form.submit();
}

/*****************************************************************************
 * 구매, 장바구니, 찜 관련.
 *****************************************************************************/

// 찜하기.
function addWishList(productId, productPriceId) {
	$.ajax({
		url : contextPath + "/wishList/add/" + productId + "-" + productPriceId,
		type: "GET",
		dataType: "json",
		success: function(response) {
			if (response.status == "OK") {
				if($(".wishListAlertPopup").length) {
					$(".dimm").show();
					$(".wishListAlertPopup").show();
				}
				else
					alert("찜 리스트에 추가되었습니다.");
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}

//찜하기.(옵션)
function addWishListOptionProducts(options) {
	$.ajax({
		url : contextPath + "/wishList/addOptionProduct",
		type: "POST",
		dataType: "json",
		data: {options : JSON.stringify(options)},
		success: function(response) {
			if (response.status == "OK") {
				if($(".wishListAlertPopup").length) {
					$(".dimm").show();
					$(".wishListAlertPopup").show();
				}
				else
					alert("찜 리스트에 추가되었습니다.");
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}

// 찜하기 (다수).
function addWishLists(productKeies) {
	$.ajax({
		url : contextPath + "/wishList/add",
		type: "POST",
		dataType: "json",
		data: { productKeies: productKeies },
		success: function(response) {
			if (response.status == "OK") {
				if($(".wishListAlertPopup").length) {
					$(".dimm").show();
					$(".wishListAlertPopup").show();
				}
				else
					alert("찜 리스트에 추가되었습니다.");
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}

// 찜 삭제
function deleteWishList(productId, productPriceId) {
	$.ajax({
		url : contextPath + "/wishList/delete/" + productId + "-" + productPriceId,
		type: "GET",
		dataType: "json",
		success: function(response) {
			if (response.status == "OK") {
				alert("삭제 되었습니다.");
				window.location.reload(true);
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}

// 찜 삭제 (다수).
function deleteWishLists(productKeies) {
	$.ajax({
		url : contextPath + "/wishList/delete",
		type: "POST",
		dataType: "json",
		data: { productKeies: productKeies },
		success: function(response) {
			if (response.status == "OK") {
				alert("삭제 되었습니다.");
				window.location.reload(true);
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}

// 장바구니 담기.
function addCart(productId, productPriceId, paramQuantity) {
	
	var quantity = 1;
	
	if(paramQuantity)
		quantity = paramQuantity;
	else {
		var $quantity = $("#quantity");
		
		if ($quantity.size() == 1) {
			quantity = $.trim( $quantity.text() );
		}
	}
	
	
	$.ajax({
		url : contextPath + "/cart/add/" + productId + "-" + productPriceId + "/" + quantity,
		type: "GET",
		dataType: "json",
		success: function(response) {
			if (response.status == "OK") {
				if($(".cartAlertPopup").length) {
					$(".dimm").show();
					$(".cartAlertPopup").show();
				}
				else {
					getMyCartList(1);
				}
				
				//헤더 장바구니 갯수 업데이트
				var data = response.data;
				$("#sessionCartCnt").text(data.cartCnt);
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}

// 장바구니 담기.(다수)
function addCarts(productKeies) {
	$.ajax({
		url : contextPath + "/cart/add",
		type: "POST",
		dataType: "json",
		data: { productKeies: productKeies },
		success: function(response) {
			if (response.status == "OK") {
				if($(".cartAlertPopup").length) {
					$(".dimm").show();
					$(".cartAlertPopup").show();
				}
				else {
					getMyCartList(1);
				}
				
				//헤더 장바구니 갯수 업데이트
				var data = response.data;
				$("#sessionCartCnt").text(data.cartCnt);
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}


//장바구니 담기.(옵션)
function addCartOptionProducts(options) {
	$.ajax({
		url : contextPath + "/cart/addCartOptionProduct",
		type: "POST",
		dataType: "json",
		data: {options : JSON.stringify(options)},
		success: function(response) {
			if (response.status == "OK") {
				if($(".cartAlertPopup").length) {
					$(".dimm").show();
					$(".cartAlertPopup").show();
				}
				else {
					getMyCartList(1);
				}
				
				//헤더 장바구니 갯수 업데이트
				var data = response.data;
				$("#sessionCartCnt").text(data.cartCnt);
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}

// 즉시구매.
function buyItNow(productId, productPriceId,  quantity) {
	var quantity = 1;
	
	var $quantity = $("#quantity");
	
	if ($quantity.size() == 1) {
		quantity = $.trim( $quantity.text() );
	}
	
	$.ajax({
		url : contextPath + "/cart/add/" + productId + "-" + productPriceId + "/" + quantity,
		type: "GET",
		dataType: "json",
		success: function(response) {
			if (response.status == "OK") {
				var $orderForm = $("#orderForm").empty();
				$orderForm.append("<input type='text' name='cartId' value='" + response.data.cartId + "' />");
				$orderForm.submit();
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}

/**
 * 장바구니 팝업
 * @param page
 */
function getMyCartList(page) {
	 var param = {
               page: page,
           };
       $.ajax({
           url : contextPath + "/cart/mylist",
           type: "GET",
           dataType: "json",
           data: param,
           success: function(data) {
               if (data.status == 'OK') {
               	$("#popCartCnt").text("총 " + data.data.totalDocs + "개 상품");
               	$("#popCartPrice").text(Number(data.data.totalPrice).toLocaleString('en'));
               	var html = "";
               	
               	for (var i = 0; i < data.data.carts.length; i++) {
               		var cartHtml = "<li><img src='" + imgUrl + data.data.carts[i].thumb.filePath +"' alt='장바구니 상품 이미지'/>"
               		    + "<span class='popCartProdTit'>" + data.data.carts[i].title + "</span>"
               		    + "<span class='popCartProdPrice'>" + Number(data.data.carts[i].discountedPrice).toLocaleString('en') + "원</span>"
               		    + "<span class='popCartProdCount'>수량 : " + data.data.carts[i].quantity + "개</span>"
               		    + "</li>";
               		html += cartHtml; 
               	}
               	
               	$(".popProdInfo").html(html);
               	
               	var pageHtml = "";
               	pageHtml += "<a class='cartPageFirst' href='javascript:getMyCartList(1)'></a>";
               	pageHtml += "<a class='cartPagePrev' href='javascript:getMyCartList(" + (Number(data.data.page) - 1) + ")'></a>"; 
               	for (var i = data.data.pageStart; i <= data.data.pageEnd; i++) {
               		if (i == data.data.page) {
               			pageHtml += "<a class='on' href='javascript:getMyCartList(" + i + ")'>" + i + "</a>";	
               		} else {
               			pageHtml += "<a href='javascript:getMyCartList(" + i + ")'>" + i + "</a>";
               		}
               		 
               	}
               	pageHtml += "<a class='cartPageNext' href='javascript:getMyCartList(" + (Number(data.data.page) + 1) + ")'></a>";
               	pageHtml += "<a class='cartPageEnd' href='javascript:getMyCartList(" + data.data.totalPage + ")'></a>";
                    
               	
               	$(".popCartPageWrap").html(pageHtml);
               	$("#cartPop").show();
               	$(".popDim").show();
               } else {
                   alert(data.message);
               }
           }
       });
}

// 여러 상품 구매
function buyProducts(productKeies) {
	$.ajax({
		url : contextPath + "/cart/add",
		type: "POST",
		dataType: "json",
		data: { productKeies: productKeies },
		success: function(response) {
			if (response.status == "OK") {
				var data = response.data;
				var newCartIds = data.newCartIds;
				var $orderForm = $("#orderForm").empty();
				for (i in newCartIds) {
					$orderForm.append("<input type='text' name='cartId' value='" + newCartIds[i] + "' />");
				}
				$orderForm.submit();
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}

//옵션 상품 구매
function buyOptionProducts(options) {
	
	$.ajax({
		url : contextPath + "/cart/addCartOptionProduct",
		type: "POST",
		dataType: "json",
		data: {options : JSON.stringify(options)},
		success: function(response) {
			if (response.status == "OK") {
				var data = response.data;
				var newCartIds = data.newCartIds;
				var $orderForm = $("#orderForm").empty();
				for (i in newCartIds) {
					$orderForm.append("<input type='text' name='cartId' value='" + newCartIds[i] + "' />");
				}
				$orderForm.submit();
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}

//배송추적 팝업.
function deliveryWin(url) {
	window.open(url, "배송추적", "width=800, height=800, resizable=yes");
}
/*****************************************************************************
 * 1:1 상담 관련.
 *****************************************************************************/

function openQuestionDialog(orderId) {
	$.ajax({
		url : contextPath + "/help/question" + ((orderId && orderId != '')?("?orderId=" + orderId):"") ,
		type: "GET",
		dataType: "html",
		success: function(html) {
			$("body").append(html);
			$('.popDim').show();
			$('#questionDialog').show();
		}
	});
}

function QuestionImageUpload() {
//	document.getElementById("attachFile").click();
	
	for (var i = 0; i < 5; i++) {
		if ($("#attachFile" + (i + 1)).val() == "") {
			document.getElementById("attachFile" + (i + 1)).click();
			return;
		}
	}
	
	alert("최대 5개까지 업로드 가능합니다.");
};

function QuestionUploadChg(i) {
    var file = $("#attachFile" + i).val().split("\\");
    if("" != file.value){
//        $("#photo").val(file[file.length-1]);
    	$(".cmAddPhotoWrap").append("<span id='attachedItem" + i + "' class='attachFileItem'>" + file[file.length-1] + "<a href='#' onclick='removeQuestionFile(" + i + "); return false;'></a></span>");
    }
};

function closeQuestionDialog() {
	$('.oasisLayerPop').hide();
	$('.oasisDim').hide();
	$(".popDim").hide();
	$("#questionDialog").remove();
}

function sendQuestion() {
		
	if ($("#isWrite").val() == "1") {
		return;
	}
	
	$("#isWrite").val("1");
	var $form = $("#questionForm");
	
	if ($.trim($form.find("input[name='title']").val()) == "") {
		alert("제목을 입력해주세요.");
		$form.find("input[name='title']").focus();
	}
	else if ($.trim($form.find("textarea[name='question']").val()) == "") {
		alert("내용을 입력해주세요.");
		$form.find("textarea[name='question']").focus();
	}
	else {
		if ($("#targetCommon").is(":checked")) {
			$("#targetStoreId").val(0);
		}
		
		$("#smsAlarmYn").val("Y");
		if(!$("input:checkbox[id='qnaSmsAlarmYn']").is(":checked"))
			$("#smsAlarmYn").val("N");

		$form.ajaxForm({
			dataType: "json",
			success: function(response) {
				if (response.status == "OK") {
					alert("등록되었습니다.");
					closeQuestionDialog();
					window.location.reload(true);
				}
				else {
					alert(response.message);
					$("#isWrite").val("0");
				}
			},
			error: function() {
				alert("오류가 발생했습니다.");
				$("#isWrite").val("0");
			}
		});
		
		$("#questionForm").submit();
	}
}

function removeQuestionFile(seq) {
	document.getElementById("attachFile" + seq).value = "";
	$("#attachedItem" + seq).remove(); 
}

/*****************************************************************************
 * 퀵메뉴
 *****************************************************************************/
var cookieArray = new Array();
var totalCnt = 0;
var totalPage = 0;

var detailUrl = "";
var imgUrl = "";

//퀵메뉴 다음 페이지
function quickMenuGoNext(){
	var quickMenuCurrentPage = parseInt($("#quickMenuCurrentPage").text());
	var viewPage = parseInt(quickMenuCurrentPage + 1);
	
	if(quickMenuCurrentPage == totalPage){
		return;
	}else{
		quickMenuContentSetting(viewPage);	
	}
	
}

//퀵메뉴 이전 페이지
function quickMenuGoPre(){
	var quickMenuCurrentPage = parseInt($("#quickMenuCurrentPage").text());
	var viewPage = parseInt(quickMenuCurrentPage - 1);
	
	if(quickMenuCurrentPage == 1){
		return;
	}else{
		quickMenuContentSetting(viewPage);	
	}
}

function quickMenuContentSetting(viewPage){
	var page = 1;
	var begin = 0;
	if(viewPage != 1){
		page = viewPage-1;
		begin = parseInt(3*page);
	}
	var end = parseInt(begin + 3);
	var str = "";
	if(totalCnt <= end){ end = totalCnt; }
	
	//$("#quickMenuContent").empty();
	
	for(i= begin; i < end; i++){
		var productInfo = unescape(cookieArray[i]).split("|");
		str += '<li>';
		str += '<a href="' + detailUrl + productInfo[0]+'">';
		str += '<img src="' + imgUrl + productInfo[1] +'" alt="상품이미지" />';
		str += '</a>';
		str += '<div class="pop_quick" style="display:none;">';
		str += '<span class="btn_quick_close">';
		str += '<a href="javascript:quickMenuRemove(' + i + ')"><img src="' + contextPath + '/images/common/btn_quick_close.png" alt="닫기" /></a>';
		str += '</span>';
		str += '<div class="txt_product">';
		if(productInfo[2].length > 15)
			str += '<p>' + productInfo[2].substring(0, 12) + '...</p>';
		else
			str += '<p>' + productInfo[2] + '</p>';
		str += '<p><strong>' + comma(productInfo[4]) + '</strong> 원</p>';
		str += '</div>';
		str += '<p><img src="' + contextPath + '/images/common/bg_quick_cnt.png" alt="" /></p>';
		str += '</div>';
		str += '</li>';
	}
	$("#quickMenuContent").html(str);
	$("#quickMenuCurrentPage").text(viewPage);
	
	// 속성에 제거 될 수 있으므로 다시 추가.
	$('#quickMenuContent li').each(function(idx){
		$(this).hover(function(){
			$(this).find('.pop_quick').show()
		},
		function(){
			$('#quickMenuContent .pop_quick').hide();
		})
	});
}


function quickMenuRemove(index){
	//cookieArray[i] 제거
	var productInfo = unescape(cookieArray[index]).split("|");
	cookieArray.splice(index, 1);
	
	totalCnt = cookieArray.length;
	
	// cookie 삭제
	var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() + -1); 
	document.cookie = "viewProduct"+productInfo[0] + "=; path=/; expires=" + expireDate.toGMTString() + ";"
	
	// 화면 재 설정
	var quickMenuCurrentPage = parseInt($("#quickMenuCurrentPage").text());
	
	if(quickMenuCurrentPage != 1 && (Math.floor(cookieArray.length / 5) + 1) < quickMenuCurrentPage)
		quickMenuCurrentPage = quickMenuCurrentPage -1;
	
	quickMenuContentSetting(quickMenuCurrentPage);
}

/*****************************************************************************
 * 입점문의
 *****************************************************************************/

function openContactUsDialog() {
	$.ajax({
		url : contextPath + "/contactUs/contact",
		type: "GET",
		dataType: "html",
		success: function(html) {
			$("body").append(html);
			$('.oasisDim').show();
			$('.oasisLayerPop').show();
		}
	});
}

function closeContactUsDialog() {
	$('.oasisLayerPop').hide();
	$('.oasisDim').hide();
	$("#contactUsDialog").remove();
}

function requestContactUs(gbn) {
	var $form = $("#contactUsForm");
	
	if ($.trim($form.find("input[name='company']").val()) == "") {
		alert("회사명을 입력해주세요.");
		$form.find("input[name='company']").focus();
	}
	else if ($.trim($form.find("input[name='userNm']").val()) == "") {
		alert("담당자명을 입력해주세요.");
		$form.find("input[name='userNm']").focus();
	}
	else if ($.trim($form.find("input[name='tel']").val()) == "") {
		alert("연락처를 입력해주세요.");
		$form.find("input[name='tel']").focus();
	}
	/*
	else if ($form.find("input[name='termsAgreeYn']:checked").val() != 'Y') {
		alert("약관에 동의해 주세요.");
	}*/
	else if ($.trim($form.find("textarea[name='description']").val()) == "") {
		alert("내용을 입력해주세요.");
		$form.find("textarea[name='description']").focus();
	}
	else {
		$form.ajaxForm({
			dataType: "json",
			success: function(response) {
				if (response.status == "OK") {
					alert("입점문의가 등록되었습니다.");
					if(gbn == 'M')
						self.close();
					else {
						window.location.reload(true);
					}
				}
				else {
					alert(response.message);
				}
			},
			error: function() {
				alert("오류가 발생했습니다.");
			}
		});
		$("#contactUsForm").submit();
	}
}

function contactUsFileUpload() {
	document.getElementById("attachFile").click();
};

function contactUsUploadChg() {
    var file = $("#attachFile").val().split("\\");
    if("" != file.value){
        $("#uploadFile").val(file[file.length-1]);
    }
};


/*****************************************************************************
 * 고객 추천 코더
 *****************************************************************************/

function openCustRecommendDialog() {
	$.ajax({
		url : contextPath + "/custRecommend/layerForm",
		type: "GET",
		dataType: "html",
		success: function(html) {
			$("body").append(html);
			$('.oasisDim').show();
			$('.oasisLayerPop').show();
		}
	});
}

function closeCustRecommendDialog() {
	$('.oasisLayerPop').hide();
	$('.oasisDim').hide();
	$("#custRecommendDialog").remove();
}


function requestCustRecommend(gbn) {
	var $form = $("#contentForm");
	
	if ($.trim($form.find("input[name='title']").val()) == "") {
		alert("추천할 상품명을 입력해주세요.");
		$form.find("input[name='title']").focus();
	}
	else if ($.trim($form.find("textarea[name='description']").val()) == "") {
		alert("추천 이유를 입력해주세요.");
		$form.find("textarea[name='description']").focus();
	}
	else {
		$form.ajaxForm({
			dataType: "json",
			success: function(response) {
				if (response.status == "OK") {
					alert("상품 추천글이 등록되었습니다.");
					//location.href = contextPath + "/custRecommend/list";
					if(gbn == 'M')
						self.close();
					else
						closeCustRecommendDialog();
				}
				else {
					alert(response.message);
				}
			},
			error: function() {
				alert("오류가 발생했습니다.");
			}
		});
		$("#contentForm").submit();
	}
}

/*****************************************************************************
 * 검색 history (mobile)
 *****************************************************************************/
var keywordCookieArray = new Array();
function keywordCookieContentSetting(){
	var str = "";
	for(var i= 0; i < keywordCookieArray.length; i++){
		var keywordInfo = unescape(keywordCookieArray[i]).split("|");
		str += '<li>';
		str += '<a href="#" onclick="javascript:setKeyword(\'' + keywordInfo[1] +'\')" class="scwListTxt">' + keywordInfo[1] + '</a>';
		str += '<a href="#" onclick="javascript:keywordCookieRemove(' + i + ')" class="scwListDel">삭제</a>';
		str += '</li>';
	}
	$("#keywordHistoryContent").html(str);
}

function keywordCookieRemove(index){
	//cookieArray[i] 제거
	var keywordInfo = keywordCookieArray[index].split("|");
	keywordCookieArray.splice(index, 1);
	
	// cookie 삭제
	var todayDate = new Date(); 
    todayDate.setDate( todayDate.getDate() - 1 );
    document.cookie = keywordInfo[0] + "=" + escape( '' ) + "; path=/; expires=" + todayDate.toGMTString() + ";";
	
	// 화면 재 설정
    keywordCookieContentSetting();
}
/*****************************************************************************
 * Utils
 *****************************************************************************/

// 3자리 수 콤마.
function comma(str) {
	str = String(str);
	return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 콤마제거.
function uncomma(str) {
	str = String(str);
	return str.replace(/[^\d]+/g, '');
}

// 즐겨찾기 추가.
function addFavorite() {
	var title = document.title; // 현재 보고 있는 페이지의 Title
	var url = location.href; // 현재 보고 있는 페이지의 Url
	
	// firefox
	if (window.sidebar && window.sidebar.addPanel) {
		window.sidebar.addPanel(title, url, "");
	}
	// opera
	else if (window.opera && window.print) {
		var elem = document.createElement('a');
		elem.setAttribute('href', url);
		elem.setAttribute('title', title);
		elem.setAttribute('rel', 'sidebar');
		elem.click();
	}
	// msie
	else if (document.all) {
		window.external.AddFavorite(url, title);
	}
	else {
		alert("해당브라우저는 즐겨찾기 추가기능이 지원되지 않습니다.\n\n수동으로 즐겨찾기에 추가해주세요.");
	}
}

// 한글 입력 방지
function fnNotInputHan(obj)
{
    //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46 )
    	return;
    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
}

// 글자수 자르기
function cutByLength(s, len) {
	if (s == null || s.length == 0) {
		return 0;
	}
	var size = 0;
	var rIndex = s.length;

	for ( var i = 0; i < s.length; i++) {
		size += this.charByteSize(s.charAt(i));
		if( size == len ) {
			rIndex = i + 1;
			break;
		} else if( size > len ) {
			rIndex = i;
			break;
		}
	}
	return s.substring(0, rIndex);
}

function charByteSize(ch) {

	if (ch == null || ch.length == 0) {
		return 0;
	}

	var charCode = ch.charCodeAt(0);

	if (charCode <= 0x00007F) {
		return 1;
	} else if (charCode <= 0x0007FF) {
		return 2;
	} else if (charCode <= 0x00FFFF) {
		return 3;
	} else {
		return 4;
	}
}


function phoneFormat(num) {
	if(num == null || num == '')
		return '';
	else
		return num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
}

function readFile(fileElementId, $viewer) {
	var file = document.getElementById(fileElementId).files[0];

	var reader = new FileReader();

	reader.onload = function() {
		var base64Str = Base64.encode(reader.result);
		$viewer.attr("src", "data:image/jpeg;base64," + base64Str);
		$viewer.data("base64", base64Str);
	};

	reader.onerror = function(event) {
		alert(event.target.error.code);
	};

	reader.readAsBinaryString(file);
};

/*****************************************************************************
 * 오아시스 24 배송조회
 *****************************************************************************/

function openOasis24Dialog(orderId) {
	$.ajax({
		url : contextPath + "/myPage/doorToDoor/" + orderId,
		type: "GET",
		dataType: "html",
		success: function(html) {
			$("body").append(html);
			$('.popDim').show();
			$('.oasisLayerPop').show();
		}
	});
}

function closeOasis24Dialog() {
	$('.oasisLayerPop').hide();
	$('.popDim').hide();
	$("#oasis24Dialog").remove();
}

/*****************************************************************************
 * 레시피 관련.
 *****************************************************************************/
// 레시피 찜하기.
function addRecipeWishlist(contentNo, callback) {
	$.ajax({
		url : contextPath + "/company/story/recipe/addWishlist/" + contentNo,
		type: "GET",
		dataType: "json",
		success: function(response) {
			if (response.status == "OK") {
				if ($.isFunction(callback))
					callback(response);
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}

// 레시피 찜 삭제
function deleteRecipeWishlist(contentNo, callback) {
	$.ajax({
		url : contextPath + "/company/story/recipe/delWishlist/" + contentNo,
		type: "GET",
		dataType: "json",
		success: function(response) {
			if (response.status == "OK") {
				if ($.isFunction(callback))
					callback(response);
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}
// 레시피 삭제 다수
function deleteRecipeWishlists(contentNos, callback) {
	$.ajax({
		url : contextPath + "/company/story/recipe/delWishlist",
		type: "POST",
		dataType: "json",
		data: { contentNos: contentNos },
		success: function(response) {
			if (response.status == "OK") {
				if ($.isFunction(callback))
					callback();
			}
			else {
				alert(response.message);
			}
		},
		error: function() {
			location.href = contextPath + "/login?redirect=true";
		}
	});
}