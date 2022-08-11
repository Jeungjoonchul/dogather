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

function replyOn(user_check,rn,bi,un) {
	var r_name = rn;
	var b_index=bi;
	var user_nickname=un;
	if(user_check){
		alert('로그인 후 댓글 작성 가능합니다');
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
			if(data=='O'){
				alert('댓글이 등록되었습니다');
				replyList(null,r_name,b_index,user_nickname);				
			}else{
				alert('댓글 등록에 실패했습니다');
				return false;
			}
		}
	});
}


//매개변수 
//< : $("#startPage").val()-1,$("#r_name").val(),$("#b_index").val(),${empty loginUser?null:loginUser.user_index}
//> : parseInt($("#endPage").val())+1,$("#r_name").val(),$("#b_index").val(),${empty loginUser?null:loginUser.user_index}
//페이지 번호 : ${i },$("#r_name").val(),$("#b_index").val(),${empty loginUser?null:loginUser.user_index}
function replyList(pn, rn, bi,un) {
	var tbody = $('#reply_contents');
	var page = pn;
	var r_name = rn;
	var b_index = bi;
	var user_nickname=un;
	console.log(user_nickname);
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
				success : function(data) {
					$('#reply_contents tr').remove();
					for (var i = 0; i < data.list.length; i++) {
						var tr = $('<tr class="replies"></tr>');
						var td1 = $('<td></td>');
						var nick = $('<span></span>').text(
								data.list[i].user_nickname);
						td1.append(nick);
						tr.append(td1);

						var td2 = $('<td></td>');
						var con = $('<textarea rows="2" cols="10" readonly style="resize:none;outline:none;border:none;"></textarea>');
						con.val(data.list[i].r_contents);
						td2.append(con);
						tr.append(td2);

						var td3 = $('<td></td>');
						var date = $('<span></span>');
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
						if (data.list[i].r_reg_date != data.list[i].r_update_date) {
							date.text(date.text() + '(수정됨)');
						}
						td3.append(date);
						tr.append(td3);
						var td4 = $('<td></td>');
										
						if(user_nickname==data.list[i].user_nickname){
							
							var btn1 = $('<a>수정</a>');
							var btn2 = $('<a style="display:none;">수정완료</a>');
							var btn3 = $('<a>삭제</a>');
							btn1.attr('href', '#');
							btn2.attr('href', '#');
							btn3.attr('href', '#');
							td4.append(btn1);
							td4.append(btn2);
							td4.append(btn3);
						}else{
							var btn4=$('<a>신고</a>');
							btn4.attr('href','#');
							td4.append(btn4);
						}
						tr.append(td4);

						tbody.append(tr);
					}
					$('#totalPage').val(data.totalPage);
					$('#totalCnt').val(data.totalCnt);
					$('#startPage').val(data.startPage);
					$('#endPage').val(data.endPage);
					$('#page').val(data.page);
					$('#list_selector tr').remove();
					var ftr = $('<tr></tr>');
					var ftd = $('<td colspan="4"></td>');
					if (data.startPage != 1) {
						var sbtn = $('<a>&lt;</a>');
						sbtn
								.attr(
										'href',
										'javascript:replyList($("#startPage").val()-1,$("#r_name").val(),$("#b_index").val(),"'+user_nickname+'")')
						ftd.append(sbtn);
					}
					for (var i = data.startPage; i <= data.endPage; i++) {
						if (data.page == i) {
							var nowPage = $('<span>' + i + '</span>');
							ftd.append(nowPage);
						} else {
							var otherPage = $('<a>' + i + '</a>');
							otherPage
									.attr(
											'href',
											'javascript:replyList('
													+ i
													+ ',$("#r_name").val(),$("#b_index").val(),"'+user_nickname+'")');
							ftd.append(otherPage);
						}
					}
					if (data.endPage != data.totalPage) {
						var ebtn = $('<a>&gt;</a>');
						ebtn
								.attr(
										'href',
										'javascript:replyList(parseInt($("#endPage").val())+1,$("#r_name").val(),$("#b_index").val(),"'+user_nickname+'")')
						ftd.append(ebtn);
					}
					ftr.append(ftd);
					$('#list_selector').append(ftr);
				}
			});

}
