$(() => {
	// 체크박스(전체) 체크시 모든 약관 동의 
	$('#all_clauses_agree_chk').click(function() {
		let chk = $("input:checkbox[id=all_clauses_agree_chk]").is(":checked");

		if (chk) {
			$("input:radio[value=essential_agree]").prop("checked", true);
		} else {
			$("input:radio[value=essential_agree]").prop("checked", false);
		}
	})
	$("input:radio[value=essential_disagree]").click(function() {
		$("input:checkbox[id=all_clauses_agree_chk]").prop("checked", false);
	})
	$("input:radio[value=essential_agree]").click(function() {
		let isAllAgreeCheked = true;
		$("input:radio[value=essential_agree]").each(function() {
			if (!$(this).is(':checked')) {
				isAllAgreeCheked = false;
			}
		})
		if (isAllAgreeCheked) {
			$("input:checkbox[id=all_clauses_agree_chk]").prop("checked", true);
		} else {
			$("input:checkbox[id=all_clauses_agree_chk]").prop("checked", false);
		}
	})


	// 모든 필수 항목을 동의시 페이지 이동됨
	$('#next_btn').click(function() {
		let isAllAgree = true
		$("input:radio[value=essential_disagree]").each(function() {
			if ($(this).is(":checked")) {
				isAllAgree = false
			}
		})
		$("input:radio[value=essential_agree]").each(function() {
			if (!$(this).is(":checked")) {
				isAllAgree = false
			}
		})

		if (isAllAgree) {
			// alert("가입 FORM 페이지로 이동")
			// $(location).attr("href", "./login_page_v6_로그인페이지1_완.html");
			$(location).attr("href", "index.jsp?content=sign_up.jsp");
		} else {
			alert("모든 필수 약관에 동의해주세요.")
		}
	})

	// 취소 버튼 눌렀을 때
	$('#cancle_btn').click(function() {
		$(location).attr("href", "index.jsp?content=login.jsp");
	})
	// 모달추가
	$('.clause_top>button').click(function() {
		$('.clause_modal_page').eq($('.clause_top>button').index(this)).stop().show()
		$('.modal_bg').stop().show()
	})
	// 닫기 버튼 눌렀을때
	$('.close_btn').click(function() {
		$('.clause_modal_page').stop().hide()
		$('.modal_bg').stop().hide()
	})
})