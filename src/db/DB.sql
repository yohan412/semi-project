

CREATE SEQUENCE USER_NOSQ NOCACHE;

CREATE TABLE USER_INFO(
	USER_NO NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(500) UNIQUE,
	USER_PW VARCHAR2(500) NOT NULL,
	USER_NAME VARCHAR2(500) NOT NULL,
	USER_GENDER VARCHAR2(2) CHECK(USER_GENDER IN('F','M') ),
	USER_BIRTHDATE VARCHAR2(500) NOT NULL,
	USER_EMAIL VARCHAR2(200) UNIQUE,
	USER_PHONE VARCHAR2(20) NOT NULL,
	USER_ZIP VARCHAR2(20) NOT NULL,
	USER_ADDR VARCHAR2(1000) NOT NULL,
	USER_ROLE VARCHAR2(50) NOT NULL,
	USER_REG DATE NOT NULL,
	USER_ENABLED VARCHAR2(2) DEFAULT 'N' CHECK(USER_ENABLED IN('Y','N')),
	USER_WISH VARCHAR2(1000)
);

SELECT * FROM USER_INFO;

CREATE SEQUENCE CENTER_NOSQ NOCACHE;

CREATE TABLE CENTER(
	CENTER_NO NUMBER PRIMARY KEY,
	CENTER_NAME VARCHAR2(500) NOT NULL,
	CENTER_ADDR VARCHAR2(1000) NOT NULL,
	CENTER_PRICE VARCHAR2(100) NOT NULL,
	CENTER_CATEGORY VARCHAR2(40) NOT NULL,
	CENTER_GRADE NUMBER,
	CENTER_CONTENT VARCHAR2(1000) NOT NULL,
	CENTER_REG DATE NOT NULL
);


CREATE SEQUENCE REVIEW_NOSQ NOCACHE;

CREATE TABLE REVIEW(
	REVIEW_NO NUMBER PRIMARY KEY,
	CENTER_NO NUMBER NOT NULL,
	REVIEW_WRITER VARCHAR2(50) NOT NULL,
	REVIEW_GRADE NUMBER NOT NULL,
	REVIEW_CONTENT VARCHAR2(4000) NOT NULL,
	REVIEW_REG DATE NOT NULL,
	CONSTRAINT FK_CENTER_NO FOREIGN KEY(CENTER_NO) REFERENCES CENTER(CENTER_NO)
);



CREATE SEQUENCE ASK_NOSQ NOCACHE;
CREATE SEQUENCE ASK_GPNOSQ NOCACHE;

CREATE TABLE ASK(
	ASK_NO NUMBER PRIMARY KEY,
	CENTER_NO NUMBER NOT NULL,
	ASK_GPNO NUMBER NOT NULL,
	ASK_GPSQ NUMBER NOT NULL,
	USER_ID VARCHAR2(500) NOT NULL,
	ASK_CONTENT VARCHAR2(4000) NOT NULL,
	ASK_REG DATE NOT NULL,
	ASK_STATUS VARCHAR2(2) DEFAULT 'N' CHECK(ASK_STATUS IN('Y','N')),
	CONSTRAINT FK_CENTER_NO2 FOREIGN KEY(CENTER_NO) REFERENCES CENTER(CENTER_NO),
	CONSTRAINT FK_USER_ID FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID)
);



CREATE SEQUENCE USED_NOSQ NOCACHE;

CREATE TABLE USED_BOARD(
	USED_NO NUMBER PRIMARY KEY,
	USED_TITLE VARCHAR2(500) NOT NULL,
	USER_ID VARCHAR2(500) NOT NULL,
	USER_NO NUMBER NOT NULL,
	USED_ADDR VARCHAR2(1000) NOT NULL,
	USED_PRICE VARCHAR2(100) NOT NULL,
	USED_CATEGORY VARCHAR2(500) NOT NULL,
	USED_CENTER_NM VARCHAR2(500) NOT NULL,
	USED_CONTENT VARCHAR2(4000) NOT NULL,
	USED_REG DATE NOT NULL,
	USED_STATUS VARCHAR2(2) DEFAULT 'N' CHECK(USED_STATUS IN('Y','N')),
	CONSTRAINT FK_USER_ID2 FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID),
	CONSTRAINT FK_USER_NO FOREIGN KEY(USER_NO) REFERENCES USER_INFO(USER_NO)
);


CREATE SEQUENCE QA_NOSQ NOCACHE;
CREATE SEQUENCE QA_GPNOSQ NOCACHE;

