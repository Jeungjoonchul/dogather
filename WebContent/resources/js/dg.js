//front

$('.dg_box').hover(function(e){
		$(this).addClass('hover')
	},function(e){
		$(this).removeClass('hover')
	});


//create
$('#dg_intro').keyup(function (e){
    var content = $(this).val();
    $('#counter').html("("+content.length+" / 최대 400자)");    //글자수 실시간 카운팅

    if (content.length > 400){
        alert("최대 400자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 400));
        $('#counter').html("(400 / 최대 400자)");
    }
});
$('#dg_intro').keyup(function(){
            var rows = $('#dg_intro').val().split('\n').length;
            var maxRows = 12;
            if( rows > maxRows){
                alert('12줄 까지만 가능합니다');
                modifiedText = $('#dg_intro').val().split("\n").slice(0, maxRows);
                $('#dg_intro').val(modifiedText.join("\n"));
            }
        });

$('#dg_banner').on('change',function(e){
	var flag=true;
	var file = e.target.files[0];
	var file_reg = /^(.*?)\.(jpg|jpeg|png|gif|bmp|webp)$/;
	var max_size=5*1024*1024;
	var image=$('#banner_image');
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
		const reader = new FileReader();
		reader.onload=function(ie){
			image.attr('src',ie.target.result);
		}
			reader.readAsDataURL(file);
			$('#image_status').text(' ');
	}else{
		image.attr('src', cp+'/resources/images/image_upload.png');
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
		url : cp + '/dg/dogather_dup_check.dg',
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
	if(dg_intro.val().length>300){
		alert('최대 300자 까지만 입력가능합니다');
		dg_intro.focus();
		flag=false
		return flag;
	}
	if(flag){
		this.submit();			
	}
});


//catalog

var next = 5;
var end = next+5;
var box_hover=true;
$('.addlist').on('click',function(){
	box_hover=false;
	for (var i = next; i < end; i++) {
		$('.dg_number'+i).slideDown('fast');
	}
	next=end;
	end=next+5;
	if(next==20){
		$('.addlist').hide();
		$('.page-btns').show();
	}
	setInterval(() => {
		box_hover=true;
	}, 500);
});

$('.dogathermain_list').hover(function(e){
	if(box_hover){
		$(this).css('transform','translate(-10px,-10px)');
		$(this).css('transition-property','all');
		$(this).css('transition-duration','0.5s');
		$(this).css('transition-delay','0.1s');
		$(this).css('box-shadow','20px 20px 10px #aaaaaa');
	}
},function(e){
	if(box_hover){
		$(this).css('transform','translate(0,0)');
		$(this).css('transition-property','all');
		$(this).css('transition-duration','0.5s');
		$(this).css('transition-delay','0.1s');
		$(this).css('box-shadow','10px 10px 5px #aaaaaa')
	}
});


//detail

$('#dg_comm_bulletin').hover(function(e){
	$(this).css('transform','translate(-10px,-10px)');
	$(this).css('transition-property','all');
	$(this).css('transition-duration','0.5s');
	$(this).css('transition-delay','0.1s');
	$(this).css('box-shadow','20px 20px 10px #aaaaaa');
},function(e){
	$(this).css('transform','translate(0,0)');
	$(this).css('transition-property','all');
	$(this).css('transition-duration','0.5s');
	$(this).css('transition-delay','0.1s');
	$(this).css('box-shadow','10px 10px 5px #aaaaaa');
});

//detail post page mover

function transferPage(dp_page){
	var dg_index=$('#dg_index').val();
	var dp_type=$('input[name=dp_type]:checked').val();
	var dp_align=$('input[name=dp_align]:checked').val();
	var dp_mine=$('#dp_mine').is(':checked')?'on':'off';

		location.href=cp+"/dg/detail.dg?dg_index="+dg_index+"&dp_page="+dp_page+"&dp_type="+dp_type+"&dp_align="+dp_align+"&dp_mine="+dp_mine;

}

$('.dp_filter input').on('change',function(){
	var dg_index=$('#dg_index').val();
	var dp_type=$('input[name=dp_type]:checked').val();
	var dp_align=$('input[name=dp_align]:checked').val();
	var dp_mine=$('#dp_mine').is(':checked')?'on':'off';
	location.href=cp+"/dg/detail.dg?dg_index="+dg_index+"&dp_type="+dp_type+"&dp_align="+dp_align+"&dp_mine="+dp_mine;
});

//modal_post_detail
function viewPost(dp_index){
	var modal=$('#modal');
	modal.fadeIn(500);
	$('.dg_comm_feed>a').attr('onclick','return false');
	$('.dg_comm_cert>a').attr('onclick','return false');
	var user_nickname=$('#loginUser_nickname').val();
	$.ajax({
		url : cp+'/dg/post_detail.dg',
		type : 'post',
		data : {"dp_index":dp_index},
		dataType : 'json',
		async: false,
		success : function(data) {
			var dp_index=$('<input type="hidden" value="'+data.dp.dp_index+'" id="dp_index"/>')
			modal.append(dp_index);
			
			var modal_cont =$('<div id="modal_cont"></div>');
			var post_detail =$('<div id="post_detail"></div>');
			var post_info = $('<div id="post_info" ></div>');
	
			var post_dp_nickname=$('<div id="post_dp_nickname" ></div>');
			var nickname_span=$('<span></span>');
			nickname_span.text(data.dp.user_nickname);
			post_dp_nickname.append(nickname_span);
			post_dp_nickname.appendTo(post_info);
			
			var post_dp_like_cnt=$('<div id="post_dp_like_cnt" ></div>');
			var like_span=$('<span>♥</span>');
			var like_cnt_span=$('<span></span>');
			like_cnt_span.text(data.dp.dp_like_cnt);
			post_dp_like_cnt.append(like_span);
			post_dp_like_cnt.append(like_cnt_span);
			post_dp_like_cnt.appendTo(post_info);
			post_detail.append(post_info);
			
			var post_dp_reg_date=$('<div id="post_dp_reg_date" ></div>');
			var reg_date_span=$('<span></span>');
			reg_date_span.text(data.dp.dp_reg_date);
			post_dp_reg_date.append(reg_date_span);
			if(data.dp.dp_reg_date!=data.dp.dp_update_date){
				var update_check=$('<span></span>');
				update_check.text('(수정됨)');
				post_dp_reg_date.append(update_check);
			}
			post_dp_reg_date.appendTo(post_detail);
				
			var post_contents = $('<div id="post_contents" ></div>');
			
			var post_dp_contents=$('<div id="post_dp_contents" ></div>');
			var contents_cont=$('<p>'+data.dp.dp_contents+'</p>');

			post_dp_contents.append(contents_cont);
			post_dp_contents.appendTo(post_contents);
			post_detail.append(post_contents);
		
			
			var images=[data.dp.dp_image1_sys,data.dp.dp_image2_sys,data.dp.dp_image3_sys];
			var flag=false;
			for (var i = 0; i < images.length; i++) {
				if(images[i]!=undefined){
					var image=images[i];
					flag=true;
					images[i]=$('<img/>');
					images[i].attr("src",cp+"/upload/images/dogather/cert/"+image);
				}else{
					break;
				}
			}
			
			if(flag){
				var post_images=$('<div id="post_images" ></div>');
				for (var i = 0; i < images.length; i++) {
					if(images[i]!=undefined){
						var image_cont = $('<div id="post_dp_image'+(i+1)+'_sys" class="post_dp_image_sys"></div>');
						image_cont.append(images[i]);
						image_cont.appendTo(post_images);
					}
				}
				post_detail.append(post_images);
			}
			post_detail.appendTo(modal_cont);
			
			
			
			//리뷰 섹션
			var post_reply=$('<div id="post_reply"></div>');
			
			
			
			//최상단 리뷰 제목
			var reply_title=$('<div id="reply_title"><h3>댓글</h3></div>');
			post_reply.append(reply_title);//리뷰 섹션에 리뷰 제목 append
			
			//리뷰 작성란
			var reply_write=$('<div id="reply_write"><div id="write_area"><textarea spellcheck="false" maxlength="300" id="reply_writer" onkeyup="letterCount()"></textarea></div><div id="button_area"><span id="lcnt">(0 / 최대 300자)</span><a href="javascript:dpReplyOn()">등록</a></div></div>');
			post_reply.append(reply_write);
			
			
			//리뷰 리스트 섹션
			var reply_list=$('<div id="reply_list"></div>');
			if(data.rl.length==0){
				var reply_status=$('<div id="reply_status"><p>작성된 댓글이 없습니다 ㅠㅠ</p><p>첫번째 댓글의 주인공이 되어주세요!</p></div>');
				reply_status.appendTo(reply_list);
			}else{
				reply_list.children().remove();
				for (var i = 0; i < data.rl.length; i++) {
					//리뷰 담을 div
					var dp_reply_area=$('<div class="dp_reply_area"></div>');
					
					// 리뷰의 첫번째 줄
					var dp_reply_header = $(' <div class="dp_reply_header"></div>');
					
					// 리뷰의 첫줄의 왼쪽 닉네임
					var dp_reply_header_left = $('<div class="dp_reply_header_left"></div>').text(
							data.rl[i].user_nickname);
					
					// 첫줄에 왼쪽 닉네임 추가
					dp_reply_header.append(dp_reply_header_left);
					
					// 리뷰 첫줄의 오른쪽 날짜와 버튼
					var dp_reply_header_right = $('<div class="dp_reply_header_right"></div>');
					
					// 날짜 담을 span
					var date = $('<span></span>');
					var dpr_date = data.rl[i].dpr_reg_date.split(' ')[0];
					var dpr_time = data.rl[i].dpr_reg_date.split(' ')[1];
					var now = new Date();
					var dateTime = new Date(data.rl[i].dpr_reg_date);

					if (now.getFullYear() === dateTime.getFullYear()
							&& now.getMonth() === dateTime.getMonth()
							&& now.getDate() === dateTime.getDate()) {
						date.text(dpr_time);
					} else {
						date.text(dpr_date);
					}
					
					// 수정여부 확인 후 수정표시
					if (data.rl[i].dpr_reg_date != data.rl[i].dpr_update_date) {
						date.text(date.text() + '(수정됨)');
					}
					
					// 첫줄 오른쪽에 날짜 추가
					dp_reply_header_right.append(date);
					
					// 첫줄 오른쪽 날짜 옆에 버튼 추가
					if(user_nickname==data.rl[i].user_nickname){
						var btn_update = $('<input type="button" class="dp_reply_btns dp_reply_update" value="수정"/>');
						var btn_update_complete = $('<input type="button" class="dp_reply_btns dp_reply_update_submit" value="수정 완료" style="display: none;"/>');
						var btn_delete = $('<input type="button" class="dp_reply_btns dp_reply_delete" value="삭제"/>');
						
						dp_reply_header_right.append(btn_update);
						dp_reply_header_right.append(btn_update_complete);
						dp_reply_header_right.append(btn_delete);

					}else{
						var btn_report = $('<input type="button" class="dp_reply_btns dp_reply_report" value="신고"/>');

						dp_reply_header_right.append(btn_report);
					}
					
					var dpr_index =$('<input type="hidden" class="dpr_index" value="'+data.rl[i].dpr_index+'"/>')
					dp_reply_header_right.append(dpr_index);
					
					// 왼쪽 완성 후 첫줄에 추가
					dp_reply_header.append(dp_reply_header_right);
					
					// 첫줄 완성 후 reply_area에 추가
					dp_reply_area.append(dp_reply_header);
					
					// 두번째 줄에 댓글 내용 담을 div 및 textarea 생성
					var dp_reply_content = $('<div class="dp_reply_content"></div>');
					var replyTXT = $('<div>'+data.rl[i].dpr_contents+'</div>');
					dp_reply_content.append(replyTXT);
					dp_reply_area.append(dp_reply_content);
					reply_list.append(dp_reply_area);
				}
				
				//페이징 처리
				var dp_totalPage=$('<input type=hidden value="'+data.totalPage+'" id="dp_totalPage">')
				var dp_totalCnt=$('<input type=hidden value="'+data.totalCnt+'" id="dp_totalCnt">')
				var dp_startPage=$('<input type=hidden value="'+data.startPage+'" id="dp_startPage">')
				var dp_endPage=$('<input type=hidden value="'+data.endPage+'" id="dp_endPage">')
				var dp_page=$('<input type=hidden value="'+data.page+'" id="dp_page">')
				reply_list.append(dp_totalPage);
				reply_list.append(dp_totalCnt);
				reply_list.append(dp_startPage);
				reply_list.append(dp_endPage);
				reply_list.append(dp_page);
				
				var dp_reply_page=$('<div id="dp_reply_page_selector"></div>');
				if (data.startPage != 1) {
//					var sbtn = $('<input type="button" class="dp_reply_page_btn" value="&lt;"/>');
					var sbtn = $('<a class="dp_reply_page_btn">&lt;</a>');
					sbtn.attr('href','javascript:pageMove("<")')
					dp_reply_page.append(sbtn);
				}
				for (var i = data.startPage; i <= data.endPage; i++) {
					if (data.page == i) {
						var nowPage = $('<span class="dp_nowPage">' + i + '</span>');
						dp_reply_page.append(nowPage);
					} else {
//						var otherPage = $('<input type="button" class="dp_reply_page_btn" value="'+i+'"/>');
						var otherPage = $('<a class="dp_reply_page_btn">'+i+'</a>');
						otherPage.attr('href','javascript:pageMove('+i+')');
						dp_reply_page.append(otherPage);
					}
				}
				if (data.endPage != data.totalPage) {
//					var ebtn = $('<input type="button" class="dp_reply_page_btn" value="&gt;"/>');
					var ebtn = $('<a class="dp_reply_page_btn">&gt;</a>');
					ebtn.attr('href','javascript:pageMove(">")')
					dp_reply_page.append(ebtn);
				}
				reply_list.append(dp_reply_page);
			}
			
			//리뷰 리스트 섹션을 리뷰 섹션 하단에 추가
			post_reply.append(reply_list);
			post_reply.appendTo(modal_cont);
			modal_cont.appendTo(modal);
		}
	});
}


//page move in modal
function pageMove(page){
	console.log(page);
	getDpReplyList(page);
}

//count letters in modal
function letterCount(){
	    var content = $('#reply_writer').val();
	    $('#lcnt').html("("+content.length+" / 최대 300자)");    //글자수 실시간 카운팅

	    if (content.length > 300){
	        alert("최대 300자까지 입력 가능합니다.");
	        $('#reply_writer').val(content.substring(0, 300));
	        $('#lcnt').html("(300 / 최대 300자)");
	    }


	            var rows = $('#reply_writer').val().split('\n').length;
	            var maxRows = 6;
	            if( rows > maxRows){
	                alert('6줄 까지만 가능합니다');
	                modifiedText = $('#reply_writer').val().split("\n").slice(0, maxRows);
	                $('#reply_writer').val(modifiedText.join("\n"));
	            }

}

//modal close
$(document).mouseup(function (e){
	if($("#modal").has(e.target).length === 0){
		$("#modal").fadeOut(500);
		$("#modal").children().remove();
		$('.dg_comm_feed>a').removeAttr('onclick');
		$('.dg_comm_cert>a').removeAttr('onclick');
	}
});
$(document).keydown(function(e){
	//keyCode 구 브라우저, which 현재 브라우저
    var code = e.keyCode || e.which;
 
    if (code == 27) { // 27은 ESC 키번호
    	$("#modal").fadeOut(500);
		$("#modal").children().remove();
		$('.dg_comm_feed>a').removeAttr('onclick');
		$('.dg_comm_cert>a').removeAttr('onclick');
    }
});

//reply write in modal
function dpReplyOn(){
	const loginUser_nickname=$('#loginUser_nickname').val();
	if(loginUser_nickname==''||loginUser_nickname==null){
		alert('로그인 후 작성 가능합니다');
		return false;
	}
	var dp_index=$('#dp_index').val();
	var dpr_contents=$('#reply_writer').val();
	var page=$('#dp_page').val();
	if(dpr_contents==''){
		$('#reply_writer').focus();
		alert('내용을 입력해주세요');
	}else{
		$.ajax({
			url : cp+'/dg/reply_on.dg',
			type : 'post',
			data : {"dp_index":dp_index,"dpr_contents":dpr_contents,"page":page},
			dataType : 'text',
			async: false,
			success : function(data){
				if(data=='X'){
					alert('댓글 등록에 실패했습니다');
					return false;
				}else{
					alert('댓글이 등록되었습니다');
					$('#reply_writer').val('');
					getDpReplyList(data);
				}
			}
		});
	}
}


$('input[name=dp_type]').on('change',function(){
	$('#cert_images').toggle('fast');
	});
//회원 탈퇴
function quitDg(loginUser_index,dg_user_index,dg_index){
	if(loginUser_index==dg_user_index){
		alert('회원님은 해당 두개더를 탈퇴할 수 없습니다');
	}else{
		var quit_confirm = confirm('해당 두개더를 정말 그만두시겠습니까?\r\n(두개더를 그만 두시는 경우 작성하신 글들은 해당 두개더에서 보이지 않습니다)');
		if(quit_confirm){
			location.href=cp+'/dg/quit.dg?loginUser_index='+loginUser_index+'&dg_index='+dg_index;			
		}
	}
}



//join
$('#dg_user_target').keyup(function (e){
    var content = $(this).val();
    $('#counter').html("("+content.length+" / 최대 300자)");    //글자수 실시간 카운팅

    if (content.length > 300){
        alert("최대 300자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 300));
        $('#counter').html("(300 / 최대 300자)");
    }
});
$('#dg_user_target').keyup(function(){
            var rows = $('#dg_user_target').val().split('\n').length;
            var maxRows = 10;
            if( rows > maxRows){
                alert('10줄 까지만 가능합니다');
                modifiedText = $('#dg_user_target').val().split("\n").slice(0, maxRows);
                $('#dg_user_target').val(modifiedText.join("\n"));
            }
        });


//write

$('#dp_contents').keyup(function (e){
    var content = $(this).val();
    $('#counter').html("("+content.length+" / 최대 400자)");    //글자수 실시간 카운팅

    if (content.length > 400){
        alert("최대 400자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 400));
        $('#counter').html("(400 / 최대 400자)");
    }
});
$('#dp_contents').keyup(function(){
            var rows = $('#dp_contents').val().split('\n').length;
            var maxRows = 10;
            if( rows > maxRows){
                alert('10줄 까지만 가능합니다');
                modifiedText = $('#dp_contents').val().split("\n").slice(0, maxRows);
                $('#dp_contents').val(modifiedText.join("\n"));
            }
        });

$('input[name=dp_type]').on('change',function(){
	$('#cert_images').toggle('fast');
});

function upload_image(dp_image){
	$('#'+dp_image).click();
}
$('input[type=file]').on('change',function(e){
	var flag=true;
	var file = e.target.files[0];
	var file_reg = /^(.*?)\.(jpg|jpeg|png|gif|bmp|webp)$/;
	var max_size=5*1024*1024;
	var image=$(this).parent().prev().children();
	var status=$(this).parent().next().children();
	if(file==undefined){
		
		flag=false;
	}	
	else if(!file_reg.test(file.name)){
		alert('이미지 형식이 올바르지 않습니다');
		flag=false;
	}else if(file.size>=max_size){
		alert('이미지는 5MB까지 등록 가능합니다');
		flag=false;
	}
	if(flag){
		const reader = new FileReader();
		reader.onload=function(ie){
			image.attr('src',ie.target.result);
			status.text(file.name);
		}
			reader.readAsDataURL(file);
			if($(this).parent().parent().next()!=undefined){
				$(this).parent().parent().next().show('fast');				
			}
	}else{
		image.attr('src', cp+'/resources/images/image_upload.png');
		status.text('이미지가 없습니다');
		$('#dg_banner').val('');
		$('#dg_banner').focus();
		if($(this).parent().parent().next()!=undefined){
			$(this).parent().parent().next().hide('fast');				
		}
	}
	console.log($(this).val());
});
function delete_image(dp_image){
	var file_tag=$('#'+dp_image);
	var image=file_tag.parent().prev().children();
	var status=file_tag.parent().next().children();
	image.attr('src', cp+'/resources/images/image_upload.png');
	status.text('이미지가 없습니다');
	file_tag.val('');
	if(file_tag.parent().parent().next()!=undefined){
		file_tag.parent().parent().next().hide('fast');				
	}
}

$('form[name=dogather_post_on').submit(function(e){
	e.preventDefault();
	var flag=true;
	if($('#dp_contents').val()==''){
		alert('내용을 입력해주세요');
		flag=false;
		return flag;
	}
	
	if(flag){
		if($('#dp_type_feed').is(':checked')){
			$('input[type=file]').val('');
		}
		this.submit();
	}
});





//dogather post reply list
var getDpReplyList=function(page){
	console.log(page);
	if(page=='>'){
		page=parseInt($('#dp_endPage').val())+1;
	}
	if(page=='<'){
		page=parseInt($('#dp_startPage').val())-1;
	}
	var user_nickname=$('#loginUser_nickname').val();
	var dp_index=$('#dp_index').val();
	$.ajax({
		url : cp+'/dg/post_reply.dg',
		type : 'post',
		data : {"dp_index":dp_index,"page":page},
		dataType : 'json',
		async: false,
		success : function(data) {
			console.log(data);
//			var dp_index=$('<input type="hidden" value="'+data.dp.dp_index+'" id="dp_index"/>')
//			modal.append(dp_index);
//			
//			var modal_cont =$('<div id="modal_cont"></div>');
//			var post_detail =$('<div id="post_detail"></div>');
//			var post_info = $('<div id="post_info" ></div>');
//	
//			var post_dp_nickname=$('<div id="post_dp_nickname" ></div>');
//			var nickname_span=$('<span></span>');
//			nickname_span.text(data.dp.user_nickname);
//			post_dp_nickname.append(nickname_span);
//			post_dp_nickname.appendTo(post_info);
//			
//			var post_dp_like_cnt=$('<div id="post_dp_like_cnt" ></div>');
//			var like_span=$('<span>♥</span>');
//			var like_cnt_span=$('<span></span>');
//			like_cnt_span.text(data.dp.dp_like_cnt);
//			post_dp_like_cnt.append(like_span);
//			post_dp_like_cnt.append(like_cnt_span);
//			post_dp_like_cnt.appendTo(post_info);
//			post_detail.append(post_info);
//			
//			var post_dp_reg_date=$('<div id="post_dp_reg_date" ></div>');
//			var reg_date_span=$('<span></span>');
//			reg_date_span.text(data.dp.dp_reg_date);
//			post_dp_reg_date.append(reg_date_span);
//			if(data.dp.dp_reg_date!=data.dp.dp_update_date){
//				var update_check=$('<span></span>');
//				update_check.text('(수정됨)');
//				post_dp_reg_date.append(update_check);
//			}
//			post_dp_reg_date.appendTo(post_detail);
//				
//			var post_contents = $('<div id="post_contents" ></div>');
//			
//			var post_dp_contents=$('<div id="post_dp_contents" ></div>');
//			var contents_cont=$('<p>'+data.dp.dp_contents+'</p>');
//
//			post_dp_contents.append(contents_cont);
//			post_dp_contents.appendTo(post_contents);
//			post_detail.append(post_contents);
//		
//			
//			var images=[data.dp.dp_image1_sys,data.dp.dp_image2_sys,data.dp.dp_image3_sys];
//			var flag=false;
//			for (var i = 0; i < images.length; i++) {
//				if(images[i]!=undefined){
//					var image=images[i];
//					flag=true;
//					images[i]=$('<img/>');
//					images[i].attr("src",cp+"/upload/images/dogather/cert/"+image);
//				}else{
//					break;
//				}
//			}
//			
//			if(flag){
//				var post_images=$('<div id="post_images" ></div>');
//				for (var i = 0; i < images.length; i++) {
//					if(images[i]!=undefined){
//						var image_cont = $('<div id="post_dp_image'+(i+1)+'_sys" class="post_dp_image_sys"></div>');
//						image_cont.append(images[i]);
//						image_cont.appendTo(post_images);
//					}
//				}
//				post_detail.append(post_images);
//			}
//			post_detail.appendTo(modal_cont);
			
			
			
			//리뷰 섹션
			//var post_reply=$('<div id="post_reply"></div>');
			var post_reply=$('#post_reply');
			
			
			//최상단 리뷰 제목
//			var reply_title=$('<div id="reply_title"><h3>댓글</h3></div>');
//			post_reply.append(reply_title);//리뷰 섹션에 리뷰 제목 append
			
			//리뷰 작성란
//			var reply_write=$('<div id="reply_write"><div id="write_area"><textarea spellcheck="false" maxlength="300" id="reply_writer" onkeyup="letterCount()"></textarea></div><div id="button_area"><span id="lcnt">(0 / 최대 300자)</span><a href="javascript:dpReplyOn()">등록</a></div></div>');
//			post_reply.append(reply_write);
			
			
			//리뷰 리스트 섹션
//			var reply_list=$('<div id="reply_list"></div>');
			var reply_list=$('#reply_list')
			if(data.rl.length==0){
				reply_list.children().remove();
				var reply_status=$('<div id="reply_status"><p>작성된 댓글이 없습니다 ㅠㅠ</p><p>첫번째 댓글의 주인공이 되어주세요!</p></div>');
				reply_status.appendTo(reply_list);
			}else{
				reply_list.children().remove();
				for (var i = 0; i < data.rl.length; i++) {
					//리뷰 담을 div
					var dp_reply_area=$('<div class="dp_reply_area"></div>');
					
					// 리뷰의 첫번째 줄
					var dp_reply_header = $(' <div class="dp_reply_header"></div>');
					
					// 리뷰의 첫줄의 왼쪽 닉네임
					var dp_reply_header_left = $('<div class="dp_reply_header_left"></div>').text(
							data.rl[i].user_nickname);
					
					// 첫줄에 왼쪽 닉네임 추가
					dp_reply_header.append(dp_reply_header_left);
					
					// 리뷰 첫줄의 오른쪽 날짜와 버튼
					var dp_reply_header_right = $('<div class="dp_reply_header_right"></div>');
					
					// 날짜 담을 span
					var date = $('<span></span>');
					var dpr_date = data.rl[i].dpr_reg_date.split(' ')[0];
					var dpr_time = data.rl[i].dpr_reg_date.split(' ')[1];
					var now = new Date();
					var dateTime = new Date(data.rl[i].dpr_reg_date);

					if (now.getFullYear() === dateTime.getFullYear()
							&& now.getMonth() === dateTime.getMonth()
							&& now.getDate() === dateTime.getDate()) {
						date.text(dpr_time);
					} else {
						date.text(dpr_date);
					}
					
					// 수정여부 확인 후 수정표시
					if (data.rl[i].dpr_reg_date != data.rl[i].dpr_update_date) {
						date.text(date.text() + '(수정됨)');
					}
					
					// 첫줄 오른쪽에 날짜 추가
					dp_reply_header_right.append(date);
					
					// 첫줄 오른쪽 날짜 옆에 버튼 추가
					if(user_nickname==data.rl[i].user_nickname){
						var btn_update = $('<input type="button" class="dp_reply_btns dp_reply_update" value="수정"/>');
						var btn_update_complete = $('<input type="button" class="dp_reply_btns dp_reply_update_submit" value="수정 완료" style="display: none;"/>');
						var btn_delete = $('<input type="button" class="dp_reply_btns dp_reply_delete" value="삭제"/>');
						
						dp_reply_header_right.append(btn_update);
						dp_reply_header_right.append(btn_update_complete);
						dp_reply_header_right.append(btn_delete);

					}else{
						var btn_report = $('<input type="button" class="dp_reply_btns dp_reply_report" value="신고"/>');

						dp_reply_header_right.append(btn_report);
					}
					
					var dpr_index =$('<input type="hidden" class="dpr_index" value="'+data.rl[i].dpr_index+'"/>')
					dp_reply_header_right.append(dpr_index);
					
					// 왼쪽 완성 후 첫줄에 추가
					dp_reply_header.append(dp_reply_header_right);
					
					// 첫줄 완성 후 reply_area에 추가
					dp_reply_area.append(dp_reply_header);
					
					// 두번째 줄에 댓글 내용 담을 div 및 textarea 생성
					var dp_reply_content = $('<div class="dp_reply_content"></div>');
					var replyTXT = $('<div>'+data.rl[i].dpr_contents+'</div>');
					dp_reply_content.append(replyTXT);
					dp_reply_area.append(dp_reply_content);
					reply_list.append(dp_reply_area);
				}
				
				//페이징 처리
				var dp_totalPage=$('<input type=hidden value="'+data.totalPage+'" id="dp_totalPage">')
				var dp_totalCnt=$('<input type=hidden value="'+data.totalCnt+'" id="dp_totalCnt">')
				var dp_startPage=$('<input type=hidden value="'+data.startPage+'" id="dp_startPage">')
				var dp_endPage=$('<input type=hidden value="'+data.endPage+'" id="dp_endPage">')
				var dp_page=$('<input type=hidden value="'+data.page+'" id="dp_page">')
				reply_list.append(dp_totalPage);
				reply_list.append(dp_totalCnt);
				reply_list.append(dp_startPage);
				reply_list.append(dp_endPage);
				reply_list.append(dp_page);
				
				var dp_reply_page=$('<div id="dp_reply_page_selector"></div>');
				if (data.startPage != 1) {
//					var sbtn = $('<input type="button" class="dp_reply_page_btn" value="&lt;"/>');
					var sbtn = $('<a class="dp_reply_page_btn">&lt;</a>');
					sbtn.attr('href','javascript:pageMove("<")')
					dp_reply_page.append(sbtn);
				}
				for (var i = data.startPage; i <= data.endPage; i++) {
					if (data.page == i) {
						var nowPage = $('<span class="dp_nowPage">' + i + '</span>');
						dp_reply_page.append(nowPage);
					} else {
//						var otherPage = $('<input type="button" class="dp_reply_page_btn" value="'+i+'"/>');
						var otherPage = $('<a class="dp_reply_page_btn">'+i+'</a>');
						otherPage.attr('href','javascript:pageMove('+i+')');
						dp_reply_page.append(otherPage);
					}
				}
				if (data.endPage != data.totalPage) {
//					var ebtn = $('<input type="button" class="dp_reply_page_btn" value="&gt;"/>');
					var ebtn = $('<a class="dp_reply_page_btn">&gt;</a>');
					ebtn.attr('href','javascript:pageMove(">")')
					dp_reply_page.append(ebtn);
				}
				reply_list.append(dp_reply_page);
			}
			
			//리뷰 리스트 섹션을 리뷰 섹션 하단에 추가
			post_reply.append(reply_list);
		}
	});
}