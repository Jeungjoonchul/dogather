<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="cp" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${cp }/smarteditor2-2.8.2.3/js/HuskyEZCreator" charset="utf-8"></script>
<script>
	let oEditors=[];
	
	smartEditor = function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef:oEditors,
			elPlaceHolder:"editorTxt",
			sSkinURI:"${cp }/smarteditor2-2.8.2.3/SmartEditor2Skin.html",
			fCreator:"createSEditor2"
		});
	}
	
	$(document).ready(function(){
		smartEditor();
	});
</script>
<body>
	<form action="">
		<textarea name = "editorTxt" id="editorTxt">asdf</textarea>
	</form>
</body>
</html>