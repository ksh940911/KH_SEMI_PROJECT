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

select * from restaurant;
select * from menu;
select * from member;
select * from tb_order order by order_date desc;

create sequence seq_tb_order_id;

select count(*)count from tb_order;
select * from tb_order where res_id = 1; --order_id
select * from review; --order_id
select * from reviewphoto;

update restaurant
set res_address = '서울 강남구 테헤란로 124'
where res_id = 3;

commit;

--selectRestaurantListByCategory
--select * from restaurant where category = ?



--res_id로 리뷰 갯수 조회 selectReviewCntByResId
/*
select count(*) count
from tb_order O join review R
    on O.order_id = R.order_id
where res_id = ?
*/



--insertOrder
--order_id, member_id, res_id, order_date, address, address_sub, phone, order_comment, payment_way, 
--payment_place, order_menu, total_price
--insert into tb_order values(seq_tb_order_id.nextval, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?, ?)

insert into tb_order
values(seq_tb_order_id.nextval, 'honggd', 1, sysdate, '서울시 강남구', '테헤란로', '01099999999', null, 'K', 'N', '[{"resId":1,"menuId":1,"menuName":"크래미키토","amount":1,"price":7000,"totalPrice":7000},{"resId":1,"menuId":3,"menuName":"트러플키토마요","amount":1,"price":7000,"totalPrice":7000}]', 14000);

commit;

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
    )M'[{"resId":1,"menuId":1,"menuName":"크래미키토","amount":2,"price":7000,"totalPrice":14000},{"resId":1,"menuId":2,"menuName":"베이컨키토마요","amount":1,"price":7000,"totalPrice":7000}]'
where rnum = 1
*/

select * from member;   

--delete from member where member_id = 'test';

--set define off;

insert into restaurant (res_id, res_name, res_address, category, logo_img) 
values(seq_tb_res_id.nextval,		'짬뽕지존 역삼점'	,	'서울 강남구 테헤란로10길 21 세명프라자 B동 205호 짬뽕지존'	,		'중국집'	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMjZfMjE4%2FMDAxNjE2NzQ5ODA5MjU2.0AFgeocdzyFnyZeQoR0oV_nyhPu8iDywOACz-mEna7gg.OTWbS5iWXYlXlrnmqqtfMqv6nWaaLyQXm36GTP1PK7Qg.JPEG.ribon907%2FKakaoTalk_20210326_174825698_02.jpg'	);																		insert into restaurant (res_id, res_name, res_address, category, logo_img) values(seq_tb_res_id.nextval,		'짬뽕지존 역삼점'	,	'서울 강남구 테헤란로10길 21 세명프라자 B동 205호 짬뽕지존'	,		'중국집'	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAzMjZfMjE4%2FMDAxNjE2NzQ5ODA5MjU2.0AFgeocdzyFnyZeQoR0oV_nyhPu8iDywOACz-mEna7gg.OTWbS5iWXYlXlrnmqqtfMqv6nWaaLyQXm36GTP1PK7Qg.JPEG.ribon907%2FKakaoTalk_20210326_174825698_02.jpg'	);																		

select * from restaurant;

--현재 시퀀스가 몇인지 조회 : 21
select seq_tb_res_id.currval from dual;

--drop sequence seq_tb_res_id;
create sequence seq_tb_res_id
start with 19;

select * from user_sequences;






insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			4	,'	지존/지옥 짜장	','			대표메뉴	',	6500			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			4	,'	지존/지옥 짬뽕	','			대표메뉴	',	8500			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			4	,'	지존/지옥 짬짜면	','			대표메뉴	',	9000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			4	,'	지존/지옥 순두부짬뽕	','			대표메뉴	',	9000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			4	,'	지존/지옥 쌀국수짬뽕	','			대표메뉴	',	9000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			4	,'	지존/지옥 수제비짬뽕	','			대표메뉴	',	9000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			4	,'	수제만두	','			대표메뉴	',	6000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			4	,'	찹쌀/사천 탕수육	','			대표메뉴	',	13000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			4	,'	게살/새우 볶음밥	','			대표메뉴	',	8500			);																			

commit;
rollback;

select * from user_tables;


update menu set res_id = 21 where res_id = 

select * from restaurant order by res_id;
select * from menu order by menu_id;

delete from restaurant where res_id = 31;

set define off;
commit;

select * from review;
select * from tb_order;

--리뷰리스트(전체)
select r.* 
from ( 
    select row_number() over(order by r.review_no desc) rnum, o.res_id, r.*, p.photo_no reviewphoto_no, p.photo_originalfilename, p.photo_renamedfilename, p.photo_status 
    from reviewphoto p right join review r on p.review_no = r.review_no left join tb_order o on r.order_id = o.order_id ) r 
    where rnum between 1 and 10;

--가게별 리뷰테이블 조회(페이징)
select r.* 
from ( 
    select row_number() over(order by r.review_no desc) rnum, o.res_id, r.*, p.photo_no reviewphoto_no, p.photo_originalfilename, p.photo_renamedfilename, p.photo_status 
    from reviewphoto p right join review r on p.review_no = r.review_no left join tb_order o on r.order_id = o.order_id ) r 
    where rnum between 1 and 10 and res_id=1;
    
--tb_order에 'reviewYN' 컬럼 추가
--alter table tb_order add review_yn char(1) default 'N' not null;

select * from tb_order;

select * from restaurant;

--주문내역 조회    
select * from tb_order o, restaurant r where o.res_id = r.res_id and o.member_id = 'honggd' order by order_date desc;

--가게별 별점 평균 조회 쿼리 selectAvgReviewStarByResId
select round(avg(review_star), 1) avg
from review r join tb_order o
on r.order_id = o.order_id
where res_id = ?;

select * from restaurant;

--updateReviewCountByResId
update restaurant 
set review_cnt = ?
where res_id = ?

--updateAvgReviewStarByResId
update restaurant
set rate_avg = ?
where res_id = ?

--updateReviewYNByOrderId
update tb_order
set review_yn = 'Y'
where order_id = ?;

--tb_order의 order_menu컬럼을 varchar2최대크기로 변경
alter table tb_order
modify order_menu clob;

