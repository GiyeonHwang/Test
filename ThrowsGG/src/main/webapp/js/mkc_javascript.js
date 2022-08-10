/*blog-single 페이지로 유기번호를 넘기는 js 함수 - mkc */
function goData(DesertionNo) {
	var form = document.frm;
	$('input[name=DesertionNo]').attr('value', DesertionNo);
	$("#frm").submit();
}
/*blog-single 페이지에서 대댓글(reply)버튼 누를시 쓰기 폼으로 스크롤 이동  - mkc */
function fnMove(mkc) {
	$('input[id=name]').attr('value', mkc);
	var offset = $("#leaveCommFrm").offset();
	$('html, body').animate({ scrollTop: offset.top }, 1000);
}


