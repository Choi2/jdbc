-- ����
ALTER TABLE `book`
	DROP FOREIGN KEY `FK_category_TO_book`; -- ī�װ� -> ����

-- īƮ
ALTER TABLE `cart`
	DROP FOREIGN KEY `FK_member_TO_cart`; -- �� -> īƮ

-- īƮ
ALTER TABLE `cart`
	DROP FOREIGN KEY `FK_book_TO_cart`; -- ���� -> īƮ

-- �ֹ�
ALTER TABLE `order`
	DROP FOREIGN KEY `FK_member_TO_order`; -- �� -> �ֹ�

-- �ֹ�����
ALTER TABLE `order_book`
	DROP FOREIGN KEY `FK_order_TO_order_book`; -- �ֹ� -> �ֹ�����

-- �ֹ�����
ALTER TABLE `order_book`
	DROP FOREIGN KEY `FK_book_TO_order_book`; -- ���� -> �ֹ�����

-- ī�װ�
DROP TABLE IF EXISTS `category` RESTRICT;

-- ����
DROP TABLE IF EXISTS `book` RESTRICT;

-- ��
DROP TABLE IF EXISTS `member` RESTRICT;

-- īƮ
DROP TABLE IF EXISTS `cart` RESTRICT;

-- �ֹ�
DROP TABLE IF EXISTS `order` RESTRICT;

-- �ֹ�����
DROP TABLE IF EXISTS `order_book` RESTRICT;

-- ī�װ�
CREATE TABLE `category` (
	`no`   INTEGER     NOT NULL COMMENT '��ȣ', -- ��ȣ
	`type` VARCHAR(50) NOT NULL COMMENT '����' -- ����
)
COMMENT 'ī�װ�';

-- ī�װ�
ALTER TABLE `category`
	ADD CONSTRAINT `PK_category` -- ī�װ� �⺻Ű
		PRIMARY KEY (
			`no` -- ��ȣ
		);

ALTER TABLE `category`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '��ȣ';

-- ����
CREATE TABLE `book` (
	`no`          INTEGER     NOT NULL COMMENT '��ȣ', -- ��ȣ
	`title`       VARCHAR(50) NOT NULL COMMENT '����', -- ����
	`price`       INTEGER     NOT NULL COMMENT '����', -- ����
	`category_no` INTEGER     NOT NULL COMMENT 'ī�װ���ȣ' -- ī�װ���ȣ
)
COMMENT '����';

-- ����
ALTER TABLE `book`
	ADD CONSTRAINT `PK_book` -- ���� �⺻Ű
		PRIMARY KEY (
			`no` -- ��ȣ
		);

ALTER TABLE `book`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '��ȣ';

-- ��
CREATE TABLE `member` (
	`no`       INTEGER      NOT NULL COMMENT '��ȣ', -- ��ȣ
	`name`     VARCHAR(60)  NULL     COMMENT '�̸�', -- �̸�
	`phone`    VARCHAR(50)  NULL     COMMENT '��ȭ��ȣ', -- ��ȭ��ȣ
	`email`    VARCHAR(100) NULL     COMMENT '�̸���', -- �̸���
	`password` VARCHAR(100) NULL     COMMENT '��й�ȣ' -- ��й�ȣ
)
COMMENT '��';

-- ��
ALTER TABLE `member`
	ADD CONSTRAINT `PK_member` -- �� �⺻Ű
		PRIMARY KEY (
			`no` -- ��ȣ
		);

ALTER TABLE `member`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '��ȣ';

-- īƮ
CREATE TABLE `cart` (
	`member_no` INTEGER NOT NULL COMMENT '����ȣ', -- ����ȣ
	`no`        INTEGER NOT NULL COMMENT '������ȣ', -- ������ȣ
	`amount`    INTEGER NULL     DEFAULT 0 COMMENT '����', -- ����
	`price`     INTEGER NULL     DEFAULT 0 COMMENT '����' -- ����
)
COMMENT 'īƮ';

