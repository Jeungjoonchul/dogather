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
<script src="${cp }/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script>
	$(document).ready(function () {
			
		var oEditors = [];
		function smartEditorIFrame() {
			
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "form-control",
				sSkinURI : "${cp}/smarteditor2/SmartEditor2Skin.html",
				fCreator : "createSEditor2",
			});
	      }
		smartEditorIFrame();
	});
</script>
<body>
	<form action="">
		<textarea name="form-control" id="form-control">asdf</textarea>
	</form>
</body>
</html>