CREATE TABLE QNA(
	QA_NO NUMBER PRIMARY KEY,
	QA_GPNO NUMBER NOT NULL,
	QA_GPSQ NUMBER NOT NULL,
	USER_ID VARCHAR2(500) NOT NULL,
	USER_NO NUMBER NOT NULL,
	QA_TYPE VARCHAR2(50) NOT NULL,
	QA_TITLE VARCHAR2(50) NOT NULL,
	QA_CONTENT VARCHAR2(4000) NOT NULL,
	QA_FAQ VARCHAR2(2) DEFAULT 'N' CHECK(QA_FAQ IN('Y','N')),
	QA_REG DATE NOT NULL,
	QA_STATUS VARCHAR2(2) DEFAULT 'N' CHECK(QA_STATUS IN('Y','N')),
	CONSTRAINT FK_USER_ID3 FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID),
	CONSTRAINT FK_USER_NO2 FOREIGN KEY(USER_NO) REFERENCES USER_INFO(USER_NO)
);



CREATE SEQUENCE USK_NOSQ NOCACHE;
CREATE SEQUENCE USK_GPNOSQ NOCACHE;

CREATE TABLE USED_ASK(
	USK_NO NUMBER PRIMARY KEY,
	USED_NO NUMBER NOT NULL,
	USK_TYPE VARCHAR2(50) NOT NULL,
	USK_GPNO NUMBER NOT NULL,
	USK_GPSQ NUMBER NOT NULL,
	USER_ID VARCHAR2(500) NOT NULL,
	USK_TITLE VARCHAR2(50) NOT NULL,
	USK_CONTENT VARCHAR2(4000) NOT NULL,
	USK_REG DATE NOT NULL,
	USK_STATUS VARCHAR2(2) DEFAULT 'N' CHECK(USK_STATUS IN('Y','N')),
	CONSTRAINT FK_USED_NO FOREIGN KEY(USED_NO) REFERENCES USED_BOARD(USED_NO),
	CONSTRAINT FK_USER_ID4 FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID)
);



CREATE SEQUENCE BIZ_NOSQ NOCACHE;

CREATE TABLE BUSINESS(
	BIZ_NO NUMBER PRIMARY KEY,
	USER_NO NUMBER NOT NULL,
	USER_NAME VARCHAR2(500) NOT NULL,
	BIZ_NAME VARCHAR2(500) NOT NULL,
	BIZ_ADDR VARCHAR2(2000) NOT NULL,
	BIZ_CATEGORY VARCHAR2(50) NOT NULL,
	BIZ_PRICE VARCHAR2(100) NOT NULL,
	BIZ_CONTENT VARCHAR2(4000) NOT NULL,
	BIZ_PIC VARCHAR2(2000)
	CONSTRAINT FK_USER_NO3 FOREIGN KEY(USER_NO) REFERENCES USER_INFO(USER_NO)
);

CREATE TABLE CENTER_PIC(
	CENTER_NO NUMBER NOT NULL,
	PIC_NAME VARCHAR2(500) NOT NULL,
	PIC_PATH VARCHAR2(1000) NOT NULL
	CONSTRAINT FK_CENTER_PIC FOREIGN KEY(CENTER_NO) REFERENCES CENTER(CENTER_NO)
);

CREATE TABLE USED_PIC(
	USED_NO NUMBER NOT NULL,
	PIC_NAME VARCHAR2(500) NOT NULL,
	PIC_PATH VARCHAR2(1000) NOT NULL
	CONSTRAINT FK_USED_PIC FOREIGN KEY(USED_NO) REFERENCES CENTER(USED_NO)
);

DROP TABLE BUSINESS;
DROP SEQUENCE BIZ_NOSQ;

DROP TABLE USED_ASK;
DROP SEQUENCE USK_NOSQ;
DROP SEQUENCE USK_GPNOSQ;

DROP TABLE QNA;
DROP SEQUENCE QA_NOSQ;
DROP SEQUENCE QA_GPNOSQ;

DROP TABLE USED_BOARD;
DROP SEQUENCE USED_NOSQ;

DROP TABLE ASK;
DROP SEQUENCE ASK_NOSQ;
DROP SEQUENCE ASK_GPNOSQ;

DROP TABLE REVIEW;
DROP SEQUENCE REVIEW_NOSQ;

DROP TABLE CENTER;
DROP SEQUENCE CENTER_NOSQ;

DROP TABLE USER_INFO;
DROP SEQUENCE USER_NOSQ;

SELECT * FROM BUSINESS;
