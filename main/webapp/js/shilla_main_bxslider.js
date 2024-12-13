$(function(){
    $(".slide_gallery").bxSlider({
        mode: 'fade',
        auto:true,
        speed: 1000,
		pause: 7000,
        infiniteLoop: true,
        touchEnabled: false,
        
        // pagerCustom:'.slide_pager',
        pagerCustom:"#custom_pager",
        controls:false,
        autoControls: false,


        onSlideAfter: function(nowShowing, oldIndex, newIndex) {
            
            var dot = $("#custom_pager a");
            // console.log(nowShowing);
            // console.log(oldIndex);
            // console.log(newIndex);
            // dot.eq(nowShowing.children('img').attr('alt')).css({
            //     backgroundColor:"#6e6d6d",
            // }); 
            dot.eq(oldIndex).css({
                backgroundColor:"#b9b9b9",
            }); 
            dot.eq(newIndex).css({
                backgroundColor:"#6e6d6d",
            }); 
        }
    });


    // $(".slide_gallery li").on("click", function(){
        
    //     alert('aa');
    //     // window.location.href="https://www.shilla.net/seoul/index.do";
    // });

});