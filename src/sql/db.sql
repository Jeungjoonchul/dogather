##########################################################################################################################
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
    user_public_scope enum('all','buddy','none') default 'all' #유저 정보 공개 범위(ex : 'none' / none일 경우 아무도 회원 정보 조회 불가)
);

create table t_user_profile(
	user_index int,
    user_profile_original_name varchar(300), #유저 프로필 사진 원본 파일이름
    user_profile_system_name varchar(300), #유저 프로필 사진 시스템 파일이름
    constraint userProfile_user_fk foreign key(user_index) references t_user(user_index)
);

#약관 동의 여부
create table t_user_terms_agreement(
	user_index int,
    user_term_essential1 boolean default true not null, #필수약관 1 동의 여부(기본 't' / ex : 't')
    user_term_essential2 boolean default true not null, #필수약관 2 동의 여부(기본 't' / ex : 't')
    user_term_selective1 boolean not null, #선택약관 1 동의 여부(ex : 'f')
    user_term_selective1_reg_date datetime default now(),
    user_term_selective2 boolean not null, #선택약관 2 동의 여부(ex : 't')
    user_term_selective2_reg_date datetime default now(),
    constraint userTermsAgreement_user_fk foreign key(user_index) references t_user(user_index)
);

create table t_user_info(
	user_index int,
    user_reg_date datetime default now(), #유저 가입날짜(yyyy-MM-dd / ex : 2022-07-25)
    user_password_set_date datetime default now(), #비밀번호 마지막으로 설정한 시간 (비밀번호 교체 권유용 / ex : 2022-07-25)
    user_inactive_date datetime, #비활성화 날짜(yyyy-MM-dd / ex : 2022-07-26)
    user_inactive boolean default false not null, #비활성화 여부 (ex : 'f' / f일 경우 활성화 상태, t일 경우 비활성화 상태)
    user_inactive enum('withdrawal','dormancy'),
    user_last_login datetime,
    constraint userInfo_user_fk foreign key(user_index) references t_user(user_index)
);

#유저 주소(회원 가입 시 필수 입력 항목)
create table t_user_address(
	user_index int, #유저 고유 번호 (ex : 1)
	zip_code varchar(5), #우편번호(ex : 06236)
    address1 varchar(300), #주소 최상위(ex : 서울시)
    address2 varchar(300), #시군구(ex : 강남구)
    address3 varchar(300), #읍면동(ex : 역삼동)
    address4 varchar(300), #나머지 주소(도로명 또는 지번 / ex : 테헤란로 146)
    address_detail varchar(1000), #상세주소(ex : 3층 코리아IT아카데미)
    address_extra varchar(300), #참고사항 / address_refer -> address_extra 220721 (ex : (역삼동))
	constraint userAddress_user_fk foreign key(user_index) references t_user(user_index)
);



#유저 친구 현황
create table t_user_buddies(
	user_index int, #(ex : 1)
    user_buddies text, #유저의 친구, 친구인 user_index를 ','로 구분하여 append(ex : 2,3,4,5,...)
    constraint userBuddies_user_fk foreign key(user_index) references t_user(user_index)
);


#유저 차단 현황
create table t_user_block(
	user_index int, #(ex : 1)
    user_block_list text, #유저가 차단한 유저 현황(ex : 6,7,8,9,10,...)
    constraint userBlock_user_fk foreign key(user_index) references t_user(user_index)
);

#유저 쪽지 범위
create table t_user_note_scope(
	user_index int, #유저(ex: 1)
    note_scope enum('all','buddy','none') default 'all', #쪽지 수신 여부 확인(ex : 'buddy' / 친구 쪽지만 수신 가능)
    constraint userNoteScope_user_fk foreign key(user_index) references t_user(user_index)
);
##########################################################################################################################


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
   
	user_profile_original_name varchar(300), #유저 프로필 사진 원본 파일이름
    user_profile_system_name varchar(300), #유저 프로필 사진 시스템 파일이름

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
    user_t_categoryinactive boolean default false not null, #비활성화 여부 (ex : 0 / 0일 경우 활성화 상태, 1일 경우 비활성화 상태)
    user_inactive_reason enum('withdrawal','dormancy'),

	zip_code varchar(5), #우편번호(ex : 06236)
    address_default varchar(1000), #기본주소
    address_detail varchar(1000), #상세주소(ex : 3층 코리아IT아카데미)
    address_extra varchar(300), #참고사항 / address_refer -> address_extra 220721 (ex : (역삼동))
    
	user_buddies text, #유저의 친구, 친구인 user_index를 ','로 구분하여 append(ex : 2,3,4,5,...)
	user_block_list text, #유저가 차단한 유저 현황(ex : 6,7,8,9,10,...)
    
	note_scope enum('all','buddy','none') default 'all' #쪽지 수신 여부 확인(ex : 'buddy' / 친구 쪽지만 수신 가능)
);

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

