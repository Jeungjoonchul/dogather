
function loginCheck(loginUser, page) {
	if (loginUser) {
		location.href = cp + "/board/free_board/post_write.bo?page=" + page;
	} else {
		alert('로그인 후 이용 가능합니다');
		location.href = cp + "/user/login.us"
	}
}

function delete_check(b_index) {
	var check = confirm('정말 삭제하시겠습니까?');
	if (check) {
		location.href = cp + "/board/free_board/post_delete.bo?b_index="
				+ b_index;
	}
}

function postOn() {

	var title = $('#b_title');
	var contents = $('#summernote');
	var post = $('#post_editor');
	if (title.val() == '' || title.val() == null) {
		alert('제목을 입력하세요');
		title.focus();
		return false;
	}
	if (contents.val() == '' || contents.val() == null) {
		alert('내용을 입력하세요');
		$('#summernote').summernote('focus');
		return false;
	}
	post.submit();
}

$(document).on('click','#reply_on',function(){
	var user_nickname=$('#loginUser_nickname').val();
	if(user_nickname==null||user_nickname==''){
		alert('로그인 후 댓글 작성 가능합니다');
		location.href=cp+'/user/login.us';
		return false; 
	}
	if($('#r_contents').val()==''){
		alert('내용을 입력해주세요');
		$('#r_contents').focus();
		return false;
	}
	var form= $('#reply_write');
	$.ajax({
		url : cp+'/board/reply_ok.bo',
		type : 'post',
		data : form.serialize(),
		dataType : 'text',
		async: false,
		success : function(data) {
			if(data=='X'){
				alert('댓글 등록에 실패했습니다');
				return false;
			}else{
				alert('댓글이 등록되었습니다');
				$('#r_contents').val('');
				getList(data);
			}
		}
	});
});


$('#reply_area_toggle').on('click',function(){
	if($('#reply_area_toggle').val()=='접기'){
		$('#reply_area_toggle').val('펼쳐보기');
		$("#reply_area").hide('slow');
	}else{
		$('#reply_area_toggle').val('접기');
		$("#reply_area").show('slow');
	}
});

var replyUpdateFlag=true;
$(document).on('click','.reply_update',function(e){
	var target = $(e.target);

	if(replyUpdateFlag){
		target.hide();
		target.next().show();
		replyUpdateFlag=false;
		var textarea=target.parent().parent().next().children();
		textarea.removeAttr('readonly');
		textarea.css('background-color','#fffde7');
		textarea.css('border','0.5px solid #e0e0e0');
		textarea.focus();
	}else{
		alert('수정중인 댓글이 있습니다');
	}
	
});

$(document).on('click','.reply_update_submit',function(e){
	//여기 할 차례
});


$(document).on('click','.reply_page_btn',function(e){
	var page = $(e.target).val();
	getList(page);
});

	
var getList=function(page){
	if(page=='>'){
		page=parseInt($('#endPage').val())+1;
	}
	if(page=='<'){
		page=parseInt($('#startPage').val())-1;
	}
	
	var r_name = $('#r_name').val();
	var b_index = $('#b_index').val();
	var user_nickname=$('#loginUser_nickname').val();
	$
			.ajax({
				url : cp + '/board/reply_list.bo',
				type : 'post',
				data : {
					"page" : page,
					"r_name" : r_name,
					"b_index" : b_index
				},
				dataType : 'json',
				async:false,
				success : function(data) {
					$('#reply_area div').remove();
					for (var i = 0; i < data.list.length; i++) {
						// 리뷰 담을 div
						var reply_area = $('<div class="reply_area"></div>');
						
						// 리뷰의 첫번째 줄
						var reply_header = $(' <div class="reply_header"></div>');
						
						// 리뷰의 첫줄의 왼쪽 닉네임
						var reply_header_left = $('<div class="reply_header_left"></div>').text(
								data.list[i].user_nickname);
						
						// 첫줄에 왼쪽 닉네임 추가
						reply_header.append(reply_header_left);
						
						// 리뷰 첫줄의 오른쪽 날짜와 버튼
						var reply_header_right = $('<div class="reply_header_right"></div>');
						
						// 날짜 담을 span
						var date = $('<span></span>');

						// 오늘 작성된 리뷰라면 시간으로 표시/아니라면 날짜로 표시
						var r_date = data.list[i].r_reg_date.split(' ')[0];
						var r_time = data.list[i].r_reg_date.split(' ')[1];
						var now = new Date();
						var dateTime = new Date(data.list[i].r_reg_date);

						if (now.getFullYear() === dateTime.getFullYear()
								&& now.getMonth() === dateTime.getMonth()
								&& now.getDate() === dateTime.getDate()) {
							date.text(r_time);
						} else {
							date.text(r_date);
						}
						
						// 수정여부 확인 후 수정표시
						if (data.list[i].r_reg_date != data.list[i].r_update_date) {
							date.text(date.text() + '(수정됨)');
						}
						
						// 첫줄 오른쪽에 날짜 추가
						reply_header_right.append(date);
							
						
						// 첫줄 오른쪽 날짜 옆에 버튼 추가
						if(user_nickname==data.list[i].user_nickname){
							var btn_update = $('<input type="button" class="reply_btns reply_update" value="수정"/>');
							var btn_update_complete = $('<input type="button" class="reply_btns reply_update_submit" value="수정 완료" style="display: none;"/>');
							var btn_delete = $('<input type="button" class="reply_btns reply_delete" value="삭제"/>');
							reply_header_right.append(btn_update);
							reply_header_right.append(btn_update_complete);
							reply_header_right.append(btn_delete);
						}else{
							var btn_report = $('<input type="button" class="reply_btns reply_delete" value="신고"/>');
							reply_header_right.append(btn_report);
						}
						
						// 왼쪽 완성 후 첫줄에 추가
						reply_header.append(reply_header_right);
						
						// 첫줄 완성 후 reply_area에 추가
						reply_area.append(reply_header);
						
						// 두번째 줄에 댓글 내용 담을 div 및 textarea 생성
						var reply_content = $('<div class="reply_content"></div>');
						var replyTXT = $('<textarea readonly></textarea>');
						replyTXT.val(data.list[i].r_contents);
						reply_content.append(replyTXT);
						reply_area.append(reply_content);
						$('#reply_area').append(reply_area);
					}
					$('#totalPage').val(data.totalPage);
					$('#totalCnt').val(data.totalCnt);
					$('#startPage').val(data.startPage);
					$('#endPage').val(data.endPage);
					$('#page').val(data.page);
					var reply_page=$('<div id="reply_page_selector"></div>');
					if (data.startPage != 1) {
						var sbtn = $('<input type="button" class="reply_page_btn" value="&lt;"/>');
						reply_page.append(sbtn);
					}
					for (var i = data.startPage; i <= data.endPage; i++) {
						if (data.page == i) {
							var nowPage = $('<span class="nowPage">' + i + '</span>');
							reply_page.append(nowPage);
						} else {
							var otherPage = $('<input type="button" class="reply_page_btn" value="'+i+'"/>');
							reply_page.append(otherPage);
						}
					}
					if (data.endPage != data.totalPage) {
						var ebtn = $('<input type="button" class="reply_page_btn" value="&gt;"/>');
						reply_page.append(ebtn);
					}
					$('#reply_area').append(reply_page);
				}
			});

}