-- īƮ
ALTER TABLE `cart`
	ADD CONSTRAINT `PK_cart` -- īƮ �⺻Ű
		PRIMARY KEY (
			`member_no`, -- ����ȣ
			`no`         -- ������ȣ
		);

-- �ֹ�
CREATE TABLE `order` (
	`no`      INTEGER      NOT NULL COMMENT '��ȣ', -- ��ȣ
	`name`    VARCHAR(100) NOT NULL COMMENT '�ֹ���', -- �ֹ���
	`price`   INTEGER      NULL     DEFAULT 0 COMMENT '�����ݾ�', -- �����ݾ�
	`address` VARCHAR(100) NOT NULL COMMENT '�����', -- �����
	`no2`     INTEGER      NOT NULL COMMENT '����ȣ' -- ����ȣ
)
COMMENT '�ֹ�';

-- �ֹ�
ALTER TABLE `order`
	ADD CONSTRAINT `PK_order` -- �ֹ� �⺻Ű
		PRIMARY KEY (
			`no` -- ��ȣ
		);

ALTER TABLE `order`
	MODIFY COLUMN `no` INTEGER NOT NULL AUTO_INCREMENT COMMENT '��ȣ';

-- �ֹ�����
CREATE TABLE `order_book` (
	`order_no` INTEGER NOT NULL COMMENT '�ֹ���ȣ', -- �ֹ���ȣ
	`no2`      INTEGER NOT NULL COMMENT '������ȣ', -- ������ȣ
	`amount`   INTEGER NULL     DEFAULT 0 COMMENT '����', -- ����
	`COL`      INTEGER NULL     COMMENT '����' -- ����
)
COMMENT '�ֹ�����';

-- �ֹ�����
ALTER TABLE `order_book`
	ADD CONSTRAINT `PK_order_book` -- �ֹ����� �⺻Ű
		PRIMARY KEY (
			`order_no`, -- �ֹ���ȣ
			`no2`       -- ������ȣ
		);

-- ����
ALTER TABLE `book`
	ADD CONSTRAINT `FK_category_TO_book` -- ī�װ� -> ����
		FOREIGN KEY (
			`category_no` -- ī�װ���ȣ
		)
		REFERENCES `category` ( -- ī�װ�
			`no` -- ��ȣ
		);

-- īƮ
ALTER TABLE `cart`
	ADD CONSTRAINT `FK_member_TO_cart` -- �� -> īƮ
		FOREIGN KEY (
			`member_no` -- ����ȣ
		)
		REFERENCES `member` ( -- ��
			`no` -- ��ȣ
		);

-- īƮ
ALTER TABLE `cart`
	ADD CONSTRAINT `FK_book_TO_cart` -- ���� -> īƮ
		FOREIGN KEY (
			`no` -- ������ȣ
		)
		REFERENCES `book` ( -- ����
			`no` -- ��ȣ
		);

-- �ֹ�
ALTER TABLE `order`
	ADD CONSTRAINT `FK_member_TO_order` -- �� -> �ֹ�
		FOREIGN KEY (
			`no2` -- ����ȣ
		)
		REFERENCES `member` ( -- ��
			`no` -- ��ȣ
		);

-- �ֹ�����
ALTER TABLE `order_book`
	ADD CONSTRAINT `FK_order_TO_order_book` -- �ֹ� -> �ֹ�����
		FOREIGN KEY (
			`order_no` -- �ֹ���ȣ
		)
		REFERENCES `order` ( -- �ֹ�
			`no` -- ��ȣ
		);

-- �ֹ�����
ALTER TABLE `order_book`
	ADD CONSTRAINT `FK_book_TO_order_book` -- ���� -> �ֹ�����
		FOREIGN KEY (
			`no2` -- ������ȣ
		)
		REFERENCES `book` ( -- ����
			`no` -- ��ȣ
		);