#자유게시판 댓글
create table t_fb_reply(
	b_index int, #게시글 번호(ex : 1)
    user_index int, #댓글 작성자(ex : 2)
    r_reg_date datetime default now(), #댓글 작성 시간(ex : 2022-07-25)
    r_update_date datetime default now(), #댓글 수정 시간(ex : 2022-07-25)
    r_contents text, #댓글 내용(ex : '너무 웃겨요')
    r_inactive boolean default false not null, #댓글 삭제 여부(ex : 'f')
    constraint fbReply_freeBoard_fk foreign key(fb_index) references t_free_board(fb_index),
    constraint fbReply_user_fk foreign key(user_index) references t_user(user_index)
);

#이벤트(adminMode에서 crud 가능 / userMode에서는 r만 가능)
create table t_event_board(
	b_index int primary key auto_increment, #게시글 번호(ex : 1)
    user_index varchar(300) default -1, #게시글 작성자(default admin)
	b_reg_date datetime default now(), #게시글 등록일(ex : 2022-07-26)
    b_update_date datetime default now(), #게시글 수정일(ex : 2022-07-27)
    b_subject varchar(300) not null, #콜라보, 진행중, 종료(ex : 진행중)
    b_title varchar(1000) not null, #게시글 제목(ex : 3일만에 50kg감량 시 1000만원!!)
    b_contents text not null, #게시글 내용(blob 타입 확인 필요)
    b_hits int default 0, #게시글 조회수(ex : 50000)
    b_like_user_index text, #좋아요 누른 사람(ex : 1,3,4,5,6,10,11,...)
    b_inactive boolean default false not null, #게시글 삭제여부(ex : 'f')
    b_files varchar(1000)
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
    dg_reg_date datetime default now(),#dogather 만든 날짜(ex : 2022-07-26)
    category_index int not null, #카테고리(ex : 1)
    dg_title varchar(767) not null unique, #dogather 제목(ex : 살빼기dogather)
    dg_intro text, #dogather 소개(ex : 체중감량 같이해요!)
    dg_banner text, #dogather 사진(로고)
    dg_public_scope enum('t','f'), #공개범위(ex : 't')
    dg_capacity int check(dg_capacity<=50) default 50, #dogather 참여 가능 인원 수, dogather 점수에 따라 증가 가능, 점수 산정식은 미정, 최선:admin에서 설정해줌 / DB 자동화는 가능하면 하도록(ex : 50)
	dg_limit_scope enum('unLimit','limit','impossible'), #가입 제한(ex : 'unLimit')
    #dg_likeUserIndex text #두개더에 좋아요 누른 유저(생각해 보고 넣기)
    dg_expire datetime, #전체 목표 완료 날짜(ex : 2022-12-26)
    dg_inactive boolean default false not null,
    constraint dogather_user_fk foreign key(user_index) references t_user(user_index),
    constraint dogather_category_fk foreign key(category_index) references t_category(category_index)
);

#dogather 가입 유저
create table t_dogather_user(
	dg_index int, #dogather 인덱스 번호(ex : 1)
    user_index int, #dogather 참여자 번호(ex : 1)
    dg_user_reg_date datetime default now(), #dogather 참여자:가입날짜(ex : 2022-07-25)
    constraint dogatherUser_dogather_fk foreign key(dg_index) references t_dogather(dg_index),
    constraint dogatherUser_user_fk foreign key(user_index) references t_user(user_index)
);

#dogather 유저 목표(진행중)
create table t_dogather_user_target(
	dg_index int, #dogather 인덱스 번호(ex : 1)
    user_index int, #유저 번호(ex: 1)
    dgu_target_date datetime, #(ex : 2022-12-25)
    dgu_target text, #목표(ex : 70kg까지 살빼기 / 살빼기)
    constraint dogatherUserTarget_dogather_fk foreign key(dg_index) references t_dogather(dg_index),
    constraint dogatherUserTarget_user_fk foreign key(user_index) references t_user(user_index)
);

