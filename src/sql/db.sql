drop database dg_db;
create database dg_db;
use dg_db;

#(admin에서 관리하는 테이블 / user 입력 X)
#카테고리 테이블
create table t_category(
	category_index int primary key, #카테고리 번호
    category_name varchar(300)
);
insert into t_category values(1,'건강'),(2,'학습'),(3,'교양'),(4,'습관'),(5,'경제');

#약관 테이블
create table t_terms(
	terms_index int primary key,
    terms_title varchar(1000),
    terms_contents text,
    terms_type enum('essential','selective')
);
insert into t_terms values(1,'이용 약관','이용 약관 내용','essential'),(2,'개인 정보 약관','개인 정보 약관 내용','essential'),(3,'선택 약관1','선택 약관 1 내용','selective'),(4,'선택 약관 2','선택 약관 2 내용','selective');

create table t_user(
	#회원 가입 시 입력 받아야할 내용들(필수 입력 항목)
	user_index int primary key auto_increment, #유저 고유 번호(ex : 1)
	user_email varchar(767) not null unique, #정규식 적용 필요(email 정규식 / ex : apple@naver.com)
    user_nickname varchar(30) not null unique, #정규식 적용 필요(영문자,한글,숫자, 2~10자리, 중복 불가 / ex : Apple킴)
    user_name varchar(51) not null, #정규식 적용 필요(한글, 2~17자 리 / ex : 김사과)
    user_password varchar(16) not null, #정규식 적용 필요(비밀번호 형식 : 영문자+숫자+특수문자, 8~16자리 / ex : asdf1234!)
	user_phone varchar(11) not null, #정규식 적용 필요(10~11자리, 01로 시작 / ex : 0198479384)
    user_gender enum('male','female') not null, #value는 mail, femail (ex : mail)
    user_birth_date date not null, #입력 형식 확인(yyyy-MM-dd / ex : 2002-06-10)
	
    #선택 입력 항목
    user_interest varchar(1000), #유저의 관심사, 반정규화 (check 박스 / ex : 1,2,3,4,5,기타/코딩) 관심 카테고리 없으면 정보제공X
    user_intro text, #자기소개(1000자)
    
    #회원 가입 완료 후 설정
   
	user_profile_image varchar(300),#유저 이미지 파일 이름(원본파일명:저장파일명)

	user_term_essential1 boolean default true not null, #필수약관 1 동의 여부(기본 't' / ex : 't')
    user_term_essential2 boolean default true not null, #필수약관 2 동의 여부(기본 't' / ex : 't')
    user_term_selective1 boolean not null, #선택약관 1 동의 여부(ex : 'f')
    user_term_selective1_reg_date datetime default now(),
    user_term_selective2 boolean not null, #선택약관 2 동의 여부(ex : 't')
    user_term_selective2_reg_date datetime default now(),

	user_public_scope enum('all','buddy','none') default 'all', #유저 정보 공개 범위(ex : 'none' / none일 경우 아무도 회원 정보 조회 불가)
	user_reg_date datetime default now(), #유저 가입날짜(yyyy-MM-dd / ex : 2022-07-25)
    user_password_set_date datetime default now(), #비밀번호 마지막으로 설정한 시간 (비밀번호 교체 권유용 / ex : 2022-07-25)
	user_last_login datetime,
    user_inactive_date datetime, #비활성화 날짜(yyyy-MM-dd / ex : 2022-07-26)
    user_inactive boolean default false not null, #비활성화 여부 (ex : 0 / 0일 경우 활성화 상태, 1일 경우 비활성화 상태)
    user_inactive_reason enum('withdrawal','dormancy'),

	zip_code varchar(5), #우편번호(ex : 06236)
    address_default varchar(1000), #기본주소
    address_detail varchar(1000), #상세주소(ex : 3층 코리아IT아카데미)
    address_extra varchar(300), #참고사항 / address_refer -> address_extra 220721 (ex : (역삼동))
    
	user_buddies text, #유저의 친구, 친구인 user_index를 ','로 구분하여 append(ex : 2,3,4,5,...)
	user_block_list text, #유저가 차단한 유저 현황(ex : 6,7,8,9,10,...)
    
	note_scope enum('all','buddy','none') default 'all' #쪽지 수신 여부 확인(ex : 'buddy' / 친구 쪽지만 수신 가능)
);

