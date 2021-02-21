--테이블 삭제
drop table users;

--시퀀스 삭제
drop sequence seq_users_no;

--테이블 생성
create table users(
    userNo number,
    id varchar2(50) not null UNIQUE,
    userName varchar2(100) not null,
    password varchar2(50) not null,
    joinDate Date not null,
    primary key(userNo)
    );
    
--시퀀스 생성
create sequence seq_users_no
Increment by 1
start with 1
NOCACHE;

delete from users
where userNo =3;

commit;


--테이블 삭제
drop table blog;

--테이블 생성
create table blog(
    id varchar2(50),
    blogTitle varchar2(200) not null,
    logoFile varchar2(200),
    primary key(id),
    CONSTRAINT FK_id
    foreign key(id)
    REFERENCES users(id)
    );
    
commit;
    

--테이블 삭제
drop table category;

--시퀀스 삭제
drop sequence seq_category_no;

--테이블 생성
create table category(
    cateNo number,
    id varchar2(50),
    cateName varchar2(200) not null,
    description varchar2(500),
    regDate date not null,
    primary key(cateNo),
    CONSTRAINT FK_cate_id
    foreign key(id)
    REFERENCES blog(id)
    );
    
--시퀀스 생성
create sequence seq_category_no
Increment by 1
start with 1
NOCACHE;

commit;


--테이블 삭제
drop table comments;

--시퀀스 삭제
drop sequence seq_comments_no;

--테이블 생성
create table comments(
    cmtNo number,
    postNo number,
    userNo number,
    cmtContent varchar2(1000),
    regDate date not null,
    primary key(cmtNo),
    CONSTRAINT FK_post_no
    foreign key(postNo)
    REFERENCES post(postNo),
    CONSTRAINT FK_user_no
    foreign key(userNo)
    REFERENCES users(userNo)
    );
    
--시퀀스 생성
create sequence seq_comments_no
Increment by 1
start with 1
NOCACHE;

commit;


--테이블 삭제
drop table post;

--시퀀스 삭제
drop sequence seq_post_no;

--테이블 생성
create table post(
    postNo number,
    cateNo number,
    postTitle varchar2(300) not null,
    postContent varchar2(4000),
    regDate date not null,
    primary key(postNo),
    CONSTRAINT FK_cate_no
    foreign key(cateNo)
    REFERENCES category(cateNo)
    );
    
--시퀀스 생성
create sequence seq_post_no
Increment by 1
start with 1
NOCACHE;

commit;
    

DELETE FROM users
           WHERE userno = 2;
           