#dogather 인증글
create table t_dogather_do(
	dd_index int primary key auto_increment, #dogather 인증글 번호(ex : 1)
    dg_index int, #dogather 인덱스 번호(ex : 1)
    user_index int, #작성자 번호(ex : 1)
    dd_reg_date datetime default now(), #작성 날짜(ex : 2022-07-26)
    dd_update_date datetime default now(), #수정 날짜(ex : 2022-07-26)
    dd_contents text, #작성 내용(ex : 오늘도 해냈다)
    dd_inactive boolean default false not null, #삭제 여부(ex : 'f')
    dd_like_user_index text, #인증 글에 좋아요 누른 유저(ex : 2,4,6,7,...)
    dd_image1 text, #인증 사진1
    dd_image2 text, #인증 사진2
    dd_image3 text, #인증 사진3
    constraint dogatherDo_dogather_fk foreign key(dg_index) references t_dogather(dg_index),
    constraint dogatherDo_user_fk foreign key(user_index) references t_user(user_index)
);

#dogather 인증글 댓글
create table t_dd_reply(
	dd_index int, #dogather 인증글 번호(ex : 1)
    user_index int, #댓글 작성자(ex : 2)
    ddr_reg_date datetime default now(), #댓글 작성 시간(ex : 2022-07-26)
    ddr_update_date datetime default now(), #댓글 수정 시간(ex : )<-수정 안함
    ddr_contents text, #댓글 내용(ex : 축하여~)
    ddr_inactive boolean default false not null, #댓글 삭제 여부(ex : 'f')
    constraint ddReply_dogather_do_fk foreign key(dd_index) references t_dogather_do(dd_index),
    constraint ddReply_user_fk foreign key(user_index) references t_user(user_index)
);

#dogather feed
create table t_dogather_feed(
	df_index int primary key auto_increment, #dogather 피드 번호(ex : 1)
    dg_index int, #dogather 인덱스 번호(ex : 1)
    user_index int, #작성자 번호(ex : 2)
    df_reg_date datetime default now(), #작성 날짜(ex : 2022-07-26)
    df_update_date datetime default now(), #수정 날짜(ex : )
    df_contents text, #작성 내용(ex : 여긴 어떤곳인가요?)
    df_like_user_index text, #인증 글에 좋아요 누른 유저(ex : 1,3,5,...)
    df_inactive boolean default false not null, #삭제 여부(ex : 'f')
    constraint dogatherFeed_dogather_fk foreign key(dg_index) references t_dogather(dg_index),
    constraint dogatherFeed_user_fk foreign key(user_index) references t_user(user_index)
);

#dogather feed 댓글
create table t_df_reply(
	df_index int, #dogather 피드 번호(ex : 1)
    user_index int, #댓글 작성자(ex : 1)
    dfr_reg_date datetime default now(), #댓글 작성 시간(ex : 2022-07-26)
    dfr_update_date datetime default now(), #댓글 수정 시간(ex : )
    dfr_contents text, #댓글 내용(ex : 살빼는 곳입니다)
    dfr_inactive boolean default false not null, #댓글 삭제 여부(ex : 'f')
    constraint dfReply_dogather_feed_fk foreign key(df_index) references t_dogather_feed(df_index),
    constraint dfReply_user_fk foreign key(user_index) references t_user(user_index)
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
    constraint user_sBoard_fk foreign key(user_index) references user(user_index)
);
#게시판 댓글 틀
create table t_sb_reply(
	b_index int, #게시판 번호
    user_index int, #댓글 작성자
    r_reg_date datetime default now(), #댓글 작성 시간
    r_update_date datetime default now(), #댓글 수정 시간
    r_contents text, #댓글 내용
    r_inactive boolean default false not null, #댓글 삭제 여부
    constraint free_board_reply_fk foreign key(b_index) references user(b_index),
    constraint user_reply_fk foreign key(user_index) references user(user_index)
);
#############################################################################################

create table t_testBoard(
	tb_index int primary key auto_increment, #게시글 번호
    user_index int, #게시글 작성자
    tb_reg_date datetime default now(), #게시글 등록일
    tb_update_date datetime default now(), #게시글 수정일
    tb_title varchar(1000) not null, #게시글 제목
    tb_contents text not null, #게시글 내용(blob 타입 확인 필요)
    tb_hits int default 0, #게시글 조회수
    tb_like_user_index text, #좋아요 누른 사람
    tb_inactive boolean default false not null, #게시글 삭제여부
    tb_files text #원본 파일명+저장 파일명(ex : 원본파일명.jpg:저장파일명/원본파일명.png:저장파일명)
);

#게시판 댓글 틀
create table t_tb_reply(
	tb_index int, #게시판 번호
    user_index int, #댓글 작성자
    tbr_reg_date datetime default now(), #댓글 작성 시간
    tbr_update_date datetime default now(), #댓글 수정 시간
    tbr_contents text, #댓글 내용
    tbr_inactive boolean default false not null #댓글 삭제 여부
);



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