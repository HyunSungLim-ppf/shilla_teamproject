$(() => {
	// Find ID Modal
	$(".find_id_btn").click(function() {
		$('.find_id_container').stop().show(0)
		$('.find_page_bg').stop().show(0)
	})
	$(".close_btn").click(function() {
		$('.find_id_container').stop().hide(0)
		$('.find_id_container123').stop().hide(0)
		$('.find_page_bg').stop().hide(0)
	})
	$('.find_page_bg').click(function() {
		$('.find_id_container').stop().hide(0)
		$('.find_page_bg').stop().hide(0)
	})

	// Find Password Modal
	$(".find_password_btn").click(function() {
		$('.find_password_container').stop().show(0)
		$('.find_page_bg').stop().show(0)
	})
	$(".close_btn").click(function() {
		$('.find_password_container').stop().hide(0)
		$('.find_password_container123').stop().hide(0)
		$('.find_page_bg').stop().hide(0)
	})
	$('.find_page_bg').click(function() {
		$('.find_password_container').stop().hide(0)
		$('.find_page_bg').stop().hide(0)
	})

	// 수정v1.1.5에 따른 추가 회원가입 버튼 클릭시 약관 페이지로 이동
	$('.user_join_btn').click(function() {
		location.href = "index.jsp?content=clause.jsp"
	})
	
	/* 로그인 버튼 클릭시 --------------------------------------- */
	$('.find_id_container123 button.insert_userId').click(function(){
		const userid = $('.find_id_container123 .find_id_result_ok span').text();
		console.log(userid);
		$('#login_form .input_container input[name=user_id]').val(userid);
		$('.find_id_container123').stop().hide(0)
	});	
/* --------------------------------------------------------- */
/* 비밀번호 입력 버튼 클릭시 --------------------------------------- */
	$('.find_password_container123 button.insert_userPwd').click(function(){
//		const userpwd = $('.find_password_container123 .find_pwd_result_ok span').text();
//		console.log(userpwd);
//		$('#login_form .input_container input[name=user_password]').val(userpwd);
		$('.find_password_container123').stop().hide(0)
	});	
/* --------------------------------------------------------- */
})