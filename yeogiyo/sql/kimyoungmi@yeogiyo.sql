--=========================
--관리자계정 
--=========================
--web계정 생성
create user yeogiyo
identified by yeogiyo
default tablespace users;

--권한부여
grant connect, resource to yeogiyo;

--=========================
--yeogiyo계정 
--=========================
show user;


--=========================
--=========================
--                   김영미                    --
--=========================
--=========================
--restaurant 테이블 생성
create table restaurant (	
    res_id number not null,
    res_name varchar2(100) not null, 
    res_address varchar2(100) not null,
    category varchar2(20) not null, 
    min_price number default 0 not null,
    logo_img varchar2(2000),
    rate_avg number default 0 not null,
    review_cnt number default 0 not null,
    constraint pk_res_id primary key(res_id)
);

create sequence seq_tb_res_id;

--drop table restaurant;

--alter table restaurant modify logo_img varchar2(2000);

select * from restaurant;

--set define off;

comment on column restaurant.res_id is '가게아이디';
comment on column restaurant.res_name is '가게명';
comment on column restaurant.res_address is '가게주소';
comment on column restaurant.category is '카테고리';
comment on column restaurant.min_price is '최소주문금액';
comment on column restaurant.logo_img is '가게로고이미지';
comment on column restaurant.rate_avg is '별점평균';
comment on column restaurant.review_cnt is '리뷰갯수';

--restaurant 테이블 값 대입
insert into yeogiyo.restaurant
values(seq_tb_res_id.nextval, '보슬보슬', '서울 강남구 테헤란로8길 22 1층 102호', '분식', 5000, 'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAyMDJfMjU5%2FMDAxNjEyMjM5MjI4OTUw.Z7jBsmXSMSXN1cfJ5yDp0aJSJwbgMyTIws8vDOHxbsYg.rcS_Ie89SmRci22AJTExHZ1va4BooJRRPCGtYdgodqog.JPEG.julie6534%2FIMG_4482.jpghttps://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAyMDJfMjU5%2FMDAxNjEyMjM5MjI4OTUw.Z7jBsmXSMSXN1cfJ5yDp0aJSJwbgMyTIws8vDOHxbsYg.rcS_Ie89SmRci22AJTExHZ1va4BooJRRPCGtYdgodqog.JPEG.julie6534%2FIMG_4482.jpg', 0, 0);
insert into yeogiyo.restaurant
values(seq_tb_res_id.nextval, '진씨화로', '서울 강남구 테헤란로10길 21 2층서울 강남구 테헤란로10길 21 2층', '한식', 7000, 'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDEwMTVfMTI1%2FMDAxNjAyNzMxMTcwNzQx.8Vo0y5GKtdQEY6ofYCKTn1jQYu5LWJygIidQcJ82RNYg.Ia5esI2PveYo2jh41XSTQkBcjmHkf8R10CB05yVn0wgg.JPEG.aaa-_-aa%2F%25C1%25F8%25BE%25BE%25C8%25AD%25B7%25CE1.jpghttps://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDEwMTVfMTI1%2FMDAxNjAyNzMxMTcwNzQx.8Vo0y5GKtdQEY6ofYCKTn1jQYu5LWJygIidQcJ82RNYg.Ia5esI2PveYo2jh41XSTQkBcjmHkf8R10CB05yVn0wgg.JPEG.aaa-_-aa%2F%25C1%25F8%25BE%25BE%25C8%25AD%25B7%25CE1.jpg', 0, 0);
insert into yeogiyo.restaurant
values(seq_tb_res_id.nextval, '뢰벤돈까스', '서울 강남구 테헤란로 124서울 강남구 테헤란로 124', '일식/돈까스', 5000, 'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fmyplace-phinf.pstatic.net%2F20210331_255%2F1617176670752Qhr3y_JPEG%2Fupload_4a4d0cac6724154b669297108c590c71.jpghttps://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fmyplace-phinf.pstatic.net%2F20210331_255%2F1617176670752Qhr3y_JPEG%2Fupload_4a4d0cac6724154b669297108c590c71.jpg', 0, 0);

--menu 테이블 생성
CREATE TABLE menu (
	menu_id	number	NOT NULL,
    res_id number not null,
	menu_name	varchar2(100)	NOT NULL,
	description	varchar2(1000),
	menu_category	varchar2(100) DEFAULT '대표메뉴' not null,
	price	number DEFAULT 0 not null,
	menu_img	varchar2(2000),
    constraints pk_menu_id primary key(menu_id),
    constraints fk_menu_res_id foreign key(res_id) 
                            references restaurant(res_id)
                            on delete cascade
);

create sequence seq_tb_menu_id;
--drop sequence seq_tb_menu_id;

--drop table menu;
select * from menu where res_id = 1;
commit;


