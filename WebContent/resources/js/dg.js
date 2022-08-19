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

//만드는 중
function quitDg(login_user_index,dg_user_index,dg_index){
	if(login_user_index==dg_user_index){
		alert('회원님은 해당 두개더를 탈퇴할 수 없습니다');
	}else{
		var confirm = confirm('해당 두개더를 정말 그만두시겠습니까?');
		if(confirm){
			location.href=cp+'/dg/quit.dg?login_user_index='+login_user_index+'&dg_index='+dg_index;			
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

$('input[type=radio]').on('change',function(){
	$('#cert_images').toggle('fast');
	console.log($('input[name=dp_type]').val());
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