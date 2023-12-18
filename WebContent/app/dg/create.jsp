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
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
<!-- include libraries(jQuery, bootstrap) -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/dogatherCreate.css" />

</head>
<body>
	<%@include file="/loginCheck.jsp"%>

	<%@include file="/header.jsp"%>
	<main>
		<div id="main">
			<form name="dogather_create" action="${cp }/dg/create_ok.dg"
				method="post" enctype="multipart/form-data">
				<table>
					<thead>
						<tr>
							<td colspan="2"><h2><span class="purple">두게더</span> 만들기</h2></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th><label for="category_index">카테고리</label></th>
							<td><select name="category_index" id="category_index">
									<option value="1">건강</option>
									<option value="2">학습</option>
									<option value="3">교양</option>
									<option value="4">습관</option>
									<option value="5">경제</option>
							</select></td>
						</tr>
						<tr>
							<th><label for="dg_title">두게더 이름(필수)</label></th>
							<td><input type="text" name="dg_title" id="dg_title"
								maxlength="10" /></td>
						</tr>
						<tr>
							<th><label for="dg_intro">두게더 설명(필수)</label></th>
							<td><textarea name="dg_intro" id="dg_intro"
									spellcheck="false" maxlength="400"></textarea><span
								id="counter">(0 / 최대 400자)</span></td>
						</tr>
						<tr>
							<th><label for="dg_intro_short">짧은 설명(15글자 이내)</label></th>
							<td><input type="text" name="dg_intro_short"
								id="dg_intro_short" maxlength='15' style="width: 300px;" /></td>
						</tr>
						<tr>
							<th><label for="dg_banner">배너</label></th>
							<td>
								<img src="${cp }/resources/images/image_upload.png" id="banner_image" /> 
								<input type="file" name="dg_banner" id="dg_banner" accept=".jpeg,.jpg,.png,.webp,.gif,.bmp" style="display: block;" />
							</td>
						</tr>
						<tr>
							<th><label for="dg_public_scope">공개/비공개</label></th>
							<td><select name="dg_public_scope" id="dg_public_scope">
									<option value="1">공개</option>
									<option value="0">비공개</option>
							</select>
								<div id="limit_scope_container" style="display: inline;">
									<label for="dg_limit_scope_unlimit">바로 가입</label><input
										type="radio" name="dg_limit_scope" value="unlimit"
										id="dg_limit_scope_unlimit" checked> <label
										for="dg_limit_scope_limit">승인 후 가입</label><input type="radio"
										name="dg_limit_scope" value="limit" id="dg_limit_scope_limit">

								</div></td>
						</tr>
						<tr>
							<th><label for="dg_expire_define">목표날짜</label></th>
							<td><select name="dg_expire_define" id="dg_expire_define">
									<option value="false">설정하지 않기</option>
									<option value="true">설정하기</option>
							</select> <input type="date" name="dg_expire" id="dg_expire"
								style="display: none" /></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"><input type="submit" value="두게더 만들기"></td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</main>
	<%@include file="../../footer.jsp"%>
</body>
<script src="${cp }/resources/js/dg.js"></script>
</html>