insert into t_user(user_index,user_email,user_nickname,user_name,user_password,user_phone,user_gender,user_birth_date,user_term_essential1,user_term_essential2,user_term_selective1,user_term_selective2) 
values(-1,'admin','두개더_관리자','admin','1234','02111111111','male','1901-01-01',true,true,true,true);
insert into t_user(user_email,user_nickname,user_name,user_password,user_phone,user_gender,user_birth_date,user_interest,user_intro,user_term_selective1,user_term_selective2,zip_code,address_default,address_detail) 
values('apple@apple.com','김사과','김사과','asdf1234!','01011111111','male','1999-01-01','1,2,3,4,5','안녕하세요',true,false,'06236','서울 강남구 역삼동 736-6','3층'),
('banana@banana.com','바나나','바나나','asdf1234!','01011111111','male','1999-01-01','1,2,3,4,5','안녕하세요',true,false,'06236','서울 강남구 역삼동 736-6','3층'),
('cherry@cherry.com','박체리','박체리','asdf1234!','01011111111','male','1999-01-01','1,2,3,4,5','안녕하세요',true,false,'06236','서울 강남구 역삼동 736-6','3층'),
('durian@durian.com','차두리','차두리','asdf1234!','01011111111','male','1999-01-01','1,2,3,4,5','안녕하세요',true,false,'06236','서울 강남구 역삼동 736-6','3층');



#유저 친구 상태 현황
create table t_buddy_request(
	user_index int, #유저(ex : 1)
    buddy_request_receiver int, #친구 요청 받은 user_index(ex : 2)
    buddy_request_reg_date datetime, #요청한 날짜(ex : 2022-07-25)
    buddy_request_message text, #요청 메시지(ex : '하이')
    buddy_request_status enum('request','accept','deny'), #요청 상태(요청, 수락, 거절 / ex : 'request')
    constraint buddyRequest_user_fk foreign key(user_index) references t_user(user_index)
);


#유저 받은 쪽지함
create table t_user_send_note(
	user_index int, #받은 사람(ex : 1)
    snote_sender int, #보낸 사람(ex : 2)
    snote_reg_date datetime default now(), #보낸 날짜(ex : 2022-07-25)
    snote_contents text, #보낸 내용(ex : '하이 ㅋㅋ')
    snote_is_deleted boolean default false not null, #삭제 여부(ex : 'f')
    constraint userSendNote_user_fk foreign key(user_index) references t_user(user_index)
);

#유저 보낸 쪽지함
create table t_user_receive_note(
	user_index int, #보낸 사람(ex : 2)
    rnote_receiver int, #받은 사람(ex : 1)
    rnote_reg_date datetime default now(), #보낸 날짜(ex : 2022-07-25)
    rnote_contents text, #보낸 내용(ex : '하이 ㅋㅋ')
    rnote_is_deleted boolean default false not null, #삭제 여부(ex : 'f')
    rnote_check_date datetime, #쪽지 확인한 날짜(ex : '')
    constraint userReceiveNote_user_fk foreign key(user_index) references t_user(user_index)
);




#자유게시판
create table t_free_board(
	b_index int primary key auto_increment, #게시글 번호(ex : 1)
    user_index int, #게시글 작성자(ex : 1)
    b_reg_date datetime default now(), #게시글 등록일(ex : 2022-07-25)
    b_update_date datetime default now(), #게시글 수정일(ex : 2022-07-25)
    b_subject enum('유머','잡담','기타') not null, #게시판 말머리(ex : '유머')
    b_title varchar(1000) not null, #게시글 제목(ex : '나 이별했어')
    b_contents text not null, #게시글 내용(blob 타입 확인 필요 / ex : '진짜임')
    b_hits int default 0, #게시글 조회수(ex : 10)
    b_like_user_index text, #좋아요 누른 사람(ex : 2,3,4,5,...)
    b_inactive boolean default false not null, #게시글 삭제 여부(ex : 'f')
    b_files varchar(1000),
    constraint freeBoard_user_fk foreign key(user_index) references t_user(user_index)
);

