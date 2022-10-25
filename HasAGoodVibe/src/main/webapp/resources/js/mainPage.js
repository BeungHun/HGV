/**
 *  User 관련 JS
 */
 
 		// 이미지 미리보기 셋팅
    	function multipleImageEventSet() {
	    	const inputMultipleImages = document.querySelectorAll(".input-multiple-image");
	        for(inputMultipleImage of inputMultipleImages){
				inputMultipleImage.addEventListener("change", e => {
				    readMultipleImage(e.target)
				});
	        };
		};
		
 		//미리보기
		function readMultipleImage(input) {
			var modalBox = input.closest(".modal");
		    
			if(modalBox.getAttribute('id') == 'requestModal'){
				var multipleContainer = document.getElementsByClassName("multiple-container2");
			}else{
				var multipleContainer = modalBox.getElementsByClassName("multiple-container");
			}
				
		    for(i of multipleContainer){
		    	i.innerHTML = "";
			    // 인풋 태그에 파일들이 있는 경우
			    if(input.files) {
			        // 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
			        const fileArr = Array.from(input.files)
			        fileArr.forEach((file, index) => {
			        	const reader = new FileReader();
			        	const $imgDiv = document.createElement("div");
			        	$imgDiv.classList.add("col-2");
			        	const $img = document.createElement("img");
			        	$img.classList.add("fileloadimage");
			        	const $label = document.createElement("label");
			        	$label.classList.add("image-label");
			        	$label.textContent = file.name;
			        	$imgDiv.appendChild($img);
			        	$imgDiv.appendChild($label);
			        	reader.onload = e => {
			        		$img.src = e.target.result;
			        		$imgDiv.style.width = ($img.naturalWidth) * 0.2 + "px";
			        		console.log($img.naturalWidth);
			        		$imgDiv.style.height = ($img.naturalHeight) * 0.2 + "px"
			        	}
			        	reader.readAsDataURL(file);
			        	i.appendChild($imgDiv);
			        });
			        
			    }
		    }
		}
 		
	    
 		// 모달_상세페이지 캐러셀 사진 이미지 제일 큰 높이로 맞추기
	    function carouseBoxImgHeight(elm){
	        const cardModalId = document.getElementById(elm);
	        
	        const carouseImageBox = cardModalId.getElementsByClassName('sub-img');
	        const carouselThumbsBox = cardModalId.querySelector('.carousel-thumbs')
	        const thumbsBox = cardModalId.querySelector('.imageBox_full')
	        var arouseImgHeightValue = 0;
	
	        for(let i of carouseImageBox){
	            imgBox = i.children[0];
	
	            if(imgBox.height > arouseImgHeightValue){
	                arouseImgHeightValue = imgBox.height;
	            }
	        }
	
	        carouselThumbsBox.style.height = arouseImgHeightValue*0.2;
	        thumbsBox.style.height = arouseImgHeightValue*0.8;
	        
	    }
	
	    // 메인페이지_카드 이미지 제일 큰 높이로 맞추기
	    function modalBoxImgHeight(){
            const modalImageBox = document.getElementsByClassName('modal_imageBox')
            var modalImgHeightValue = 0;
 
            for(i of modalImageBox){
                imgBox = i.getElementsByTagName('img');
                if(imgBox[0].height > modalImgHeightValue){
                    modalImgHeightValue = imgBox[0].height;
                }
            }
            for(i of modalImageBox){
                i.style.height = modalImgHeightValue + "px";
            }
        }
	
	    // 카드상세보기 카드선택시 썸네일 변경
	    function showTargetImg(elm, cardNo) {
	        const selectImg = elm.children[0];
	        const selectImgSrc = selectImg.src;
	        const modalBox = elm.closest('.modal-body')
	        const repreImg = modalBox.querySelector('.represImg');
	        repreImg.src = selectImgSrc;
	
	        const subImgs = modalBox.getElementsByClassName('sub-img');
	        for(img of subImgs) {
	            imgBox = img.children[0];
	            imgBox.classList.remove('selected');
	        }
	        selectImg.classList.add('selected');
	    }
	    
		// Tab 채우기 바꾸기 
	    function storeTabs(elm){
	        var navTabsBox = elm.closest(".nav-tabs");
	        var navLinks = navTabsBox.getElementsByClassName("nav-link");
	        for(i of navLinks){
	            i.classList.remove("active");
	        }
	        elm.classList.add("active");
	    }
		
		// 자바 스크립트로 데이트 포맷 바꾸기
		function formatDate(date) {
		    var d = new Date(date),
		        month = '' + (d.getMonth() + 1),
		        day = '' + d.getDate(),
		        year = d.getFullYear();

		    if (month.length < 2) 
		        month = '0' + month;
		    if (day.length < 2) 
		        day = '0' + day;

		    return [year, month, day].join('-');
		}
		
	    // 원 표시 자동변환 script
	    function changeMoneyUnit() {
	        var moneyValue = document.querySelectorAll(".money");
	        const moneyUnit = "원"
        	var regex = /[^0-9]/g;
	        for(i of moneyValue){
	            result = i.innerText.toString().replace(regex,"").replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	            result = result.concat(moneyUnit);
	            i.innerText = result;
	        };
	    };
	  
	    
	    
	    
	    
	    
	    //AJAX
	    
	    
	    
	
	
		//찜하기 Onclick Funtion 
	    function doLikeCard(cardNo){
	        
	        if(memberNo == 0){
	            var result = confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?");
	            if(result == true) location.href = "../member/loginPage";
	            return;
	        }
	        
	        if(stylistNo != 0){
	            alert('회원만 가능한 기능입니다.');
	            return;
	        }

	        var stylistCardNo = cardNo;
	        
	        var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	        xhr.onreadystatechange = function () {
	            if(xhr.readyState == 4 && xhr.status == 200){
	                var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
	                refreshUserCardLike();
	                totalCardLike();
	                
	            }
	        }
	        xhr.open("post" , "../user/doLikeCard"); //리퀘스트 세팅..
	        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	        xhr.send("stylist_card_no=" + stylistCardNo); //AJAX로 리퀘스트함..
	    }
		
		//Modal : 요청하기 Ajax
		function requestOrder(elm){
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					/* 요청하기 모달에 정보기입 */
					var requestModalBox = document.getElementById("requestModal");
					
					var modalTitleBox = requestModalBox.querySelector(".modal-title");
					modalTitleBox.innerText = "";
					modalTitleBox.innerText = jsonObj.stylist.memberVo.member_nick + " 님에게 요청하기";
					
					var requestStylistCardNo = requestModalBox.querySelector("#requestStylistCardNo");
					requestStylistCardNo.value = jsonObj.stylist.stylist_CardVo.stylist_card_no;
					var requestPrice = requestModalBox.querySelector("#requestPrice");
					requestPrice.value = jsonObj.stylist.stylist_CardVo.stylist_card_price;
					
					var requestUserHeight = requestModalBox.querySelector("#requestHeight");
					requestUserHeight.value = jsonObj.user.userVo.user_heigth;
					var requestUserWeight = requestModalBox.querySelector("#requestWeight");
					requestUserWeight.value = jsonObj.user.userVo.user_weight;
					var requestUserTop = requestModalBox.querySelector("#requestTop");
					requestUserTop.value = jsonObj.user.userVo.user_top;
					var requestUserBottom = requestModalBox.querySelector("#requestBottom");
					requestUserBottom.value = jsonObj.user.userVo.user_bottom;
					var requestUserShoes = requestModalBox.querySelector("#requestShoes");
					requestUserShoes.value = jsonObj.user.userVo.user_shoes;
					var requestModalFooter = requestModalBox.querySelector(".modal-footer");
					var modalFooterButton = requestModalFooter.querySelector(".btn");
					modalFooterButton.setAttribute("data-bs-target", "#cardModal_" + jsonObj.stylist.stylist_CardVo.stylist_card_no);
					
					/* 주문하기 모달에 정보기입 */
					var ordertModalBox = document.getElementById("ordertModal");
					var modalTitleBox = ordertModalBox.querySelector(".modal-title");
					modalTitleBox.innerText = "";
					modalTitleBox.innerText = jsonObj.stylist.memberVo.member_nick + " 님에게 요청하기";
					
					var orderUserBox = ordertModalBox.querySelector("#orderUser");
					orderUserBox.innerText = "";
					orderUserBox.innerText = jsonObj.user.memberVo.member_nick;
					var orderStylistBox = ordertModalBox.querySelector("#orderStylist");
					orderStylistBox.innerText = "";
					orderStylistBox.innerText = jsonObj.stylist.memberVo.member_nick;
					var orderSalepriceBox = ordertModalBox.querySelector("#orderSaleprice");
					orderSalepriceBox.innerText = "";
					orderSalepriceBox.innerText = jsonObj.stylist.stylist_CardVo.stylist_card_price;
					var userCashBox = ordertModalBox.querySelector("#userCash");
					userCashBox.innerText = "";
					userCashBox.innerText = jsonObj.user.memberVo.member_cash;
					
					var modalFooterBox = ordertModalBox.querySelector(".modal-footer");
					modalFooterBox.innerHTML = "";
					
					var orderCompleteBox = document.createElement("button");
			        orderCompleteBox.setAttribute("class", "btn btn-primary");
			        orderCompleteBox.setAttribute("data-bs-target", "#requestModal");
			        orderCompleteBox.setAttribute("data-bs-toggle", "modal");
			        orderCompleteBox.setAttribute("data-bs-dismiss", "modal");
			        orderCompleteBox.innerText = "";
			        orderCompleteBox.innerText = "이전";
			        modalFooterBox.appendChild(orderCompleteBox);
			        
					if(jsonObj.user.memberVo.member_cash >= jsonObj.stylist.stylist_CardVo.stylist_card_price){
						var afterCashBox = ordertModalBox.querySelector("#afterCash");
						afterCashBox.innerText = "";
						afterCashBox.innerText = jsonObj.user.memberVo.member_cash - jsonObj.stylist.stylist_CardVo.stylist_card_price;
						
						var orderCompleteBox = document.createElement("button");
				        orderCompleteBox.setAttribute("onclick", "requestOrderProcess()");
				        orderCompleteBox.setAttribute("class", "btn btn-primary");
				        orderCompleteBox.setAttribute("data-bs-target", "#ordertCompleteModal");
				        orderCompleteBox.setAttribute("data-bs-toggle", "modal");
				        orderCompleteBox.setAttribute("data-bs-dismiss", "modal");
				        orderCompleteBox.innerText = "";
				        orderCompleteBox.innerText = "확인";
				        modalFooterBox.appendChild(orderCompleteBox);
					}else{
						var afterCashBox = ordertModalBox.querySelector("#afterCash");
						afterCashBox.classList.remove("money");
						afterCashBox.innerText = "";
						afterCashBox.innerText = "소지 적립금이 부족합니다";
						
						// 여기에 충전 페이지로 가는 버튼 넣을지 말지는 선택
					}
					changeMoneyUnit();
				}
			}
			xhr.open("post" , "../user/orderPage"); //리퀘스트 세팅..
	        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	        xhr.send("stylist_card_no=" + elm); //AJAX로 리퀘스트함..
		}
		
		//결제 모달로 자료 전달
		function orderWriteProcess(){
			var formData = new FormData(document.getElementById("orderWriteProcess"));
			var date = new Date();
			
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();
			var hours = date.getHours();
	        var minutes = date.getMinutes();
	        var orderDate = year + "/" + month + "/" + day + " " + hours + ":" + minutes;
			
			var orderModalBox = document.getElementById("ordertModal");
			var orderCategoryBox = orderModalBox.querySelector('#orderCategory');
			orderCategoryBox.innerText = "";
			orderCategoryBox.innerText = formData.get("card_category_name");
			var orderHeightBox = orderModalBox.querySelector('#orderHeight');
			orderHeightBox.innerText = "";
			orderHeightBox.innerText = formData.get("order_heigth");
			var orderWeightBox = orderModalBox.querySelector('#orderWeight');
			orderWeightBox.innerText = "";
			orderWeightBox.innerText = formData.get("order_weight");
			var orderTopBox = orderModalBox.querySelector('#orderTop');
			orderTopBox.innerText = "";
			orderTopBox.innerText = formData.get("order_top");
			var orderBottomBox = orderModalBox.querySelector('#orderBottom');
			orderBottomBox.innerText = "";
			orderBottomBox.innerText = formData.get("order_bottom");
			var orderShoesBox = orderModalBox.querySelector('#orderShoes');
			orderShoesBox.innerText = "";
			orderShoesBox.innerText = formData.get("order_shoes");
			var orderDateBox = orderModalBox.querySelector('#orderDate');
			orderDateBox.innerText = "";
			orderDateBox.innerText = orderDate;
			var orderContentBox = orderModalBox.querySelector('#orderContent');
			orderContentBox.innerHTML = "";
			orderContentBox.innerHTML = formData.get("order_content");
		}
		
		
		//결제 프로세스
		function requestOrderProcess(){
			var formData = new FormData(document.getElementById("orderWriteProcess"));
			
	        var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	        xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					console.log(jsonObj);
					
					
				}
			}
	        
			xhr.open("post" , "../user/orderWriteProcess"); //리퀘스트 세팅..
 			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); // 콘텐츠 타입을 json으로
			xhr.send(formData); //AJAX로 리퀘스트함..
			
		}
		
		//Modal 5 : Store
		function storeModalInfo(memberNo){
			
			console.log(memberNo);
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					console.log(jsonObj);
					
					var receivedRequestListBox = document.getElementById("receivedRequestList");
				    receivedRequestListBox.innerHTML = "";

				    var row_1 = document.createElement("div");
				    row_1.setAttribute("class", "row text-center align-self-center fs-4 my-3");
				    receivedRequestListBox.appendChild(row_1);
				    var row1Col_1 = document.createElement("div");
				    row1Col_1.setAttribute("class", "col");
				    row_1.appendChild(row1Col_1);
				    var row1Col1_SpanBox = document.createElement("span");
				    row1Col1_SpanBox.innerText = "번호";
				    row1Col_1.appendChild(row1Col1_SpanBox);
				    var row1Col_2 = document.createElement("div");
				    row1Col_2.setAttribute("class", "col");
				    row_1.appendChild(row1Col_2);
				    var row1Col2_SpanBox = document.createElement("span");
				    row1Col2_SpanBox.innerText = "닉네임";
				    row1Col_2.appendChild(row1Col2_SpanBox);
				    var row1Col_3 = document.createElement("div");
				    row1Col_3.setAttribute("class", "col");
				    row_1.appendChild(row1Col_3);
				    var row1Col3_SpanBox = document.createElement("span");
				    row1Col3_SpanBox.innerText = "카테고리";
				    row1Col_3.appendChild(row1Col3_SpanBox);
				    var row1Col_4 = document.createElement("div");
				    row1Col_4.setAttribute("class", "col");
				    row_1.appendChild(row1Col_4);
				    var row1Col4_SpanBox = document.createElement("span");
				    row1Col4_SpanBox.innerText = "금액";
				    row1Col_4.appendChild(row1Col4_SpanBox);
				    var row1Col_5 = document.createElement("div");
				    row1Col_5.setAttribute("class", "col");
				    row_1.appendChild(row1Col_5);
				    var row1Col5_SpanBox = document.createElement("span");
				    row1Col5_SpanBox.innerText = "일자";
				    row1Col_5.appendChild(row1Col5_SpanBox);
				    var row1Col_6 = document.createElement("div");
				    row1Col_6.setAttribute("class", "col");
				    row_1.appendChild(row1Col_6);
				    var row1Col6_SpanBox = document.createElement("span");
				    row1Col6_SpanBox.innerText = "상태";
				    row1Col_6.appendChild(row1Col6_SpanBox);
				    
				    var i = jsonObj.dataList.length;
				    for(let data of jsonObj.dataList){

				        var row_2 = document.createElement("div");
				        row_2.setAttribute("class", "row text-center align-self-center");
				        receivedRequestListBox.appendChild(row_2);

				        var row2Col_1 = document.createElement("div");
				        row2Col_1.setAttribute("class", "col");
				        row_2.appendChild(row2Col_1);
				        var row2Col1_ABox = document.createElement("a");
				        row2Col1_ABox.setAttribute("onclick", "readOrderDetailModal(" + data.orderVo.order_no + ")");
				        row2Col1_ABox.setAttribute("data-bs-target", "#readOrderDetailModal");
				        row2Col1_ABox.setAttribute("data-bs-toggle", "modal");
				        row2Col1_ABox.innerText = i;
				        row2Col_1.appendChild(row2Col1_ABox);

				        var row2Col_2 = document.createElement("div");
				        row2Col_2.setAttribute("class", "col");
				        row_2.appendChild(row2Col_2);
				        var row2Col2_SpanBox = document.createElement("span");
				        row2Col2_SpanBox.innerText = data.memberVo.member_nick;
				        row2Col_2.appendChild(row2Col2_SpanBox);

				        var row2Col_3 = document.createElement("div");
				        row2Col_3.setAttribute("class", "col");
				        row_2.appendChild(row2Col_3);
				        var row2Col3_SpanBox = document.createElement("span");
				        row2Col3_SpanBox.innerText = data.card_category_name;
				        row2Col_3.appendChild(row2Col3_SpanBox);

				        var row2Col_4 = document.createElement("div");
				        row2Col_4.setAttribute("class", "col");
				        row_2.appendChild(row2Col_4);
				        var row2Col4_SpanBox = document.createElement("span");
				        row2Col4_SpanBox.setAttribute("class", "money");
				        row2Col4_SpanBox.innerText = data.orderVo.order_saleprice;
				        row2Col_4.appendChild(row2Col4_SpanBox);

				        var row2Col_5 = document.createElement("div");
				        row2Col_5.setAttribute("class", "col");
				        row_2.appendChild(row2Col_5);
				        var row2Col5_SpanBox = document.createElement("span");
				        row2Col5_SpanBox.innerText = formatDate(data.orderVo.order_date);
				        row2Col_5.appendChild(row2Col5_SpanBox);

				        var row2Col_6 = document.createElement("div");
				        row2Col_6.setAttribute("class", "col");
				        row_2.appendChild(row2Col_6);
				        var row2Col6_SpanBox = document.createElement("span");
				        if(data.orderVo.order_state == "order"){
				            row2Col6_SpanBox.innerText = "대기";
				        }else if(data.orderVo.order_state == "reject"){
				            row2Col6_SpanBox.innerText = "거절";
				        }else if(data.orderVo.order_state == "accept"){
				            row2Col6_SpanBox.innerText = "진행중";
				        }else if(data.orderVo.order_state == "answer"){
				            row2Col6_SpanBox.innerText = "답변완료";
				        }else if(data.orderVo.order_state == "complete"){
				            row2Col6_SpanBox.innerText = "리뷰완료";
				        }else{
				            row2Col6_SpanBox.innerText = "에러";
				        }
				        row2Col_6.appendChild(row2Col6_SpanBox);
				        
				        i--;
				    }
				    
				    changeMoneyUnit();
				}
			}
			xhr.open("get" , "../member/storeModalInfo?member_no=" + memberNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
		}
			
		//Modal 6 : readOrderDetailModal
		function readOrderDetailModal(OrderNo){
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					var readOrderDetailModalBox = document.getElementById("readOrderDetailModal");

				    var orderDetailNameBox = readOrderDetailModalBox.querySelector("#orderDetailNameBox");
				    orderDetailNameBox.innerText =  "";
				    orderDetailNameBox.innerText =  jsonObj.memberVo.member_nick;

				    var orderDetailCategoryBox = readOrderDetailModalBox.querySelector("#orderDetailCategoryBox");
				    orderDetailCategoryBox.innerText = "";
				    orderDetailCategoryBox.innerText = jsonObj.card_category_name;

				    var orderDetailProfileBox = readOrderDetailModalBox.querySelector("#orderDetailProfileBox");
				    orderDetailProfileBox.src = "" 
				    if(jsonObj.memberVo.member_profileimage_link == null){
				        orderDetailProfileBox.src = "../resources/img/noneProfileImg.jpg";
				    }else{
				        orderDetailProfileBox.src = "/uploadFiles/" + jsonObj.memberVo.member_profileimage_link;
				    }
				    
				    var orderDetailStateBox = readOrderDetailModalBox.querySelector("#orderDetailStateBox");
				    orderDetailStateBox.innerText = "";
				    
				    
				    var orderDetailModalButtonBox = readOrderDetailModalBox.querySelector(".modal-footer");
				    orderDetailModalButtonBox.innerHTML = "";
				    var returnButtonBox = document.createElement("button");
				    returnButtonBox.setAttribute("class", "btn btn-primary");
				    returnButtonBox.setAttribute("onclick", "storeModalInfo(" + memberNo +")");
				    returnButtonBox.setAttribute("data-bs-target", "#storeModal");
				    returnButtonBox.setAttribute("data-bs-toggle", "modal");
				    returnButtonBox.setAttribute("data-bs-dismiss", "modal");
				    returnButtonBox.innerText = "이전";
				    orderDetailModalButtonBox.appendChild(returnButtonBox);
				    
				    if(jsonObj.orderVo.order_state == "order"){
				        orderDetailStateBox.innerText = "대기";
				        
				        if(stylistNo != 0){
					        var rejectButtonBox = document.createElement("button");
					        rejectButtonBox.setAttribute("class", "btn btn-primary");
					        rejectButtonBox.setAttribute("onclick", "orderRejectProcess("+ jsonObj.orderVo.order_no +")");
					        rejectButtonBox.innerText = "거절";
						    orderDetailModalButtonBox.appendChild(rejectButtonBox);
						    
						    var acceptButtonBox = document.createElement("button");
						    acceptButtonBox.setAttribute("class", "btn btn-primary");
						    acceptButtonBox.setAttribute("onclick", "orderAcceptProcess("+ jsonObj.orderVo.order_no +")");
						    acceptButtonBox.innerText = "수락";
						    orderDetailModalButtonBox.appendChild(acceptButtonBox);
				        }
				        
				    }else if(jsonObj.orderVo.order_state == "reject"){
				        orderDetailStateBox.innerText = "거절";
				    }else if(jsonObj.orderVo.order_state == "accept"){
				        orderDetailStateBox.innerText = "진행중";
				        
				        
				        var closestPointBox = document.querySelector(".closestPoint");
				        closestPointBox.innerHTML = "";
				        
				        var formBox = document.createElement("form");
				        formBox.setAttribute("id", "orderResponseProcess");
				        formBox.setAttribute("method", "post");
				        formBox.setAttribute("enctype", "multipart/form-data");
				        closestPointBox.appendChild(formBox);
				        
				        
				        var inputHiddenBox =  document.createElement("input");
				        inputHiddenBox.setAttribute("type", "hidden");
				        inputHiddenBox.setAttribute("name", "order_no");
				        inputHiddenBox.setAttribute("value", jsonObj.orderVo.order_no);
				        formBox.appendChild(inputHiddenBox);
				        
				        if(stylistNo != 0){
					        var row1 = document.createElement("div");
					        row1.setAttribute("class", "row bg-secondary text-white my-3");
					        formBox.appendChild(row1);
					        var col1 = document.createElement("div");
					        col1.setAttribute("class", "col");
					        row1.appendChild(col1);
					        var titleBox = document.createElement("h5");
					        titleBox.innerText = "회신"
					        col1.appendChild(titleBox);
					        
					        var row2 = document.createElement("div");
					        row2.setAttribute("class", "row");
					        formBox.appendChild(row2);
					        var col2 = document.createElement("div");
					        col2.setAttribute("class", "col");
					        row2.appendChild(col2);
					        
					        var row3 = document.createElement("div");
					        row3.setAttribute("class", "row multiple-container");
					        col2.appendChild(row3);
					        
					        var row4 = document.createElement("div");
					        row4.setAttribute("class", "row my-3");
					        col2.appendChild(row4);
					        var col3 = document.createElement("div");
					        col3.setAttribute("class", "col");
					        row4.appendChild(col3);
					        var textareaBox = document.createElement("textarea");
					        textareaBox.setAttribute("class", "summernote");
					        textareaBox.setAttribute("name", "styling_content");
					        col3.appendChild(textareaBox);
					        summernoteSetting();
					        
					        var row5 = document.createElement("div");
					        row5.setAttribute("class", "row my-2");
					        col2.appendChild(row5);
					        var col4 = document.createElement("div");
					        col4.setAttribute("class", "col requestStylingGuide");
					        row5.appendChild(col4);
					        var col4SpanBox = document.createElement("span");
					        col4SpanBox.innerText = "* 파일은 이미지파일만 첨부할 수 있습니다.";
					        col4.appendChild(col4SpanBox);
					        
					        var row6 = document.createElement("div");
					        row6.setAttribute("class", "row my-2");
					        col2.appendChild(row6);
					        var col5 = document.createElement("div");
					        col5.setAttribute("class", "col-md-auto");
					        row6.appendChild(col5);
					        var col5_InputBox = document.createElement("input");
					        col5_InputBox.setAttribute("class", "form-control input-multiple-image");
					        col5_InputBox.setAttribute("style", "display: block;");
					        col5_InputBox.setAttribute("type", "file");
					        col5_InputBox.setAttribute("name", "files");
					        col5_InputBox.setAttribute("multiple", "multiple");
					        col5_InputBox.setAttribute("accept", "image/*");
					        col5.appendChild(col5_InputBox);
					        multipleImageEventSet();
					        
					        var tempSaveButtonBox = document.createElement("button");
					        tempSaveButtonBox.setAttribute("class", "btn btn-primary");
					        tempSaveButtonBox.setAttribute("onclick", "storeModalInfo(" + memberNo +")");
					        tempSaveButtonBox.setAttribute("data-bs-target", "#storeModal");
					        tempSaveButtonBox.setAttribute("data-bs-toggle", "modal");
					        tempSaveButtonBox.setAttribute("data-bs-dismiss", "modal");
					        tempSaveButtonBox.innerText = "임시저장";
						    orderDetailModalButtonBox.appendChild(tempSaveButtonBox);
					        
					        var writeResponseButtonBox = document.createElement("a");
					        writeResponseButtonBox.setAttribute("class", "btn btn-primary");
					        writeResponseButtonBox.setAttribute("onclick", "writeResponseProcess()");
					        writeResponseButtonBox.innerText = "회신";
						    orderDetailModalButtonBox.appendChild(writeResponseButtonBox);
						    
				        }
				    }else if(jsonObj.orderVo.order_state == "answer"){
				        orderDetailStateBox.innerText = "답변완료";
				        
				        var closestPointBox = document.querySelector(".closestPoint");
				        closestPointBox.innerHTML = "";
				        
				       
					    var responseDetailButtonBox = document.createElement("a");
					    responseDetailButtonBox.setAttribute("class", "btn btn-primary");
					    responseDetailButtonBox.setAttribute("onclick", "responseResultInfo(" + jsonObj.orderVo.order_no +")");
					    responseDetailButtonBox.setAttribute("data-bs-target", "#responseResultModal");
					    responseDetailButtonBox.setAttribute("data-bs-toggle", "modal");
					    responseDetailButtonBox.setAttribute("data-bs-dismiss", "modal");
					    responseDetailButtonBox.innerText = "답신확인";
					    orderDetailModalButtonBox.appendChild(responseDetailButtonBox);
					    
				    }else if(jsonObj.orderVo.order_state == "complete"){
				        orderDetailStateBox.innerText = "리뷰완료";
				        var closestPointBox = document.querySelector(".closestPoint");
				        closestPointBox.innerHTML = "";
				        
				        var showReviewButtonBox = document.createElement("button");
				        showReviewButtonBox.setAttribute("class", "btn btn-primary");
				        showReviewButtonBox.setAttribute("data-bs-target", "#cardModal_" + jsonObj.orderVo.stylist_card_no);
				        showReviewButtonBox.setAttribute("data-bs-toggle", "modal");
				        showReviewButtonBox.setAttribute("data-bs-dismiss", "modal");
				        showReviewButtonBox.innerText = "리뷰보기";
				        orderDetailModalButtonBox.appendChild(showReviewButtonBox);
					    
				    }else{
				        orderDetailStateBox.innerText = "에러";
				    }

				    var orderDetailDateBox = readOrderDetailModalBox.querySelector("#orderDetailDateBox");
				    orderDetailDateBox.innerText = "";
				    orderDetailDateBox.innerText = formatDate(jsonObj.orderVo.order_date);
				    var orderDetailPriceBox = readOrderDetailModalBox.querySelector("#orderDetailPriceBox");
				    orderDetailPriceBox.innerText = "";
				    orderDetailPriceBox.innerText = jsonObj.orderVo.order_saleprice;
				    var orderDetailHeigthBox = readOrderDetailModalBox.querySelector("#orderDetailHeigthBox");
				    orderDetailHeigthBox.innerText = "";
				    orderDetailHeigthBox.innerText = jsonObj.orderVo.order_heigth + " cm";
				    var orderDetailWeightBox = readOrderDetailModalBox.querySelector("#orderDetailWeightBox");
				    orderDetailWeightBox.innerText = "";
				    orderDetailWeightBox.innerText = jsonObj.orderVo.order_weight + " kg";
				    var orderDetailTopBox = readOrderDetailModalBox.querySelector("#orderDetailTopBox");
				    orderDetailTopBox.innerText = "";
				    orderDetailTopBox.innerText = jsonObj.orderVo.order_top + " size";
				    var orderDetailBottomBox = readOrderDetailModalBox.querySelector("#orderDetailBottomBox");
				    orderDetailBottomBox.innerText = "";
				    orderDetailBottomBox.innerText = jsonObj.orderVo.order_bottom + " size";
				    var orderDetailShoesBox = readOrderDetailModalBox.querySelector("#orderDetailShoesBox");
				    orderDetailShoesBox.innerText = "";
				    orderDetailShoesBox.innerText = jsonObj.orderVo.order_shoes + " mm";
				    var orderDetailContentBox = readOrderDetailModalBox.querySelector("#orderDetailContentBox");
				    orderDetailContentBox.innerHTML = "";
				    orderDetailContentBox.innerHTML = jsonObj.orderVo.order_content;
				    
				    var orderDetailOrderFileBox = readOrderDetailModalBox.querySelector("#orderDetailOrderFileBox");
				    orderDetailOrderFileBox.innerHTML = "";
				    
			        for(orderFileVo of jsonObj.orderFileVoList){
				        var colBox = document.createElement("div");
				        colBox.setAttribute("class", "col-3");
				        orderDetailOrderFileBox.appendChild(colBox);
				        
				        var aBox = document.createElement("a");
				        aBox.setAttribute("href", "http://localhost:8181/uploadFiles/"+ orderFileVo.order_file_link);
				        colBox.appendChild(aBox);
				        
				        var imgBox = document.createElement("img");
				        imgBox.src = "/uploadFiles/" + orderFileVo.order_file_link;
				        aBox.appendChild(imgBox);
			        }
				    
				    changeMoneyUnit();
				}
			}
			xhr.open("get" , "../stylist/orderDetailPage?order_no=" + OrderNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
		}
		
		// 요청 거절하기 프로세스
		function orderRejectProcess(OrderNo){
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					readOrderDetailModal(OrderNo);
				}
			}
			xhr.open("get" , "../stylist/orderRejectProcess?order_no=" + OrderNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
		}
		
		// 요청 수락하기 프로세스
		function orderAcceptProcess(OrderNo){
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					readOrderDetailModal(OrderNo);
				}
			}
			xhr.open("get" , "../stylist/orderAcceptProcess?order_no=" + OrderNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
		}
		
		//회신하기 프로세스
		function writeResponseProcess(){
			var formData = new FormData(document.getElementById("orderResponseProcess"));
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					var con_test = confirm("답신을 보내겠습니까?");
					if(con_test == true){
						readOrderDetailModal(jsonObj.styling_ResponseVo.order_no);
					}
					else if(con_test == false){
					}
				}
			}
			xhr.open("post" , "../stylist/stylingResponseProcess"); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(formData); //AJAX로 리퀘스트함..
		}
		
		
		//Modal 7 : 답신 카드 호출
		function responseResultInfo(OrderNo){
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					console.log(jsonObj);
					var size = parseInt(jsonObj.size);
					
					var responseResultModalBox = document.getElementById("responseResultModal");
					var reviewTargetBox = responseResultModalBox.querySelector(".reviewTarget");
					reviewTargetBox.innerHTML = "";

				    var responseNameBox = responseResultModalBox.querySelector("#responseNameBox");
				    responseNameBox.innerText =  "";
				    responseNameBox.innerText =  jsonObj.memberVo.member_nick;
				    var responseCategoryBox = responseResultModalBox.querySelector("#responseCategoryBox");
				    responseCategoryBox.innerText = "";
				    responseCategoryBox.innerText = jsonObj.card_category_name;
				    var responseProfileBox = responseResultModalBox.querySelector("#responseProfileBox");
				    responseProfileBox.src = "" 
				    if(jsonObj.memberVo.member_profileimage_link == null){
				    	responseProfileBox.src = "../resources/img/noneProfileImg.jpg";
				    }else{
				    	responseProfileBox.src = "/uploadFiles/" + jsonObj.memberVo.member_profileimage_link;
				    }
				    
				    
				    var responseDateBox = responseResultModalBox.querySelector("#responseDateBox");
				    responseDateBox.innerText =  "";
				    responseDateBox.innerText =  formatDate(jsonObj.styling_ResponseVo.styling_date);
				    var orderDetailDateBox = responseResultModalBox.querySelector("#orderDetailDateBox");
				    orderDetailDateBox.innerText =  "";
				    orderDetailDateBox.innerText =  formatDate(jsonObj.orderVo.order_date);
				    var orderDetailPriceBox = responseResultModalBox.querySelector("#orderDetailPriceBox");
				    orderDetailPriceBox.innerText =  "";
				    orderDetailPriceBox.innerText =  jsonObj.orderVo.order_saleprice;
				    
				    var responseMainImgBox = responseResultModalBox.querySelector("#responseMainImgBox");
				    responseMainImgBox.innerHTML =  "";
			    	var responseMainImg = document.createElement("img");
				    if(size > 0){
				    	responseMainImg.setAttribute("class", "pd-img d-block represImg");
				    	responseMainImg.src = "/uploadFiles/" + jsonObj.responseImgVoList[0].styling_img_link;
				    }else{
				    	responseMainImg.setAttribute("class", "img-fluid mx-auto d-block");
				    	responseProfileBox.src = "../resources/img/HGV_logo.png";
				    }
			    	responseMainImgBox.appendChild(responseMainImg);
					
			    	var responseCarouselBox = responseResultModalBox.querySelector("#responseCarousel");
			    	responseCarouselBox.innerHTML =  "";
			    	var carouselInnerBox = document.createElement("div");
			    	carouselInnerBox.setAttribute("class", "carousel-inner");
			    	responseCarouselBox.appendChild(carouselInnerBox);
			    	if(size == 0){
			    		var row1 = document.createElement("div");
			    		row1.setAttribute("class", "row");
			    		carouselInnerBox.appendChild(row1);
			    		var col1 = document.createElement("div");
			    		col1.setAttribute("class", "col text-center");
			    		row1.appendChild(col1);
			    		var spanBox = document.createElement("span");
			    		spanBox.innerText = "참고 이미지가 없습니다!"
			    		col1.appendChild(spanBox);
			    	}else if(size < 5){
			    		var row1 = document.createElement("div");
			    		row1.setAttribute("class", "row mx-0");
			    		carouselInnerBox.appendChild(row1);
				    	for(let i = 0; i < size; i++){
				    		if(i == 0){
					    		var col1 = document.createElement("div");
					    		col1.setAttribute("class", "sub-img thumb col-4 col-sm-3 px-1 py-2 selected");
					    		col1.setAttribute("onclick", "showTargetImg(this,"+ i +");");
					    		row1.appendChild(col1);
				    		}else{
				    			var col1 = document.createElement("div");
					    		col1.setAttribute("class", "sub-img thumb col-4 col-sm-3 px-1 py-2");
					    		col1.setAttribute("onclick", "showTargetImg(this,"+ i +");");
					    		row1.appendChild(col1);
				    		}
				    		var imgBox = document.createElement("img");
				    		imgBox.src = "/uploadFiles/" + jsonObj.responseImgVoList[i].styling_img_link;
				    		col1.appendChild(imgBox);
				    	}
			    	}else if(size < 9){
			    		var carouselItem1 = document.createElement("div");
			    		carouselItem1.setAttribute("class", "carousel-item active");
			    		carouselInnerBox.appendChild(carouselItem1);
			    		var row1 = document.createElement("div");
			    		row1.setAttribute("class", "row mx-0");
			    		carouselItem1.appendChild(row1);
				    	for(let i = 0; i < 4; i++){
				    		if(i == 0){
					    		var col1 = document.createElement("div");
					    		col1.setAttribute("class", "sub-img thumb col-4 col-sm-3 px-1 py-2 selected");
					    		col1.setAttribute("onclick", "showTargetImg(this,"+ i +");");
					    		row1.appendChild(col1);
				    		}else{
				    			var col1 = document.createElement("div");
					    		col1.setAttribute("class", "sub-img thumb col-4 col-sm-3 px-1 py-2");
					    		col1.setAttribute("onclick", "showTargetImg(this,"+ i +");");
					    		row1.appendChild(col1);
				    		}
				    		var imgBox = document.createElement("img");
				    		imgBox.src = "/uploadFiles/" + jsonObj.responseImgVoList[i].styling_img_link;
				    		col1.appendChild(imgBox);
				    	}
				    	
			    		var carouselItem2 = document.createElement("div");
			    		carouselItem2.setAttribute("class", "carousel-item");
			    		carouselInnerBox.appendChild(carouselItem2);
			    		var row2 = document.createElement("div");
			    		row2.setAttribute("class", "row mx-0");
			    		carouselItem2.appendChild(row2);
				    	for(let i = 4; i < size; i++){
			    			var col2 = document.createElement("div");
			    			col2.setAttribute("class", "sub-img thumb col-4 col-sm-3 px-1 py-2");
			    			col2.setAttribute("onclick", "showTargetImg(this,"+ i +");");
			    			row2.appendChild(col2);
				    		var imgBox2 = document.createElement("img");
				    		imgBox2.src = "/uploadFiles/" + jsonObj.responseImgVoList[i].styling_img_link;
				    		col2.appendChild(imgBox2);
				    	}
				    	
				    	var button1 = document.createElement("button");
				    	button1.setAttribute("class", "carousel-control-prev");
				    	button1.setAttribute("type", "button");
				    	button1.setAttribute("data-bs-target", "#responseCarousel");
				    	button1.setAttribute("data-bs-slide", "prev");
				    	responseCarouselBox.appendChild(button1);
				    	var buttonspan1 = document.createElement("span");
				    	buttonspan1.setAttribute("class", "carousel-control-prev-icon");
				    	buttonspan1.setAttribute("aria-hidden", "true");
				    	button1.appendChild(buttonspan1);
				    	
				    	var button2 = document.createElement("button");
				    	button2.setAttribute("class", "carousel-control-next");
				    	button2.setAttribute("type", "button");
				    	button2.setAttribute("data-bs-target", "#responseCarousel");
				    	button2.setAttribute("data-bs-slide", "next");
				    	responseCarouselBox.appendChild(button2);
				    	var buttonspan2 = document.createElement("span");
				    	buttonspan2.setAttribute("class", "carousel-control-next-icon");
				    	buttonspan2.setAttribute("aria-hidden", "true");
				    	button2.appendChild(buttonspan2);
			    	}
			    	
			    	var responseNameBox = responseResultModalBox.querySelector("#responseContent");
				    responseNameBox.innerHTML =  "";
				    responseNameBox.innerHTML =  jsonObj.styling_ResponseVo.styling_content;
			    	
				    var responseModalButtonBox = responseResultModalBox.querySelector(".modal-footer");
				    responseModalButtonBox.innerHTML = "";
				    var returnButtonBox = document.createElement("button");
				    returnButtonBox.setAttribute("class", "btn btn-primary");
				    returnButtonBox.setAttribute("data-bs-dismiss", "modal");
				    returnButtonBox.innerText = "이전";
				    responseModalButtonBox.appendChild(returnButtonBox);
				    
				    if(userNo != 0){
					    var reviewButtonBox = document.createElement("button");
					    reviewButtonBox.setAttribute("class", "btn btn-primary");
					    reviewButtonBox.setAttribute("onclick", "writeReviewButton(" + jsonObj.styling_ResponseVo.styling_no + "," + jsonObj.orderVo.order_no + ")");
					    reviewButtonBox.innerText = "리뷰쓰기";
					    responseModalButtonBox.appendChild(reviewButtonBox);
				    }
					
				    changeMoneyUnit();
				}
			}
			xhr.open("get" , "../member/stylingResponseCard?order_no=" + OrderNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
		}
		
		// Modal7 : 리뷰쓰기 랜더링
		function writeReviewButton(stylingNo, orderNo){
			//원래는 리뷰작성한 적이 있는지 체크한 다음에 리뷰 작성이 들어가야 하나, 시간과 합치는데 지장이 있을거 같아 랜더링만 우선 진행
			
			var responseResultModalBox = document.getElementById("responseResultModal");
			var reviewTargetBox = responseResultModalBox.querySelector(".reviewTarget");
			reviewTargetBox.innerHTML = "";
			
			var formBox = document.createElement("form");
	        formBox.setAttribute("id", "orderReviewProcess");
	        formBox.setAttribute("method", "post");
	        formBox.setAttribute("enctype", "multipart/form-data");
	        reviewTargetBox.appendChild(formBox);
	        
	        var inputHiddenBox =  document.createElement("input");
	        inputHiddenBox.setAttribute("type", "hidden");
	        inputHiddenBox.setAttribute("name", "styling_no");
	        inputHiddenBox.setAttribute("value", stylingNo);
	        formBox.appendChild(inputHiddenBox);
	        
	        var row1 = document.createElement("div");
	        row1.setAttribute("class", "row bg-secondary text-white my-3");
	        formBox.appendChild(row1);
	        var col1 = document.createElement("div");
	        col1.setAttribute("class", "col");
	        row1.appendChild(col1);
	        var titleBox = document.createElement("h5");
	        titleBox.innerText = "리뷰"
	        col1.appendChild(titleBox);
	        
	        var row2 = document.createElement("div");
	        row2.setAttribute("class", "row");
	        formBox.appendChild(row2);
	        var col2 = document.createElement("div");
	        col2.setAttribute("class", "col");
	        row2.appendChild(col2);
	        
	        var row3 = document.createElement("div");
	        row3.setAttribute("class", "row multiple-container");
	        col2.appendChild(row3);
	        
	        var row4 = document.createElement("div");
	        row4.setAttribute("class", "row my-3");
	        col2.appendChild(row4);
	        var col3 = document.createElement("div");
	        col3.setAttribute("class", "col-5 star-rating space-x-4");
	        row4.appendChild(col3);
	        
	        var input1 = document.createElement("input");
	        input1.setAttribute("type", "radio");
	        input1.setAttribute("id", "5-stars");
	        input1.setAttribute("name", "styling_review_starRatring");
	        input1.setAttribute("value", 5);
	        input1.setAttribute("v-model", "ratings");
	        col3.appendChild(input1);
	        var label1 = document.createElement("label");
	        label1.setAttribute("for", "5-stars");
	        label1.setAttribute("class", "star pr-4");
	        label1.innerText = "★";
	        col3.appendChild(label1);
	        var input2 = document.createElement("input");
	        input2.setAttribute("type", "radio");
	        input2.setAttribute("id", "4-stars");
	        input2.setAttribute("name", "styling_review_starRatring");
	        input2.setAttribute("value", 4);
	        input2.setAttribute("v-model", "ratings");
	        col3.appendChild(input2);
	        var label2 = document.createElement("label");
	        label2.setAttribute("for", "4-stars");
	        label2.setAttribute("class", "star pr-4");
	        label2.innerText = "★";
	        col3.appendChild(label2);
	        var input3 = document.createElement("input");
	        input3.setAttribute("type", "radio");
	        input3.setAttribute("id", "3-stars");
	        input3.setAttribute("name", "styling_review_starRatring");
	        input3.setAttribute("value", 3);
	        input3.setAttribute("v-model", "ratings");
	        col3.appendChild(input3);
	        var label3 = document.createElement("label");
	        label3.setAttribute("for", "3-stars");
	        label3.setAttribute("class", "star pr-4");
	        label3.innerText = "★";
	        col3.appendChild(label3);
	        var input4 = document.createElement("input");
	        input4.setAttribute("type", "radio");
	        input4.setAttribute("id", "2-stars");
	        input4.setAttribute("name", "styling_review_starRatring");
	        input4.setAttribute("value", 2);
	        input4.setAttribute("v-model", "ratings");
	        col3.appendChild(input4);
	        var label4 = document.createElement("label");
	        label4.setAttribute("for", "2-stars");
	        label4.setAttribute("class", "star pr-4");
	        label4.innerText = "★";
	        col3.appendChild(label4);
	        var input5 = document.createElement("input");
	        input5.setAttribute("type", "radio");
	        input5.setAttribute("id", "1-stars");
	        input5.setAttribute("name", "styling_review_starRatring");
	        input5.setAttribute("value", 1);
	        input5.setAttribute("v-model", "ratings");
	        col3.appendChild(input5);
	        var label5 = document.createElement("label");
	        label5.setAttribute("for", "1-stars");
	        label5.setAttribute("class", "star pr-4");
	        label5.innerText = "★";
	        col3.appendChild(label5);
	        
	        var row5 = document.createElement("div");
	        row5.setAttribute("class", "row my-3");
	        col2.appendChild(row5);
	        var col4 = document.createElement("div");
	        col4.setAttribute("class", "col");
	        row5.appendChild(col4);
	        var textareaBox = document.createElement("textarea");
	        textareaBox.setAttribute("class", "summernote");
	        textareaBox.setAttribute("name", "styling_review_content");
	        col4.appendChild(textareaBox);
	        summernoteSetting();
	        
	        var row5 = document.createElement("div");
	        row5.setAttribute("class", "row my-2");
	        col2.appendChild(row5);
	        var col4 = document.createElement("div");
	        col4.setAttribute("class", "col reviewGuide");
	        row5.appendChild(col4);
	        var col4SpanBox = document.createElement("span");
	        col4SpanBox.innerText = "* 파일은 이미지파일만 첨부할 수 있습니다.";
	        col4.appendChild(col4SpanBox);
	        
	        var row6 = document.createElement("div");
	        row6.setAttribute("class", "row my-2");
	        col2.appendChild(row6);
	        var col5 = document.createElement("div");
	        col5.setAttribute("class", "col-md-auto");
	        row6.appendChild(col5);
	        var col5_InputBox = document.createElement("input");
	        col5_InputBox.setAttribute("class", "form-control input-multiple-image");
	        col5_InputBox.setAttribute("style", "display: block;");
	        col5_InputBox.setAttribute("type", "file");
	        col5_InputBox.setAttribute("name", "files");
	        col5_InputBox.setAttribute("multiple", "multiple");
	        col5_InputBox.setAttribute("accept", "image/*");
	        col5.appendChild(col5_InputBox);
	        multipleImageEventSet();
	        
	        var responseModalButtonBox = responseResultModalBox.querySelector("#responseModalButtonBox");
		    responseModalButtonBox.innerHTML = "";
		    var returnButtonBox = document.createElement("button");
		    returnButtonBox.setAttribute("class", "btn btn-primary");
		    returnButtonBox.setAttribute("onclick", "readOrderDetailModal(" + orderNo +")");
		    returnButtonBox.setAttribute("data-bs-target", "#readOrderDetailModal");
		    returnButtonBox.setAttribute("data-bs-toggle", "modal");
		    returnButtonBox.setAttribute("data-bs-dismiss", "modal");
		    returnButtonBox.innerText = "이전";
		    responseModalButtonBox.appendChild(returnButtonBox);
	        
	        var tempSaveButtonBox = document.createElement("button");
	        tempSaveButtonBox.setAttribute("class", "btn btn-primary");
	        tempSaveButtonBox.setAttribute("onclick", "readOrderDetailModal(" + orderNo +")");
	        tempSaveButtonBox.setAttribute("data-bs-target", "#readOrderDetailModal");
	        tempSaveButtonBox.setAttribute("data-bs-toggle", "modal");
	        tempSaveButtonBox.setAttribute("data-bs-dismiss", "modal");
	        tempSaveButtonBox.innerText = "임시저장";
	        responseModalButtonBox.appendChild(tempSaveButtonBox);
	        
	        var writeResponseButtonBox = document.createElement("a");
	        writeResponseButtonBox.setAttribute("class", "btn btn-primary");
	        writeResponseButtonBox.setAttribute("onclick", "writeReviewProcess()");
	        writeResponseButtonBox.innerText = "회신";
	        responseModalButtonBox.appendChild(writeResponseButtonBox);
			
		}
		
		//리뷰쓰기 프로세스
		function writeReviewProcess(){
			var formData = new FormData(document.getElementById("orderReviewProcess"));
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					
					var con_test = confirm("리뷰을 보내겠습니까?");
					if(con_test == true){
						responseResultInfo(jsonObj.orderNo);
					}
					else if(con_test == false){
					}
				}
			}
			xhr.open("post" , "../user/writeReviewProcess"); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(formData); //AJAX로 리퀘스트함..
		}
		
		// 리뷰 불러오기 AJAX
		function callReview(CardNo){
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					console.log(jsonObj);
					var stylistCardModalBox = document.getElementById("cardModal_" + CardNo);
					var reviewBox = stylistCardModalBox.querySelector(".reviewBox");
					reviewBox.innerHTML = "";
					
					for(let review of jsonObj.reviewList){
						var row1 = document.createElement("div");
				        row1.setAttribute("class", "row");
				        reviewBox.appendChild(row1);
				        var col1 = document.createElement("div");
				        col1.setAttribute("class", "col m-3");
				        row1.appendChild(col1);
				        
				        var reviewProfile_Row1 = document.createElement("div");
				        reviewProfile_Row1.setAttribute("class", "row");
				        col1.appendChild(reviewProfile_Row1);
				        
				        var reviewProfile_Col1 = document.createElement("div");
				        reviewProfile_Col1.setAttribute("class", "col-2");
				        reviewProfile_Row1.appendChild(reviewProfile_Col1);
				        var reviewProfileImg = document.createElement("img");
				        reviewProfileImg.setAttribute("class", "rounded-circle");
				        reviewProfileImg.src = "/uploadFiles/" + review.memberVo.member_profileimage_link;
				        reviewProfile_Col1.appendChild(reviewProfileImg);
			        
				        var reviewProfile_Col2 = document.createElement("div");
				        reviewProfile_Col2.setAttribute("class", "col-5");
				        reviewProfile_Col2.setAttribute("style", "align-self: center;");
				        reviewProfile_Row1.appendChild(reviewProfile_Col2);
				        /* 닉네임 */
				        var reviewProfile_Row2 = document.createElement("div");
				        reviewProfile_Row2.setAttribute("class", "row");
				        reviewProfile_Col2.appendChild(reviewProfile_Row2);
				        var reviewProfile_Col3 = document.createElement("div");
				        reviewProfile_Col3.setAttribute("class", "col col-md-auto");
				        reviewProfile_Row2.appendChild(reviewProfile_Col3);
				        var reviewNick = document.createElement("span");
				        reviewNick.innerText = review.memberVo.member_nick;
				        reviewProfile_Col3.appendChild(reviewNick);
				        /* 별점 */
				        var reviewProfile_Row3 = document.createElement("div");
				        reviewProfile_Row3.setAttribute("class", "row");
				        reviewProfile_Col2.appendChild(reviewProfile_Row3);
				        var reviewProfile_Col4 = document.createElement("div");
				        reviewProfile_Col4.setAttribute("class", "col col-md-auto");
				        reviewProfile_Row3.appendChild(reviewProfile_Col4);
				        var starRatingBox = document.createElement("div");
				        starRatingBox.setAttribute("class", "starRatingBox");
				        reviewProfile_Col4.appendChild(starRatingBox);
				        var starRatingFillBox = document.createElement("div");
				        starRatingFillBox.setAttribute("class", "starRatingFill");
				        starRatingFillBox.setAttribute("style", "width:" + review.styling_ReviewVo.styling_review_starRatring + "%");
				        starRatingBox.appendChild(starRatingFillBox);
				        var starRatingFillSpanBox = document.createElement("span");
				        starRatingFillSpanBox.innerText = "★★★★★";
				        starRatingFillBox.appendChild(starRatingFillSpanBox);
				        var starRatingEmptyBox = document.createElement("div");
				        starRatingEmptyBox.setAttribute("class", "starRatingEmpty");
				        starRatingBox.appendChild(starRatingEmptyBox);
				        var starRatingEmptySpanBox = document.createElement("span");
				        starRatingEmptySpanBox.innerText = "★★★★★";
				        starRatingEmptyBox.appendChild(starRatingEmptySpanBox);
					    /* 작성일자/신고 */
				       	var reviewDate_Col1 = document.createElement("div");
				       	reviewDate_Col1.setAttribute("class", "col text-end");
				       	reviewProfile_Row1.appendChild(reviewDate_Col1);
				       	var reviewDate_Row1 = document.createElement("div");
				       	reviewDate_Row1.setAttribute("class", "row");
				       	reviewDate_Col1.appendChild(reviewDate_Row1);
				       	var reviewDate_Col2 = document.createElement("div");
				       	reviewDate_Col2.setAttribute("class", "col");
				       	reviewDate_Row1.appendChild(reviewDate_Col2);
				       	var reviewDate_Span1 = document.createElement("span");
				       	reviewDate_Span1.innerText = formatDate(review.styling_ReviewVo.styling_review_date);
				       	reviewDate_Col2.appendChild(reviewDate_Span1);
				       	var reviewDate_Row2 = document.createElement("div");
				       	reviewDate_Row2.setAttribute("class", "row");
				       	reviewDate_Col1.appendChild(reviewDate_Row2);
				       	var reviewDate_Col3 = document.createElement("div");
				       	reviewDate_Col3.setAttribute("class", "col");
				       	reviewDate_Row2.appendChild(reviewDate_Col3);
				       	var reviewDate_Span2 = document.createElement("span");
				       	reviewDate_Span2.innerText = "신고";
				       	reviewDate_Col3.appendChild(reviewDate_Span2);
				       	
				       	/* 리뷰 본문 */
				       	var reviewContentBox = document.createElement("div");
				       	reviewContentBox.setAttribute("class", "row my-3");
				       	col1.appendChild(reviewContentBox);
				       	
				       	var contentCol1 = document.createElement("div");
				       	contentCol1.setAttribute("class", "col");
				       	reviewContentBox.appendChild(contentCol1);
				       	var contentRow1 = document.createElement("div");
				       	contentRow1.setAttribute("class", "row");
				       	contentCol1.appendChild(contentRow1);
				       	
				       	for(reviewImg of review.reviewImgList){
				       		var reviewImgCol = document.createElement("div");
				       		reviewImgCol.setAttribute("class", "col-4 text-center card g-2");
				       		contentRow1.appendChild(reviewImgCol);
					       	var reviewImgBox = document.createElement("img");
					       	reviewImgBox.src = "/uploadFiles/" + reviewImg.styling_review_img_link;
					       	reviewImgCol.appendChild(reviewImgBox);
				       	}
				       	
				       	var reviewContentText = document.createElement("div");
				       	reviewContentText.setAttribute("class", "col-md-auto g-2");
			       		contentRow1.appendChild(reviewContentText);
			       		var reviewContentTextSpan = document.createElement("span");
			       		reviewContentTextSpan.innerHTML = review.styling_ReviewVo.styling_review_content;
			       		reviewContentText.appendChild(reviewContentTextSpan);
					}
					
				}
			}
			xhr.open("get" , "../member/callReview?stylist_card_no=" + CardNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
			
		}
		
		
		
		
		
	    