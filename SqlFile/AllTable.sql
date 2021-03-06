--------------------------------------------------------
--  督析戚 持失喫 - 鉢推析-7杉-07-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table USERNOTICEWRITE
--------------------------------------------------------

  CREATE TABLE "USERNOTICEWRITE" 
   (	"SEQUENCE" NUMBER DEFAULT NULL, 
	"NICKNAME" VARCHAR2(100), 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(4000), 
	"VIEWER" NUMBER DEFAULT 0, 
	"RECOMMEND" NUMBER DEFAULT 0, 
	"DISRECOMMEND" NUMBER DEFAULT 0, 
	"GOODSPHOTO" VARCHAR2(1000)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table TBL_MEMBER_AUTH
--------------------------------------------------------

  CREATE TABLE "TBL_MEMBER_AUTH" 
   (	"USERID" VARCHAR2(50), 
	"AUTH" VARCHAR2(50)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table TBL_MEMBER
--------------------------------------------------------

  CREATE TABLE "TBL_MEMBER" 
   (	"USERID" VARCHAR2(50), 
	"USERPW" VARCHAR2(100), 
	"USERNAME" VARCHAR2(100), 
	"REGDATE" VARCHAR2(20), 
	"UPDATEDATE" DATE DEFAULT sysdate, 
	"ENABLED" CHAR(1) DEFAULT 0, 
	"USEREMAIL" VARCHAR2(50), 
	"IP" VARCHAR2(16), 
	"NICKNAME" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table RES_CART
--------------------------------------------------------

  CREATE TABLE "RES_CART" 
   (	"NUM" NUMBER, 
	"USERID" VARCHAR2(100), 
	"GOODS" VARCHAR2(100), 
	"PRICE" VARCHAR2(100), 
	"GOODSPHOTO" VARCHAR2(2000), 
	"STARTDATE" DATE, 
	"LASTDATE" DATE, 
	"MANY" NUMBER DEFAULT 0, 
	"N_NUM" NUMBER DEFAULT 0, 
	"REGDATE" DATE DEFAULT sysdate, 
	"NICKNAME" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table RES_TABLE
--------------------------------------------------------

  CREATE TABLE "RES_TABLE" 
   (	"NUM" NUMBER, 
	"N_NUM" NUMBER, 
	"USERID" VARCHAR2(100), 
	"GOODS" VARCHAR2(2000), 
	"STATUS" NUMBER(1,0) DEFAULT 1, 
	"RESDATE" VARCHAR2(1000) DEFAULT sysdate, 
	"PRICE" NUMBER, 
	"GOODSPHOTO" VARCHAR2(3000), 
	"NICKNAME" VARCHAR2(100), 
	"STARTDATE" DATE, 
	"LASTDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table RESERVATION
--------------------------------------------------------

  CREATE TABLE "RESERVATION" 
   (	"NUM" NUMBER, 
	"USERID" VARCHAR2(1000), 
	"SELLER" VARCHAR2(100), 
	"BUYDATE" DATE DEFAULT sysdate, 
	"STATUS" NUMBER DEFAULT 0
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "REVIEW" 
   (	"NUM" NUMBER, 
	"TITLE" VARCHAR2(1000), 
	"CONTENT" VARCHAR2(4000), 
	"WRITER" VARCHAR2(1000), 
	"REGDATE" DATE DEFAULT sysdate, 
	"PHOTO" VARCHAR2(1000), 
	"NICKNAME" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table NOTICEREPLY
--------------------------------------------------------

  CREATE TABLE "NOTICEREPLY" 
   (	"NUM" NUMBER, 
	"N_NUM" NUMBER, 
	"USERID" VARCHAR2(100), 
	"COMM" VARCHAR2(2000), 
	"REGDATE" DATE DEFAULT sysdate, 
	"LIKES" NUMBER DEFAULT 0, 
	"HATES" NUMBER DEFAULT 0, 
	"NICKNAME" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table NOTICEWRITE
--------------------------------------------------------

  CREATE TABLE "NOTICEWRITE" 
   (	"SEQUENCE" NUMBER, 
	"USERID" VARCHAR2(100), 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(4000), 
	"VIEWER" NUMBER DEFAULT 0, 
	"RECOMMEND" NUMBER DEFAULT 0, 
	"DISRECOMMEND" NUMBER DEFAULT 0, 
	"NICKNAME" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table PERSISTENT_LOGINS
--------------------------------------------------------

  CREATE TABLE "PERSISTENT_LOGINS" 
   (	"USERNAME" VARCHAR2(64), 
	"SERIES" VARCHAR2(64), 
	"TOKEN" VARCHAR2(64), 
	"LAST_USED" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "PRODUCT" 
   (	"NUM" NUMBER, 
	"USERID" VARCHAR2(100), 
	"GOODS" VARCHAR2(100), 
	"CONTENT" VARCHAR2(3000), 
	"PRICE" VARCHAR2(100) DEFAULT 0, 
	"CATEGORY" VARCHAR2(100), 
	"GOODSPHOTO" VARCHAR2(2000), 
	"STATUS" CHAR(1) DEFAULT 1, 
	"NICKNAME" VARCHAR2(100), 
	"STARTDATE" DATE, 
	"LASTDATE" DATE, 
	"REGDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table QNA
--------------------------------------------------------

  CREATE TABLE "QNA" 
   (	"NUM" NUMBER, 
	"TITLE" VARCHAR2(150), 
	"WRITER" VARCHAR2(100), 
	"REGDATE" DATE, 
	"CONTENT" VARCHAR2(2000)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table INLOG
--------------------------------------------------------

  CREATE TABLE "INLOG" 
   (	"USERID" VARCHAR2(50), 
	"FAIL_COUNT" NUMBER DEFAULT 0, 
	"LOGIN_COUNT" NUMBER DEFAULT 0, 
	"FULLFAIL_COUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table IPBANLIST
--------------------------------------------------------

  CREATE TABLE "IPBANLIST" 
   (	"USERID" VARCHAR2(20), 
	"IP" VARCHAR2(20), 
	"BANDATE" DATE DEFAULT sysdate, 
	"ENABLED" CHAR(1) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table APPLY_USER
--------------------------------------------------------

  CREATE TABLE "APPLY_USER" 
   (	"NUM" NUMBER, 
	"USERNAME" VARCHAR2(100), 
	"USERID" VARCHAR2(100), 
	"USEREMAIL" VARCHAR2(100), 
	"ADDR" VARCHAR2(1000), 
	"APPLYDATE" DATE DEFAULT sysdate, 
	"PHONENUM" VARCHAR2(60), 
	"ENABLED" CHAR(1) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table AREPLY
--------------------------------------------------------

  CREATE TABLE "AREPLY" 
   (	"NUM" NUMBER, 
	"N_NUM" NUMBER, 
	"NICKNAME" VARCHAR2(100), 
	"COMM" VARCHAR2(2000), 
	"REGDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table CONTACTUS
--------------------------------------------------------

  CREATE TABLE "CONTACTUS" 
   (	"NUM" NUMBER, 
	"EMAIL" VARCHAR2(100), 
	"MESSAGE" VARCHAR2(3000), 
	"REGDATE" DATE DEFAULT sysdate, 
	"STATUS" CHAR(1) DEFAULT 0, 
	"TITLE" VARCHAR2(150)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Table COURSE
--------------------------------------------------------

  CREATE TABLE "COURSE" 
   (	"TITLE" VARCHAR2(100), 
	"NUM" NUMBER, 
	"CONTENT" CLOB, 
	"PHOTO" CLOB, 
	"REGDATE" DATE DEFAULT sysdate, 
	"PRICE" NUMBER, 
	"WRITER" VARCHAR2(100), 
	"PREVIEW" NUMBER DEFAULT 1, 
	"DAYS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)

����������������������������������������������������焼掘澗 砺戚鷺 鎧採 煽舌 切戟 ������������������������������������������
  TABLESPACE "USERS" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("PHOTO") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT))
REM INSERTING into USERNOTICEWRITE
SET DEFINE OFF;
Insert into USERNOTICEWRITE (SEQUENCE,NICKNAME,TITLE,CONTENT,VIEWER,RECOMMEND,DISRECOMMEND,GOODSPHOTO) values (2,'歯','砺什闘','<p>しじしけ</p>',59,0,0,'4ee78897-17f4-416f-afe4-d88cfba603c6_JAVA_Bean.jpg');
Insert into USERNOTICEWRITE (SEQUENCE,NICKNAME,TITLE,CONTENT,VIEWER,RECOMMEND,DISRECOMMEND,GOODSPHOTO) values (3,'拙精塘晦','砺什闘','<p>test</p>',68,19,5,'582599a5-9771-44e0-a768-f50a2b875067_Jamaican Blue.jpg');
REM INSERTING into TBL_MEMBER_AUTH
SET DEFINE OFF;
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('user0','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('althsuwpfl','ROLE_ADMIN');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('aaaaa','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('althsuwpfls','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('sdsfs','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('tss','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('iptest','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('asdadsd','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('saddas','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('asdad','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('adsadada','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('daafafafaf','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('asdadad','ROLE_USER');
Insert into TBL_MEMBER_AUTH (USERID,AUTH) values ('eun960411','ROLE_USER');
REM INSERTING into TBL_MEMBER
SET DEFINE OFF;
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('user0','$2a$10$GDy.bHVUFT0eQS68T6BYKeHb9drh1TnfEpiAzqy7yIZVeQkJH43/.','析鋼紫遂切','20/05/27',to_date('20/06/26','RR/MM/DD'),'1','abc@naver.com','127.0.0.2','歯');
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('sdsfs','$2a$10$vim3mt35Tor6tzWSGtdxmefXC/X9Aeb1B6xU3ouL54XCGUxU6P.l2','析鋼紫遂切','20/05/31',to_date('20/05/31','RR/MM/DD'),'0','sdsd@naver.com','127.0.0.3',null);
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('aaaaa','$2a$10$90CpF6pFTM5lNRWX31.Wxen5hd0N2la.Q/aIfpZUoImpRjI7VzBoS','析鋼紫遂切','20/05/31',to_date('20/05/31','RR/MM/DD'),'1','asd@a.s','127.0.0.4',null);
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('althsuwpfls','$2a$10$3d5bvDQxRdUQzWBo/XBlveOUpNklfnfemCJOIenFp88szY5avMZbG','析鋼紫遂切','20/06/02',to_date('20/06/02','RR/MM/DD'),'1','althsuwpfl@gmail.com','127.0.0.5','塘晦');
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('tss','$2a$10$OjjKTqraQIu1WnyMOxFpve5EeYo4koO7pULW.BFyAiULw7sXrOC9K','析鋼紫遂切','20/06/23',to_date('20/06/23','RR/MM/DD'),'1','tss@gmail.com','127.0.0.1',null);
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('althsuwpfl','$2a$10$C5m/r5mRHzSzCvLNT/0RgeiT..8Jgl.xp1Ma0xyCismUD7DvfxJT2','淫軒切','20/05/27',to_date('20/05/23','RR/MM/DD'),'1','althsuwpfl@naver.com','127.0.0.6','淫軒');
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('saddas','$2a$10$CmSvIR.i1m95zFSsYAgBXedmZYfUdH669yZDpKTGiNtCKYg9n3EBK','析鋼紫遂切','20/06/23',to_date('20/06/23','RR/MM/DD'),'1','adsadasd@gmail.com','127.0.0.1',null);
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('iptest','$2a$10$2IiM3SbFDbzD6JIY8ZeJyeMNBDm3pnq07glkFp41b6P8ALCIvFi6q','析鋼紫遂切','20/06/18',to_date('20/06/18','RR/MM/DD'),'1','alal@naver.com','127.0.0.1',null);
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('asdadsd','$2a$10$SeKjxisoK7fQvNJ/IZBn/eoF9BzWw7mJuJv6jVkPfc2bYG7dUvTHm','析鋼紫遂切','20/06/23',to_date('20/06/23','RR/MM/DD'),'0','asdas@naver.com','127.0.0.1',null);
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('asdad','$2a$10$I4AHPVK4AwIepO3kVWBXcO8w0zwyLo7qw06rnT2NWgOUhI7/MXeQe','析鋼紫遂切','20/06/23',to_date('20/06/23','RR/MM/DD'),'0','sadd@naver.com','127.0.0.1',null);
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('adsadada','$2a$10$afBoYU4F7Jzo0RDMKFWvl.jMaQQmnIAdmUtpC6UTjScck5MtdiMca','析鋼紫遂切','20/06/23',to_date('20/06/23','RR/MM/DD'),'1','asasdasd@gmail.com','127.0.0.1',null);
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('daafafafaf','$2a$10$GViqF26A7WX4iPzUXa/e5eLkXEkC/TZdUI0jZF6UTWdalKinSFsPG','析鋼紫遂切','20/06/23',to_date('20/06/23','RR/MM/DD'),'0','asdnas@naver.com','127.0.0.1',null);
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('asdadad','$2a$10$eXX3yqQU3ye2e2IVjQo5Pee.hlr1RRsHw/EJYfQ4XrVFjzEiQnTF.','析鋼紫遂切','20/06/27',to_date('20/06/27','RR/MM/DD'),'1','sadads@naver.com','127.0.0.1','拙精塘晦');
Insert into TBL_MEMBER (USERID,USERPW,USERNAME,REGDATE,UPDATEDATE,ENABLED,USEREMAIL,IP,NICKNAME) values ('eun960411','$2a$10$zHxeJjjrMnY4wvrBkpf09e0vD7DZcdOCRbSpcnXBJqzzvZluyGHyW','析鋼紫遂切','20/07/06',to_date('20/07/06','RR/MM/DD'),'0','anaksld@naver.com','127.0.0.1','森精');
REM INSERTING into RES_CART
SET DEFINE OFF;
REM INSERTING into RES_TABLE
SET DEFINE OFF;
REM INSERTING into RESERVATION
SET DEFINE OFF;
REM INSERTING into REVIEW
SET DEFINE OFF;
Insert into REVIEW (NUM,TITLE,CONTENT,WRITER,REGDATE,PHOTO,NICKNAME) values (11,'砺什闘脊艦陥.','<p>いし</p>','alth',to_date('20/06/02','RR/MM/DD'),'9004426a-0_JAVA_Bean.jpg',null);
Insert into REVIEW (NUM,TITLE,CONTENT,WRITER,REGDATE,PHOTO,NICKNAME) values (12,'政煽砺什闘','<p>砺什闘鎧遂戚拭推.</p><p>&nbsp;</p><p>戚 紫遭精..?</p>','user0',to_date('20/06/02','RR/MM/DD'),'ea6805ef-0_loginbg.jpg',null);
Insert into REVIEW (NUM,TITLE,CONTENT,WRITER,REGDATE,PHOTO,NICKNAME) values (21,'砺什闘脊艦陥.','<p>12313</p>','althsuwpfls',to_date('20/06/05','RR/MM/DD'),'0c43e583-4_JAVA_Bean.jpg',null);
Insert into REVIEW (NUM,TITLE,CONTENT,WRITER,REGDATE,PHOTO,NICKNAME) values (22,'砺什闘脊艦陥.','<p>213</p>','althsuwpfls',to_date('20/06/05','RR/MM/DD'),'b3a193ba-c_JAVA_Bean.jpg',null);
Insert into REVIEW (NUM,TITLE,CONTENT,WRITER,REGDATE,PHOTO,NICKNAME) values (41,'砺什闘 莞革績','<p>莞革績 砺什闘</p>','拙精塘晦',to_date('20/06/27','RR/MM/DD'),'af8beddd-2_loginbg.jpg',null);
Insert into REVIEW (NUM,TITLE,CONTENT,WRITER,REGDATE,PHOTO,NICKNAME) values (46,'楳差廃 獣娃戚心柔艦陥.','<p>ぞぞぞぞ</p>','eun960411',to_date('20/07/02','RR/MM/DD'),'67eee972-d_shiroyama.webp',null);
Insert into REVIEW (NUM,TITLE,CONTENT,WRITER,REGDATE,PHOTO,NICKNAME) values (43,'格巷疏紹嬢推','<p>旋駅蓄探脊艦陥</p>','eun960411',to_date('20/07/02','RR/MM/DD'),'b58b83ad-c_5.jpg',null);
Insert into REVIEW (NUM,TITLE,CONTENT,WRITER,REGDATE,PHOTO,NICKNAME) values (44,'陥獣神壱 粛嬢推','<p>情薦暁神蟹・</p>','eun960411',to_date('20/07/02','RR/MM/DD'),'638a054b-e_6.jpg',null);
REM INSERTING into NOTICEREPLY
SET DEFINE OFF;
Insert into NOTICEREPLY (NUM,N_NUM,USERID,COMM,REGDATE,LIKES,HATES,NICKNAME) values (12,10,'althsuwpfl','奇越 砺什闘 2 脊艦陥.',to_date('20/06/01','RR/MM/DD'),31,13,null);
Insert into NOTICEREPLY (NUM,N_NUM,USERID,COMM,REGDATE,LIKES,HATES,NICKNAME) values (13,10,'user0','照括. USER脊艦陥.',to_date('20/06/01','RR/MM/DD'),22,11,null);
Insert into NOTICEREPLY (NUM,N_NUM,USERID,COMM,REGDATE,LIKES,HATES,NICKNAME) values (15,21,'althsuwpfl','!? 舛源?',to_date('20/06/01','RR/MM/DD'),7,2,null);
Insert into NOTICEREPLY (NUM,N_NUM,USERID,COMM,REGDATE,LIKES,HATES,NICKNAME) values (16,21,'althsuwpfl','叔奄澗 情薦劃',to_date('20/06/01','RR/MM/DD'),1,2,null);
Insert into NOTICEREPLY (NUM,N_NUM,USERID,COMM,REGDATE,LIKES,HATES,NICKNAME) values (68,21,'asdadad','<p>砺什闘</p>',to_date('20/06/27','RR/MM/DD'),3,1,'拙精塘晦');
Insert into NOTICEREPLY (NUM,N_NUM,USERID,COMM,REGDATE,LIKES,HATES,NICKNAME) values (79,22,'user0','test',to_date('20/07/03','RR/MM/DD'),3,3,'歯');
Insert into NOTICEREPLY (NUM,N_NUM,USERID,COMM,REGDATE,LIKES,HATES,NICKNAME) values (21,22,'althsuwpfls','asdsa',to_date('20/06/03','RR/MM/DD'),4,3,'塘晦');
REM INSERTING into NOTICEWRITE
SET DEFINE OFF;
Insert into NOTICEWRITE (SEQUENCE,USERID,TITLE,CONTENT,VIEWER,RECOMMEND,DISRECOMMEND,NICKNAME) values (21,'althsuwpfl','蓄亜 因走紫牌','<p>06杉 21析 至穣奄紫 獣蝿 析舛</p>',135,6,1,'淫軒切');
Insert into NOTICEWRITE (SEQUENCE,USERID,TITLE,CONTENT,VIEWER,RECOMMEND,DISRECOMMEND,NICKNAME) values (22,'althsuwpfl','砺什闘脊艦陥.','<p>te</p>',611,6,4,'淫軒切');
REM INSERTING into PERSISTENT_LOGINS
SET DEFINE OFF;
Insert into PERSISTENT_LOGINS (USERNAME,SERIES,TOKEN,LAST_USED) values ('asdadad','e5D068nrlnamAXLtAgPmRw==','nX6g3i+26Th01HuRJ1wWqA==',to_timestamp('20/06/27 17:40:29.149000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into PERSISTENT_LOGINS (USERNAME,SERIES,TOKEN,LAST_USED) values ('althsuwpfls','r3kUHc3Kw6Ln/H0hEZ9ZoA==','9jE1EWPZbsjKqF8wpv6ynQ==',to_timestamp('20/07/07 18:54:19.706000000','RR/MM/DD HH24:MI:SSXFF'));
REM INSERTING into PRODUCT
SET DEFINE OFF;
Insert into PRODUCT (NUM,USERID,GOODS,CONTENT,PRICE,CATEGORY,GOODSPHOTO,STATUS,NICKNAME,STARTDATE,LASTDATE,REGDATE) values (32,'eun960411','什賭繊遁縦什鳶銅','<p>段井勲税 動動馬壱 舘舘廃 覗傾績, 神牽厳引鎧軒厳 乞砧拭辞</p><p>''繕曽失引 輩級元戚 狽雌吉 箭企稽 板噺馬走 省聖 郊戚滴脊艦陥.''</p>','1500','切穿暗','a4c3bda1-815f-4133-846a-b49c0f581347_4.png','1','森精',to_date('20/07/08','RR/MM/DD'),to_date('20/07/31','RR/MM/DD'),to_date('20/07/06','RR/MM/DD'));
Insert into PRODUCT (NUM,USERID,GOODS,CONTENT,PRICE,CATEGORY,GOODSPHOTO,STATUS,NICKNAME,STARTDATE,LASTDATE,REGDATE) values (33,'eun960411','切戚情闘 珍度闘 SL 1','<p>井戦径 握秩 稽球 遁匂胡什研 是馬食</p><p>''虞戚希級戚 採球君錘 虞戚漁聖 井蝿拝 呪 赤惟 背掃艦陥.''</p>','50000','切穿暗','b3112879-64e7-4f33-a4c8-d7428e2da7d1_5.png','1','森精',to_date('20/07/09','RR/MM/DD'),to_date('20/07/31','RR/MM/DD'),to_date('20/07/06','RR/MM/DD'));
Insert into PRODUCT (NUM,USERID,GOODS,CONTENT,PRICE,CATEGORY,GOODSPHOTO,STATUS,NICKNAME,STARTDATE,LASTDATE,REGDATE) values (34,'eun960411','TALON 27.5 0','<p>穿搭旋昔 馬球砺析税 巨切昔! 亜梱錘 ALUCXX 硝欠耕棺 覗傾績拭</p><p>切戚情闘税 舶重旋昔 27.5昔帖 蕃 砺滴且君走亜 希背閃 什匂苧人</p><p>傾閃研 荘奄澗 虞戚希級聖 是廃 刃混廃 繕杯聖 戚件蛎柔艦陥.</p>','70000','切穿暗','6389a3b6-0ce6-48fa-b205-483234c85602_6.png','1','剰精',to_date('20/07/15','RR/MM/DD'),to_date('20/08/21','RR/MM/DD'),to_date('20/07/06','RR/MM/DD'));
Insert into PRODUCT (NUM,USERID,GOODS,CONTENT,PRICE,CATEGORY,GOODSPHOTO,STATUS,NICKNAME,STARTDATE,LASTDATE,REGDATE) values (35,'eun960411','SCR2 PLUS','<p>奄糎税 SCR2 左陥 廃去厭 是税</p><p>硝決什SL 去厭税 硝欠耕棺 覗傾績生稽 姥失鞠嬢 左陥</p><p>狽雌吉 井勲 失管生稽 井呈廃 虞戚漁聖 荘奄叔 呪 赤柔艦陥.</p>','5500','切穿暗','f143a7c1-1d93-4f8c-bf76-38a046272c38_7.png','1','森精',to_date('20/07/08','RR/MM/DD'),to_date('20/07/31','RR/MM/DD'),to_date('20/07/06','RR/MM/DD'));
Insert into PRODUCT (NUM,USERID,GOODS,CONTENT,PRICE,CATEGORY,GOODSPHOTO,STATUS,NICKNAME,STARTDATE,LASTDATE,REGDATE) values (38,'eun960411','朝沙 TCR ADVANCED 2','<p>置旋税 爽楳失管 豪訓什研 達焼鎧陥</p><p>''遁匂胡什 朝沙 稽球 郊戚滴''</p>','2000','切穿暗','003a129c-53cd-405e-863b-783a58cf0853_3.png','1','森精',to_date('20/07/08','RR/MM/DD'),to_date('20/07/31','RR/MM/DD'),to_date('20/07/06','RR/MM/DD'));
Insert into PRODUCT (NUM,USERID,GOODS,CONTENT,PRICE,CATEGORY,GOODSPHOTO,STATUS,NICKNAME,STARTDATE,LASTDATE,REGDATE) values (39,'eun960411','什凪屡虞戚綜球 穿奄切穿暗 29昔帖','<p>亜舌 遭鉢吉 eMTB 覗傾績引 乞斗 貢 壕斗軒 奄綬</p><p>''置歎舘 M5 硝稽戚 歯獣人 薄糎馬澗 亜舌 採球郡壱 悪径廃 乞斗''</p>','6000','切穿暗','bf3a036e-ba2a-4ed2-8405-b1b5ab3dc7ee_2.png','1','森精',to_date('20/07/09','RR/MM/DD'),to_date('20/07/31','RR/MM/DD'),to_date('20/07/06','RR/MM/DD'));
REM INSERTING into QNA
SET DEFINE OFF;
Insert into QNA (NUM,TITLE,WRITER,REGDATE,CONTENT) values (21,'噺据 亜脊拭 企馬食','althsuwpfl',to_date('20/06/26','RR/MM/DD'),'<p>噺据 亜脊精 焼戚巨, 戚五析, 搾腔腰硲税 溌昔聖 暗団 &nbsp;亜脊聖 遭楳杯艦陥.</p><p>&nbsp;</p><p>焼戚巨, 戚五析精 切疑生稽 掻差溌昔聖 遭楳 馬悟, &nbsp;陥献 庚薦亜 持医聖 井酔拭 1:1 庚税研 背 爽獣掩 郊遇艦陥.</p><p>&nbsp;</p><p>姶紫杯艦陥.</p>');
Insert into QNA (NUM,TITLE,WRITER,REGDATE,CONTENT) values (22,'切穿暗税 推榎 貢 兄纏 号狛拭 淫馬食','althsuwpfl',to_date('20/06/26','RR/MM/DD'),'<p>切穿暗税 兄纏 榎衝拭 企廃 切室廃 紫牌精 <a href="https://localhost:8443/about">戚遂照鎧</a>研 戚遂背 爽獣掩 郊遇艦陥.</p><p>兄纏 号狛精 1:1庚税 貢 企食 亜管 廃 切穿暗 鯉系聖 左壱, 雌室 鎧遂拭辞 森鉦獄動聖 喚君爽獣檎 桔艦陥.</p><p>&nbsp;</p><p>姶紫杯艦陥.</p>');
REM INSERTING into INLOG
SET DEFINE OFF;
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('aaaaa',2,0,0);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('althsuwpfls',0,512,9);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('sdsfs',0,0,0);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('tss',0,30,0);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('saddas',0,0,0);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('iptest',0,3,0);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('asdad',0,0,0);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('adsadada',0,0,0);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('daafafafaf',0,0,0);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('asdadad',0,15,0);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('althsuwpfl',0,917,42);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('user0',0,506,8);
Insert into INLOG (USERID,FAIL_COUNT,LOGIN_COUNT,FULLFAIL_COUNT) values ('eun960411',0,0,0);
REM INSERTING into IPBANLIST
SET DEFINE OFF;
Insert into IPBANLIST (USERID,IP,BANDATE,ENABLED) values ('iptest','127.0.0.1',to_date('20/06/21','RR/MM/DD'),'0');
REM INSERTING into APPLY_USER
SET DEFINE OFF;
Insert into APPLY_USER (NUM,USERNAME,USERID,USEREMAIL,ADDR,APPLYDATE,PHONENUM,ENABLED) values (2,'塘晦','althsuwpfls','althsuwpfl@gmail.com','asad',to_date('20/06/27','RR/MM/DD'),'131-3123-2424','0');
REM INSERTING into AREPLY
SET DEFINE OFF;
Insert into AREPLY (NUM,N_NUM,NICKNAME,COMM,REGDATE) values (3,2,'拙精塘晦','砺什闘2',to_date('20/07/07','RR/MM/DD'));
Insert into AREPLY (NUM,N_NUM,NICKNAME,COMM,REGDATE) values (4,2,'拙精塘晦','さささ',to_date('20/07/07','RR/MM/DD'));
Insert into AREPLY (NUM,N_NUM,NICKNAME,COMM,REGDATE) values (5,2,'拙精塘晦','testa',to_date('20/07/07','RR/MM/DD'));
REM INSERTING into CONTACTUS
SET DEFINE OFF;
Insert into CONTACTUS (NUM,EMAIL,MESSAGE,REGDATE,STATUS,TITLE) values (3,'althsuwpfl@gmail.com','asdasd',to_date('20/05/31','RR/MM/DD'),'0','砺什闘');
Insert into CONTACTUS (NUM,EMAIL,MESSAGE,REGDATE,STATUS,TITLE) values (4,'althsuwpfl@gmail.com','rte',to_date('20/06/01','RR/MM/DD'),'0','砺什闘脊艦陥.');
Insert into CONTACTUS (NUM,EMAIL,MESSAGE,REGDATE,STATUS,TITLE) values (21,'althsuwpfl@gmail.com','asd',to_date('20/06/05','RR/MM/DD'),'0','砺什闘脊艦陥.');
Insert into CONTACTUS (NUM,EMAIL,MESSAGE,REGDATE,STATUS,TITLE) values (41,'athsu@naver.com','刊た崇艦崇刊�藝愍噺兇喊豸挟�焼び',to_date('20/06/26','RR/MM/DD'),'1','照括? 淫軒切?');
Insert into CONTACTUS (NUM,EMAIL,MESSAGE,REGDATE,STATUS,TITLE) values (2,'althsuwpfl@gmail.com','砺什闘 五析 脊艦陥.',to_date('20/05/30','RR/MM/DD'),'0','舛源 砺什闘');
REM INSERTING into COURSE
SET DEFINE OFF;
Insert into COURSE (TITLE,NUM,REGDATE,PRICE,WRITER,PREVIEW,DAYS) values ('歯稽錘 切穿煽燈嬢',7,to_date('20/07/06','RR/MM/DD'),6000,'淫軒切',2,2);
Insert into COURSE (TITLE,NUM,REGDATE,PRICE,WRITER,PREVIEW,DAYS) values ('薦爽亀 燈嬢',8,to_date('20/07/06','RR/MM/DD'),15000,'淫軒切',2,10);
Insert into COURSE (TITLE,NUM,REGDATE,PRICE,WRITER,PREVIEW,DAYS) values ('焼硯燈嬢',3,to_date('20/07/06','RR/MM/DD'),6000,'淫軒切',5,1);
Insert into COURSE (TITLE,NUM,REGDATE,PRICE,WRITER,PREVIEW,DAYS) values ('析窒 切穿暗燈嬢',4,to_date('20/07/06','RR/MM/DD'),50000,'淫軒切',3,2);
Insert into COURSE (TITLE,NUM,REGDATE,PRICE,WRITER,PREVIEW,DAYS) values ('背痕燈嬢',5,to_date('20/07/06','RR/MM/DD'),70000,'淫軒切',5,5);
Insert into COURSE (TITLE,NUM,REGDATE,PRICE,WRITER,PREVIEW,DAYS) values ('言増燈嬢人 敗臆',9,to_date('20/07/06','RR/MM/DD'),70000,'淫軒切',5,2);
��������������������������������������������������������������������������������������������������������������������������������

����������������������������������������������焼掘採斗 PK, FK, Unique key����������������������������������������������������
--------------------------------------------------------
--  DDL for Index USERNOTICEWRITE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERNOTICEWRITE_PK" ON "USERNOTICEWRITE" ("NICKNAME", "SEQUENCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index USERNOTICEWRITE_PK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERNOTICEWRITE_PK1" ON "USERNOTICEWRITE" ("SEQUENCE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index TBL_MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TBL_MEMBER_PK" ON "TBL_MEMBER" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL
--------------------------------------------------------
--  DDL for Index NICKNAME_QE
--------------------------------------------------------

  CREATE UNIQUE INDEX "NICKNAME_QE" ON "TBL_MEMBER" ("NICKNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index RES_CART_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RES_CART_PK" ON "RES_CART" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index RES_TABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RES_TABLE_PK" ON "RES_TABLE" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index RESERVATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RESERVATION_PK" ON "RESERVATION" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index REVIEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REVIEW_PK" ON "REVIEW" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index REVIEW_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "REVIEW_UK1" ON "REVIEW" ("NICKNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index NOTICEREPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NOTICEREPLY_PK" ON "NOTICEREPLY" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index NOTICEWRITE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NOTICEWRITE_PK" ON "NOTICEWRITE" ("SEQUENCE", "USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index PERSISTENT_LOGINS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSISTENT_LOGINS_PK" ON "PERSISTENT_LOGINS" ("SERIES") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index PRODUCT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PRODUCT_PK" ON "PRODUCT" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index QNA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QNA_PK" ON "QNA" ("NUM", "WRITER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
  PARALLEL
--------------------------------------------------------
--  DDL for Index INLOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "INLOG_PK" ON "INLOG" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index IPBANLIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IPBANLIST_PK" ON "IPBANLIST" ("USERID", "IP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index APPLY_USER_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "APPLY_USER_UK1" ON "APPLY_USER" ("USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index APPLY_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "APPLY_USER_PK" ON "APPLY_USER" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TABLE1_PK" ON "AREPLY" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index CONTACTUS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CONTACTUS_PK" ON "CONTACTUS" ("NUM", "EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  DDL for Index COURSE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COURSE_PK" ON "COURSE" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"
--------------------------------------------------------
--  Constraints for Table USERNOTICEWRITE
--------------------------------------------------------

�����������������������������������Ｅ彑椋� 痕井 紫牌 ����������������������������������������������������������������
  ALTER TABLE "USERNOTICEWRITE" MODIFY ("SEQUENCE" NOT NULL ENABLE)
 
  ALTER TABLE "USERNOTICEWRITE" MODIFY ("NICKNAME" NOT NULL ENABLE)
 
  ALTER TABLE "USERNOTICEWRITE" MODIFY ("TITLE" NOT NULL ENABLE)
 
  ALTER TABLE "USERNOTICEWRITE" MODIFY ("CONTENT" NOT NULL ENABLE)
 
  ALTER TABLE "USERNOTICEWRITE" MODIFY ("VIEWER" NOT NULL ENABLE)
 
  ALTER TABLE "USERNOTICEWRITE" MODIFY ("RECOMMEND" NOT NULL ENABLE)
 
  ALTER TABLE "USERNOTICEWRITE" MODIFY ("DISRECOMMEND" NOT NULL ENABLE)
 
  ALTER TABLE "USERNOTICEWRITE" ADD CONSTRAINT "USERNOTICEWRITE_PK" PRIMARY KEY ("SEQUENCE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
