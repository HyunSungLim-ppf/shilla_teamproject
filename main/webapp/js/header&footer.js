/* GNB 메뉴 슬라이드 효과 시작 */
$('.gnb_main .m1').on('mouseenter', function () {
    $('.gnb_sub').stop().css({ display: 'none' });
    $('.gnb_sub').eq(0).stop().slideDown(300);
});
$('.gnb_main .m2').on('mouseenter', function () {
    $('.gnb_sub').stop().css({ display: 'none' });
    $('.gnb_sub').eq(1).stop().slideDown(300);
});
$('.gnb_main .m3').on('mouseenter', function () {
    $('.gnb_sub').stop().css({ display: 'none' });
    $('.gnb_sub').eq(2).stop().slideDown(300);
});
$('.gnb_main .m4').on('mouseenter', function () {
    $('.gnb_sub').stop().css({ display: 'none' });
    $('.gnb_sub').eq(3).stop().slideDown(300);
});
$('.gnb_main .m5').on('mouseenter', function () {
    $('.gnb_sub').stop().slideUp(300);
});

$('.gnb_sub').on('mouseleave', function () {
    $('.gnb_sub').stop().slideUp(300);
});
// ↓ 아래 jQuery는 # 링크 클릭시 상단으로 이동하는 것으 방지하는 코드입니다.
// 불필요하다 생각되시면 삭제해도 무방합니다!
$('a[href="#"]').click(function (e) {
    e.preventDefault();
});
/* GNB 메뉴 슬라이드 효과 끝 */

//-----------------------------기능 추가 및 수정 by 현성-----------------------------
/* 
기능 추가 및 수정시 주의점
- 기존 css와 html구조는 건들지 않을 것 즉, js 및 jquery만 사용해서 기능 추가 및 수정
*/

// Header 부분 
// Header 1. 형섭이가 말했던거 일단은 이렇게 심플하게 
$('header h1').mouseenter(function () {
    $('.gnb_sub').stop().slideUp(300);
    $('.gnb_main_li_bd').css({ 'width': '0%' })
})

// Header 2. 성주가 원했던거가 이거 였던가?
$('.gnb_main li').css({ 'border': 'none' })
for (let i = 0; i < $('.gnb_main li').length; i++) {
    $('.gnb_main li').eq(i).append('<div class="gnb_main_li_bd"></div>')
}
$('.gnb_main_li_bd')
    .css({
        'width': '0%',
        // 'height': '3px',
        'height': '0.15625vw',
        'background-color': 'rgba(98, 82, 63, 0.8)',
        'margin': '0 auto',
        // 'margin-top': '11px',
        'margin-top': '0.57291vw',
        'transition': 'all 0.3s'
    })

for (let i = 0; i < $('.gnb_main li').length; i++) {
    $('.gnb_main li').eq(i).mouseenter(function () {
        $('.gnb_main_li_bd').eq(i).css({ 'width': '100%' })
    })
}
// 기존 형섭이 header에 코드를 추가해야되서;;
$('.gnb_main .m1').on('mouseenter', function () {
    $('.gnb_sub').stop().css({ display: 'none' });
    $('.gnb_sub').eq(0).stop().slideDown(300);
    //가변추가
    $('.gnb_sub').stop().css({ 
        height: '2.8125vw',
        paddingTop:'1vw'
    });
   

    $('.gnb_main_li_bd').css({ 'width': '0%' })
    $('.gnb_main_li_bd').eq(0).css({ 'width': '100%' })
});
$('.gnb_main .m2').on('mouseenter', function () {
    $('.gnb_sub').stop().css({ display: 'none' });
    $('.gnb_sub').eq(1).stop().slideDown(300);
    //가변추가
    $('.gnb_sub').stop().css({ 
        height: '10.0520833vw',
        paddingTop:'1vw'

    });
    $('.gnb_main_li_bd').css({ 'width': '0%' })
    $('.gnb_main_li_bd').eq(1).css({ 'width': '100%' })
});
$('.gnb_main .m3').on('mouseenter', function () {
    $('.gnb_sub').stop().css({ display: 'none' });
    $('.gnb_sub').eq(2).stop().slideDown(300);
   //가변추가
   $('.gnb_sub').stop().css({ 
    height: ' 8.489583vw',
    paddingTop:'1vw'

});
   
    $('.gnb_main_li_bd').css({ 'width': '0%' })
    $('.gnb_main_li_bd').eq(2).css({ 'width': '100%' })
});
$('.gnb_main .m4').on('mouseenter', function () {
    $('.gnb_sub').stop().css({ display: 'none' });
    $('.gnb_sub').eq(3).stop().slideDown(300);
    // 가변 추가
    $('.gnb_sub').stop().css({ 
        height: '2.8125vw',
        paddingTop:'1vw'
        
    });
    $('.gnb_main_li_bd').css({ 'width': '0%' })
    $('.gnb_main_li_bd').eq(3).css({ 'width': '100%' })
});
$('.gnb_main .m5').on('mouseenter', function () {
    $('.gnb_sub').stop().slideUp(300);
  
    $('.gnb_main_li_bd').css({ 'width': '0%' })
    $('.gnb_main_li_bd').eq(4).css({ 'width': '100%' })
});

