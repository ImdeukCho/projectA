create table login
( userId varchar2(20) primary key,
  userPasswd varchar2(20) not null,
  userName varchar2(20) not null,
  gender varchar2(20) not null,
  birth date not null,
  phone varchar2(60),
  address varchar2(200) not null,
  email varchar2(60),
  profilePhoto varchar2(200),
  certificatePhoto varchar2(200),
  certificateData varchar2(200),
  hobby varchar2(200),
  cardName varchar2(20),
  cardNo  varchar2(30));
  

insert into login values ( 'id1' , '1234' , 'name1', '남자', '2000/01/01', '01012345678', '서울시', 'avcd@naver.com', '프로필img1.jpg', '자격증img1.jpg','자격증정보','디자인·영상·개발',null,null);
insert into login values ( 'id2' , '1234' , 'name2', '여자', '2000/01/01', '01012345678', '서울시', 'avcd@naver.com', '프로필img2.jpg', '자격증img2.jpg','자격증정보','외국어',null,null);
insert into login values ( 'id3' , '1234' , 'name3', '남자', '2000/01/01', '01012345678', '서울시', 'avcd@naver.com', '프로필img3.jpg', '자격증img3.jpg','자격증정보','재테크·투잡',null,null);
insert into login values ( 'id4' , '1234' , 'name4', '여자', '2000/01/01', '01012345678', '서울시', 'avcd@naver.com', '프로필img4.jpg', '자격증img4.jpg','자격증정보','댄스·뮤직',null,null);
insert into login values ( 'id5' , '1234' , 'name5', '남자', '2000/01/01', '01012345678', '서울시', 'avcd@naver.com', '프로필img5.jpg', '자격증img5.jpg','자격증정보','피트니스·스포츠',null,null);
insert into login values ( 'id6' , '1234' , 'name6', '여자', '2000/01/01', '01012345678', '서울시', 'avcd@naver.com', '프로필img6.jpg', '자격증img6.jpg','자격증정보','뷰티·마인드.펫',null,null);
insert into login values ( 'id7' , '1234' , 'name7', '남자', '2000/01/01', '01012345678', '서울시', 'avcd@naver.com', '프로필img7.jpg', '자격증img7.jpg','자격증정보','드로잉·사진·글',null,null);
insert into login values ( 'id8' , '1234' , 'name8', '남자', '2000/01/01', '01012345678', '서울시', 'avcd@naver.com', '프로필img8.jpg', '자격증img8.jpg','자격증정보','요리·공예·취미',null,null);
insert into login values ( 'id9' , '1234' , 'name8', '여자', '2000/01/01', '', '서울시', '', '', '','','','','');
commit;

ALTER TABLE LOGIN MODIFY birth VAR date;
DROP TABLE login;
select * from login order by userId asc;