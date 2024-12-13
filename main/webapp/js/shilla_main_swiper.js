$(function () {
    var swiper = new Swiper('.swiper', {
        slidesPerView: 4,
        spaceBetween: 0,
        direction: 'horizontal',
        loop: true,
        // Navigation arrows
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        loop: true,
        loopFillGroupWithBlank: false,
        autoplay: {
            delay: 4000, // 3초마다 자동 재생
            disableOnInteraction: false
        }
    });
});


