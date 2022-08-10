<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<form id="reply_form">
		<input type="hidden" name="user_index" value="1" /> <input
			type="hidden" name="b_index" value="1" />
		<textarea rows="" cols="" name="r_contents"></textarea>
		<a href="javascript:sendit();">등록</a>
	</form>
	<table id="reply_list">
		<tr>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
	</table>
</body>
<script>
	function sendit() {
		var form = $('#reply_form');
		var list = $('#reply_list');
		$('#reply_list tr:gt(0)').remove();
		$.ajax({
			url : '${cp}/board/reply_ok.bo',
			type : 'post',
			data : form.serialize(),
			dataType:'json',
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					var rpl = $("<tr class='replies' id='reply'"+i+"'><td>"+data[i].user_nickname+"</td><td>"+data[i].r_contents+"</td><td>"+data[i].r_reg_date+"</td></tr>");
					list.append(rpl);
				}
			}
		});

	}
</script>
</html>