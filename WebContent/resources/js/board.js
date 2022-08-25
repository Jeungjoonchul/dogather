//게시글 작성 시 로그인 검사

function loginCheck(loginUser) {
	var page=$('#page').val();
	var keyword=$('#post_query_keyword').val();
	var subject=$('#subject').val();
	if (loginUser) {
		location.href = cp + "/board/"+$('#path').val()+"/post_write.bo?page=" + page+"&keyword="+keyword+"&subject="+subject;
	} else {
		alert('로그인 후 이용 가능합니다');
		location.href = cp + "/user/login.us"
	}
}

//게시글 삭제
function delete_check(b_index,page,keyword,subject) {
	var check = confirm('정말 삭제하시겠습니까?');
	if (check) {
		location.href = cp + "/board/"+$('#path').val()+"/post_delete.bo?b_index="+ b_index+"&page="+page+"&keyword="+keyword+"&subject="+subject;
	}
}



//게시글 필터
$('#subject').on('change',function(){
	var page=$('#page').val();
	var keyword=$('#post_query_keyword').val();
	var subject=$('#subject').val();
	location.href = cp + "/board/"+$('#path').val()+"/post_list.bo?page="+page+"&keyword="+keyword+"&subject="+subject;
});

//게시글 작성 유효성 검사
function postCheck() {

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

//게시글 검색
$('#post_query_btn').on('click',function(){
	postQuery();
});
$('#post_query_keyword').on('keyup',function(key){
	if(key.keyCode==13){
		postQuery();
	}
});
function postQuery(){
	var subject= $('#subject').val();
	var keyword = $('#post_query_keyword').val();
	location.href=cp+'/board/'+$('#path').val()+'/post_list.bo?keyword='+keyword+'&subject='+subject;
};

//댓글 작성
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
		url : cp+'/board/'+$('#path').val()+'/reply_on.bo',
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

//댓글 펼치기, 접기
$('#reply_area_toggle').on('click',function(){
	if($('#reply_area_toggle').val()=='접기'){
		$('#reply_area_toggle').val('펼쳐보기');
		$("#reply_area").hide('slow');
	}else{
		$('#reply_area_toggle').val('접기');
		$("#reply_area").show('slow');
	}
});

//수정 버튼 눌렀는지 확인용(수정 누르면 false로 변하고 다른 수정 버튼 못누름/댓글 내용 수정 후 
var replyUpdateFlag=true;
//댓글 수정 여부 확인용
var reply_contents_before='';

//수정 버튼 누르면 수정 완료 버튼으로 변경
$(document).on('click','.reply_update',function(e){
	var target = $(e.target);
	reply_contents_before=target.parent().parent().next().children().html().replaceAll('<br>','\n');

	var cont=target.parent().parent().next();
	if(replyUpdateFlag){
		target.hide();
		target.next().show();
		replyUpdateFlag=false;
		
		var textarea=$('<textarea spellcheck="false" id="reply_editor"></textarea>');
		textarea.val(reply_contents_before);
		var height = cont.children().css('height');
		cont.children().remove();
		textarea.css('height',height);
		cont.append(textarea);
		
//		var textarea=target.parent().parent().next().children();
//		textarea.removeAttr('readonly');
//		textarea.css('background-color','#fffde7');
//		textarea.css('border','0.5px solid #e0e0e0');
		textarea.focus();
		
		const re = document.getElementById('reply_editor');
		caretMoveEnd(re);
	}else{
		alert('수정중인 댓글이 있습니다');
	}
	
});



$(document).on('keyup','#reply_editor',function(){
	var rows=$('#reply_editor').val().split('\n').length;
	$('#reply_editor').css('height',(rows-1)*20+45+ 'px');
})
$(document).on('keyup','#r_contents',function(){
	var rows=$('#r_contents').val().split('\n').length;
	if(rows>4){
		$('#r_contents').css('height',(rows-4)*20+100+ 'px');
	}
})

//댓글 수정
$(document).on('click','.reply_update_submit',function(e){
	var r_contents=$(e.target).parent().parent().next().children().val();
	var r_index = $(e.target).next().next().val();
	
	var page = $('#page').val();
	if(reply_contents_before==r_contents){
		alert('변경 사항이 없습니다')
		return false;
	}
	$.ajax({
		url : cp+'/board/'+$('#path').val()+'/reply_update.bo',
		type : 'post',
		data : {"r_contents":r_contents,"r_index":r_index},
		dataType : 'text',
		async: false,
		success : function(data) {
			if(data=='X'){
				alert('댓글 수정에 실패했습니다');
				return false;
			}else{
				alert('댓글이 수정되었습니다');
				replyUpdateFlag=true;
				getList(page);
			}
		}
	});
});

var caretMoveEnd=function(item){
	var selection=document.getSelection();
	var range=document.createRange();
	range.selectNodeContents(item);
	range.collapse(false);
	selection.removeAllRanges();
	selection.addRange(range);
};

//댓글 삭제
$(document).on('click','.reply_delete',function(e){
	var check=confirm('댓글을 삭제하시겠습니까?');
	if(check){
		var r_index=$(e.target).next().val();
		var page = $('#page').val();
		var b_index=$('#b_index').val();
		$.ajax({
			url : cp+'/board/'+$('#path').val()+'/reply_delete.bo',
			type : 'post',
			data : {"r_index":r_index,"page":page,"b_index":b_index},
			dataType : 'text',
			async: false,
			success : function(data) {
				if(data=='X'){
					alert('댓글 삭제에 실패했습니다');
					return false;
				}else{
					alert('댓글이 삭제되었습니다');
					getList(data);
				}
			}
		});
	}else{
		return false;
	}
});


//댓글 페이지 버튼 누를 시 페이지 변경
$(document).on('click','.reply_page_btn',function(e){
	var page = $(e.target).val();
	getList(page);
});

//좋아요 누르기
$('#like_up span').on('click',function(e){
	var user_nickname=$('#loginUser_nickname').val();
	if(user_nickname==null||user_nickname==''){
		alert('로그인 후 좋아요를 누를 수 있습니다');
		return false; 
	}
	else{
		var status = $('#like_up span:last-child').text();
		var b_index = $('#b_index').val();
		$.ajax({
			url : cp+'/board/'+$('#path').val()+'/board_like.bo',
			type : 'post',
			data : {"b_index":b_index,"status":status},
			dataType : 'json',
			async: false,
			success : function(data){
				if(data.result=='like'){
					$('#like_up').children().first().text('♥');
					$('#like_up').children().last().text('like');
				}else{
					$('#like_up').children().first().text('♡');
					$('#like_up').children().last().text('none');
				}
				if(data.b_like_cnt==undefined){
					data.b_like_cnt=0;
				}
				$('#meta_right').children().last().text('좋아요 '+(data.b_like_cnt+''));
				return;
			}
		});
	}
});


//페이지에 대한 댓글 리스트 가져오기
var getList=function(page){
	if(page=='>'){
		page=parseInt($('#endPage').val())+1;
	}
	if(page=='<'){
		page=parseInt($('#startPage').val())-1;
	}
	
	var b_index = $('#b_index').val();
	var user_nickname=$('#loginUser_nickname').val();
	$
			.ajax({
				url : cp+'/board/'+$('#path').val()+'/reply_list.bo',
				type : 'post',
				data : {
					"page" : page,
					"b_index" : b_index
				},
				dataType : 'json',
				async:false,
				success : function(data) {
					$('#reply_area div').remove();
					if(data.list.length>0){
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
								var btn_report = $('<input type="button" class="reply_btns reply_report" value="신고"/>');

								reply_header_right.append(btn_report);
								
							}
							var r_index =$('<input type="hidden" class="r_index" value="'+data.list[i].r_index+'"/>')
							reply_header_right.append(r_index);
							
							// 왼쪽 완성 후 첫줄에 추가
							reply_header.append(reply_header_right);
							
							// 첫줄 완성 후 reply_area에 추가
							reply_area.append(reply_header);
							
							// 두번째 줄에 댓글 내용 담을 div 및 textarea 생성
							var reply_content = $('<div class="reply_content"></div>');
							var replyTXT = $('<div>'+data.list[i].r_contents+'</div>');
							reply_content.append(replyTXT);
							reply_area.append(reply_content);
							$('#reply_area').append(reply_area);
						}
						
						//댓글 페이징 처리
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
					}else{
						$('#reply_area').remove();
						$('#reply_list').css('text-indent','40px');
						$('#reply_list').text('작성된 댓글이 없습니다.');
					}
					
				}
			});

}