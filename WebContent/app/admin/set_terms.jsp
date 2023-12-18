<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="${cp}/resources/js/cp.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com/" />
<link rel="preconnect" href="https://fonts.gstatic.com/" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


<title>Doːgather</title>
</head>
<body>

	<form action="${cp }/admin/set_terms_ok.ad" method="post" >
		<c:forEach items="${list }" var="t">
			<table>
				<caption>약관 ${t.terms_index }</caption>
				<tr>
					<th>제목</th>
					<td><input type="text" value="${t.terms_title }" name="terms_title${t.terms_index }"></td>
					
				</tr>
				<tr>
				<th>약관 내용</th>
					<td><textarea class="textarea" name="terms_contents${t.terms_index }">${t.terms_contents }</textarea></td>
				</tr>
			</table>
			<hr/>
		</c:forEach>
		<input type="submit">
	</form>



</body>
<script src="${cp }/resources/js/summernote_text.js"></script>
</html>