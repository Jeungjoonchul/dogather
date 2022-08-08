<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>




<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			width : 1000,
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
					url : '${cp}/board/board_imageUpload.bo',
					cache : false,
					contentType : false,
					processData : false,
					enctype : 'multipart/form-data',
					success : function(img_systemName) {
						var orgName = img_systemName.split(',')[0];
						var sysName = img_systemName.split(',')[1];
						$(el).summernote('editor.insertImage',
								'${cp}/temp/' + sysName);
						$('#sysName').append(sysName + ',');
						$('#orgName').append(orgName + ',');
					}
				});
	}
</script>
</head>
<body>
	<form method="post" action="${cp}/board/board_write.bo"
		id="board_editor" name="board_editor">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="tb_title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="summernote" name="tb_contents"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="전송">
		<textarea name="orgName" id="orgName" style="display: none;"></textarea>
		<textarea name="sysName" id="sysName" style="display: none;"></textarea>
	</form>
</body>
</html>