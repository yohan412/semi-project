CREATE TABLE TESTKAKAOMAP(
	CENTERNAME VARCHAR2(30) PRIMARY KEY,
	CENTERLOC VARCHAR2(100) NOT NULL
)

INSERT INTO TESTKAKAOMAP VALUES ('스포츠센터1','서울 강남구 테헤란로 145');
INSERT INTO TESTKAKAOMAP VALUES ('스포츠센터2','서울 강남구 강남대로 428 만이빌딩 3층 2-303호');
INSERT INTO TESTKAKAOMAP VALUES ('스포츠센터3','서울 서초구 서초대로 411 GT타워');

SELECT * FROM TESTKAKAOMAP;