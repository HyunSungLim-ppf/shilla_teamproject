$(function(){
    $(".slide_gallery").bxSlider({
        mode: 'fade',
        auto:true,
        speed: 1000,
		pause: 7000,
        infiniteLoop: true,
        
        
        pagerCustom:'.slide_pager',
        controls:false,
        autoControls: false,
    });


    /*
    1.현재 보이는 슬라이드의 인덱스 외부에서 선언한 변수에 저장.
    2.해당 인덱스의 dot색 변경
    */
    //1
    let slide_index = 0;
    chgDotColor();
    function chgDotColor(){

        const slide = $(".slide_gallery li");
        const dot = $(".dot");
        if(slide_index>=slide.length){
            slide_index = 0;
        }
        dot.eq(slide_index).find("a").eq(0).css({
            backgroundColor:"#6e6d6d",
        });
        if(slide_index<0){
            slide_index = 2;
        }
        dot.eq(slide_index-1).find("a").eq(0).css({
            backgroundColor:"#ccc",
        });
        dot.eq(slide_index+1).find("a").eq(0).css({
            backgroundColor:"#b9b9b9",
        });
        slide_index++;

        setTimeout(chgDotColor,7300);
        //나중에 수정하기
    } 
});