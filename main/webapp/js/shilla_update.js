/**
 * 
 */



      let hb = $(".hidden_brand").text();
      let hc = $(".hidden_category").text();

      /* 페이지 로딩 시 초기 세팅*/
      //로딩 시 categorydp있던 데이터 seleted로 설정하기
      console.log($("#select option[value=" + hc + "]"));
      //셀렉트 세팅
      $("#select option[value=" + hc + "]").attr("selected", true);
      //$("#select option[val=hc");
      //라디오 세팅
      $("input[name='brand']")
        .eq(hb - 1)
        .attr("checked", true);
      //셀렉트 옵션 초기 세팅==받아온 값이 있을 때
      if ($("#select").val() != "") {
        //받아온 값 추후에 사용 위해 담아두기
        const select_val = $("#select").val();
        //현재 라디오 버튼 위치 확인
        if ($("input[name='brand']").eq(0).is(":checked")) {
          $("#select option").remove();
          $("#select ").append(
            "<option id='ss' disabled value=''>서울신라호텔 문의</option>"
          );
          $("#select ").append(
            "<option id='aa' value='a'>객실/패키지 문의</option>"
          );
          $("#select ").append(
            "<option id='bb' value='b'>다이닝 문의</option>"
          );
          $("#select ").append("<option id='cc' value='c'>웨딩 문의</option>");
          $("#select ").append(
            "<option id='dd' value='d'>연회/회의 문의</option>"
          );
          $("option[value='" + select_val + "']").prop('selected', true);
        }
        if ($("input[name='brand']").eq(1).is(":checked")) {
          $("#select option").remove();
          $("#select ").append(
            "<option id='js' disabled value=''>제주신라호텔 문의</option>"
          );
          $("#select ").append(
            "<option id='aa' value='a'>객실/패키지 문의</option>"
          );
          $("#select ").append(
            "<option id='bb' value='b'>다이닝 문의</option>"
          );
          $("#select ").append(
            "<option id='dd' value='d'>연회/회의 문의</option>"
          );
          $("#select ").append(
            "<option id='ee' value='e'>멤버쉽 문의</option>"
          );
          $("option[value='" + select_val + "']").prop('selected', true);
        }
        if ($("input[name='brand']").eq(2).is(":checked")) {
          $("#select option").remove();
          $("#select ").append(
            "<option id='sm'  disabled value=''>신라모노그램 문의</option>"
          );
          $("#select ").append(
            "<option id='aa' value='a'>객실/패키지 문의</option>"
          );
          $("#select ").append(
            "<option id='bb' value='b'>다이닝 문의</option>"
          );
          $("#select ").append(
            "<option id='ee' value='e'>멤버쉽 문의</option>"
          );
          $("#select ").append("<option id='ff' value='f'>기타 문의</option>");
          $("option[value='" + select_val + "']").prop('selected', true);
        }
        if ($("input[name='brand']").eq(3).is(":checked")) {
          $("#select option").remove();
          $("#select ").append(
            "<option id='st' disabled value=''>신라스테이 문의</option>"
          );
          $("#select ").append(
            "<option id='aa' value='a'>객실/패키지 문의</option>"
          );
          $("#select ").append(
            "<option id='bb' value='b'>다이닝 문의</option>"
          );
          $("#select ").append("<option id='ff' value='f'>기타 문의</option>");
          $("option[value='" + select_val + "']").prop('selected', true);  
        }
      }

      /*radio변경시 함수 발생*/
      for (let i = 0; i < 4; i++) {
        $("input[name='brand']").eq(i).on("click", choose_radio);
      }
	  $(".hidden_brand").hide();
	  $(".hidden_category").hide();
      function choose_radio() {
        //신라서울 라디오 선택
        if ($("input[name='brand']").eq(0).is(":checked")) {
          //신라서울문의 selected 변경
          $("#ss").prop("selected", true);
          //옵션 화면 출력 조정

          $("#select option").remove();
          $("#select ").append(
            "<option id='ss' selected disabled value=''>서울신라호텔 문의</option>"
          );
          $("#select ").append(
            "<option id='aa' value='a'>객실/패키지 문의</option>"
          );
          $("#select ").append(
            "<option id='bb' value='b'>다이닝 문의</option>"
          );
          $("#select ").append("<option id='cc' value='c'>웨딩 문의</option>");
          $("#select ").append(
            "<option id='dd' value='d'>연회/회의 문의</option>"
          );
        }
        //신라제주 선택
        if ($("input[name='brand']").eq(1).is(":checked")) {
          $("#js").prop("selected", true);
          //옵션 화면 출력 조정

          $("#select option").remove();
          $("#select ").append(
            "<option id='js' selected disabled value=''>제주신라호텔 문의</option>"
          );
          $("#select ").append(
            "<option id='aa' value='a'>객실/패키지 문의</option>"
          );
          $("#select ").append(
            "<option id='bb' value='b'>다이닝 문의</option>"
          );
          $("#select ").append(
            "<option id='dd' value='d'>연회/회의 문의</option>"
          );
          $("#select ").append(
            "<option id='ee' value='e'>멤버쉽 문의</option>"
          );
        }
        //신라모노 선택
        if ($("input[name='brand']").eq(2).is(":checked")) {
          $("#sm").prop("selected", true);

          $("#select option").remove();
          $("#select ").append(
            "<option id='sm' selected disabled value=''>신라모노그램 문의</option>"
          );
          $("#select ").append(
            "<option id='aa' value='a'>객실/패키지 문의</option>"
          );
          $("#select ").append(
            "<option id='bb' value='b'>다이닝 문의</option>"
          );
          $("#select ").append(
            "<option id='ee' value='e'>멤버쉽 문의</option>"
          );
          $("#select ").append("<option id='ff' value='f'>기타 문의</option>");
        }
        //신라스테이 선택
        if ($("input[name='brand']").eq(3).is(":checked")) {
          $("#st").prop("selected", true);

          $("#select option").remove();
          $("#select ").append(
            "<option id='st' selected disabled value=''>신라스테이 문의</option>"
          );
          $("#select ").append(
            "<option id='aa' value='a'>객실/패키지 문의</option>"
          );
          $("#select ").append(
            "<option id='bb' value='b'>다이닝 문의</option>"
          );
          $("#select ").append("<option id='ff' value='f'>기타 문의</option>");
        }
      }


