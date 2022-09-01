$(document).ready(function(){
	//여기 아래 부분
	$('.textarea').summernote({
		width:338,
		maxWidth:338,
		height : 500, // 에디터 높이
		minHeight : null, // 최소 높이
		maxHeight : 500, // 최대 높이
		lang : "ko-KR", // 한글 설정
		disableResizeEditor: true,
		toolbar: 'none',
		spellCheck:false,
		disableDragAndDrop:true
    });
});