insert into t_free_board(user_index,b_subject,b_title,b_contents)
values(1,'유머','유머 테스트','<p>웃긴 유머</p>'),(2,'잡담','잡담 테스트','<p>그냥 잡담</p>'),(3,'기타','기타 테스트','<p>기타 연주</p>'),(4,'유머','유우머','<p>유우우머</p>');


#자유게시판 댓글
create table t_fb_reply(
	r_index int primary key auto_increment,
	b_index int, #게시글 번호(ex : 1)
    user_index int, #댓글 작성자(ex : 2)
    r_reg_date datetime default now(), #댓글 작성 시간(ex : 2022-07-25)
    r_update_date datetime default now(), #댓글 수정 시간(ex : 2022-07-25)
    r_contents text, #댓글 내용(ex : '너무 웃겨요')
    r_like_user_index text,
    r_inactive boolean default false not null, #댓글 삭제 여부(ex : 'f')
    constraint fbReply_freeBoard_fk foreign key(b_index) references t_free_board(b_index),
    constraint fbReply_user_fk foreign key(user_index) references t_user(user_index)
);

###!!!!!!!!!!!!!!!!!!!!!아래 쿼리문  0을 최근 게시물 번호로 수정 후 더미 데이터 생성!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
insert into t_fb_reply(b_index,user_index,r_contents) values(0,1,'사과의 댓글'),(0,2,'바나나의 댓글'),(0,3,'체리의 댓글'),(0,4,'두리안의 댓글');

#정보 게시판
create table t_info_board(
	b_index int primary key auto_increment, #게시글 번호
    user_index int, #게시글 작성자
    b_reg_date datetime default now(), #게시글 등록일
    b_update_date datetime default now(), #게시글 수정일
    b_subject varchar(300) not null, #전체, 자유게시판, 카테고리 게시판(ex : 전체)
    b_title varchar(1000) not null, #게시글 제목
    b_contents text not null, #게시글 내용(blob 타입 확인 필요)
    b_hits int default 0, #게시글 조회수
    b_like_user_index text, #좋아요 누른 사람
    b_inactive boolean default false not null, #게시글 삭제여부
    b_files varchar(1000),
    constraint infoBoard_user_fk foreign key(user_index) references t_user(user_index)
);
#정보 게시판 댓글
create table t_ib_reply(
	r_index int primary key auto_increment,
	b_index int, #게시판 번호
    user_index int, #댓글 작성자
    r_reg_date datetime default now(), #댓글 작성 시간
    r_update_date datetime default now(), #댓글 수정 시간
    r_contents text, #댓글 내용
    r_like_user_index text,
    r_inactive boolean default false not null, #댓글 삭제 여부
    constraint ibReply_infoBoard_fk foreign key(b_index) references t_info_board(b_index),
    constraint ibReply_user_fk foreign key(user_index) references t_user(user_index)
);

#이벤트(adminMode에서 crud 가능 / userMode에서는 r만 가능)
create table t_event_board(
	b_index int primary key auto_increment, #게시글 번호(ex : 1)
    user_index varchar(300) default -1, #게시글 작성자(default admin)
	b_reg_date datetime default now(), #게시글 등록일(ex : 2022-07-26)
    b_update_date datetime default now(), #게시글 수정일(ex : 2022-07-27)
    b_subject varchar(300) not null, #진행중, 종료(ex : 진행중)
    b_title varchar(1000) not null, #게시글 제목(ex : 3일만에 50kg감량 시 1000만원!!)
    b_contents text not null, #게시글 내용(blob 타입 확인 필요)
    b_hits int default 0, #게시글 조회수(ex : 50000)
    b_like_user_index text, #좋아요 누른 사람(ex : 1,3,4,5,6,10,11,...)
    b_inactive boolean default false not null, #게시글 삭제여부(ex : 'f')
    b_files varchar(1000)
);

