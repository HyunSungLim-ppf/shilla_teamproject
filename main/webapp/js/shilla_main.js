$(function () {
  // GNB
  // $("nav ul>li").on("mouseenter", function () {
  //   $(this).children("ul").children("li").stop().fadeToggle(300);
  // });
  // $("nav ul>li").on("mouseleave", function () {
  //   $(this).children("ul").children("li").stop().fadeToggle(200);
  // });
  // main contents
  $("main section div ul a").on("mouseenter", function () {
    $(this).children("h2").children("img").stop().fadeToggle(400);
  });
  $("main section div ul a").on("mouseleave", function () {
    $(this).children("h2").children("img").stop().fadeToggle(400);
  });



  // $(".mp_main_about:hover .mp_main_about_introduce").hide();
  $(window).on("scroll", function(){
  console.log(scrollY);
  if(scrollY >= 550 && scrollY<2200){
      $(".mp_main_about_introduce").stop().css({
         trainsiton: "2.0s ease-in",
      });
      $(".mp_main_about .mp_main_about_introduce").stop().css({
        transform :"translateX(-1620px)",
        // transform :"translateX(-1870x)",
        opacity:0.8,
      });
      // $(".mp_main_about_introduce").addClass("slide-left");
    
    }

    /*--------------0되면 원상태로 ---------------*/
    if(scrollY === 0){
      $(".mp_main_about_introduce").stop().css({
        trainsiton:  "ease-in",
     });
      $(".mp_main_about .mp_main_about_introduce").stop().css({
      transform :"translateX(+1580px)",
      opacity:0,  
      });
    }


    /*--------------해당구역 벗어나면 다시 원상태로 ---------------*/
    // else{  
    //   $(".mp_main_about_introduce").stop().css({
    //     trainsiton: "1s ease-in",
    //   });
    //   $(".mp_main_about .mp_main_about_introduce").stop().css({
    //     transform :"translateX(+1580px)",
    //     // transform :"translateX(+1920px)",
    //     opacity:0,
    //   });
      
    // }
    /*-------------------------------------------------------------*/







});

});