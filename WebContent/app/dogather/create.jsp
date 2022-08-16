<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="cp" value="${pageContext.request.contextPath }"/>
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
      rel="stylesheet"
    />
    <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
    <!-- include libraries(jQuery, bootstrap) -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


    <title>Doːgather</title>
    <link rel="stylesheet" href="${cp }/resources/css/include.css" />
        <link rel="stylesheet" href="${cp }/resources/css/mainStyle.css" />
        <style>
        	#banner_image{
        		width: 100px;
        		height: 100px;
        	}
        	td:first-of-type{text-align: left;}
        	th{font-size: 16px;}
        </style>
</head>
<body>

<c:if test="${empty loginUser }">
	<c:choose>
		<c:when test="${empty cookie.autoLogin_check }">
		<script>
			alert('로그인 후 이용 가능합니다');
			location.replace("${cp}/user/login.us");
		</script>
		</c:when>
		<c:otherwise>
		<script>
			location.replace("${cp}/user/login.us");
		</script>
		</c:otherwise>
	</c:choose>
</c:if>
	<%@include file="../../header.jsp" %>
	<main>
		<div id="main">
	<form name="dogather_create" action="${cp }/dogather/create_ok.dg" method="post" enctype="multipart/form-data">
	<table>
	<thead>
	<tr>
	<td colspan="2"><h2>두개더 만들기</h2></td>
	</tr>
	</thead>
	<tbody>
		<tr>
		<th><label for="category_index">카테고리</label></th>
		<td>
		<select name="category_index" id="category_index">
			<option value="1">건강</option>
			<option value="2">학습</option>
			<option value="3">교양</option>
			<option value="4">습관</option>
			<option value="5">경제</option>
		</select>
		</td>
		</tr>
		<tr>
			<th><label for="dg_title">두개더 이름(필수)</label></th>
			<td><input type="text" name="dg_title" id="dg_title"/></td>
		</tr>
		<tr>
			<th>	<label for="dg_intro">두개더 설명(필수)</label></th>
			<td><textarea name="dg_intro" id="dg_intro"rows="6" cols="15"></textarea></td>
		</tr>
		<tr>
			<th>	<label for="dg_intro_short">짧은 설명</label></th>
			<td><input type="text" name="dg_intro_short" id="dg_intro_short"/></td>
		</tr>
		<tr>
			<th><label for="dg_banner">배너</label></th>
			<td>
			<img src="${cp }/resources/images/image_upload.png" id="banner_image"/>
			<input type="file" name = "dg_banner" id="dg_banner" accept=".jpeg,.jpg,.png,.webp,.gif,.bmp" style="display: block;"/>
			</td>
		</tr>
		<tr>
			<th><label for="dg_public_scope">공개/비공개</label></th>
			<td>
				<select name="dg_public_scope" id="dg_public_scope">
					<option value="1">공개</option>
					<option value="0">비공개</option>
				</select>
				<div id="limit_scope_container" style="display: inline;">
        <label for="dg_limit_scope_unlimit">바로 가입</label><input type="radio" name="dg_limit_scope" value="unlimit" id="dg_limit_scope_unlimit" checked>
        <label for="dg_limit_scope_limit">승인 후 가입</label><input type="radio" name="dg_limit_scope" value="limit" id="dg_limit_scope_limit">

    </div>
			</td>
		</tr>
		<tr>
			<th><label for="dg_expire_define">목표날짜</label></th>
			<td>
				<select name="dg_expire_define" id="dg_expire_define">
					<option value="false">설정하지 않기</option>
					<option value="true">설정하기</option>
				</select>
					<input type="date" name="dg_expire" id="dg_expire" style="display: none"/>
			</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2"><input type="submit" value="두개더 만들기"></td>
		</tr>
	</tfoot>
	</table>
	</form>
		</div>
	</main>
	<%@include file="../../footer.jsp" %>
</body>
<script>
	$('#dg_banner').on('change',function(e){
		var flag=true;
		var file = e.target.files[0];
		var file_reg = /^(.*?)\.(jpg|jpeg|png|gif|bmp|webp)$/;
		var max_size=5*1024*1024;
		var image=$('#banner_image');
		var status=$('#image_status');
		status.css('color','red');
		if(file==undefined){
			alert('선택된 이미지가 없습니다');
			flag=false;
		}else if(!file_reg.test(file.name)){
			alert('이미지 형식이 올바르지 않습니다');
			flag=false;
		}else if(file.size>=max_size){
			alert('이미지는 5MB까지 등록 가능합니다');
			flag=false;
		}
		if(flag){
		console.log(flag);
			const reader = new FileReader();
			reader.onload=function(ie){
				image.attr('src',ie.target.result);
			}
				reader.readAsDataURL(file);
				$('#image_status').text(' ');
		}else{
			image.attr('src','${cp}/resources/images/image_upload.png');
			$('#dg_banner').val('');
			$('#dg_banner').focus();
		}
	});
	
	$(document).ready(function(){
		$('#limit_scope_container').show();
		$('#dg_expire').hide();
	});
	
	$('#dg_public_scope').on('change',function(){
		
			$('#limit_scope_container').toggle();
		
	});
	$('#dg_expire_define').on('change',function(){
		$('#dg_expire').toggle();
		if(!$('#dg_expire').is(':visible')){
			$('#dg_expire').val('');
		}
		
	});
	$('form[name=dogather_create]').on('submit',function(e){
		e.preventDefault();
		var flag=true;
		var title_dup='O';
		var dg_title=$('#dg_title');
		var dg_intro=$('#dg_intro');
		$.ajax({
			url : cp + '/dogather/dogather_dup_check.dg',
			type : 'post',
			data : {"dg_title":dg_title.val()},
			dataType : 'text',
			async : false,
			success : function(data) {

				if (data == 'X') {
					title_dup='X';
					flag=false
				}
			}
		});
		if(dg_title.val()==''){
			alert('두개더의 이름을 입력해주세요');
			dg_title.focus();
			flag=false
			return flag;
		}
		if(title_dup=='X'){
			alert('이미 존재하는 두개더 이름입니다');
			dg_title.focus();
			flag=false
			return flag;
		}
		if(dg_intro.val()==''){
			alert('두개더의 설명을 입력해주세요');
			dg_intro.focus();
			flag=false
			return flag;
		}
		if(flag){
			this.submit();			
		}
	});
	
</script>
</html>