#이벤트게시판 댓글
create table t_eb_reply(
	r_index int primary key auto_increment,
	b_index int, #게시글 번호(ex : 1)
    user_index int, #댓글 작성자(ex : 2)
    r_reg_date datetime default now(), #댓글 작성 시간(ex : 2022-07-25)
    r_update_date datetime default now(), #댓글 수정 시간(ex : 2022-07-25)
    r_contents text, #댓글 내용(ex : '너무 웃겨요')
    r_like_user_index text,
    r_inactive boolean default false not null, #댓글 삭제 여부(ex : 'f')
    constraint ebReply_eventBoard_fk foreign key(b_index) references t_event_board(b_index)
);

#공지사항(adminMode에서 crud 가능 / userMode에서는 r만 가능)
create table t_notice_board(
	b_index int primary key auto_increment, #게시글 번호(ex : 1)
    user_index varchar(300) default '-1', #게시글 작성자(default admin)
	b_reg_date datetime default now(), #게시글 등록일(ex : 2022-07-26)
    b_update_date datetime default now(), #게시글 수정일(ex : 2022-07-27)
	b_subject varchar(300) not null, #전체, 자유게시판, 카테고리 게시판(ex : 전체)
    b_title varchar(1000) not null, #게시글 제목(ex : 광고 피드 작성 시 회원 탈퇴)
    b_contents text not null, #게시글 내용(blob 타입 확인 필요)
    b_hits int default 0, #게시글 조회수(ex : 10)
    b_like_user_index text, #좋아요 누른 사람(ex : 1,4,6,23,67,100,...)
    b_inactive boolean default false not null, #게시글 삭제여부(ex : 'f')
    b_files varchar(1000)
);

#dogater
create table t_dogather(
	dg_index int primary key auto_increment, #dogather 인덱스 번호(ex : 1)
    user_index int, #dogather 창시자(방장)(ex : 1)
    dg_reg_date date default (current_date),#dogather 만든 날짜(ex : 2022-07-26)
    category_index int not null, #카테고리(ex : 1)
    dg_title varchar(767) not null unique, #dogather 제목(ex : 살빼기dogather)
    dg_intro text, #dogather 소개(ex : 체중감량 같이해요!)
    dg_intro_short varchar(60), #dogather 짧은 설명
    dg_banner_org varchar(300),
    dg_banner_sys varchar(300), #dogather 사진(로고)
    dg_public_scope boolean, #공개범위(ex : 1)
    dg_capacity int default 50, #dogather 참여 가능 인원 수, dogather 점수에 따라 증가 가능, 점수 산정식은 미정, 최선:admin에서 설정해줌 / DB 자동화는 가능하면 하도록(ex : 50)
	dg_limit_scope enum('unLimit','limit','impossible'), #가입 제한(ex : 'unLimit')
    dg_hits int default 0,
    #dg_likeUserIndex text #두개더에 좋아요 누른 유저(생각해 보고 넣기)
    dg_expire date, #전체 목표 완료 날짜(ex : 2022-12-26)
    dg_inactive boolean default false not null,
    constraint dogather_user_fk foreign key(user_index) references t_user(user_index),
    constraint dogather_category_fk foreign key(category_index) references t_category(category_index)
);

#dogather 가입 유저
create table t_dogather_user(
	dg_index int, #dogather 인덱스 번호(ex : 1)
    user_index int, #dogather 참여자 번호(ex : 1)
    dg_user_reg_date datetime default now(), #dogather 참여자:가입날짜(ex : 2022-07-25)
    dg_user_active boolean default true,
    dg_user_drop_date datetime, #dogather 탈퇴 날짜
    constraint dogatherUser_dogather_fk foreign key(dg_index) references t_dogather(dg_index),
    constraint dogatherUser_user_fk foreign key(user_index) references t_user(user_index)
);

#dogather 유저 초대

#dogather 유저 목표(진행중)
create table t_dogather_user_target(
	dg_index int, #dogather 인덱스 번호(ex : 1)
    user_index int, #유저 번호(ex: 1)
    dg_user_target_date datetime, #(ex : 2022-12-25)
    dg_user_target text, #목표(ex : 70kg까지 살빼기 / 살빼기)
    constraint dogatherUserTarget_dogather_fk foreign key(dg_index) references t_dogather(dg_index),
    constraint dogatherUserTarget_user_fk foreign key(user_index) references t_user(user_index)
);