--menu 테이블 내용 삽입
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	1	,	'크래미키토'	,	'밥대신 폭신폭신한 계란 한입 가득~짭짤한 크래미살에 알싸한 미나리와 당근의 향연은 피로회복과 다이어트 한끼!'	,	'대표메뉴'	,	7000	,	'https://ldb-phinf.pstatic.net/20210110_254/16102487347502RsMQ_JPEG/HXThTYc17WSUVz-kmZZA2gMsb9R6oR78EeH6DuDHp7M%3D.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	1	,	'베이컨키토마요'	,	'갈릭소스에 묻혀 켜켜이 들어간 베이컨을 계란이 감싸고 있어 담백짭쪼름한 어메리칸스따일!'	,	'대표메뉴'	,	7000	,	'https://ldb-phinf.pstatic.net/20210110_72/1610248734834kjAC9_JPEG/zMhZs6-p6TioYVzdfk2xtCawSC0H-2bGo6FtObAMqLY%3D.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	1	,	'트러플키토마요'	,	'아삭아삭한 야채와 송로버섯소스와 마요네즈소스의 환상적인궁합!'	,	'대표메뉴'	,	7000	,	'https://ldb-phinf.pstatic.net/20210110_150/1610248734771FeB0m_JPEG/l-UzO2wRdyPmEvkTCpsUwnpWBOeHgHNpI83giut9sFU%3D.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	1	,	'묵참키토마요'	,	'고단백 지단듬뿍!!새큼한 묵은지와 먹어도 먹어도 질리지 않는 참치마요!!'	,	'대표메뉴'	,	7000	,	'https://ldb-phinf.pstatic.net/20210110_185/16102487351736n0O5_JPEG/CwUMvRzp3pkBfh3XMpVOT8LdvXf56a5kR7SwfcMs6I0%3D.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	1	,	'보슬김밥'	,	'보슬보슬한 계란 듬뿍~지단김밥!'	,	'김밥'	,	5000	,	'https://ldb-phinf.pstatic.net/20210105_52/16097797604959tMOB_JPEG/6dllS4i_fiCtLj2zB2bT1dwvcRoWqWQ-N9jJ1iG_-z_UKKrmaf4n3TpTZNkdCAE6.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	1	,	'스팸보슬김밥'	,	'보송보송 지단김밥에 짭잘한 오리지날 스팸클래식이뙇!이보다 좋을순 없다.'	,	'김밥'	,	6000	,	'https://ldb-phinf.pstatic.net/20210105_282/1609779760748DXrWJ_JPEG/6dllS4i_fiCtLj2zB2bT1bR3Z6sI2IN9zdQrNo0HbXESm_CNCb_PbqLjDzLDqgbE.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	1	,	'치즈보슬김밥'	,	'보송보송한 계란에 고소한 치즈의 조합!'	,	'김밥'	,	6000	,	'https://ldb-phinf.pstatic.net/20210105_200/1609779760488k86H7_JPEG/6dllS4i_fiCtLj2zB2bT1X_8XZ5doiLzLNxdniu_U4tXlbXhY-pikM1OEQCkFPFD.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	1	,	'청양보슬마요김밥'	,	'보송보송한 계란에 매콤달콤한 청양고추와마요의 환상적인조합!'	,	'김밥'	,	6000	,	'https://ldb-phinf.pstatic.net/20210121_31/16111890663868fT6l_JPEG/rXXzTRVoIjsYOugmjybtKGOdQ9NikTwq9yP3W9y90Ds%3D.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	1	,	'꿀밤마늘떡볶이(2인분)'	,	'꿀밤2개'	,	'분식'	,	11000	,	'https://ldb-phinf.pstatic.net/20210107_215/16099854843614PYHt_JPEG/mDcMbl2AXdguQYrLkHz9x9aRfsvJKjY7zbQotTK4eMA%3D.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	1	,	'차돌마늘떡볶이(2인분)'	,	'차돌100g'	,	'분식'	,	15000	,	'https://ldb-phinf.pstatic.net/20210106_100/16099025728145v83k_JPEG/4CyAV3J-ucN80BpfQ0izENYoQXORcIXrMu19eOPeyQ0%3D.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	2	,	'[인기] 소고기 샤브샤브(1인분)'	,	'소고기 130g , 야채, 버섯, 육수, 소스(칠리,겨자), 만두, 떡사리, 김치제공'	,	'대표메뉴'	,	15000	,	'https://ldb-phinf.pstatic.net/20210128_212/1611798071879aMkIe_JPEG/U9OGXkwGHwogC2Fw4wWsI4lISdT_1FPPuNRchaj1OVg%3D.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	2	,	'냉불(함흥냉면 + 불고기)'	,	'냉면  + 불고기 + 무채 + 냉육수(비냉주문시)'	,	'대표메뉴'	,	9500	,	'https://ldb-phinf.pstatic.net/20200902_176/15990308404232tsdH_JPEG/5Zicbh6GZqOFQSe5aesn6pySsSFX3oUNeKOIEG1KEL4MKqFmMxJBrReYSYTvCEHs.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	2	,	'숙주갈비탕'	,	'반찬  : 김치. 샐러드. 공깃밥'	,	'대표메뉴'	,	1400	,	'https://ldb-phinf.pstatic.net/20210302_212/1614673524620LDxUN_JPEG/2PROW6TC4ZuGoId5q_O13hEaLcb1PYFyuu1F9WdrQnY%3D.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	2	,	'소고기국밥'	,	'반찬  : 김치. 샐러드. 공깃밥'	,	'대표메뉴'	,	9500	,	'https://ldb-phinf.pstatic.net/20210302_19/1614673524563KhkCR_JPEG/HlXsgZJd0NPKzIXxOKVZzWeqc3E8ISSir_FSCb3cATo%3D.jpg'	);
insert into yeogiyo.menu values(	seq_tb_menu_id.nextval,	2	,	'한우 불고기'	,	'1인분 (300그램) 반찬: 김치. 샐러드. 양파절임. 고추절임. 공깃밥'	,	'대표메뉴'	,	18000	,	'https://ldb-phinf.pstatic.net/20200830_26/1598720702972DTAru_JPEG/SWEiPrvbGvbe9zQKzjKvlERzfR3s3g2SOw0L6fSjDu9-ALusuWHL3tyF7FXXPzsA.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(	seq_tb_menu_id.nextval,	3	,	'등심돈까스'	,	'매콤달콤/순한맛소스'	,	'대표메뉴'	,	6500			);
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(	seq_tb_menu_id.nextval,	3	,	'생선까스'	,			'대표메뉴'	,	7500			);
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(	seq_tb_menu_id.nextval,	3	,	'치즈돈까스'	,			'대표메뉴'	,	7500			);
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(	seq_tb_menu_id.nextval,	3	,	'함박스테이크'	,			'대표메뉴'	,	7500			);
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price) values(	seq_tb_menu_id.nextval,	3	,	'뢰벤정식'	,	'돈가스,함박스테이크,생선까스'	,	'대표메뉴'	,	8500			);

