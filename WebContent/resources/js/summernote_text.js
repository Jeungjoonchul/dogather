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
		disableDragAndDrop:true,
		callbacks: {
            onKeydown: function (e) { 
                var t = e.currentTarget.innerText; 
                if (t.trim().length >= 400) {
                    //delete keys, arrow keys, copy, cut, select all
                    if (e.keyCode != 8 && !(e.keyCode >=37 && e.keyCode <=40) && e.keyCode != 46 && !(e.keyCode == 88 && e.ctrlKey) && !(e.keyCode == 67 && e.ctrlKey) && !(e.keyCode == 65 && e.ctrlKey))
                    e.preventDefault(); 
                } 
            },
            onKeyup: function (e) {
                var t = e.currentTarget.innerText;
                $('#maxContentPost').text(400 - t.trim().length);
            },
            onPaste: function (e) {
                var t = e.currentTarget.innerText;
                var bufferText = ((e.originalEvent || e).clipboardData || window.clipboardData).getData('Text');
                e.preventDefault();
                var maxPaste = bufferText.length;
                if(t.length + bufferText.length > 400){
                    maxPaste = 400 - t.length;
                }
                if(maxPaste > 0){
                    document.execCommand('insertText', false, bufferText.substring(0, maxPaste));
                }
                $('#maxContentPost').text(400 - t.length);
            }
        }
    });
});