function contextPath(){
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+1));
		return contextPath;
}
const cp = contextPath();
	
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		height : 300, // 에디터 높이
		minHeight : null, // 최소 높이
		maxHeight : null, // 최대 높이
		focus : true, // 에디터 로딩후 포커스를 맞출지 여부
		lang : "ko-KR", // 한글 설정
		placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i], this);
				}
			}
		}

	});
});


function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
				data : form_data,
				type : "POST",
				url : cp+'/board/board_imageUpload.bo',
				cache : false,
				contentType : false,
				processData : false,
				enctype : 'multipart/form-data',
				success : function(img_systemName) {
					var orgName = img_systemName.split(',')[0];
					var sysName = img_systemName.split(',')[1];
					$(el).summernote('editor.insertImage',
							cp+'/temp/' + sysName);
					$('#sysName').append(sysName + ',');
					$('#orgName').append(orgName + ',');
				}
			});
}