--=========================
--=========================
--                   김영미                    --
--=========================
--=========================
create table tb_order (
    order_id number not null,
    member_id varchar2(100) not null,
    res_id number not null,
    order_date date default sysdate,
    address varchar2(100) not null,
    address_sub varchar2(100) not null,
    phone char(11) not null,
    order_comment varchar(200),
    payment_way char(1) not null,
    payment_place char(1) not null,
    order_menu varchar2(2000) not null,
    total_price number not null,
    constraints pk_order_id primary key(order_id),
    constraints fk_tb_order_member_id foreign key(member_id) references member(member_id) on delete cascade,
    constraints fk_tb_order_res_id foreign key(res_id) references restaurant(res_id) on delete cascade
    
);

select * from member;

create sequence seq_tb_order_id;

select count(*)count from tb_order;
select * from tb_order;
--insertOrder
--order_id, member_id, res_id, order_date, address, address_sub, phone, order_comment, payment_way, 
--payment_place, order_menu, total_price
--insert into tb_order values(seq_tb_order_id.nextval, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?, ?)

insert into tb_order
values(seq_tb_order_id.nextval, 1, 'honggd', 1, sysdate, '서울시 강남구', '테헤란로', '01099999999', null, 'K', 'N', '[{"resId":1,"menuId":1,"menuName":"크래미키토","amount":1,"price":7000,"totalPrice":7000},{"resId":1,"menuId":3,"menuName":"트러플키토마요","amount":1,"price":7000,"totalPrice":7000}]', 14000);

insert into tb_order(order_id) values(seq_tb_order_id.nextval);

--selectLastOrderById
/*
select *
from(
    select rownum rnum, M.*
    from (
        select M.*
        from tb_order M
        where member_id = ?
        order by order_date desc
        )M
    )M
where rnum = 1
*/



--delete from member where member_id = 'test';

--=========================
--=========================
--                   김상훈                    --
--=========================
--=========================



내용



--=========================
--=========================
--                   김상훈                    --
--=========================
--=========================


--=========================
--=========================
--                   송준호                    --
--=========================
--=========================



내용



--=========================
--=========================
--                   송준호                    --
--=========================
--=========================


--=========================
--=========================
--                   황윤진                    --
--=========================
--=========================



내용



--=========================
--=========================
--                   황윤진                    --
--=========================
--=========================


--=========================
--=========================
--                   이재성                    --
--=========================
--=========================
select * from member;
desc member;

내용



--=========================
--=========================
--                   이재성                    --
--=========================
--=========================


--=========================
--=========================
--                   송민성                    --
--=========================
--=========================



내용



--=========================
--=========================
--                   송민성                    --
--=========================