//체크가 된 걸 .text로 가져와서 select비교하기



/*$("select#select").click(function(){
	$("option").hide();
	if($("#shilla1").prop("checked")){
		$('.sec_2 .select_q #select #ss').show();
		$('.sec_2 .select_q #select #aa').show();
		$('.sec_2 .select_q #select #bb').show();
		$('.sec_2 .select_q #select #cc').show();
		$('.sec_2 .select_q #select #dd').show();				
	}
	if($("#shilla2").prop("checked")){
		$('.sec_2 .select_q #select #js').show();
		$('.sec_2 .select_q #select #aa').show();
		$('.sec_2 .select_q #select #bb').show();
		$('.sec_2 .select_q #select #dd').show();
		$('.sec_2 .select_q #select #ee').show();				
	}
	if($("#shilla3").prop("checked")){
		$('.sec_2 .select_q #select #sm').show();
		$('.sec_2 .select_q #select #aa').show();
		$('.sec_2 .select_q #select #bb').show();
		$('.sec_2 .select_q #select #ee').show();
		$('.sec_2 .select_q #select #ff').show();
	}
	if($("#shilla4").prop("checked")){
		$('.sec_2 .select_q #select #st').show();
		$('.sec_2 .select_q #select #aa').show();
		$('.sec_2 .select_q #select #bb').show();
		$('.sec_2 .select_q #select #ff').show();
	}
});

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
});*/

/*$('.radio_group input[name="brand"]').click(function(){       
    const idx = $(this).parent().index();
    console.log("idx : "+idx);
	$("#select option").hide();
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
});*/


/* 브랜드 */
/*if($(".hidden_brand").text()=='1'){
	let hb = $(".hidden_brand").text();
	$(".hidden_brand").hide();
	
	$(".radio_group input[value='1']").attr("checked",true);

}
if($(".hidden_brand").text()=='2'){
	let hb = $(".hidden_brand").text();
	$(".hidden_brand").hide();
	
	$(".radio_group input[value='2']").attr("checked",true);

}
if($(".hidden_brand").text()=='3'){
	let hb = $(".hidden_brand").text();
	$(".hidden_brand").hide();
	
	$(".radio_group input[value='3']").attr("checked",true);

}
if($(".hidden_brand").text()=='4'){
	let hb = $(".hidden_brand").text();
	$(".hidden_brand").hide();
	
	$(".radio_group input[value='4']").attr("checked",true);

}*/


/* 카테고리 */
/*if($(".hidden_category").text()=='a'){
	let hc = $(".hidden_category").text();
	$(".hidden_category").hide();
		
	$(".select_q option[value='a']").attr("selected",true);
}

if($(".hidden_category").text()=='b'){
	 hc = $(".hidden_category").text();
	$(".hidden_category").hide();
			
	$(".select_q option[value='b']").attr("selected",true);
}

if($(".hidden_category").text()=='c'){
	let hc = $(".hidden_category").text();
	$(".hidden_category").hide();
		
	$(".select_q option[value='c']").attr("selected",true);
}

if($(".hidden_category").text()=='d'){
	let hc = $(".hidden_category").text();
	$(".hidden_category").hide();
		
	$(".select_q option[value='d']").attr("selected",true);
}

if($(".hidden_category").text()=='e'){
	let hc = $(".hidden_category").text();
	$(".hidden_category").hide();
		
	$(".select_q option[value='e']").attr("selected",true);
}

if($(".hidden_category").text()=='f'){
	let hc = $(".hidden_category").text();
	$(".hidden_category").hide();
		
	$(".select_q option[value='f']").attr("selected",true);
}
*/
/* 업데이트 유효성 검사*/
function updateCheck() {
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
	return true;
}









