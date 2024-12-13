function searchCheck() {
		if(document.searchScript.searchText.value.length < 2){
			alert("검색어를 2자이상 검색해주세요.");
			return false;
		}else{
			return true;	
		}
	}
$(document).ready(function(){
/*
   백엔드 프로젝트
   .li_num => 출력한 목록 전체 선택자
   .li_숫자 => 출력한 목록 한 행

*/    
	
/*처음 보이는 목록 갯수 원하는만큼 보이기(게시글 목록 페이지로 왔을 때 초기세팅) */
    $(".li_num").hide();
    for(let i =0; i< 7; i++){
       $(".li_"+i).show();
    }
    $(".paging_btn").first().addClass('on');
    


//페이징 길이 10보다 크면
if ($(".paging_btn").length > 10) {
	//다음버튼 보이게하기
	$(".go_next").show();
	$(".container:visible .tab_contents .paging:visible .paging_btn").hide();
	for(let i =0; i<10;i++){
		$(".container:visible .tab_contents .paging:visible .paging_btn").eq(i).show()               
	}
} else if($(".paging_btn:visible").length==0){
	$(".go_next").hide();
	$(".go_back").hide();
}
//-----------------------------------------------------------------------------------------------------------





/*(추가해야할 것) 페이징 1-10까지만 보이게. */
/* 클릭했을 때 원하는 갯수만큼 보이기   */    
$(".paging span").click(function(){          
	//클릭한 페이징의 텍스트 값을 숫자로 변환
	let c =  $(this).text();
	let count = Number(c);
	            
	$(".paging_btn").removeClass('on');
	$(this).addClass('on');

	//다 숨기고
	$(".li_num").hide();
	
	//원하는 갯수만큼만 리스트 출력
	for(let i=7*(count-1); i <=(7*count)-1;i++){
	$(".li_"+i).show();
	}              
});     
/*하단 탭 눌렀을 때 리스트 보이는 거 초기화*/       
	$(".tab_btn li").click(function(){          
		$(".paging_btn").removeClass('on');
		$(".paging_btn").first().addClass('on');         
		$(".li_num").hide();
	for(let i=1; i <=7;i++){
		$(".li_"+i).show();
	}   
              
              
              
    ///페이징  표시 10개 이상은 안 보이게
	if ($(".container:visible .tab_contents .paging:visible .paging_btn").length > 10) {
	    //다음버튼 보이게하기
		$(".go_next").show();
		$(".container:visible .tab_contents .paging:visible .paging_btn").hide();
	for(let i =0; i<10;i++){
		$(".container:visible .tab_contents .paging:visible .paging_btn").eq(i).show()               
	}

                }
          ///페이징 버튼 표시 초기화
            if($(".paging:visible .paging_btn").length>10 ){
              $(".go_next").show();
            }
            else{
              $(".go_next").hide();

            }
          if(Number($(".paging:visible .paging_btn:visible").first().text()) ==1){
              $(".go_back").hide();         
             }else{
              $(".go_back").show();         
             }

              
    });   
       

    
/*  탭 컨텐츠 탭누를 때마다 첫번째 페이징에 불들어오기  */  
       
      /*아래 탭(작은 탭) 눌렀을 때)*/
      for(let i = 0; i<4; i++){
            $(".seoul_tab .tab_btn li ").eq(i).click(function(){
              for(let j=0; j<4;j++){
                   $(".tab_contents").children(".list").eq(j).children(".paging").children(".paging_btn").eq(0).addClass('on');
              }
           });
           $(".jeju_tab .tab_btn li").eq(i).click(function(){
              for(let j=0; j<4;j++){
                   $(".tab_contents").eq(1).children(".list").eq(j).children(".paging").children(".paging_btn").eq(0).addClass('on');
                 }
           });
            $(".mono_tab .tab_btn li").eq(i).click(function(){
              for(let j=0; j<4;j++){
                   $(".tab_contents").eq(2).children(".list").eq(j).children(".paging").children(".paging_btn").eq(0).addClass('on');
              }
           });
           $(".stay_tab .tab_btn li").eq(i).click(function(){
              for(let j=0; j<4;j++){
                   $(".tab_contents").eq(3).children(".list").eq(j).children(".paging").children(".paging_btn").eq(0).addClass('on');
                 }
           });
      }   
        
	// 지금 문제가 나는 top_tab이 없는데 조건이 top_tap 클릭시라 페이징 버튼 갯수가 잘못출력됨
	        
	/*상단 탭(큰탭) 눌렀을 때 첫번쨰 페이징에 색 넣기*/         
	for(let i = 0; i<4;i++){
	
		$(".top_tab_btn li").eq(i).click(function(){
			//큰탭 누르면 강제 클릭
			//페이징 숫자 10개 넘으면 안 보이게
			if ($(".container:visible .tab_contents .paging:visible .paging_btn").length > 10) {
				//다음버튼 보이게하기
				$(".go_next").show();
				$(".container:visible .tab_contents .paging:visible .paging_btn").hide();
				for(let i =0; i<10;i++){
				$(".container:visible .tab_contents .paging:visible .paging_btn").eq(i).show();               
				}
			}
		     
		     
			//페이징 버튼 표시 초기화
			if($(".paging:visible .paging_btn").length>10 ){
				$(".go_next").show();
			} else {
				$(".go_next").hide();
			}
			
			if((Number($(".paging:visible .paging_btn:visible").first().text()) == 1) || Number($(".paging:visible .paging_btn:visible").first().text() == 0)){
				$(".go_back").hide();         
			}else{
				$(".go_back").show();         
			}         
			/***************************************/
			//보이는 페이징 다 지우기
			for (let i = 0; i < $(".container:visible .tab_contents .paging:visible .paging_btn").length; i++) {
				$(".container:visible .tab_contents .paging:visible .paging_btn").eq(i).hide();
			}
			//10개까지만 보이기
			for (let i = 0; i <= 9; i++) {
				$(".container:visible .tab_contents .paging:visible .paging_btn").eq(i).show();
			}
			/**************************************/
	         
	         
			$(".seoul_tab .tab_btn li ").eq(0).click();
			$(".jeju_tab .tab_btn li ").eq(0).click();
			$(".mono_tab .tab_btn li ").eq(0).click();
			$(".stay_tab .tab_btn li ").eq(0).click();
			//페이징 1번에 색 추가
			for(let j = 0; j<4;j++){	
				$(".tab_contents").eq(j).children(".list").eq(0).children(".paging").children(".paging_btn").eq(0).addClass('on');
			}
		});   
	}
              
      
      
 

              
              
              
  /*페이징에 화살표 추가하기*/ 
  $(".paging").prepend(
     "<span class='go_back'onclick='countDown(10)' ><i class='fa fa-angle-double-left'></i></span>"
  );          
    $(".paging").append(
     "<span class='go_next' onclick='countUp(10)'><i class='fa fa-angle-double-right'></i></span>"
  );          
    
 /*처음에 1부터 시작하면 이전으로 버튼 제거*/   

      
    
    
 
console.log(Number($(".paging:visible .paging_btn").eq(0).text()));
//초기 페이징 화살표 표시
	if($(".paging:visible .paging_btn").length>10 ){
		$(".go_next").show();
    } else{
    	$(".go_next").hide();
    } 
	if(Number($(".paging:visible .paging_btn:visible").first().text()) ==1 || Number($(".paging:visible .paging_btn:visible").first().text())==0){
    	$(".go_back").hide();         
    }else{
        $(".go_back").show();         
    }

});
function countUp(ten){
if ($(".container:visible .tab_contents .paging:visible .paging_btn").length > 10) {
 //  예 :
    //다음버튼 보이게하기
    $(".go_next").show();
   console.log(ten);//10
   console.log($(".paging:visible").find(".on").text());//1
   
   //현재 보여지는 페이징의 첫번째 텍스트 값 가져오기
   console.log($(".paging:visible .paging_btn:visible").first().text());//1
   
    let nowPaging=Number($(".paging:visible .paging_btn:visible").first().text())+1+ten;
 
           //탭 눌럿을 때 처리 보이는 페이징 다 지우기
            for (let i = 0; i < $(".container:visible .tab_contents .paging:visible .paging_btn").length; i++) {
                $(".container:visible .tab_contents .paging:visible .paging_btn").eq(i).hide();
            }
            //10개까지만 보이기
            for (let i = nowPaging-1; i <= nowPaging+9-1; i++) {
                $(".container:visible .tab_contents .paging:visible .paging_btn").eq(i-1).show();
            }
            
                $(".paging:visible .paging_btn").eq(nowPaging-1-1).click();
         
            //console.log( $(".paging:visible .paging_btn").eq(0));
            
               //다음버튼 필요없으면 지우기
            if($(".paging:visible .paging_btn:visible").length<10){
                  $(".go_next").hide();
            }
            
            //다음버튼 눌렀으면 이전버튼 보이게 하기
            if(Number($(".paging:visible .paging_btn:visible").first().text()) !=1){
            $(".go_back").show();         
         }
        } else {
             $(".go_next").hide();
        }
    
}
	//이거 밑에 제대로 하기
	function countDown(ten){
	   if(Number($(".paging:visible .paging_btn:visible").first().text()) !=1){
	        let num = Number($(".paging:visible .paging_btn:visible").first().text()) - ten
	        $(".paging:visible .paging_btn").hide();
	        for(i= num-1;i<num+9;i++){
	            $(".paging:visible .paging_btn").eq(i).show();
	            $(".paging:visible .paging_btn:visible").first().click();

	            if(Number($(".paging:visible .paging_btn:visible").first().text()) ==1){
                	$(".go_next").show();
                	$(".go_back").hide();
	            }else{
		            if($(".paging:visible .paging_btn:visible").length==10){
		            	$(".go_next").show();
		            }
	            }
	      	}
	   	} else {
	   		$(".go_back").show();
	   	}
	}