alter table tb_order add (tmp_order_menu clob);
alter table tb_order
modify phone varchar2(20);

update tb_order set tmp_order_menu = order_menu;
alter table tb_order drop column order_menu;
alter table tb_order rename column tmp_order_menu to order_menu;

commit;

--insertOrder
insert into tb_order
(order_id, member_id, res_id, address, address_sub, phone, order_comment, payment_way, payment_place, order_menu, review_yn, total_price) 
values(seq_tb_order_id.nextval, 'kym9129', 21, '경기 안양시 동안구 관악대로 286', '버스가판대1103-2', '01075991973', null, 'M', 'F', '[{"resId":21,"menuId":164,"menuName":"블랙알리오","amount":1,"price":17900,"totalPrice":17900},{"resId":21,"menuId":165,"menuName":"고추마요 치킨","amount":1,"price":17900,"totalPrice":17900}]', 'N', 35800);

rollback;

select * from user_tab_columns where table_name = 'TB_ORDER';

select * from tb_order order by order_id desc;



--selectOrderList
select * from tb_order o, restaurant r where o.res_id = r.res_id and o.member_id = 'honggd' order by order_date desc;
select * from tb_order order by order_date desc;

--selectReviewCntByResId
select count(*) count from review where res_id = ?

select * from review;

 select * from tb_order o, restaurant r where o.res_id = r.res_id and o.member_id = 'honggd' order by order_date desc;

insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	14	,	'자다가도벌떡'	,	'서울 강남구 테헤란로 124 지하1층'	,		'분식'	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190519_55%2F15582467169946WXfO_PNG%2FnLARu8btaoA3ZMoljicXzjad.png'	);																		
insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	15	,	'스타벅스 역삼포스코점'	,	'서울 강남구 테헤란로 13'	,		'카페/디저트'	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190828_93%2F1566953601239OT9MQ_PNG%2FxX7Wv642gXMoTI0DAv0hRymS.png'	);																		
insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	16	,	'카페드나탈리 역삼'	,	'서울 강남구 테헤란로20길 16 금정빌딩 1F'	,		'카페/디저트'	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDA1MTBfMjEw%2FMDAxNTg5MDc4NDYwMzM1.g-R0YV8Nxo4NPVxJBaonL40vp2ccjSYaiTfta3RIY5wg.3WyvMWfXR4smYyU3uZ3RFT_lyV5SirCEYSealHYYEV8g.JPEG.ramy44533%2FIMG_7821.jpg'	);																		

insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	17	,	'GS25 강남태강점'	,	'서울 강남구 테헤란로10길 14'	,		'편의점'	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190805_45%2F1564984449061HczMx_JPEG%2FHn0abE32EGOUiJRishjlYsqK.jpg'	);																		
insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	18	,	'CU 국기원사거리점'	,	'서울 강남구 테헤란로8길 11'	,		'편의점'	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200109_34%2F1578536934584lARkQ_PNG%2FG4sy524RQNZsd00KCNdMc-Oy.png'	);																		


insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			17	,	'쏜살치킨'	,	'빠른배달 가능한 BOX형 한마리 치킨!'	,	'대표메뉴'	,	10000	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EC%8F%9C%EC%82%B4%EC%B9%98%ED%82%A8_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			17	,	'매콤닭다리 세트'	,	'[바삭매콤치킨 3개 ＋ 칠성사이다]'	,	'대표메뉴'	,	9000	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EB%A7%A4%EC%BD%A4%EB%8B%AD%EB%8B%A4%EB%A6%AC%EC%84%B8%ED%8A%B8_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			17	,	'공화춘 중국집 (3인세트)'	,	'[공화춘자장덮밥（컵밥） 3개 ＋ 꼬마단무지（선택）]'	,	'대표메뉴'	,	9000	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EA%B3%B5%ED%99%94%EC%B6%98%EC%A4%91%EA%B5%AD%EC%A7%91-3%EC%9D%B8%EC%84%B8%ED%8A%B8-_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			17	,	'죽 먹고 떡볶이 마무으리'	,	'[양반전복죽285G 3개 ＋ 두껍면떡볶이（용기）]'	,	'대표메뉴'	,	11000	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EC%A3%BD%EB%A8%B9%EA%B3%A0%EB%96%A1%EB%B3%B6%EC%9D%B4%EB%A7%88%EB%AC%B4%EC%9C%BC%EB%A6%AC_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			17	,	'내맘대로 골라먹는 도시락'	,	'[라이트스탠다드 ＋ 2가지고기많은도시락／고진많도시락／11가지찬많은도시락／내장산새송이떡갈비／황금왕돈까스도시락 中 택1＋칠성사이다]'	,	'대표메뉴'	,	9300	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EB%82%B4%EB%A7%98%EB%8C%80%EB%A1%9C%EA%B3%A8%EB%9D%BC%EB%A8%B9%EB%8A%94%EB%8F%84%EC%8B%9C%EB%9D%BD_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			17	,	'출출할때 쿠키파티'	,	'[해태버터링 2개 ＋ 촉촉한초코칩 ＋ 쿠쿠다스／빅파이 中 택 1 ＋ 닥터유에너지바／단백질바 中 택1]'	,	'대표메뉴'	,	8100	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EC%B6%9C%EC%B6%9C%ED%95%A0%EB%95%8C%EC%BF%A0%ED%82%A4%ED%8C%8C%ED%8B%B0_1080x640.jpg'	);																			

insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			18	,	'쏜살치킨'	,	'빠른배달 가능한 BOX형 한마리 치킨!'	,	'대표메뉴'	,	10000	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EC%8F%9C%EC%82%B4%EC%B9%98%ED%82%A8_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			18	,	'매콤닭다리 세트'	,	'[바삭매콤치킨 3개 ＋ 칠성사이다]'	,	'대표메뉴'	,	9000	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EB%A7%A4%EC%BD%A4%EB%8B%AD%EB%8B%A4%EB%A6%AC%EC%84%B8%ED%8A%B8_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			18	,	'공화춘 중국집 (3인세트)'	,	'[공화춘자장덮밥（컵밥） 3개 ＋ 꼬마단무지（선택）]'	,	'대표메뉴'	,	9000	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EA%B3%B5%ED%99%94%EC%B6%98%EC%A4%91%EA%B5%AD%EC%A7%91-3%EC%9D%B8%EC%84%B8%ED%8A%B8-_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			18	,	'죽 먹고 떡볶이 마무으리'	,	'[양반전복죽285G 3개 ＋ 두껍면떡볶이（용기）]'	,	'대표메뉴'	,	11000	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EC%A3%BD%EB%A8%B9%EA%B3%A0%EB%96%A1%EB%B3%B6%EC%9D%B4%EB%A7%88%EB%AC%B4%EC%9C%BC%EB%A6%AC_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			18	,	'내맘대로 골라먹는 도시락'	,	'[라이트스탠다드 ＋ 2가지고기많은도시락／고진많도시락／11가지찬많은도시락／내장산새송이떡갈비／황금왕돈까스도시락 中 택1＋칠성사이다]'	,	'대표메뉴'	,	9300	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EB%82%B4%EB%A7%98%EB%8C%80%EB%A1%9C%EA%B3%A8%EB%9D%BC%EB%A8%B9%EB%8A%94%EB%8F%84%EC%8B%9C%EB%9D%BD_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			18	,	'출출할때 쿠키파티'	,	'[해태버터링 2개 ＋ 촉촉한초코칩 ＋ 쿠쿠다스／빅파이 中 택 1 ＋ 닥터유에너지바／단백질바 中 택1]'	,	'대표메뉴'	,	8100	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/gs25/2021-03-30/%EC%A0%9C%ED%9C%B4FR_20210326_GS25_%EC%B6%9C%EC%B6%9C%ED%95%A0%EB%95%8C%EC%BF%A0%ED%82%A4%ED%8C%8C%ED%8B%B0_1080x640.jpg'	);																			



insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			14	,	'국물떡볶이'	,	'국물이 일품! 밥 비벼먹고싶은 맛!'	,	'대표메뉴'	,	2900	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190802_3%2F1564701636505tRk6O_JPEG%2F%25BD%25BA%25C5%25B9_20171208_yogiyo_mg_5531_%25B1%25B9%25B9%25B0%25B6%25B1%25BA%25BA%25C0%25CC02_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			14	,	'모듬튀김 A'	,	'야채튀김 2＋고구마튀김 2＋김말이 2＋납작만두 1 제공'	,	'대표메뉴'	,	3900	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190802_84%2F1564701641872xvFTr_JPEG%2F%25BD%25BA%25C5%25B9_20170908_foodon_fon13279_%25B8%25F0%25B5%25EB%25C6%25A2%25B1%25E801_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			14	,	'모듬튀김 B'	,	'한입 고추튀김 3＋오징어튀김 2＋새우튀김2＋납작만두 1 제공'	,	'대표메뉴'	,	3900	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190802_84%2F1564701641872xvFTr_JPEG%2F%25BD%25BA%25C5%25B9_20170908_foodon_fon13279_%25B8%25F0%25B5%25EB%25C6%25A2%25B1%25E801_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			14	,	'모듬튀김 C'	,	'야채튀김 2＋고구마튀김 2＋김말이 2＋납작만두 1＋한입 고추튀김 3＋오징어튀김 2＋새우튀김1＋납작만두 1 제공'	,	'대표메뉴'	,	7800	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190802_84%2F1564701641872xvFTr_JPEG%2F%25BD%25BA%25C5%25B9_20170908_foodon_fon13279_%25B8%25F0%25B5%25EB%25C6%25A2%25B1%25E801_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			14	,	'오징어 튀김'	,	'수량선택'	,	'대표메뉴'	,	1000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190802_167%2F1564701631019q7TRd_JPEG%2F%25BD%25BA%25C5%25B9_20171208_yogiyo_mg_5515_%25BF%25C0%25C2%25A1%25BE%25EE%25C6%25A2%25B1%25E802_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			14	,	'쿨피스 1000mL'	,	'매운 떡볶이에 필수'	,	'대표메뉴'	,	2000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190802_145%2F1564701633167xJ8Op_JPEG%2F%25BD%25BA%25C5%25B9_20171208_yogiyo_mg_5273_%25C4%25F0%25C7%25C7%25BD%25BA%25B4%25DC%25C3%25BC02_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			15	,	'바닐라 플랫 화이트'	,	'바닐라 플랫 화이트는 진하고 고소한 리스트레토 샷과 바닐라 시럽 그리고 스팀 밀크로 즐기는 진한 커피 라떼'	,	'에스프레소'	,	5600	,	'https://naverbooking-phinf.pstatic.net/20210416_83/1618516172891VRd03_JPEG/image.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			15	,	'스타벅스 돌체 라떼'	,	'스타벅스의 다른 커피 음료보다 더욱 깊은 커피의 맛과 향에 깔끔한 무지방 우유와 부드러운 돌체 시럽이 들어간 음료로 달콤하고 진한 커피 라떼'	,	'에스프레소'	,	5600	,	'https://naverbooking-phinf.pstatic.net/20200724_219/1595564564127nes3a_JPEG/image.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			15	,	'카페 모카'	,	'진한 초콜릿 모카 시럽과 풍부한 에스프레소를 신선한 우유 그리고 얼음과 섞어 휘핑크림으로 마무리한 음료로 진한 에스프레소와 초콜릿 맛이 어우러진 커피'	,	'에스프레소'	,	5100	,	'https://naverbooking-phinf.pstatic.net/20210416_47/1618516166229qYF27_JPEG/image.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			15	,	'카페 아메리카노'	,	'진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피'	,	'에스프레소'	,	4100	,	'https://naverbooking-phinf.pstatic.net/20200724_22/1595564612587NY379_JPEG/image.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			15	,	'카페 라떼'	,	'풍부하고 진한 농도의 에스프레소가 시원한 우유와 얼음을 만나 고소함과 시원함을 즐길 수 있는 대표적인 커피 라떼'	,	'에스프레소'	,	4600	,	'https://naverbooking-phinf.pstatic.net/20210416_56/1618516165684D5nCy_JPEG/image.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			15	,	'카푸치노'	,	'풍부하고 진한 에스프레소에 신선한 우유와 우유 거품이 얼음과 함께 들어간 시원하고 부드러운 커피 음료'	,	'에스프레소'	,	4600	,	'https://naverbooking-phinf.pstatic.net/20210416_6/1618516161507A0S4p_JPEG/image.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			15	,	'바나나 체커스 케이크'	,	'초콜릿 케이크 시트와 화이트 케이크 시트를 번갈아 쌓은 후 바나나 생크림을 아이싱 한 바나나 체커스 케이크 입니다.'	,	'케이크&미니디저트'	,	6300	,	'https://naverbooking-phinf.pstatic.net/20210413_192/16182568849191FuzX_JPEG/image.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			15	,	'부드러운 생크림 카스텔라'	,	'부드러운 생크림이 듬뿍 들어있는 촉촉한 카스텔라입니다.'	,	'케이크&미니디저트'	,	4500	,	'https://naverbooking-phinf.pstatic.net/20210422_226/16190345123932tGwy_JPEG/image.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			15	,	'촉촉 슈크림 레이어 케이크'	,	'향긋한 올리브 오일을 넣어 구운 촉촉한 케이크 시트에 바닐라 빈을 넣은 커스터드 크림을 층층이 쌓아 올린 케이크입니다.'	,	'케이크&미니디저트'	,	5900	,	'https://naverbooking-phinf.pstatic.net/20210316_62/1615837694493qTnLT_JPEG/image.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			16	,	'꽃얼음 청포도 에이드'			,	'사장님 추천 메뉴'	,	6000	,	'https://ldb-phinf.pstatic.net/20210225_30/1614242920914IvTr5_JPEG/%B2%C9%BE%F3%C0%BD_%C3%BB%C6%F7%B5%B5_%BF%A1%C0%CC%B5%E5.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			16	,	'티라미수 라떼'			,	'사장님 추천 메뉴'	,	5000	,	'https://ldb-phinf.pstatic.net/20210225_263/1614243696027nJfAH_JPEG/%C6%BC%B6%F3%B9%CC%BC%F6_%B6%F3%B6%BC.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			16	,	'스키니 바닐라 라떼'			,	'사장님 추천 메뉴'	,	4500	,	'https://ldb-phinf.pstatic.net/20210225_83/1614243547584660hT_JPEG/%BD%BA%C5%B0%B4%CF_%B9%D9%B4%D2%B6%F3_%B6%F3%B6%BC.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			16	,	'아메리카노'			,	'커피'	,	3800	,	'https://ldb-phinf.pstatic.net/20210225_36/1614243524850VF89s_JPEG/%BE%C6%B8%DE%B8%AE%C4%AB%B3%EB.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			16	,	'오렌지 카푸치노'			,	'커피'	,	4000	,	'https://ldb-phinf.pstatic.net/20210225_173/1614243594792hrCSs_JPEG/%BF%C0%B7%BB%C1%F6_%C4%AB%C7%AA%C4%A1%B3%EB.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			16	,	'디카페인 콜드브루'			,	'커피'	,	4500	,	'https://ldb-phinf.pstatic.net/20210225_268/1614242934318DsV2m_JPEG/%B5%F0%C4%AB%C6%E4%C0%CE_%C4%DD%B5%E5%BA%EA%B7%E7.jpg'	);																			insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			14	,	'국물떡볶이'	,	'국물이 일품! 밥 비벼먹고싶은 맛!'	,	'대표메뉴'	,	2900	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190802_3%2F1564701636505tRk6O_JPEG%2F%25BD%25BA%25C5%25B9_20171208_yogiyo_mg_5531_%25B1%25B9%25B9%25B0%25B6%25B1%25BA%25BA%25C0%25CC02_1080x640.jpg'	);																			




insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			13	,	'올레 족발(앞발)_대'			,	'대표메뉴'	,	34000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180622_23%2F1529657681600QPS1f_JPEG%2FIyFn-QQcGjebigXgkhRxCy3w.JPG.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			13	,	'올레 족발(앞발)_반반'			,	'대표메뉴'	,	36000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180622_23%2F1529657681600QPS1f_JPEG%2FIyFn-QQcGjebigXgkhRxCy3w.JPG.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			13	,	'올레 족발(뒷발)_중'			,	'대표메뉴'	,	31000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180622_23%2F1529657681600QPS1f_JPEG%2FIyFn-QQcGjebigXgkhRxCy3w.JPG.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			13	,	'올레 족발(뒷발)_반반'			,	'대표메뉴'	,	33000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180622_23%2F1529657681600QPS1f_JPEG%2FIyFn-QQcGjebigXgkhRxCy3w.JPG.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			13	,	'올레 보쌈_대'			,	'대표메뉴'	,	30000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180622_126%2F1529657755005RnaxR_JPEG%2FQb9qWpUZjvtWl1Z4JeSHcjMi.JPG.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			13	,	'올레 보쌈_소'			,	'대표메뉴'	,	25000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180622_126%2F1529657755005RnaxR_JPEG%2FQb9qWpUZjvtWl1Z4JeSHcjMi.JPG.jpg'	);																			


insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			31	,	'[압도적1위]로제찜닭'			,	'인기메뉴'	,	25800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%EB%A1%9C%EC%A0%9C%EC%B0%9C%EB%8B%AD_1080x640.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			31	,	'[찜닭의정석] 한마리찜닭（까만／빨간）'			,	'인기메뉴'	,	21800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%ED%95%9C%EB%A7%88%EB%A6%AC%EC%B0%9C%EB%8B%AD-%EA%B9%8C%EB%A7%8C_%EB%B9%A8%EA%B0%84_1080x640.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			31	,	'[거부할수없는] 치즈찜닭'			,	'인기메뉴'	,	24800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%EC%B9%98%EC%A6%88%EC%B0%9C%EB%8B%AD_1080x640.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			31	,	'[칼칼한밥도둑] 묵은지찜닭'			,	'인기메뉴'	,	25800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%EB%AC%B5%EC%9D%80%EC%A7%80%EC%B0%9C%EB%8B%AD_1080x640.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			31	,	'[가성비갑]까만／빨간찜닭두마리'			,	'인기메뉴'	,	33800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%EA%B0%80%EC%84%B1%EB%B9%84%EA%B0%91-%EA%B9%8C%EB%A7%8C_%EB%B9%A8%EA%B0%84%EC%B0%9C%EB%8B%AD%EB%91%90%EB%A7%88%EB%A6%AC_1080x640.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			31	,	'로제닭발（무뼈）'			,	'인기메뉴'	,	21800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%EB%AC%B4%EB%BC%88-%EB%A1%9C%EC%A0%9C%EB%8B%AD%EB%B0%9C_1080x640.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			32	,	'블랙알리오'	,	'깊고 진한 간장과 고소하면서 담백한 마늘의 만남! 치킨을 넘어 진정한 요리를 느낄 수 있는 푸라닭의 대표 메뉴'	,	'인기메뉴'	,	17900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2020-12-01/%EC%A0%9C%ED%9C%B4FR_20201130_%ED%91%B8%EB%9D%BC%EB%8B%AD_%EB%B8%94%EB%9E%99%EC%95%8C%EB%A6%AC%EC%98%A4_1080x640.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			32	,	'고추마요 치킨'	,	'강력추천! 한 입 먹으면 계속 손이 갈 수 밖에 없는 마법의 치킨, 맵다, 부드럽다, 고소하다, 달콤하다, 새콤하다. 맛의 조합이 환상적인 강추메뉴'	,	'인기메뉴'	,	17900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2020-09-11/%EC%A0%9C%ED%9C%B4FR_20200910_%ED%91%B8%EB%9D%BC%EB%8B%AD_%EA%B3%A0%EC%B6%94%EB%A7%88%EC%9A%94%EC%B9%98%ED%82%A8_1080x640.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			32	,	'푸라닭 치킨'	,	'오븐에 조리 후 후라이드하여 속은 촉촉하고 겉은 바삭한 푸라닭 오븐 후라이드 메뉴. 건강과 맛까지 생각한 오리지널 메뉴'	,	'인기메뉴'	,	15900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2019-04-03/%EC%A0%9C%ED%9C%B4fr_20190401_%ED%91%B8%EB%9D%BC%EB%8B%AD_%ED%91%B8%EB%9D%BC%EB%8B%AD%EC%B9%98%ED%82%A8-%EC%98%A4%EB%A6%AC%EC%A7%80%EB%82%A0_1080x640.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			32	,	'블랙마요'	,	'깊고 진한 간장과 담백한 마늘이 어우러진 블랙알리오, 고소한 마요네즈와 매콤한 청고추의 조화로 탄생한 고추마요 치킨이 드디어 만났다! 푸라닭의 대표 치킨 메뉴를 한번에 즐길 수 있는 절호의 기회!'	,	'인기메뉴'	,	18900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2020-06-19/%EC%A0%9C%ED%9C%B4FR_20200619_%ED%91%B8%EB%9D%BC%EB%8B%AD_%EB%B8%94%EB%9E%99%EB%A7%88%EC%9A%94_1080x640.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			32	,	'블랙투움바'	,	'깊고 진한 간장과 담백한 마늘이 어우러진 블랙알리오와 고소하고 매콤한 투움바 치킨의 절묘한 만남! 푸라닭의 인기 치킨메뉴 2종을 한번에 즐겨보세요'	,	'인기메뉴'	,	19900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2020-11-25/%EC%A0%9C%ED%9C%B4FR_20201119_%ED%91%B8%EB%9D%BC%EB%8B%AD_%EB%B8%94%EB%9E%99%ED%88%AC%EC%9B%80%EB%B0%94_1080x640.jpg'	);
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			32	,	'블랙 윙콤보'	,	'한 번 맛보면 잊을 수 없는 푸라닭 베스트 메뉴! 깊고 진한 블랙소스와 바삭한 갈릭칩이 만나 입 안 가득 풍미를 선사합니다'	,	'인기메뉴'	,	19900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2020-12-31/%EC%A0%9C%ED%9C%B4FR_20201230_%ED%91%B8%EB%9D%BC%EB%8B%AD_%EB%B8%94%EB%9E%99%EC%9C%99%EC%BD%A4%EB%B3%B4_1080x640.jpg'	);

commit;

select * from tb_order;



insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	11	,	'고레카레 심플 역삼점'	,	'서울 강남구 테헤란로20길 18 1층'	,		'일식/돈까스'	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210312_281%2F1615529811015tXFSQ_JPEG%2FHtF4XwSp0oB-nHAXaPG_eFvi.JPG.jpg'	);																		
insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	12	,	'육감만족 역삼점'	,	'서울 강남구 논현로85길 29 썬프라자 2층'	,		'족발/보쌈'	,	'https://lh3.googleusercontent.com/proxy/V5OuzpvBnVsHk--O-UJb_jwcQoklVFA-CcsoBF3Lh9lsukiwNGlwOdDZe2gaz1fHAzFlmssw0k0dOcyq4Y3SbWIs_KZmO8opwF2SmvVX65WYZ8sd6sHedjSrCRzsmR2jtQ'	);																		

insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			11	,	'고레세트'			,	'대표메뉴'	,	11500	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210113_62%2F1610530715364MwlIB_JPEG%2FyEmxOi68AHNjc2rmzSRgIqvo.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			11	,	'버섯카레소시지세트'			,	'대표메뉴'	,	11000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210113_44%2F1610530740999wV5Ym_JPEG%2FkA9zZLJ4hMpRBqB3jahT4pbk.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			11	,	'깐새우카레우동'			,	'대표메뉴'	,	9500	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210113_238%2F16105307733788I5TK_JPEG%2FBIrySkBcJhxF1-mFHrVPbXY3.jpg%22'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			12	,	'족발'			,	'대표메뉴'	,	29000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200804_31%2F1596491464527MeyLC_JPEG%2F%25C1%25A6%25C8%25DEfr_20190122_%25C0%25B0%25B0%25A8%25B8%25B8%25C1%25B7_%25C1%25B7%25B9%25DF_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			12	,	'육감만족보（족발＋보쌈）中'			,	'대표메뉴'	,	40000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200901_226%2F1598910525247LE1ud_JPEG%2F%25C1%25A6%25C8%25DEfr_20190122_%25C0%25B0%25B0%25A8%25B8%25B8%25C1%25B7_%25C0%25B0%25B0%25A8%25B8%25B8%25C1%25B7%25BA%25B8_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			12	,	'육감만족보（족발＋보쌈）大'			,	'대표메뉴'	,	50000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200901_226%2F1598910525247LE1ud_JPEG%2F%25C1%25A6%25C8%25DEfr_20190122_%25C0%25B0%25B0%25A8%25B8%25B8%25C1%25B7_%25C0%25B0%25B0%25A8%25B8%25B8%25C1%25B7%25BA%25B8_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			12	,	'직화 불족발 2~3인용'			,	'대표메뉴'	,	37000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20201215_217%2F1607982429716rsEE3_JPEG%2F%25C1%25A6%25C8%25DEfr_20190122_%25C0%25B0%25B0%25A8%25B8%25B8%25C1%25B7_%25C1%25F7%25C8%25AD%25BA%25D2%25C1%25B7%25B9%25DF_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			12	,	'보쌈'			,	'대표메뉴'	,	29000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210119_282%2F1611006338694Bzi6x_JPEG%2F%25C1%25A6%25C8%25DEfr_20190122_%25C0%25B0%25B0%25A8%25B8%25B8%25C1%25B7_%25BA%25B8%25BD%25D3_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			12	,	'통마늘보쌈'			,	'대표메뉴'	,	32000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210126_221%2F1611611148270xvip2_JPEG%2F%25C1%25A6%25C8%25DEfr_20190122_%25C0%25B0%25B0%25A8%25B8%25B8%25C1%25B7_%25C5%25EB%25B8%25B6%25B4%25C3%25BA%25B8%25BD%25D3_1080x640.jpg'	);																			


insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	5	,	'Chai797 역삼GFC점'	,	'서울 강남구 테헤란로 152 강남파이낸스센터 B1'	,		'중국집'	,	'http://www.chai797.co.kr/chai/images/sub/brand_1.png'	);																		insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	5	,	'Chai797 역삼GFC점'	,	'서울 강남구 테헤란로 152 강남파이낸스센터 B1'	,		'중국집'	,	'http://www.chai797.co.kr/chai/images/sub/brand_1.png'	);																		

insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			5	,	'24시간 숙성 탕수육'	,			'대표메뉴'	,	28000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			5	,	'호두 꿀크림 중새우'	,			'대표메뉴'	,	29000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			5	,	'전남 무안 양파 삼선짜장면'	,			'대표메뉴'	,	9000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			5	,	'국내산 통전복 해물짬뽕'	,			'대표메뉴'	,	16000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			5	,	'황금비율 마늘 볶음밥'	,			'대표메뉴'	,	11500			);																			

insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	6	,	'보드람치킨 역삼역점'	,	'서울 강남구 테헤란로20길 13 덕성빌딩 1층'	,		'치킨'	,	'https://t1.daumcdn.net/cfile/tistory/272B7547588787F122'	);																		
insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	7	,	'치킨공식 역삼직영점'	,	'서울 강남구 역삼로17길 64 역삼동A4스페이스'	,		'치킨'	,	'https://mblogthumb-phinf.pstatic.net/MjAyMDAyMDVfMjgx/MDAxNTgwODcxMzgxOTMz.QpQmiC6-OwDaTZc8rugpERYAjXdbHguT8MzIvbte48og.PPuYiaa4EoaNQFR08Rke3ukL9ZocORCGdJ-Wb8ttIJcg.JPEG.cksal0778/IMG_3452.jpg?type=w800'	);																		
insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	8	,	'캘리포니아피자키친 역삼 GFC점'	,	'서울 강남구 테헤란로 152 강남파이낸스센터(GFC) B1F'	,		'피자/양식'	,	'https://lh3.googleusercontent.com/proxy/D6zYdjkRfgcEkr_WHTPPFJWUaJIK0EzQcULPeWTetTuOCMkl2XYDDjuhCN6ObxFM5PFs-8qgJR_0cMr47h9nLJYJonsy6TJOGYkI-efOYIXfaNN2aamGT1SeCQ81p9cOP0malmz6V4whv4fvG3yvNn241bSxy-zTd0mZLnYI3LNZD1Mzq3wGfr3VegkwxmqVcqSEa6QHjV5wyflJTa5f759uTLHKn5kfumbQ35v7smUXOeuuxna5aCIhJk63Vdltqul9xtTlkULvjGR9S-8Uiar43ma1LRs8xzjqlh17WEvehLRw9PhZLm2_ElhO4KsN6y3EQg'	);																		
insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	9	,	'핑크솔740'	,	'서울 강남구 테헤란로20길 25'	,		'피자/양식'	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAyMDlfMjMy%2FMDAxNjEyODU2NDM3MTYw.t2r04gJ4W45j2Q002HDj28inqcUhsxJI4lmelnOG-asg.7cogQUgu8afgDLLgGIcJQWIUJHcsgIF1CFPZQSrfvNQg.JPEG.wk___hong%2FDSC02344.JPG'	);																		
insert into restaurant (res_id, res_name, res_address, category, logo_img) values(	10	,	'송추가마골인어반 강남점'	,	'서울 강남구 테헤란로 134 포스코타워 역삼 지하 1층'	,		'한식'	,	'http://www.kdfnews.com/news/thumbnail/202007/50834_34952_521_v150.jpg'	);																		

insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'스페셜치킨(뼈)'	,			'치킨메뉴(뼈)'	,	38000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'치킨뱅이(뼈)'	,			'치킨메뉴(뼈)'	,	29000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'양념반 간장반(뼈)'	,			'치킨메뉴(뼈)'	,	20000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'양념반 마늘반(뼈)'	,			'치킨메뉴(뼈)'	,	20000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'파닭반 마늘반(뼈)'	,			'치킨메뉴(뼈)'	,	20000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'후라이드반 파닭반(뼈)'	,			'치킨메뉴(뼈)'	,	19000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'후라이드반 마늘반(뼈)'	,			'치킨메뉴(뼈)'	,	19000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'반반치킨(뼈)'	,			'치킨메뉴(뼈)'	,	18000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'스페셜치킨(순살)'	,			'치킨메뉴(순살)'	,	38000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'치킨뱅이(순살)'	,			'치킨메뉴(순살)'	,	29000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'양념반 간장반(순살)'	,			'치킨메뉴(순살)'	,	20000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'양념반 마늘반(순살)'	,			'치킨메뉴(순살)'	,	20000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'파닭반 마늘반(순살)'	,			'치킨메뉴(순살)'	,	20000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'후라이드반 파닭반(순살)'	,			'치킨메뉴(순살)'	,	19000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'후라이드반 마늘반(순살)'	,			'치킨메뉴(순살)'	,	19000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'반반치킨(순살)'	,			'치킨메뉴(순살)'	,	18000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'골뱅이'	,			'안주메뉴'	,	19000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'과일'	,			'안주메뉴'	,	28000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'모듬소세지'	,			'안주메뉴'	,	18000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'두부김치'	,			'안주메뉴'	,	15000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			6	,	'모듬감자'	,			'안주메뉴'	,	15000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			7	,	'문어x치킨'	,			'대표메뉴'	,	33000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			7	,	'치킨공식 Special'	,			'대표메뉴'	,	38000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			7	,	'후라이드'	,			'대표메뉴'	,	18900			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price) values(seq_tb_menu_id.nextval,			7	,	'Pizza Pepperoni 18'	,			'대표메뉴'	,	29000			);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			8	,	'캘리포니아 클럽 피자'	,	'베이컨, 구운 닭가슴살, 토마토, 양상추, 아보카도를 올린 신선하고 건강한 피자'	,	'대표메뉴'	,	22900	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210104_40%2F1609746580034cIfCm_JPEG%2F6MiQZQdyRgTKw6_lon6jd1Yd.jfif.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			8	,	'살몬 컬리라이스 볼'	,	'연어 다이스, 아보카도, 컬리플라워 라이스, 핑크 파프리카 소스'	,	'대표메뉴'	,	14300	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210104_154%2F1609746727690UQlBu_JPEG%2FLqTrr413L3ZNzOS6kFOaRd2V.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			8	,	'포켓 화이타'	,	'치폴레 살사에 곁들여진 베이컨, 아보카도, 가지를 피타 브레드에 넣어 먹는 신선&상큼 메뉴'	,	'대표메뉴'	,	9900	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210104_144%2F1609746680076uH6pg_JPEG%2FzcJiz0L3F4JKaDuDigI2i5wt.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			8	,	'소이미트 크런치 볼'	,	'콩단백고기, 곤약쌀, 가지, 당근, 실란트로 페스토 드레싱을 곁들여 먹는 건강 비건 샐러드!'	,	'대표메뉴'	,	9900	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210104_111%2F16097467055737qITB_JPEG%2F7g1wFG2LMDLZOQo8Ldh_OTZt.jfif.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			8	,	'캘리포니아 선샤인'	,	"'SOLO : 8,900원 / DUET : 18,900원'
배리, 오렌지, 라임 등이 들어간 특별한 샹그리아'"	,	'대표메뉴'	,	8900	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210104_99%2F1609746868741qCj8n_JPEG%2Fa1HnvfgkOny5TCy2IcoKXlqa.jfif.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			9	,	'마르게리따'			,	'대표메뉴'	,	17000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200812_1%2F1597233029600yVwU7_JPEG%2F27183_menu_942267.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			9	,	'빼세파스타'			,	'대표메뉴'	,	19000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200812_241%2F15972330119642CAns_JPEG%2F27183_menu_942264.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			9	,	'리코타샐러드'			,	'대표메뉴'	,	14000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200812_67%2F1597233039133zJzfh_JPEG%2F27183_menu_942247.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			9	,	'핑크크림파스타'			,	'대표메뉴'	,	19000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200812_21%2F15972330297687tSnn_JPEG%2F27183_menu_942255.JPG'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			9	,	'카프레제'			,	'샐러드'	,	15000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210219_108%2F1613684687861goIBw_JPEG%2F%25BD%25BA%25C5%25B9_20210118_DHK%25B3%25BB%25BA%25CE_%25C4%25AB%25C7%25C1%25B7%25B9%25C1%25A6%25BB%25F8%25B7%25AF%25B5%25E5_Side02_1080x640_ODZO05.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			9	,	'스테이크 샐러드'			,	'샐러드'	,	19000	,	'https://search.pstatic.net/common/?autoRotate=true&amp;quality=95&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20200905_142%2F1599303229275o3Ikl_JPEG%2F%25BD%25BA%25C5%25B9_20200826_DHK%25BF%25DC%25BA%25CE_%25BD%25BA%25C5%25D7%25C0%25CC%25C5%25A9%25BB%25F8%25B7%25AF%25B5%25E5_Side03_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			10	,	'뚝배기갈비탕'	,	'오랜시간 끓여내 깊고 구수한 맛이 일품인 송추가마골 정통 갈비탕'	,	'대표메뉴'	,	11000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190522_140%2F1558504082009V1zi3_JPEG%2FEnsMz6xcGuaxwDRaqAwM-Mds.JPG.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			10	,	'송추갈비'	,	'송추가마골 인어반 대표 갈비메뉴'	,	'대표메뉴'	,	32000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190716_151%2F15632684425400XkTY_JPEG%2FAfkvQpmqhj5ojyT9p_5MbJu-.JPG.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			10	,	'한돈돼지구이'	,	'도톰한 육질에 정통갈비양념으로 달콤한 맛이 일품인 대표 돼지구이 메뉴'	,	'대표메뉴'	,	21000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190522_230%2F1558504103182vTfsE_JPEG%2Fp1DJJtMbaK8cLJXCXgNuivSG.JPG.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			10	,	'항흠 물냉면'	,	'갖은 재료를 넣어 우려낸 가마골만의 진한 육수가 일품인 시원한 물냉면'	,	'대표메뉴'	,	8000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190522_128%2F1558504128776qh0Rf_JPEG%2Ffq0AMqN-6BWu5hoaPWdF3UXt.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			10	,	'한우채끝등심'	,	'숙성시킨 한우등심으로 하얀 눈꽃같은 마블링이 일품인 한우메뉴'	,	'대표메뉴'	,	40000	,	'https://search.pstatic.net/common/?autoRotate=true&quality=95&type=f320_320&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20190529_128%2F1559121433111KzPHN_JPEG%2F1Hy55i4ylXGTSxVagPkiSGkz.JPG.jpg'	);																			




insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			19	,	'[압도적1위]로제찜닭'			,	'인기메뉴'	,	25800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%EB%A1%9C%EC%A0%9C%EC%B0%9C%EB%8B%AD_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			19	,	'[찜닭의정석] 한마리찜닭（까만／빨간）'			,	'인기메뉴'	,	21800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%ED%95%9C%EB%A7%88%EB%A6%AC%EC%B0%9C%EB%8B%AD-%EA%B9%8C%EB%A7%8C_%EB%B9%A8%EA%B0%84_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			19	,	'[거부할수없는] 치즈찜닭'			,	'인기메뉴'	,	24800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%EC%B9%98%EC%A6%88%EC%B0%9C%EB%8B%AD_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			19	,	'[칼칼한밥도둑] 묵은지찜닭'			,	'인기메뉴'	,	25800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%EB%AC%B5%EC%9D%80%EC%A7%80%EC%B0%9C%EB%8B%AD_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			19	,	'[가성비갑]까만／빨간찜닭두마리'			,	'인기메뉴'	,	33800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%EA%B0%80%EC%84%B1%EB%B9%84%EA%B0%91-%EA%B9%8C%EB%A7%8C_%EB%B9%A8%EA%B0%84%EC%B0%9C%EB%8B%AD%EB%91%90%EB%A7%88%EB%A6%AC_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			19	,	'로제닭발（무뼈）'			,	'인기메뉴'	,	21800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%EB%AC%B4%EB%BC%88-%EB%A1%9C%EC%A0%9C%EB%8B%AD%EB%B0%9C_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			20	,	'블랙알리오'	,	'깊고 진한 간장과 고소하면서 담백한 마늘의 만남! 치킨을 넘어 진정한 요리를 느낄 수 있는 푸라닭의 대표 메뉴'	,	'인기메뉴'	,	17900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2020-12-01/%EC%A0%9C%ED%9C%B4FR_20201130_%ED%91%B8%EB%9D%BC%EB%8B%AD_%EB%B8%94%EB%9E%99%EC%95%8C%EB%A6%AC%EC%98%A4_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			20	,	'고추마요 치킨'	,	'강력추천! 한 입 먹으면 계속 손이 갈 수 밖에 없는 마법의 치킨, 맵다, 부드럽다, 고소하다, 달콤하다, 새콤하다. 맛의 조합이 환상적인 강추메뉴'	,	'인기메뉴'	,	17900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2020-09-11/%EC%A0%9C%ED%9C%B4FR_20200910_%ED%91%B8%EB%9D%BC%EB%8B%AD_%EA%B3%A0%EC%B6%94%EB%A7%88%EC%9A%94%EC%B9%98%ED%82%A8_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			20	,	'푸라닭 치킨'	,	'오븐에 조리 후 후라이드하여 속은 촉촉하고 겉은 바삭한 푸라닭 오븐 후라이드 메뉴. 건강과 맛까지 생각한 오리지널 메뉴'	,	'인기메뉴'	,	15900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2019-04-03/%EC%A0%9C%ED%9C%B4fr_20190401_%ED%91%B8%EB%9D%BC%EB%8B%AD_%ED%91%B8%EB%9D%BC%EB%8B%AD%EC%B9%98%ED%82%A8-%EC%98%A4%EB%A6%AC%EC%A7%80%EB%82%A0_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			20	,	'블랙마요'	,	'깊고 진한 간장과 담백한 마늘이 어우러진 블랙알리오, 고소한 마요네즈와 매콤한 청고추의 조화로 탄생한 고추마요 치킨이 드디어 만났다! 푸라닭의 대표 치킨 메뉴를 한번에 즐길 수 있는 절호의 기회!'	,	'인기메뉴'	,	18900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2020-06-19/%EC%A0%9C%ED%9C%B4FR_20200619_%ED%91%B8%EB%9D%BC%EB%8B%AD_%EB%B8%94%EB%9E%99%EB%A7%88%EC%9A%94_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			20	,	'블랙투움바'	,	'깊고 진한 간장과 담백한 마늘이 어우러진 블랙알리오와 고소하고 매콤한 투움바 치킨의 절묘한 만남! 푸라닭의 인기 치킨메뉴 2종을 한번에 즐겨보세요'	,	'인기메뉴'	,	19900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2020-11-25/%EC%A0%9C%ED%9C%B4FR_20201119_%ED%91%B8%EB%9D%BC%EB%8B%AD_%EB%B8%94%EB%9E%99%ED%88%AC%EC%9B%80%EB%B0%94_1080x640.jpg'	);																			
insert into yeogiyo.menu(menu_id, res_id, menu_name, description, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			20	,	'블랙 윙콤보'	,	'한 번 맛보면 잊을 수 없는 푸라닭 베스트 메뉴! 깊고 진한 블랙소스와 바삭한 갈릭칩이 만나 입 안 가득 풍미를 선사합니다'	,	'인기메뉴'	,	19900	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%ED%91%B8%EB%9D%BC%EB%8B%AD/2020-12-31/%EC%A0%9C%ED%9C%B4FR_20201230_%ED%91%B8%EB%9D%BC%EB%8B%AD_%EB%B8%94%EB%9E%99%EC%9C%99%EC%BD%A4%EB%B3%B4_1080x640.jpg'	);																			insert into yeogiyo.menu(menu_id, res_id, menu_name, menu_category, price, menu_img) values(seq_tb_menu_id.nextval,			19	,	'[압도적1위]로제찜닭'			,	'인기메뉴'	,	25800	,	'https://images.deliveryhero.io/image/yogiyo/PARTNER_FR_IMG/%EB%91%90%EC%B0%9C/2021-03-03/%EC%A0%9C%ED%9C%B4FR_20210303_%EB%91%90%EC%B0%9C_%EB%A1%9C%EC%A0%9C%EC%B0%9C%EB%8B%AD_1080x640.jpg'	);																			






commit;

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

