$(function () {
  // GNB
  // $("nav ul>li").on("mouseenter", function () {
  //   $(this).children("ul").children("li").stop().fadeToggle(300);
  // });
  // $("nav ul>li").on("mouseleave", function () {
  //   $(this).children("ul").children("li").stop().fadeToggle(200);
  // });
  // main contents
  $("main section div ul li").on("mouseenter", function () {
    $(this).children("h2").children("img").stop().fadeToggle(400);
  });
  $("main section div ul li").on("mouseleave", function () {
    $(this).children("h2").children("img").stop().fadeToggle(400);
  });

});