#dogather post
create table t_dogather_post(
	dp_index int primary key auto_increment, #dogather 인증글 번호(ex : 1)
    dg_index int, #dogather 인덱스 번호(ex : 1)
    user_index int, #작성자 번호(ex : 1)
    dp_reg_date datetime default now(), #작성 날짜(ex : 2022-07-26)
    dp_update_date datetime default now(), #수정 날짜(ex : 2022-07-26)
    dp_contents text, #작성 내용(ex : 오늘도 해냈다)
    dp_like_user_index text, #인증 글에 좋아요 누른 유저(ex : 2,4,6,7,...)
    dp_inactive boolean default false not null, #삭제 여부(ex : 'f')
    dp_image1_org varchar(300), #인증 사진1
	dp_image1_sys varchar(300),
    dp_image2_org varchar(300), #인증 사진2
	dp_image2_sys varchar(300),
    dp_image3_org varchar(300), #인증 사진3
	dp_image3_sys varchar(300),
    dp_type enum('feed','cert') not null,#피드인지 인증글인지 확인용
    constraint dogatherPost_dogather_fk foreign key(dg_index) references t_dogather(dg_index),
    constraint dogatherPost_user_fk foreign key(user_index) references t_user(user_index)
);

#dogather post reply
create table t_dp_reply(
	dpr_index int primary key auto_increment,
	dp_index int, #dogather 인증글 번호(ex : 1)
    user_index int, #댓글 작성자(ex : 2)
    dpr_reg_date datetime default now(), #댓글 작성 시간(ex : 2022-07-26)
    dpr_update_date datetime default now(), #댓글 수정 시간(ex : )<-수정 안함
    dpr_contents text, #댓글 내용(ex : 축하여~)
    dpr_inactive boolean default false not null, #댓글 삭제 여부(ex : 'f')
    constraint dpReply_dogatherPost_do_fk foreign key(dp_index) references t_dogather_post(dp_index),
    constraint dpReply_user_fk foreign key(user_index) references t_user(user_index)
);

#############################################################################################
#게시판 틀
create table t_s_board(
	b_index int primary key auto_increment, #게시글 번호
    user_index int, #게시글 작성자
    b_reg_date datetime default now(), #게시글 등록일
    b_update_date datetime default now(), #게시글 수정일
    b_subject varchar(300) not null, #전체, 자유게시판, 카테고리 게시판(ex : 전체)
    b_title varchar(1000) not null, #게시글 제목
    b_contents text not null, #게시글 내용(blob 타입 확인 필요)
    b_hits int default 0, #게시글 조회수
    b_like_user_index text, #좋아요 누른 사람
    b_inactive boolean default false not null, #게시글 삭제여부
    b_files varchar(1000),
    constraint sBoard_user_fk foreign key(user_index) references user(user_index)
);
#게시판 댓글 틀
create table t_sb_reply(
	r_index int primary key auto_increment,
	b_index int, #게시판 번호
    user_index int, #댓글 작성자
    r_reg_date datetime default now(), #댓글 작성 시간
    r_update_date datetime default now(), #댓글 수정 시간
    r_contents text, #댓글 내용
    r_like_user_index text,
    r_inactive boolean default false not null, #댓글 삭제 여부
    constraint sbReply_sBoard_fk foreign key(b_index) references user(b_index),
    constraint sbReply_user_fk foreign key(user_index) references user(user_index)
);
#############################################################################################


#기능

#회원가입 / 로그인(user : crud / admin : crud)
#친구(user : crud / admin : crud)
#쪽지보내기(user : crud / admin : crud)
#차단하기(user : crud / admin : crud)
#자유게시판(user : crud / admin : crud)
#이벤트게시판(user : r / admin : crud)
#공지사항게시판(user : r / admin : crud)

#dg개설
#dg가입
#dg인증
#dg글쓰기
#카테고리별 게시판(카테고리 설정 필요)

#약관

#친구 꼬시기(+링크)
#친구 초대 시 award(나중에 생각)