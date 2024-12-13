//// 도메인 직접 입력 or domain option 선택
//const domainListEl = document.querySelector('#domain')
//const domainInputEl = document.querySelector('#domain_input')
//// select 옵션 변경 시
//domainListEl.addEventListener('change', (event) => {
//  // option에 있는 도메인 선택 시
//  if (event.target.value !== "yourown") {
//    // 선택한 도메인을 input에 입력하고 disabled
//    domainInputEl.value = event.target.value
//    domainInputEl.disabled = true
//  } else { // 직접 입력 시
//    // input 내용 초기화 & 입력 가능하도록 변경
//    domainInputEl.value = ""
//    domainInputEl.disabled = false
//  }
//});

/* 수정v1.1.8 js 기능추가  */
// 기존 : 하나의 Selection으로만 이루어져 있음
// 수정 : 구분에서 각각의 메뉴체크시 마다 그에 따른 Selection으로 변경




if($("#select option[selected='selected']")){
    $('.sec_2 .select_q #select #js').hide();
	$('.sec_2 .select_q #select #sm').hide();
	$('.sec_2 .select_q #select #st').hide();
	$('.sec_2 .select_q #select #ee').hide();
	$('.sec_2 .select_q #select #ff').hide();
	$('.sec_2 .select_q #select #ss').stop().show();
	$('.sec_2 .select_q #select #aa').stop().show();
	$('.sec_2 .select_q #select #bb').stop().show();
	$('.sec_2 .select_q #select #cc').stop().show();
	$('.sec_2 .select_q #select #dd').stop().show(); 		
}
	$("#shilla1").click(function(){
	$("#ss").attr("selected",true);
    $("#js").attr("selected",false);
	$("#sm").attr("selected",false);
	$("#st").attr("selected",false);
	});
	
	$("#shilla2").click(function(){
	$("#ss").attr("selected",false);
	$("#js").attr("selected",true);
	$("#sm").attr("selected",false);
	$("#st").attr("selected",false);
	});
	
	$("#shilla3").click(function(){
	$("#ss").attr("selected",false);
	$("#js").attr("selected",false);
	$("#sm").attr("selected",true);
	$("#st").attr("selected",false);
	});
	
	$("#shilla4").click(function(){
	$("#ss").attr("selected",false);
	$("#js").attr("selected",false);
	$("#sm").attr("selected",false);
	$("#st").attr("selected",true);
	});
	
	
//$("#selectBox option:eq(n)").prop("selected", true);
//$("#selectBox").val("값").prop("selected", true);

 // if('.radio_group #shilla2[checked="checked"]'){
//	$('.sec_2 .select_q #select #js').selected;
//	$('option:selected','.sec_2 .select_q #select #js').removeAttr('selected');
//	$('option:selected','.sec_2 .select_q #select #sm').removeAttr('selected');
//	$('option:selected','.sec_2 .select_q #select #st').removeAttr('selected');
//	$('.sec_2 .select_q #select #ss').attr("selected",true);	
// }
//else
//  if('.radio_group #shilla2[checked="checked"]'){
//	//$('.sec_2 .select_q #select #js').selected;
//	$('option:selected','.sec_2 .select_q #select #ss').removeAttr('selected');
//	$('option:selected','.sec_2 .select_q #select #sm').removeAttr('selected');
//	$('option:selected','.sec_2 .select_q #select #st').removeAttr('selected');
//	$('.sec_2 .select_q #select #js').attr("selected",true);	
//  }
//else
//  if('.radio_group #shilla3[checked="checked"]'){
//	//$('.sec_2 .select_q #select #js').selected;
//	$('option:selected', 'select[name="category"]').removeAttr('selected');
//	$('.sec_2 .select_q #select #sm').attr("selected",true);	
//  }else
//  if('.radio_group #shilla4[checked="checked"]'){
//	//$('.sec_2 .select_q #select #js').selected;
//	$('option:selected', 'select[name="category"]').removeAttr('selected');
//	$('.sec_2 .select_q #select #st').attr("selected",true);	
//  } 