$('.gnb_sub').on('mouseleave', function () {
    $('.gnb_sub').stop().slideUp(300);
    $('.gnb_main_li_bd').css({ 'width': '0%' })
});
// 마지막 the shilla shop 처리
$('.m5').on('mouseleave', function () {
    $('.gnb_main_li_bd').css({ 'width': '0%' })
});


































// Footer 부분 
// Footer 1. 각 브랜드별 로고 이미지 효과 
$('.ft_main_rigth_top img').css({ 'filter': 'opacity(50%)' })

$('.ft_main_rigth_top img').mouseenter(function () {
    $(this).css({ 'transition': 'all 0.3s' })
    $(this).css({ 'filter': 'opacity(100%)' })
})
$('.ft_main_rigth_top img').mouseleave(function () {
    $(this).css({ 'filter': 'opacity(50%)' })
})

// Footer 2. 한김에 footer의 sns아이콘도 효과 주자
$('.ft_main_rigth_bottomRight img[alt=facebook]').mouseenter(function () {
    $(this).css({ 'transition': 'all 0.4s' })
    $(this).css({ 'filter': 'hue-rotate(360deg)' })
})
$('.ft_main_rigth_bottomRight img[alt=instagram]').mouseenter(function () {
    $(this).css({ 'transition': 'all 0.4s' })
    $(this).css({ 'filter': 'hue-rotate(360deg)' })
})
$('.ft_main_rigth_bottomRight img').mouseleave(function () {
    $(this).css({ 'filter': 'hue-rotate(0deg)' })
})

// 추가v1.1.11 Header에서의 언어선택기능
$('.select_lang>p').click(function () {
    $('.lang_list').stop().slideToggle(300)
    // 
  
})
$("body")
    .append('<div class="alert_by_Hayashi" id="jp_lang_sorry">' +
        '<p id="emoji">🙏🙇‍♂️🙇‍♀️🙏</p>' +
        '<p>すみません。日本語のページは準備中です。</p>' +
        '<p>しばらくお待ちいただければ、本当にありがとうございます。</p>' +
        '<p>天皇陛下万歳</p>' +
        '</div>')
    .append('<div class="alert_by_Hayashi" id="eng_lang_sorry">' +
        '<p id="emoji">🙏🙇‍♂️🙇‍♀️🙏</p>' +
        '<p> sorry. We\'are preparing an English page.</p>' +
        '<p>I would really appreciate it if you could wait a moment.</p>' +
        '</div>')
    // COMMON Page Alert
    .append('<div class="alert_by_Hayashi" id="common_page_alert">' +
        '<p id="emoji">🙏</p>' +
        '<p>죄송합니다. 아직 준비중인 페이지입니다.</p>' +
        '</div>')


$('.lang_list>li').eq(0).click(function () {
    $(".alert_by_Hayashi").stop().hide()
    $('.lang_list').stop().slideUp(300)
    $("#jp_lang_sorry").stop().fadeIn(700)
    setTimeout(function () {
        $(".alert_by_Hayashi").stop().fadeOut(700)
    }, 7000)
})
$('.lang_list>li').eq(1).click(function () {
    $(".alert_by_Hayashi").stop().hide()
    $('.lang_list').stop().slideUp(300)
    $("#eng_lang_sorry").stop().fadeIn(700)
    setTimeout(function () {
        $(".alert_by_Hayashi").stop().fadeOut(700)
    }, 7000)
})

// 해결v1.1.12 (발견 by 형섭)
$('footer').css({ 'margin-top': '100px' })

// 추가v1.1.11 기본 a태그 href="#"걸려 있는거 전부 처리
$("a[href='#']").click(function () {
    $('.alert_by_Hayashi').stop().hide()
    // 이건 추가
    $("#common_page_alert").stop().fadeIn(500)
    if ((window.location.href.indexOf('board') >= 0) || (window.location.href.indexOf('read') >= 0)) {
        $("#common_page_alert").stop().hide()
        $(".alert").stop().fadeIn(500)
    } else {
        $("#common_page_alert").stop().fadeIn(500)
    }
    setTimeout(function () {
        $(".alert_by_Hayashi").stop().fadeOut(700)
    }, 4000)
    console.log(window.location.href)
})

// 일단 해결v1.1.12 (발견 by 형섭 & 랄로님)
$('.gallery_wrap a[href="#"]').click(function () {
    $('.alert_by_Hayashi').stop().hide()
})

