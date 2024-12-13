$(document).ready(function() {
	var hn = $(".hidden_num").text();
	var searchText = $(".hidden_searchText").text();
	var searchField = $(".hidden_searchField").text();
	$(".hidden_num").hide();
	$(".hidden_searchText").hide();
	$(".hidden_searchField").hide();
	$(".delete_btn").click(function() {
		if (!confirm("정말로 삭제하시겠습니까?")) {
			location.reload();
		} else {
			location.href = 'boarddelete.do?num='+hn+'&searchText='+searchText+'&searchField='+searchField;		
		}
		
	});

});

//기본 작성했을떄 리스트 처음 이거 boardlist.do
//
//문의글 찾아보고 있었어 페이징 돌아다니면서 이거 히스토리고
//
//글검색 후 상세보기 후 리스트로 이동했을때 이거 서치리스트
//
//
//1) num으로 분기한다.
//2) 아무 조건이 필요가 없다.
//3) 서치텍스트로 분기한다.

