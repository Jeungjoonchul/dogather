function loginCheck(loginUser){
		if(loginUser){
			location.href= cp+"/board/free_board/write.bo";
		}else{
			alert('로그인 후 이용 가능합니다');
			location.href=cp+"/user/login.us"
		}
	}
	
	function delete_check(b_index){
		var check = confirm('정말 삭제하시겠습니까?');
		if(check){
			location.href=cp+"/board/free_board/delete.bo?b_index="+b_index;
		}
	}

	function postOn(){

		var title=$('#b_title');
		var contents=$('#summernote');
		var post=$('#post_editor');
		if(title.val()==''||title.val()==null){
			alert('제목을 입력하세요');
			title.focus();
			return false;
		}
		if(contents.val()==''||contents.val()==null){
			alert('내용을 입력하세요');
			$('#summernote').summernote('focus');
			return false;
		}
		post.submit();
	}