$('.radio_group input[name="brand"]').click(function(){       
  // 각각의 탭 index값 리턴 메서드
    const idx = $(this).parent().index();
    console.log("idx : "+idx);

  // 해당탭 내용만 보이도록 코딩  
  /*$('.sec_2 .select_q #select').eq(idx).stop().show();*/
  if(idx==0){
	$('.sec_2 .select_q #select #js').hide();
	$('.sec_2 .select_q #select #sm').hide();
	$('.sec_2 .select_q #select #st').hide();
	$('.sec_2 .select_q #select #ee').hide();
	$('.sec_2 .select_q #select #ff').hide();
	$('.sec_2 .select_q #select #ss').stop().show();
	$('.sec_2 .select_q #select #aa').stop().show();
	$('.sec_2 .select_q #select #bb').stop().show();
	$('.sec_2 .select_q #select #cc').stop().show();
	$('.sec_2 .select_q #select #dd').stop().show();
  }else if(idx==1){
	$('.sec_2 .select_q #select #ss').hide();
	$('.sec_2 .select_q #select #sm').hide();
	$('.sec_2 .select_q #select #st').hide();
	$('.sec_2 .select_q #select #cc').hide();
	$('.sec_2 .select_q #select #ff').hide();
	$('.sec_2 .select_q #select #js').stop().show();
	$('.sec_2 .select_q #select #aa').stop().show();
	$('.sec_2 .select_q #select #bb').stop().show();
	$('.sec_2 .select_q #select #ee').stop().show();
	$('.sec_2 .select_q #select #dd').stop().show();
  }else if(idx==2){
	$('.sec_2 .select_q #select #ss').hide();
	$('.sec_2 .select_q #select #js').hide();
	$('.sec_2 .select_q #select #st').hide();
	$('.sec_2 .select_q #select #cc').hide();
	$('.sec_2 .select_q #select #dd').hide();
	$('.sec_2 .select_q #select #sm').stop().show();
	$('.sec_2 .select_q #select #aa').stop().show();
	$('.sec_2 .select_q #select #bb').stop().show();
	$('.sec_2 .select_q #select #ee').stop().show();
	$('.sec_2 .select_q #select #ff').stop().show();
  }else if(idx==3){
	$('.sec_2 .select_q #select #ss').hide();
	$('.sec_2 .select_q #select #js').hide();
	$('.sec_2 .select_q #select #sm').hide();
	$('.sec_2 .select_q #select #cc').hide();
	$('.sec_2 .select_q #select #dd').hide();
	$('.sec_2 .select_q #select #ee').hide();
	$('.sec_2 .select_q #select #st').stop().show();
	$('.sec_2 .select_q #select #aa').stop().show();
	$('.sec_2 .select_q #select #bb').stop().show();
	$('.sec_2 .select_q #select #ff').stop().show();
  }  
});

/* 준비중 관련 경고창 */
// $('body').append('<div class="alert"><img src="./images/alert.png" alt="준비중 경고창"></div>');
// // 이벤트 = 검색 버튼을 클릭했을때 경고창
// $('.sec_5 .button1').click(function(e){
//     e.preventDefault();
//     $('.alert').stop().fadeIn(700);
//     setTimeout(function(){
//     $('.alert').fadeOut(700);
//     },1500);
// }); 







/* 새글등록 유효성 검사*/
function addCheck() {	
	console.log("brand : "+document.frm.brand.value);	
	console.log("category : "+document.frm.category.value);	
	if(document.frm.brand.value == "") {
        alert("관련문의를 선택해 주세요.");
        return false;
    }
 	if(document.frm.category.value == "") {
        alert("카테고리를 선택해 주세요.");
        return false;
    }	
	if(document.frm.title.value.length == 0){
		alert("제목을 작성해 주세요");
		frm.title.focus();
		return false;
	}
	if(document.frm.content.value == ""){
		alert("내용을 작성해 주세요");
		frm.content.focus();
		return false;
	}		
  	var agreement1 = document.getElementById('agree1');    
    if(agreement1.checked == false) {
        alert("필수 약관에 동의해 주세요.")
        return false;
    }	
	return true;
}

