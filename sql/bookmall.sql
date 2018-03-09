-- 서적
ALTER TABLE `book`
	DROP FOREIGN KEY `FK_category_TO_book`; -- 카테고리 -> 서적

-- 카트
ALTER TABLE `cart`
	DROP FOREIGN KEY `FK_member_TO_cart`; -- 고객 -> 카트

-- 카트
ALTER TABLE `cart`
	DROP FOREIGN KEY `FK_book_TO_cart`; -- 서적 -> 카트

-- 주문
ALTER TABLE `order`
	DROP FOREIGN KEY `FK_member_TO_order`; -- 고객 -> 주문

-- 주문도서
ALTER TABLE `order_book`
	DROP FOREIGN KEY `FK_order_TO_order_book`; -- 주문 -> 주문도서

-- 주문도서
ALTER TABLE `order_book`
	DROP FOREIGN KEY `FK_book_TO_order_book`; -- 서적 -> 주문도서

-- 카테고리
DROP TABLE IF EXISTS `category` RESTRICT;

-- 서적
DROP TABLE IF EXISTS `book` RESTRICT;

-- 고객
DROP TABLE IF EXISTS `member` RESTRICT;

-- 카트
DROP TABLE IF EXISTS `cart` RESTRICT;

-- 주문
DROP TABLE IF EXISTS `order` RESTRICT;

-- 주문도서
DROP TABLE IF EXISTS `order_book` RESTRICT;

-- 카테고리
CREATE TABLE `category` (
	`no`   INTEGER     NOT NULL COMMENT '번호', -- 번호
	`type` VARCHAR(50) NOT NULL COMMENT '종류' -- 종류
)
COMMENT '카테고리';

-- 카테고리
ALTER TABLE `category`
	ADD CONSTRAINT `PK_category` -- 카테고리 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `category`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 서적
CREATE TABLE `book` (
	`no`          INTEGER     NOT NULL COMMENT '번호', -- 번호
	`title`       VARCHAR(50) NOT NULL COMMENT '제목', -- 제목
	`price`       INTEGER     NOT NULL COMMENT '가격', -- 가격
	`category_no` INTEGER     NOT NULL COMMENT '카테고리번호' -- 카테고리번호
)
COMMENT '서적';

-- 서적
ALTER TABLE `book`
	ADD CONSTRAINT `PK_book` -- 서적 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `book`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 고객
CREATE TABLE `member` (
	`no`       INTEGER      NOT NULL COMMENT '번호', -- 번호
	`name`     VARCHAR(60)  NULL     COMMENT '이름', -- 이름
	`phone`    VARCHAR(50)  NULL     COMMENT '전화번호', -- 전화번호
	`email`    VARCHAR(100) NULL     COMMENT '이메일', -- 이메일
	`password` VARCHAR(100) NULL     COMMENT '비밀번호' -- 비밀번호
)
COMMENT '고객';

-- 고객
ALTER TABLE `member`
	ADD CONSTRAINT `PK_member` -- 고객 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `member`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 카트
CREATE TABLE `cart` (
	`member_no` INTEGER NOT NULL COMMENT '고객번호', -- 고객번호
	`no`        INTEGER NOT NULL COMMENT '서적번호', -- 서적번호
	`amount`    INTEGER NULL     DEFAULT 0 COMMENT '수량', -- 수량
	`price`     INTEGER NULL     DEFAULT 0 COMMENT '가격' -- 가격
)
COMMENT '카트';

-- 카트
ALTER TABLE `cart`
	ADD CONSTRAINT `PK_cart` -- 카트 기본키
		PRIMARY KEY (
			`member_no`, -- 고객번호
			`no`         -- 서적번호
		);

-- 주문
CREATE TABLE `order` (
	`no`      INTEGER      NOT NULL COMMENT '번호', -- 번호
	`name`    VARCHAR(100) NOT NULL COMMENT '주문자', -- 주문자
	`price`   INTEGER      NULL     DEFAULT 0 COMMENT '결제금액', -- 결제금액
	`address` VARCHAR(100) NOT NULL COMMENT '배송지', -- 배송지
	`no2`     INTEGER      NOT NULL COMMENT '고객번호' -- 고객번호
)
COMMENT '주문';

-- 주문
ALTER TABLE `order`
	ADD CONSTRAINT `PK_order` -- 주문 기본키
		PRIMARY KEY (
			`no` -- 번호
		);

ALTER TABLE `order`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 주문도서
CREATE TABLE `order_book` (
	`order_no` INTEGER NOT NULL COMMENT '주문번호', -- 주문번호
	`no2`      INTEGER NOT NULL COMMENT '서적번호', -- 서적번호
	`amount`   INTEGER NULL     DEFAULT 0 COMMENT '수량', -- 수량
	`COL`      INTEGER NULL     COMMENT '가격' -- 가격
)
COMMENT '주문도서';

-- 주문도서
ALTER TABLE `order_book`
	ADD CONSTRAINT `PK_order_book` -- 주문도서 기본키
		PRIMARY KEY (
			`order_no`, -- 주문번호
			`no2`       -- 서적번호
		);

-- 서적
ALTER TABLE `book`
	ADD CONSTRAINT `FK_category_TO_book` -- 카테고리 -> 서적
		FOREIGN KEY (
			`category_no` -- 카테고리번호
		)
		REFERENCES `category` ( -- 카테고리
			`no` -- 번호
		);

-- 카트
ALTER TABLE `cart`
	ADD CONSTRAINT `FK_member_TO_cart` -- 고객 -> 카트
		FOREIGN KEY (
			`member_no` -- 고객번호
		)
		REFERENCES `member` ( -- 고객
			`no` -- 번호
		);

-- 카트
ALTER TABLE `cart`
	ADD CONSTRAINT `FK_book_TO_cart` -- 서적 -> 카트
		FOREIGN KEY (
			`no` -- 서적번호
		)
		REFERENCES `book` ( -- 서적
			`no` -- 번호
		);

-- 주문
ALTER TABLE `order`
	ADD CONSTRAINT `FK_member_TO_order` -- 고객 -> 주문
		FOREIGN KEY (
			`no2` -- 고객번호
		)
		REFERENCES `member` ( -- 고객
			`no` -- 번호
		);

-- 주문도서
ALTER TABLE `order_book`
	ADD CONSTRAINT `FK_order_TO_order_book` -- 주문 -> 주문도서
		FOREIGN KEY (
			`order_no` -- 주문번호
		)
		REFERENCES `order` ( -- 주문
			`no` -- 번호
		);

-- 주문도서
ALTER TABLE `order_book`
	ADD CONSTRAINT `FK_book_TO_order_book` -- 서적 -> 주문도서
		FOREIGN KEY (
			`no2` -- 서적번호
		)
		REFERENCES `book` ( -- 서적
			`no` -- 번호
		);