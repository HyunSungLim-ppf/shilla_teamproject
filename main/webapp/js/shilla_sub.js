/* GNB 메뉴 슬라이드 효과 */
$('.gnb_main .m1').on('mouseenter',function(){
    $('.gnb_sub').stop().css({display:'none'});
    $('.gnb_sub').eq(0).stop().slideDown(300);
});
$('.gnb_main .m2').on('mouseenter',function(){
    $('.gnb_sub').stop().css({display:'none'});
    $('.gnb_sub').eq(1).stop().slideDown(300);
});
$('.gnb_main .m3').on('mouseenter',function(){
    $('.gnb_sub').stop().css({display:'none'});
    $('.gnb_sub').eq(2).stop().slideDown(300);
});
$('.gnb_main .m4').on('mouseenter',function(){
    $('.gnb_sub').stop().css({display:'none'});
    $('.gnb_sub').eq(3).stop().slideDown(300);
});
$('.gnb_main .m5').on('mouseenter',function(){
    $('.gnb_sub').stop().slideUp(300);
});

$('.gnb_sub').on('mouseleave',function(){
    $('.gnb_sub').stop().slideUp(300);
});
$('a[href="#"]').click(function(e){
    e.preventDefault();
});
