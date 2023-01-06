-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.9.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- shoppingdb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `shoppingdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `shoppingdb`;

-- 테이블 shoppingdb.order_seq_num 구조 내보내기
CREATE TABLE IF NOT EXISTS `order_seq_num` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 shoppingdb.order_seq_num:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `order_seq_num` DISABLE KEYS */;
INSERT INTO `order_seq_num` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(400, 0, 10000000, 400, 1, 20, 0, 0);
/*!40000 ALTER TABLE `order_seq_num` ENABLE KEYS */;

-- 프로시저 shoppingdb.pcd_member_insert 구조 내보내기
DELIMITER //
CREATE PROCEDURE `pcd_member_insert`()
BEGIN
   DECLARE _loop INT;
   SET _loop= 1;
   
   while _loop < 1000 DO 
      INSERT INTO memberdb(uid, pwd, NAME, phone, email,admin) 
      VALUES 
      (CONCAT('user_', _loop),'pwd', CONCAT('이름', _loop), CONCAT('010', _loop),CONCAT('email@', _loop),'user');
      
      SET _loop = _loop + 1;
   END while;
   
END//
DELIMITER ;

-- 테이블 shoppingdb.seq_goods_id 구조 내보내기
CREATE TABLE IF NOT EXISTS `seq_goods_id` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 shoppingdb.seq_goods_id:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `seq_goods_id` DISABLE KEYS */;
INSERT INTO `seq_goods_id` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(400, 100, 1000000, 400, 1, 20, 0, 0);
/*!40000 ALTER TABLE `seq_goods_id` ENABLE KEYS */;

-- 테이블 shoppingdb.seq_image_id 구조 내보내기
CREATE TABLE IF NOT EXISTS `seq_image_id` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 shoppingdb.seq_image_id:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `seq_image_id` DISABLE KEYS */;
INSERT INTO `seq_image_id` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(400, 1, 11111111, 400, 1, 0, 0, 0);
/*!40000 ALTER TABLE `seq_image_id` ENABLE KEYS */;

-- 테이블 shoppingdb.seq_order_id 구조 내보내기
CREATE TABLE IF NOT EXISTS `seq_order_id` (
  `next_not_cached_value` bigint(21) NOT NULL,
  `minimum_value` bigint(21) NOT NULL,
  `maximum_value` bigint(21) NOT NULL,
  `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
  `increment` bigint(21) NOT NULL COMMENT 'increment value',
  `cache_size` bigint(21) unsigned NOT NULL,
  `cycle_option` tinyint(1) unsigned NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
  `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
) ENGINE=InnoDB SEQUENCE=1;

-- 테이블 데이터 shoppingdb.seq_order_id:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `seq_order_id` DISABLE KEYS */;
INSERT INTO `seq_order_id` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
	(400, 0, 10000000, 400, 1, 0, 0, 0);
/*!40000 ALTER TABLE `seq_order_id` ENABLE KEYS */;

-- 테이블 shoppingdb.t_code 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_code` (
  `CODE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GRP_ID` varchar(50) DEFAULT NULL,
  `CODE_NAME` varchar(100) DEFAULT NULL,
  `CODE_DESC` varchar(100) DEFAULT NULL,
  `INORDER` int(11) DEFAULT NULL,
  `CREDATE` date DEFAULT current_timestamp(),
  PRIMARY KEY (`CODE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 shoppingdb.t_code:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_code` DISABLE KEYS */;
INSERT INTO `t_code` (`CODE_ID`, `GRP_ID`, `CODE_NAME`, `CODE_DESC`, `INORDER`, `CREDATE`) VALUES
	(1, 'goods_status', '베스트셀러', '베스트셀러', 1, '2023-01-02'),
	(2, 'goods_status', '스테디셀러', '스테디셀러', 2, '2023-01-02'),
	(3, 'goods_status', '신간', '신간', 3, '2023-01-02'),
	(4, 'goods_status', '판매중', '판매중', 4, '2023-01-02'),
	(5, 'goods_status', '품절', '품절', 5, '2023-01-02'),
	(6, 'goods_status', '절판', '절판', 6, '2023-01-02'),
	(7, 'delivery_state', '배송준비중', '배송준비중', 1, '2023-01-02'),
	(8, 'delivery_state', '배송중', '배송중', 2, '2023-01-02'),
	(9, 'delivery_state', '배송완료', '배송완료', 3, '2023-01-02'),
	(10, 'delivery_state', '주문취소', '주문취소', 4, '2023-01-02'),
	(11, 'delivery_state', '반품', '반품', 5, '2023-01-02');
/*!40000 ALTER TABLE `t_code` ENABLE KEYS */;

-- 테이블 shoppingdb.t_goods_detail_image 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_goods_detail_image` (
  `IMAGE_ID` decimal(20,0) NOT NULL,
  `GOODS_ID` int(11) DEFAULT NULL,
  `FILENAME` varchar(50) DEFAULT NULL,
  `REG_ID` varchar(20) DEFAULT NULL,
  `FILETYPE` varchar(40) DEFAULT NULL,
  `CREDATE` datetime DEFAULT sysdate(),
  PRIMARY KEY (`IMAGE_ID`),
  KEY `FK_t_goods_detail_image_t_shopping_goods` (`GOODS_ID`),
  CONSTRAINT `FK_t_goods_detail_image_t_shopping_goods` FOREIGN KEY (`GOODS_ID`) REFERENCES `t_shopping_goods` (`GOODS_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 shoppingdb.t_goods_detail_image:~48 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_goods_detail_image` DISABLE KEYS */;
INSERT INTO `t_goods_detail_image` (`IMAGE_ID`, `GOODS_ID`, `FILENAME`, `REG_ID`, `FILETYPE`, `CREDATE`) VALUES
	(299, 334, '포토샵 무작정 따라하기_메인.jpg', 'admin', 'main_image', '2018-10-16 00:00:00'),
	(300, 334, '포토샵 무작정 따라하기_상세1.jpg', 'admin', 'detail_image1', '2018-10-16 00:00:00'),
	(301, 335, '차트분석 무작정 따라하기_메인.jpg', 'admin', 'main_image', '2018-10-16 00:00:00'),
	(302, 335, '차트분석 무작정 따라하기_상세1.jpg', 'admin', 'detail_image1', '2018-10-16 00:00:00'),
	(303, 336, '짠테그 가계부_메인.jpg', 'admin', 'main_image', '2018-10-17 00:00:00'),
	(304, 336, '짠테그 가계부_상세1.jpg', 'admin', 'detail_image1', '2018-10-17 00:00:00'),
	(305, 337, '케라시_메인.jpg', 'admin', 'main_image', '2018-10-17 00:00:00'),
	(306, 337, '케라시_상세1.jpg', 'admin', 'detail_image1', '2018-10-17 00:00:00'),
	(307, 338, '컴퓨터 활용능력 2급 실기_메인.jpg', 'admin', 'main_image', '2018-10-17 00:00:00'),
	(308, 338, '컴퓨터 활용능력 2급 실기_상세1.jpg', 'admin', 'detail_image1', '2018-10-17 00:00:00'),
	(309, 339, '시나공 워드프로세서 실기_메인.jpg', 'admin', 'main_image', '2018-10-17 00:00:00'),
	(310, 339, '시나공 워드프로세서 실기_상세1.jpg', 'admin', 'detail_image1', '2018-10-17 00:00:00'),
	(311, 340, '엑셀실무_메인.pg.jpg', 'admin', 'main_image', '2018-10-17 00:00:00'),
	(312, 340, '엑셀실무_상세1.jpg', 'admin', 'detail_image1', '2018-10-17 00:00:00'),
	(313, 341, '헬로자바스크립트_메인.jpg', 'admin', 'main_image', '2018-10-17 00:00:00'),
	(314, 341, '모두의 파이선상세이미지1.jpg', 'admin', 'detail_image1', '2018-10-17 00:00:00'),
	(315, 342, '부동상 상식사전_메인.jpg', 'admin', 'main_image', '2018-10-17 00:00:00'),
	(316, 342, '부동상 상식사전_상세1.jpg', 'admin', 'detail_image1', '2018-10-17 00:00:00'),
	(317, 343, '기적적 계산법_메인.jpg', 'admin', 'main_image', '2018-10-17 00:00:00'),
	(319, 344, 'image1.jpg', 'admin', 'main_image', '2018-10-17 00:00:00'),
	(320, 344, 'react_detail1.jpg', 'admin', 'detail_image1', '2018-10-17 00:00:00'),
	(321, 345, 'main_react.jpg', 'admin', 'main_image', '2018-10-17 00:00:00'),
	(322, 345, 'detail3.jpg', 'admin', 'detail_image1', '2018-10-17 00:00:00'),
	(323, 346, '여행 일본어_메인.jpg', 'admin', 'main_image', '2018-10-17 00:00:00'),
	(324, 346, '여행 일본어_상세.jpg', 'admin', 'detail_image1', '2018-10-17 00:00:00'),
	(325, 347, '가장 빨리 만나는 자바_메인.jpg', 'admin', 'main_image', '2018-10-20 00:00:00'),
	(326, 347, '가장 빨리 만나는 자바_상세1.jpg', 'admin', 'detail_image1', '2018-10-20 00:00:00'),
	(327, 348, 'Java EE 디자이 패턴_메인.jpg', 'admin', 'main_image', '2018-10-20 00:00:00'),
	(328, 348, 'Java EE 디자이 패턴_상세1.jpg', 'admin', 'detail_image1', '2018-10-20 00:00:00'),
	(330, 349, '자바 리팩토링_메인.jpg', 'admin', 'main_image', '2018-10-20 00:00:00'),
	(331, 349, '자바 리팩토링_상세1.jpg', 'admin', 'detail_image1', '2018-10-20 00:00:00'),
	(334, 350, '유지보수자바_메인.jpg', 'admin', 'main_image', '2018-10-20 00:00:00'),
	(337, 343, '기적적 계산법_상세1.jpg', 'admin', 'uploadFile', '2018-10-21 00:00:00'),
	(338, 343, 'good1_detail_image2.jpg', 'admin', 'uploadFile', '2018-10-21 00:00:00'),
	(339, 343, 'good1_detail_image3.jpg', 'admin', 'uploadFile', '2018-10-21 00:00:00'),
	(341, 350, '유지보수자바_상세1.jpg', 'admin', 'uploadFile', '2018-10-21 00:00:00'),
	(342, 354, '모두의 딥러닝_메인.jpg', 'admin', 'main_image', '2018-10-23 00:00:00'),
	(343, 354, '모두의 딥러닝_상세.jpg', 'admin', 'detail_image1', '2018-10-23 00:00:00'),
	(345, 356, '마인_메인.jpg', 'admin', 'main_image', '2018-10-23 00:00:00'),
	(346, 394, '무작정 따라가기 홍콩 마카오.jpg', 'admin', 'main_image', '2018-10-16 00:00:00'),
	(347, 394, '무작정 따라가기 홍콩 마카오_상세.jpg', 'admin', 'detail_image1', '2018-10-16 00:00:00'),
	(348, 394, 'detail2.jpg', 'admin', 'detail_image2', '2018-10-16 00:00:00'),
	(349, 395, 'image2.jpg', 'admin', 'main_image', '2018-10-16 00:00:00'),
	(350, 395, '모두의 파이선상세이미지1.jpg', 'admin', 'detail_image1', '2018-10-16 00:00:00'),
	(351, 397, 'main_react.jpg', 'admin', 'main_image', '2018-10-16 00:00:00'),
	(352, 397, 'react_detail1.jpg', 'admin', 'detail_image1', '2018-10-16 00:00:00'),
	(353, 398, '헬로자바스크립트_메인.jpg', 'admin', 'main_image', '2018-10-16 00:00:00'),
	(354, 398, '헬로자바스크립트_상세1.jpg', 'admin', 'detail_image1', '2018-10-16 00:00:00');
/*!40000 ALTER TABLE `t_goods_detail_image` ENABLE KEYS */;

-- 테이블 shoppingdb.t_shopping_cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_shopping_cart` (
  `CART_ID` bigint(20) NOT NULL,
  `GOODS_ID` int(11) DEFAULT NULL,
  `MEMBER_ID` varchar(20) DEFAULT NULL,
  `DEL_YN` varchar(20) DEFAULT 'N',
  `CREDATE` datetime DEFAULT sysdate(),
  `CART_GOODS_QTY` smallint(6) DEFAULT 1,
  PRIMARY KEY (`CART_ID`),
  KEY `FK_t_shopping_cart_t_shopping_member` (`MEMBER_ID`),
  KEY `FK_t_shopping_cart_t_shopping_goods` (`GOODS_ID`),
  CONSTRAINT `FK_t_shopping_cart_t_shopping_goods` FOREIGN KEY (`GOODS_ID`) REFERENCES `t_shopping_goods` (`GOODS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_t_shopping_cart_t_shopping_member` FOREIGN KEY (`MEMBER_ID`) REFERENCES `t_shopping_member` (`MEMBER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 shoppingdb.t_shopping_cart:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_shopping_cart` ENABLE KEYS */;

-- 테이블 shoppingdb.t_shopping_goodbad 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_shopping_goodbad` (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT,
  `GOODS_ID` int(11) DEFAULT NULL,
  `MEMBER_ID` varchar(50) DEFAULT NULL,
  `GOOD_OR_BAD` varchar(50) DEFAULT NULL,
  `SELECT_TIME` datetime DEFAULT current_timestamp(),
  `FLAG` varchar(50) DEFAULT '0',
  PRIMARY KEY (`SEQ`),
  KEY `FK_t_shopping_goodbad_t_shopping_goods` (`GOODS_ID`),
  KEY `FK_t_shopping_goodbad_t_shopping_member` (`MEMBER_ID`),
  CONSTRAINT `FK_t_shopping_goodbad_t_shopping_goods` FOREIGN KEY (`GOODS_ID`) REFERENCES `t_shopping_goods` (`GOODS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_t_shopping_goodbad_t_shopping_member` FOREIGN KEY (`MEMBER_ID`) REFERENCES `t_shopping_member` (`MEMBER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 shoppingdb.t_shopping_goodbad:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_shopping_goodbad` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_shopping_goodbad` ENABLE KEYS */;

-- 테이블 shoppingdb.t_shopping_goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_shopping_goods` (
  `GOODS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GOODS_SORT` varchar(50) DEFAULT NULL,
  `GOODS_TITLE` varchar(100) DEFAULT NULL,
  `GOODS_WRITER` varchar(50) DEFAULT NULL,
  `GOODS_PUBLISHER` varchar(50) DEFAULT NULL,
  `GOODS_PRICE` int(11) DEFAULT NULL,
  `GOODS_SALES_PRICE` int(11) DEFAULT NULL,
  `GOODS_POINT` int(11) DEFAULT NULL,
  `GOODS_PUBLISHED_DATE` date DEFAULT NULL,
  `GOODS_TOTAL_PAGE` int(11) DEFAULT NULL,
  `GOODS_ISBN` varchar(50) DEFAULT NULL,
  `GOODS_DELIVERY_PRICE` int(11) DEFAULT NULL,
  `GOODS_DELIVERY_DATE` date DEFAULT NULL,
  `GOODS_STATUS` int(11) DEFAULT NULL,
  `GOODS_INTRO` varchar(2000) DEFAULT NULL,
  `GOODS_WRITER_INTRO` varchar(2000) DEFAULT NULL,
  `GOODS_PUBLISHER_COMMENT` varchar(2000) DEFAULT NULL,
  `GOODS_RECOMMENDATION` varchar(2000) DEFAULT NULL,
  `GOODS_CONTENTS_ORDER` mediumtext DEFAULT NULL,
  `GOODS_CREDATE` date DEFAULT current_timestamp(),
  `GOODS_GOOD_COUNT` int(11) DEFAULT 0,
  `GOODS_BAD_COUNT` int(11) DEFAULT 0,
  PRIMARY KEY (`GOODS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 shoppingdb.t_shopping_goods:~23 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_shopping_goods` DISABLE KEYS */;
INSERT INTO `t_shopping_goods` (`GOODS_ID`, `GOODS_SORT`, `GOODS_TITLE`, `GOODS_WRITER`, `GOODS_PUBLISHER`, `GOODS_PRICE`, `GOODS_SALES_PRICE`, `GOODS_POINT`, `GOODS_PUBLISHED_DATE`, `GOODS_TOTAL_PAGE`, `GOODS_ISBN`, `GOODS_DELIVERY_PRICE`, `GOODS_DELIVERY_DATE`, `GOODS_STATUS`, `GOODS_INTRO`, `GOODS_WRITER_INTRO`, `GOODS_PUBLISHER_COMMENT`, `GOODS_RECOMMENDATION`, `GOODS_CONTENTS_ORDER`, `GOODS_CREDATE`, `GOODS_GOOD_COUNT`, `GOODS_BAD_COUNT`) VALUES
	(334, '컴퓨터와 인터넷', '포토샵 무작정 따라하기', '민지영, 문수민, 이상호, 앤미디어', '길벗', 34000, 30000, 1000, '2018-10-02', 1111, '12122222', 2000, '2018-10-17', 1, '구글코리아에서 소프트웨어 엔지니어로 재직 중이다. 더 좋은 소프트웨어 엔지니어가 되기를 갈망하지만 일과 삶의 균형이 더 중요하다. 겨울에는 주로 스키를 즐긴다.', '구글코리아에서 소프트웨어 엔지니어로 재직 중이다. 더 좋은 소프트웨어 엔지니어가 되기를 갈망하지만 일과 삶의 균형이 더 중요하다. 겨울에는 주로 스키를 즐긴다.', '구글코리아에서 소프트웨어 엔지니어로 재직 중이다. 더 좋은 소프트웨어 엔지니어가 되기를 갈망하지만 일과 삶의 균형이 더 중요하다. 겨울에는 주로 스키를 즐긴다.', '구글코리아에서 소프트웨어 엔지니어로 재직 중이다. 더 좋은 소프트웨어 엔지니어가 되기를 갈망하지만 일과 삶의 균형이 더 중요하다. 겨울에는 주로 스키를 즐긴다.', NULL, '2018-10-16', NULL, 0),
	(335, '컴퓨터와 인터넷', '무작정 따라하기 차트분석', '윤재수', '미래 출판사', 1212, 30000, 121, '2018-10-02', 12, '1212', 2000, '2018-10-24', 1, '1212', '1212', '1212', '1212', NULL, '2018-10-16', NULL, 0),
	(336, '컴퓨터와 인터넷', '짠테크 가계부', '짠돌이 카페', '길벗', 30000, 30000, 1212, '2018-10-02', 1212, '1212', 1212, '2018-10-18', 1, '1212', '1212', '121', '1212', NULL, '2018-10-17', NULL, 0),
	(337, '컴퓨터와 인터넷', '케라스로 배우는 딥러닝', '프랑소와 숄레', '국민출판사', 30000, 30000, 1212, '2018-10-02', 1212, '1212', 1212, '2018-10-19', 1, '1212', '1221', '1212', '1212', NULL, '2018-10-17', NULL, 0),
	(338, '컴퓨터와 인터넷', '컴퓨터 활용능려 2급 실기', '이병승', '길벗', 25000, 25000, 1212, '2018-08-08', 1212, '1212', 1212, '2018-10-26', 1, '1212', '1212', '1212', '1212', NULL, '2018-10-17', NULL, 0),
	(339, '컴퓨터와 인터넷', '시나공 워드 프로세서 실기', '길벗 알엔디', '국민 출판사', 25000, 25000, 1212, '2018-10-29', 1212, '1212', 1212, '2018-10-25', 1, '1212', '1212', '1212', '121', NULL, '2018-10-17', NULL, 0),
	(340, '컴퓨터와 인터넷', '직장인을 위한 엑셀 실무', '홍길동', '서울출판사', 25000, 25000, 1212, '2018-10-17', 1212, '1212', 1212, '2018-10-25', 1, '1212', '1212', '1212', '1212', NULL, '2018-10-17', NULL, 0),
	(341, '컴퓨터와 인터넷', '자바스크립트 배우기', '2222', '서울 출판사', 25000, 25000, 2222, '2018-10-18', 2222, '2222', 2222, '2018-10-18', 1, '5656', '56566', '5656', '5656', NULL, '2018-10-17', NULL, 0),
	(342, '컴퓨터와 인터넷', '부동산 상식 사전', '백영록', '길벗', 20000, 20000, 5555, '2018-10-04', 555, '555', 555, '2018-10-11', 1, '555', '555', '555', '555', NULL, '2018-10-17', NULL, 0),
	(343, '컴퓨터와 인터넷', '기적의 계산법', '이순신', '국민 출판사', 30000, 30000, 777, '2018-10-04', 990, '777', 2000, '2018-11-22', 2, '777', '7777', '777', '777', NULL, '2018-10-17', NULL, 0),
	(344, '컴퓨터와 인터넷', '초보자를 위한 자바 프로그래밍', '이병승', '인포북', 30000, 27000, 2000, '2018-10-02', 996, '2323454566778', 2000, '2018-10-18', 3, '7777', '77777', '7777', '7777', NULL, '2018-10-17', NULL, 0),
	(345, '컴퓨터와 인터넷', '리액트를 다루는 기술', '이순신', '민국 출판사', 30000, 30000, 888, '2018-10-12', 888, '8888', 888, '2018-10-18', 3, '88', '888888', '888', '888', NULL, '2018-10-17', NULL, 0),
	(346, '컴퓨터와 인터넷', '여행 일본어', '이길동', '국민 출판사', 30000, 30000, 898, '2018-10-23', 8989, '8989', 8989, '2018-10-18', 4, '8989', '8989', '8989', '8989', NULL, '2018-10-17', NULL, 0),
	(347, '컴퓨터와 인터넷', '가장 빨리 만나는 자바9', '카이 호스트만', '길벗', 30000, 32400, 2000, '2018-10-17', 1111, '1212121', 2000, '2018-10-22', 2, '첫 번째 단계는 프로그래밍 기초 과정이다.\r\n: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.', NULL, '첫 번째 단계는 프로그래밍 기초 과정이다.\r\n: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.', '첫 번째 단계는 프로그래밍 기초 과정이다.\r\n: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.', NULL, '2018-10-20', NULL, 0),
	(348, '컴퓨터와 인터넷', '자바 EE 디자인 패턴', '무라트예네르, 알렉스 시돔', '길벗', 34000, 30000, 1000, '2018-10-18', 1212, '12122222', 2000, '2018-10-24', 4, '첫 번째 단계는 프로그래밍 기초 과정이다.\r\n: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.', '첫 번째 단계는 프로그래밍 기초 과정이다.\r\n: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.', '첫 번째 단계는 프로그래밍 기초 과정이다.\r\n: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.', '첫 번째 단계는 프로그래밍 기초 과정이다.\r\n: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.', NULL, '2018-10-20', NULL, 0),
	(349, '컴퓨터와 인터넷', '자바로 배우는 리팩토링', '유키히로시', '길벗', 34000, 30000, 1000, '2018-10-02', 1111, '12122222', 2000, '2018-10-25', 4, '저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.', '저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.', '저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.', '저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.', NULL, '2018-10-20', NULL, 0),
	(350, '컴퓨터와 인터넷', '유지 보수가 가능한 코딩의 기술-자바편', '주스트 뷔서', '한국 출판사', 35000, 32000, 2000, '2018-10-20', 1000, '2323222323', 2000, '2018-10-22', 2, '이 책을 읽고 나면 프로그래머는 새로운 객체를 찾아서 만들게 될 것이고, 그것을 프로그래밍화 하는 것이 진정한 객체 지향 프로그래밍이라는 사실을 깨닫게 될 것이다.', '저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.\r\n\r\n- 전자공학과 졸업\r\n- 벤처 기업에서 다양한 소프트웨어 개발 참여\r\n- 대기업의 시스템 통합 작업에 관련된 소프트웨어 개발 참여\r\n- IT프로그래밍 학원에서 강의', '이 책을 읽고 나면 프로그래머는 새로운 객체를 찾아서 만들게 될 것이고, 그것을 프로그래밍화 하는 것이 진정한 객체 지향 프로그래밍이라는 사실을 깨닫게 될 것이다.', '이 책을 읽고 나면 프로그래머는 새로운 객체를 찾아서 만들게 될 것이고, 그것을 프로그래밍화 하는 것이 진정한 객체 지향 프로그래밍이라는 사실을 깨닫게 될 것이다.', NULL, '2018-10-20', NULL, 0),
	(354, '컴퓨터와 인터넷', '모두의 딥러닝', '조태호', '길벗', 24000, 21600, 1000, '2018-10-02', 300, '2112121', 3000, '2018-10-04', 1, '딥러닝을 전혀 모르는 사람이 봐도 술술 읽을 수 있게 쉽게 설명한다. 또한, 딥러닝의 원리를 잘 보여주는 예제를 엄선하여 직관적인 몇 줄의 코드로 강력한 딥러닝을 구현해볼 수 있다. 다양하고 실질적인 예제를 통해 재미있게 학습할 수 있으며, 모든 예제는 가상 머신을 설치할 필요 없이 윈도 10에서 손쉽게 실행할 수 있어 편리하다. 복잡한 수식은 최대한 줄이고 고급 기술은 심화 학습에서 추가로 학습할 수 있게 단계별로 구성하였다. ‘이론 없는 실습’, ‘실습 없는 이론’이 아닌 이론과 실습 두 날개의 균형을 잡음으로써, 배운 내용을 올바로 이해하고 실전에서 제대로 써먹을 수 있도록 안내한다. 이 책을 읽고 나면 ‘나의 사례’에 적합한 딥러닝 모델을 구현할 수 있을 것이다.', '딥러닝을 전혀 모르는 사람이 봐도 술술 읽을 수 있게 쉽게 설명한다. 또한, 딥러닝의 원리를 잘 보여주는 예제를 엄선하여 직관적인 몇 줄의 코드로 강력한 딥러닝을 구현해볼 수 있다. 다양하고 실질적인 예제를 통해 재미있게 학습할 수 있으며, 모든 예제는 가상 머신을 설치할 필요 없이 윈도 10에서 손쉽게 실행할 수 있어 편리하다. 복잡한 수식은 최대한 줄이고 고급 기술은 심화 학습에서 추가로 학습할 수 있게 단계별로 구성하였다. ‘이론 없는 실습’, ‘실습 없는 이론’이 아닌 이론과 실습 두 날개의 균형을 잡음으로써, 배운 내용을 올바로 이해하고 실전에서 제대로 써먹을 수 있도록 안내한다. 이 책을 읽고 나면 ‘나의 사례’에 적합한 딥러닝 모델을 구현할 수 있을 것이다.', '딥러닝을 전혀 모르는 사람이 봐도 술술 읽을 수 있게 쉽게 설명한다. 또한, 딥러닝의 원리를 잘 보여주는 예제를 엄선하여 직관적인 몇 줄의 코드로 강력한 딥러닝을 구현해볼 수 있다. 다양하고 실질적인 예제를 통해 재미있게 학습할 수 있으며, 모든 예제는 가상 머신을 설치할 필요 없이 윈도 10에서 손쉽게 실행할 수 있어 편리하다. 복잡한 수식은 최대한 줄이고 고급 기술은 심화 학습에서 추가로 학습할 수 있게 단계별로 구성하였다. ‘이론 없는 실습’, ‘실습 없는 이론’이 아닌 이론과 실습 두 날개의 균형을 잡음으로써, 배운 내용을 올바로 이해하고 실전에서 제대로 써먹을 수 있도록 안내한다. 이 책을 읽고 나면 ‘나의 사례’에 적합한 딥러닝 모델을 구현할 수 있을 것이다.', '딥러닝을 전혀 모르는 사람이 봐도 술술 읽을 수 있게 쉽게 설명한다. 또한, 딥러닝의 원리를 잘 보여주는 예제를 엄선하여 직관적인 몇 줄의 코드로 강력한 딥러닝을 구현해볼 수 있다. 다양하고 실질적인 예제를 통해 재미있게 학습할 수 있으며, 모든 예제는 가상 머신을 설치할 필요 없이 윈도 10에서 손쉽게 실행할 수 있어 편리하다. 복잡한 수식은 최대한 줄이고 고급 기술은 심화 학습에서 추가로 학습할 수 있게 단계별로 구성하였다. ‘이론 없는 실습’, ‘실습 없는 이론’이 아닌 이론과 실습 두 날개의 균형을 잡음으로써, 배운 내용을 올바로 이해하고 실전에서 제대로 써먹을 수 있도록 안내한다. 이 책을 읽고 나면 ‘나의 사례’에 적합한 딥러닝 모델을 구현할 수 있을 것이다.', NULL, '2018-10-23', NULL, 0),
	(356, '컴퓨터와 인터넷', '마인크래프트 무작정 따라하기', '신윤철,이상민', '길벗', 14000, 12000, 1000, '2018-10-02', 245, '12122222', 2000, '2018-10-10', 1, '마인크래프트를 이용해 코딩을 배울 수 있다는 이야기를 들어 본 적 있나요? \r\n마이크로소프트(Microsoft)에서 만든 블록형 코딩 도구인 메이크코드(MakeCode)를 마인크래프트와 연결해 보세요. 메이크코드에서 만든 코드를 마인크래프트 월드에 적용할 수 있습니다. 또한, 장애물 파괴나 벽돌 쌓기 등 건축물을 지을 때 피할 수 없었던 반복 작업도, 메이크코드의 명령 블록을 이용하면 한번에 뚝딱 자동화할 수 있습니다. \r\n《마인크래프트 게임 제작 무작정 따라하기》는 아이들이 좋아하는 마인크래프트를 활용해 코딩을 쉽고 재미있게 익힐 수 있게 차근차근 도와주는 책입니다. 미래의 게임 프로그래머 또는 공학도를 꿈꾸는 아이라면 《마인크래프트 게임 제작 무작정 따라하기》와 함께 컴퓨팅 사고력, 창의성, 도전 정신을 키워 보세요!', '마인크래프트를 이용해 코딩을 배울 수 있다는 이야기를 들어 본 적 있나요? \r\n마이크로소프트(Microsoft)에서 만든 블록형 코딩 도구인 메이크코드(MakeCode)를 마인크래프트와 연결해 보세요. 메이크코드에서 만든 코드를 마인크래프트 월드에 적용할 수 있습니다. 또한, 장애물 파괴나 벽돌 쌓기 등 건축물을 지을 때 피할 수 없었던 반복 작업도, 메이크코드의 명령 블록을 이용하면 한번에 뚝딱 자동화할 수 있습니다. \r\n《마인크래프트 게임 제작 무작정 따라하기》는 아이들이 좋아하는 마인크래프트를 활용해 코딩을 쉽고 재미있게 익힐 수 있게 차근차근 도와주는 책입니다. 미래의 게임 프로그래머 또는 공학도를 꿈꾸는 아이라면 《마인크래프트 게임 제작 무작정 따라하기》와 함께 컴퓨팅 사고력, 창의성, 도전 정신을 키워 보세요!', '마인크래프트를 이용해 코딩을 배울 수 있다는 이야기를 들어 본 적 있나요? \r\n마이크로소프트(Microsoft)에서 만든 블록형 코딩 도구인 메이크코드(MakeCode)를 마인크래프트와 연결해 보세요. 메이크코드에서 만든 코드를 마인크래프트 월드에 적용할 수 있습니다. 또한, 장애물 파괴나 벽돌 쌓기 등 건축물을 지을 때 피할 수 없었던 반복 작업도, 메이크코드의 명령 블록을 이용하면 한번에 뚝딱 자동화할 수 있습니다. \r\n《마인크래프트 게임 제작 무작정 따라하기》는 아이들이 좋아하는 마인크래프트를 활용해 코딩을 쉽고 재미있게 익힐 수 있게 차근차근 도와주는 책입니다. 미래의 게임 프로그래머 또는 공학도를 꿈꾸는 아이라면 《마인크래프트 게임 제작 무작정 따라하기》와 함께 컴퓨팅 사고력, 창의성, 도전 정신을 키워 보세요!', '마인크래프트를 이용해 코딩을 배울 수 있다는 이야기를 들어 본 적 있나요? \r\n마이크로소프트(Microsoft)에서 만든 블록형 코딩 도구인 메이크코드(MakeCode)를 마인크래프트와 연결해 보세요. 메이크코드에서 만든 코드를 마인크래프트 월드에 적용할 수 있습니다. 또한, 장애물 파괴나 벽돌 쌓기 등 건축물을 지을 때 피할 수 없었던 반복 작업도, 메이크코드의 명령 블록을 이용하면 한번에 뚝딱 자동화할 수 있습니다. \r\n《마인크래프트 게임 제작 무작정 따라하기》는 아이들이 좋아하는 마인크래프트를 활용해 코딩을 쉽고 재미있게 익힐 수 있게 차근차근 도와주는 책입니다. 미래의 게임 프로그래머 또는 공학도를 꿈꾸는 아이라면 《마인크래프트 게임 제작 무작정 따라하기》와 함께 컴퓨팅 사고력, 창의성, 도전 정신을 키워 보세요!', NULL, '2018-10-20', NULL, 0),
	(394, '컴퓨터와 인터넷', '무작정 따라가기 홍콩 마카오', '김수정, 김승남', '인포북스', 30000, 27000, 1000, '2015-10-16', 1000, '121212', 2000, '2018-10-18', 1, '이 책을 읽고 나면 프로그래머는 새로운 객체를 찾아서 만들게 될 것이고, 그것을 프로그래밍화 하는 것이 진정한 객체 지향 프로그래밍이라는 사실을 깨닫게 될 것이다.\r\n\r\n객체 지향 프로그래밍이란 사람을 ‘주체(subject)’라 하고, 주체가 바라본 대상(사람, 사물, 객체)을 ‘객체(object)’라고 한다. 사람이 일상적으로 보고, 느끼고, 생각하는 관점에서 프로그래밍을 하는 방식이다.\r\n\r\n자바를 처음 접하는 사람은 다소 생소한 개념이 나오지만 반복해서 학습을 하다 보면 어느새 프로그래밍에 입문할 수 있다는 사실을 깨닫게 될 것이다. 각 장의 끝에는 연습문제를 두어 독학하기에 적합하다. 또한 저자의 카페(http://cafe.naver.com/standardjava)에서는 이 책의 내용이 담긴 동영상 강좌를 무료로 제공한다.', '저자가 오랜 기간 실무에서 습득한 이론 및 평소에 관심이 있던 분야와 학원 강의 중 입문자들이 첫 프로그래밍을 배웠을 때의 낮선 부분과 수업을 진행하면서 어려웠던 여러 가지의 시행착오를 바탕으로 자바를 처음 배우는 입문자가 쉽게 자신의 아이디어를 발휘하여 개발할 수 있게 구성하여 집필했다.\r\n\r\n- 전자공학과 졸업\r\n- 벤처 기업에서 다양한 소프트웨어 개발 참여\r\n- 대기업의 시스템 통합 작업에 관련된 소프트웨어 개발 참여\r\n- IT프로그래밍 학원에서 강의\r\n\r\n※저자카페 : http://cafe.naver.com/standardjava', '이 책의 삼 단계 학습 방법\r\n\r\n첫 번째 단계는 프로그래밍 기초 과정이다.\r\n: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.\r\n\r\n두 번째 단계는 자바의 객체 지향 개념에 대해 배운다.\r\n: C언어는 컴퓨터의 수행 과정을 흉내 낸 절차적 언어이다. 이러한 절차적 언어를 하는데 있어 여러 가지 단점들이 나타났다. 대표적으로는 소스 코드의 재사용이다. 지금의 응용 프로그램은 초기에 비해 규모도 커지고 개발 기간도 많이 소모된다. 자바는 기존 기능의 재사용성, 설계의 용이성, 관리의 편리성 등의 이유로 많이 찾고 있다. 이 단계의 핵심은 재사용성 및 프로그래밍 설계와 관련된 객체 지향 개념에 대해 학습한다.\r\n\r\n세 번째 단계는 API의 기능을 각 장별로 학습한다.\r\n: 자바는 약 20년이 넘었기 때문에 이전에 자바로 프로그래밍을 하면서 다른 프로그램에서 많이 사용하는 기능을 미리 자바에서 클래스로 만들어서 제공한다. 이를 API(Application Program Interface)라고 하며, 이 단계의 과정은 사실 다른 언어에서도 지원한다. 그러나 자바는 앞에서 말한 바와 같이 객체 지향 언어이므로 이 모든 API 기능이 객체 지향 개념을 적용하여 제공되고 있다. 따라서 자바의 API를 잘 사용하려면 앞의 객체 지향 개념을 잘 숙지해야 한다.', '이 책의 삼 단계 학습 방법\r\n\r\n첫 번째 단계는 프로그래밍 기초 과정이다.\r\n: 객체 지향 프로그래밍을 잘하기 위해서는 우선 기존 프로그래밍 언어의 발전과 프로그래밍의 특징을 잘 알아야 한다. 그리고 자바 또한 기존 언어에서 사용하는 개념이나 기능을 그대로 사용하기 때문에 가장 먼저 프로그래밍의 기본적인 특징이나 기능을 학습할 필요가 있다.\r\n\r\n두 번째 단계는 자바의 객체 지향 개념에 대해 배운다.\r\n: C언어는 컴퓨터의 수행 과정을 흉내 낸 절차적 언어이다. 이러한 절차적 언어를 하는데 있어 여러 가지 단점들이 나타났다. 대표적으로는 소스 코드의 재사용이다. 지금의 응용 프로그램은 초기에 비해 규모도 커지고 개발 기간도 많이 소모된다. 자바는 기존 기능의 재사용성, 설계의 용이성, 관리의 편리성 등의 이유로 많이 찾고 있다. 이 단계의 핵심은 재사용성 및 프로그래밍 설계와 관련된 객체 지향 개념에 대해 학습한다.\r\n\r\n세 번째 단계는 API의 기능을 각 장별로 학습한다.\r\n: 자바는 약 20년이 넘었기 때문에 이전에 자바로 프로그래밍을 하면서 다른 프로그램에서 많이 사용하는 기능을 미리 자바에서 클래스로 만들어서 제공한다. 이를 API(Application Program Interface)라고 하며, 이 단계의 과정은 사실 다른 언어에서도 지원한다. 그러나 자바는 앞에서 말한 바와 같이 객체 지향 언어이므로 이 모든 API 기능이 객체 지향 개념을 적용하여 제공되고 있다. 따라서 자바의 API를 잘 사용하려면 앞의 객체 지향 개념을 잘 숙지해야 한다.', NULL, '2018-10-16', NULL, 0),
	(395, '컴퓨터와 인터넷', '모두의 파이썬', '이승찬', '길벗', 12000, 10800, 1000, '2016-05-09', 200, '9791186978894', 2000, '2018-10-18', 1, '프로그래밍을 한 번도 해본 적이 없어도 괜찮다. 파이썬이 무엇인지 몰라도 상관 없다. 《모두의 파이썬》은 어려운 개념과 복잡한 이론 설명은 최대한 줄이고, 초보자가 프로그래밍을 쉽게 배울 수 있도록 짧고 간단한 예제로 내용을 구성했다. 처음부터 모든 것을 다 이해하지 못해도 괜찮다. 프로그램을 따라서 입력하고, 실행 결과를 확인하며, 책에서 알려주는 대로 에러를 수정해 보자. 어느새 파이썬 프로그램으로 멋진 그림을 그리고, 계산을 하고, 간단한 게임을 만들고, 수학 문제를 푸는 자신을 발견하게 될 것이다. 《모두의 파이썬》으로 남녀노소 누구나 즐겁게 프로그래밍을 시작해 보자!\r\n\r\n누구나 20일이면 파이썬 프로그램을 만들 수 있다!\r\n\r\n1~13일: 파이썬 언어 기초 배우기\r\n\r\n초보자도 배우기 쉬운 언어인 파이썬의 기초 문법을 예제로 배운다. 입력 → 결과 확인 → 에러 해결 → 해설 → 응용, ‘5단계 트레이닝’으로 짧은 프로그램을 직접 입력하고 고쳐 보면서 자연스럽게 프로그램을 작성하는 방법을 익힌다.\r\n\r\n14~18일: 간단한 게임 만들기\r\n\r\n앞에서 학습한 파이썬 기능을 이용하여 5가지 게임 프로젝트를 실습한다. 계산 맞히기 게임, 타자 게임, 거북이 대포 게임, 터틀런 1, 2를 만들고 실제로 게임을 플레이해 본다.\r\n\r\n19~20일: 파이썬으로 수학 문제 풀어 보기\r\n\r\n중학교 수준의 간단한 수학 문제를 파이썬 프로그램으로 만들어서 풀어 본다. 수학과 프로그래밍의 연관 관계를 배울 수 있으며 파이썬이 어떻게 활용되는지 알 수 있다.\r\n\r\n 만든 이 코멘트', '서울대학교에서 컴퓨터공학을 전공하고 게임 개발자로 일하며 메이플스토리 등의 히트 게임을 만들었습니다. 15년간 일한 게임 업계를 떠나 University of Washington에서 경영학 석사 학위를 받았습니다. 현재 로봇 개발/생산 업체 메타로보틱스에서 최신 소프트웨어 기술을 농업 현장에 적용하기 위해 노력하고 있습니다.', '프로그래밍을 한 번도 해본 적이 없어도 괜찮다. 파이썬이 무엇인지 몰라도 상관 없다. 《모두의 파이썬》은 어려운 개념과 복잡한 이론 설명은 최대한 줄이고, 초보자가 프로그래밍을 쉽게 배울 수 있도록 짧고 간단한 예제로 내용을 구성했다. 처음부터 모든 것을 다 이해하지 못해도 괜찮다. 프로그램을 따라서 입력하고, 실행 결과를 확인하며, 책에서 알려주는 대로 에러를 수정해 보자. 어느새 파이썬 프로그램으로 멋진 그림을 그리고, 계산을 하고, 간단한 게임을 만들고, 수학 문제를 푸는 자신을 발견하게 될 것이다. 《모두의 파이썬》으로 남녀노소 누구나 즐겁게 프로그래밍을 시작해 보자!\r\n\r\n누구나 20일이면 파이썬 프로그램을 만들 수 있다!\r\n\r\n1~13일: 파이썬 언어 기초 배우기\r\n\r\n초보자도 배우기 쉬운 언어인 파이썬의 기초 문법을 예제로 배운다. 입력 → 결과 확인 → 에러 해결 → 해설 → 응용, ‘5단계 트레이닝’으로 짧은 프로그램을 직접 입력하고 고쳐 보면서 자연스럽게 프로그램을 작성하는 방법을 익힌다.\r\n\r\n14~18일: 간단한 게임 만들기\r\n\r\n앞에서 학습한 파이썬 기능을 이용하여 5가지 게임 프로젝트를 실습한다. 계산 맞히기 게임, 타자 게임, 거북이 대포 게임, 터틀런 1, 2를 만들고 실제로 게임을 플레이해 본다.\r\n\r\n19~20일: 파이썬으로 수학 문제 풀어 보기\r\n\r\n중학교 수준의 간단한 수학 문제를 파이썬 프로그램으로 만들어서 풀어 본다. 수학과 프로그래밍의 연관 관계를 배울 수 있으며 파이썬이 어떻게 활용되는지 알 수 있다.\r\n\r\n 만든 이 코멘트', '프로그래밍을 한 번도 해본 적이 없어도 괜찮다. 파이썬이 무엇인지 몰라도 상관 없다. 《모두의 파이썬》은 어려운 개념과 복잡한 이론 설명은 최대한 줄이고, 초보자가 프로그래밍을 쉽게 배울 수 있도록 짧고 간단한 예제로 내용을 구성했다. 처음부터 모든 것을 다 이해하지 못해도 괜찮다. 프로그램을 따라서 입력하고, 실행 결과를 확인하며, 책에서 알려주는 대로 에러를 수정해 보자. 어느새 파이썬 프로그램으로 멋진 그림을 그리고, 계산을 하고, 간단한 게임을 만들고, 수학 문제를 푸는 자신을 발견하게 될 것이다. 《모두의 파이썬》으로 남녀노소 누구나 즐겁게 프로그래밍을 시작해 보자!\r\n\r\n누구나 20일이면 파이썬 프로그램을 만들 수 있다!\r\n\r\n1~13일: 파이썬 언어 기초 배우기\r\n\r\n초보자도 배우기 쉬운 언어인 파이썬의 기초 문법을 예제로 배운다. 입력 → 결과 확인 → 에러 해결 → 해설 → 응용, ‘5단계 트레이닝’으로 짧은 프로그램을 직접 입력하고 고쳐 보면서 자연스럽게 프로그램을 작성하는 방법을 익힌다.\r\n\r\n14~18일: 간단한 게임 만들기\r\n\r\n앞에서 학습한 파이썬 기능을 이용하여 5가지 게임 프로젝트를 실습한다. 계산 맞히기 게임, 타자 게임, 거북이 대포 게임, 터틀런 1, 2를 만들고 실제로 게임을 플레이해 본다.\r\n\r\n19~20일: 파이썬으로 수학 문제 풀어 보기\r\n\r\n중학교 수준의 간단한 수학 문제를 파이썬 프로그램으로 만들어서 풀어 본다. 수학과 프로그래밍의 연관 관계를 배울 수 있으며 파이썬이 어떻게 활용되는지 알 수 있다.\r\n\r\n 만든 이 코멘트', NULL, '2018-10-16', NULL, 0),
	(397, '컴퓨터와 인터넷', '리액트를 다루는 기술', '김민준', '길벗', 32000, 32000, 1000, '2018-08-01', 688, '9791160505238', 2000, '2018-10-17', 1, '리액트에 대한 기본 지식이 없는 상태에서도 쉽게 이해할 수 있도록 꼼꼼하게 설명되어 있습니다. 또한, 실제 실무에서 어떻게 사용되는지 상세히 알려줍니다.\r\n\r\n\r\n', '애니메이션 스트리밍 서비스를 제공하는 라프텔(laftel.net)에서 프런트엔드 엔지니어로 일하고 있고, 패스트캠퍼스의 리액트로 구현하는 웹 애플리케이션 제작 캠프에서 강의를 하고 있다. 리액트의 빅 팬이고, velopert.com 블로그를 운영하고 있으며, 유튜브에서 매일 밤 라이브 코딩(velopert의 코딩 이야기)을 하고 있다', '리액트에 대한 기본 지식이 없는 상태에서도 쉽게 이해할 수 있도록 꼼꼼하게 설명되어 있습니다. 또한, 실제 실무에서 어떻게 사용되는지 상세히 알려줍니다.\r\n김범준_라프텔(연세대학교) 개발자\r\n\r\n리액트뿐만 아니라 다양한 라이브러리를 필요한 곳에 같이 사용하여 쉽게 배울 수 있었습니다. \r\n정지훈_IOS 앱 개발\r\n\r\n실무에서 약간 응용하여 사용할 수 있는 좋은 예제가 많다. 참고하지 않은 부분이 없을 정도로 내용이 매우 실무적이다.\r\n조용진_스타트업 모두의 캠퍼스 개발자\r\n\r\n문법적인 설명뿐만 아니라 사용하는 개념과 왜 그 개념이 도입될 수밖에 없는지를 이해하는 것이 중요하다고 생각합니다. 이 책은 그 점이 좋았습니다. \r\n신형진_연세대학교 대학원생', '리액트에 대한 기본 지식이 없는 상태에서도 쉽게 이해할 수 있도록 꼼꼼하게 설명되어 있습니다. 또한, 실제 실무에서 어떻게 사용되는지 상세히 알려줍니다.\r\n김범준_라프텔(연세대학교) 개발자\r\n\r\n리액트뿐만 아니라 다양한 라이브러리를 필요한 곳에 같이 사용하여 쉽게 배울 수 있었습니다. \r\n정지훈_IOS 앱 개발\r\n\r\n실무에서 약간 응용하여 사용할 수 있는 좋은 예제가 많다. 참고하지 않은 부분이 없을 정도로 내용이 매우 실무적이다.\r\n조용진_스타트업 모두의 캠퍼스 개발자\r\n\r\n문법적인 설명뿐만 아니라 사용하는 개념과 왜 그 개념이 도입될 수밖에 없는지를 이해하는 것이 중요하다고 생각합니다. 이 책은 그 점이 좋았습니다. \r\n신형진_연세대학교 대학원생', NULL, '2018-10-16', NULL, 0),
	(398, '컴퓨터와 인터넷', 'Try! helloworld 자바스크립트', '김용록', '길벗', 22000, 19800, 1000, '2018-05-22', 336, '9791160504736', 2000, '2018-10-17', 1, '자바스크립트는 문법이 간결하고 프로그램 설치가 간편하여 첫 프로그래밍 언어로 인기가 높다. 또한, 웹 프로그래밍부터 응용 프로그램 개발까지 활용 범위도 넓다. 이 책은 무료 학습 서비스(동영상+온라인 실습)를 제공하는 프로그래머스(programmers.co.kr) 사이트의 인기 강좌 ‘자바스크립트 기초’와 ‘웹 프런트엔드 기초’를 책으로 엮은 것이다. 책의 설명만으로도 학습하는 데 무리가 없지만, 저자 동영상 강의를 함께 보면 학습 효율이 더욱 높아질 것이다. 또한, 배운 내용을 바로 온라인 사이트에서 실습할 수 있다. 하루 한 강, 매일 15분이면 어느새 자바스크립트 프로그래밍에 익숙해진 자신을 발견하게 될 것이다.', '구글코리아에서 소프트웨어 엔지니어로 재직 중이다. 더 좋은 소프트웨어 엔지니어가 되기를 갈망하지만 일과 삶의 균형이 더 중요하다. 겨울에는 주로 스키를 즐긴다.', '언어는 말을 하면서 배워야 빠르고 정확하게 배울 수 있습니다. 프로그래밍 언어도 마찬가지입니다. 실습을 하면서 배워야 빠르고 정확하게 배울 수 있고 비로서 자기 것으로 만들 수 있습니다. 프로그래머스 사이트에서 제공하는 강의와 실습 문제는 자바스크립트를 이해하고 자기 것으로 만드는 데 큰 도움을 줄 것입니다. 기회가 된다면 작은 문제나 원하는 프로젝트를 직접 만들면서 해결해 나가길 권합니다. 프로그래머로 더욱 빠르게 성장할 수 있을 것입니다.--- 「머리말」 중에서', '혼자서 공부하는 \r\n자바스크립트 + 웹 프런트엔드\r\n\r\n# 하루 15분! 자바스크립트 기초부터 웹 프런트엔드까지!\r\n짧은 강의와 실습을 통해 하루 15분이면 누구나 자바스크립트 프로그래밍을 배울 수 있게 구성하였다. 기초 문법을 익힌 후에는 HTML, CSS와 함께 자바스크립트를 활용해 웹 페이지의 다양한 기능을 구현해본다.\r\n\r\n# 5분 동영상, 53개 강의\r\n지하철 안에서, 생활 속 자투리 시간에 틈틈이, 짬짬이 볼 수 있는 동영상 강의 53개를 제공한다(본문에 QR 코드 수록). 초보자도 차근차근 학습할 수 있도록 동영상 강의에서 미처 다루지 못한 내용을 책에 보완하고 실전에 필요한 팁을 추가했다.\r\n\r\n# 코딩 실습 22개 + 정답 수록\r\n배운 내용을 바로 확인하고 점검할 수 있는 실습 문제와 정답을 수록했다. 프로그래머스 사이트(http://programmers.co.kr)에서 직접 코드를 입력하고 실행해보면서 배운 내용을 훈련할 수 있다.', NULL, '2018-10-16', NULL, 0);
/*!40000 ALTER TABLE `t_shopping_goods` ENABLE KEYS */;

-- 테이블 shoppingdb.t_shopping_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_shopping_member` (
  `MEMBER_ID` varchar(20) NOT NULL,
  `MEMBER_PW` varchar(30) NOT NULL,
  `MEMBER_NAME` varchar(50) DEFAULT NULL,
  `MEMBER_GENDER` varchar(10) DEFAULT NULL,
  `TEL1` varchar(20) DEFAULT NULL,
  `TEL2` varchar(20) DEFAULT NULL,
  `TEL3` varchar(20) DEFAULT NULL,
  `HP1` varchar(20) DEFAULT NULL,
  `HP2` varchar(20) DEFAULT NULL,
  `HP3` varchar(20) DEFAULT NULL,
  `SMSSTS_YN` varchar(20) DEFAULT NULL,
  `EMAIL1` varchar(20) DEFAULT NULL,
  `EMAIL2` varchar(20) DEFAULT NULL,
  `EMAILSTS_YN` varchar(20) DEFAULT NULL,
  `ZIPCODE` varchar(20) DEFAULT NULL,
  `ROADADDRESS` varchar(500) DEFAULT NULL,
  `JIBUNADDRESS` varchar(500) DEFAULT NULL,
  `NAMUJIADDRESS` varchar(500) DEFAULT NULL,
  `MEMBER_BIRTH_Y` varchar(20) DEFAULT NULL,
  `MEMBER_BIRTH_M` varchar(20) DEFAULT NULL,
  `MEMBER_BIRTH_D` varchar(20) DEFAULT NULL,
  `MEMBER_BIRTH_GN` varchar(20) DEFAULT NULL,
  `JOINDATE` datetime DEFAULT sysdate(),
  `DEL_YN` varchar(20) DEFAULT 'N',
  PRIMARY KEY (`MEMBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 shoppingdb.t_shopping_member:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_shopping_member` DISABLE KEYS */;
INSERT INTO `t_shopping_member` (`MEMBER_ID`, `MEMBER_PW`, `MEMBER_NAME`, `MEMBER_GENDER`, `TEL1`, `TEL2`, `TEL3`, `HP1`, `HP2`, `HP3`, `SMSSTS_YN`, `EMAIL1`, `EMAIL2`, `EMAILSTS_YN`, `ZIPCODE`, `ROADADDRESS`, `JIBUNADDRESS`, `NAMUJIADDRESS`, `MEMBER_BIRTH_Y`, `MEMBER_BIRTH_M`, `MEMBER_BIRTH_D`, `MEMBER_BIRTH_GN`, `JOINDATE`, `DEL_YN`) VALUES
	('admin', '1212', '어드민', '101', '010', '1234', '1234', '02', '1234', '1234', 'Y', 'admin', 'test.com,non', 'Y', '06253', '서울 강남구 강남대로 298 (역삼동)', '서울 강남구 역삼동 838', '럭키빌딩 101호', '2000', '5', '10', '2', '2018-10-16 00:00:00', 'N'),
	('eee', 'qqqqqq1!', 'qwe', '102', '02', '1234', '1234', '010', '2222', '2222', 'Y', 'dzm2111', 'naver.com', 'Y', '04808', '경기 성남시 분당구 대왕판교로606번길 45 (삼평동)', '경기 성남시 분당구 삼평동 653', '역', '1995', '5', '10', NULL, '2023-01-05 16:39:53', 'N'),
	('lee', '1212', '이병승', '101', '010', '1111', '1111', '02', '1111', '1111', 'Y', 'lee', 'test.com,non', 'Y', '13547', '경기 성남시 분당구 고기로 25 (동원동)', '경기 성남시 분당구 동원동 79-1', '럭키빌딩 101호', '2000', '5', '10', '2', '2018-10-23 00:00:00', 'N'),
	('lee1', 'qqqqqq1!', 'qwe', '101', '02', '1234', '2', '010', '2222', '2222', 'Y', 'dzm2111', 'naver.com', 'Y', '13524', '경기 이천시 아리역로 1 (창전동)', '경기 성남시 분당구 삼평동 653', '역', '2000', '5', '10', NULL, '2023-01-05 16:47:10', 'N'),
	('user1', 'pwd', '유저1', '102', '010', '1111', '1111', '02', '0202', '0202', 'Y', 'user1', 'naver.com,non', 'Y', '12345', '우리집', '좋아', 'ㅎㅇㅎㅇㅎ', '2001', '3', '12', '2', '2022-12-31 13:12:52', 'N'),
	('user2', 'qqqqqq1!', 'asd', '102', '02', '1234', '2134', '010', '1234', '1234', 'Y', 'dzm2111', 'gmail.com', 'Y', '13524', '경기 성남시 분당구 대왕판교로606번길 45 (삼평동)', '경기 성남시 분당구 삼평동 653', '역', '2000', '5', '10', NULL, '2023-01-05 16:28:56', 'N'),
	('user22', 'qqqqqq1!', 'asd', '102', '02', '1234', '1234', '010', '1234', '1234', 'Y', 'dzm2111', 'naver.com', 'Y', '13524', '경기 이천시 아리역로 1 (창전동)', '경기 이천시 창전동 440-3', '역', '1969', '5', '10', NULL, '2023-01-05 16:30:37', 'N'),
	('user222', '111111!q', 'ddd', '102', '02', '1234', '1234', '010', '1432', '2813', 'Y', '수정', 'naver.com', 'Y', '13524', '경기 성남시 분당구 대왕판교로606번길 45 (삼평동)', '경기 성남시 분당구 삼평동 653', '역', '2000', '5', '10', NULL, '2023-01-05 10:55:14', 'N'),
	('user2221', 'qqqqqq1!', 'qwe', '102', '02', '1234', '1234', '010', '2134', '2813', 'Y', 'dzm2111', 'naver.com', 'Y', '13524', '경기 이천시 아리역로 1 (창전동)', '경기 성남시 분당구 삼평동 653', '역', '2000', '5', '10', NULL, '2023-01-05 16:33:54', 'N'),
	('user223', '11', '11222', '102', '02', '1234', '1234', '010', '2134', '2222', 'Y', '100', 'naver.com', 'Y', '13524', '경기 성남시 분당구 대왕판교로606번길 45 (삼평동)', '경기 성남시 분당구 삼평동 653', '역', '2000', '5', '10', NULL, '2023-01-05 10:58:32', 'N'),
	('user29', 'qqqqqq1!', 'dsf', '101', '02', '1234', '1234', '010', '2222', '2222', 'Y', 'dzm2111', 'naver.com', 'Y', 'qw', '서울 송파구 탄천동로 36 (잠실동)', '경기 성남시 분당구 삼평동 653', '232323', '2000', '5', '10', NULL, '2023-01-05 16:54:22', 'N'),
	('user3', 'pwd', 'pwd', '102', '02', '2222', '2222', '010', '1111', '1111', 'Y', 'dzm2111', 'naver.com', 'Y', '12345', '서울 송파구 탄천동로 36 (잠실동)', '경기 성남시 분당구 삼평동 653', '수정됨', '2000', '5', '10', '2', '2023-01-04 17:43:20', 'N'),
	('user31', 'pwd', 'sdf', NULL, '02', '1234', '1234', '010', '1432', '2813', 'Y', 'dzm2111', 'naver.com', 'Y', '13524', '경기 성남시 분당구 대왕판교로606번길 45 (삼평동)', '경기 성남시 분당구 삼평동 653', '역', '2000', '5', '10', NULL, '2023-01-04 17:53:38', 'N'),
	('user312', 'pwd', 'qwe', NULL, '02', '1234', '1234', '010', '2134', '2813', 'Y', 'dzm2111', 'naver.com', 'Y', '13524', '경기 성남시 분당구 대왕판교로606번길 45 (삼평동)', '경기 성남시 분당구 삼평동 653', '역', '2000', '5', '10', NULL, '2023-01-04 18:08:40', 'N'),
	('user333', 'pwd', 'qqq', NULL, '02', '1234', '1234', '010', '2222', '2222', 'Y', '100', 'naver.com', 'Y', '05500', '서울 광진구 자양강변길 7 (자양동)', '서울 송파구 잠실동 1082-1', 'www', '2000', '2', '10', NULL, '2023-01-04 18:03:29', 'N'),
	('user4', 'pwd', 'dsf', '101', '02', '1234', '1234', '010', '2134', '3243', 'Y', '2', 'naver.com', 'Y', '04808', '경기 성남시 분당구 대왕판교로606번길 45 (삼평동)', '경기 성남시 분당구 삼평동 653', '역', '2000', '5', '10', NULL, '2023-01-04 17:47:02', 'N');
/*!40000 ALTER TABLE `t_shopping_member` ENABLE KEYS */;

-- 테이블 shoppingdb.t_shopping_member_backup 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_shopping_member_backup` (
  `MEMBER_ID` varchar(20) NOT NULL,
  `MEMBER_PW` varchar(30) NOT NULL,
  `MEMBER_NAME` varchar(50) DEFAULT NULL,
  `MEMBER_GENDER` varchar(10) DEFAULT NULL,
  `TEL1` varchar(20) DEFAULT NULL,
  `TEL2` varchar(20) DEFAULT NULL,
  `TEL3` varchar(20) DEFAULT NULL,
  `HP1` varchar(20) DEFAULT NULL,
  `HP2` varchar(20) DEFAULT NULL,
  `HP3` varchar(20) DEFAULT NULL,
  `EMAIL1` varchar(20) DEFAULT NULL,
  `EMAIL2` varchar(20) DEFAULT NULL,
  `ZIPCODE` varchar(20) DEFAULT NULL,
  `ROADADDRESS` varchar(500) DEFAULT NULL,
  `JIBUNADDRESS` varchar(500) DEFAULT NULL,
  `NAMUJIADDRESS` varchar(500) DEFAULT NULL,
  `MEMBER_BIRTH_Y` varchar(20) DEFAULT NULL,
  `MEMBER_BIRTH_M` varchar(20) DEFAULT NULL,
  `MEMBER_BIRTH_D` varchar(20) DEFAULT NULL,
  `MEMBER_BIRTH_GN` varchar(20) DEFAULT NULL,
  `DELETE_DATE` datetime DEFAULT sysdate(),
  PRIMARY KEY (`MEMBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 shoppingdb.t_shopping_member_backup:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_shopping_member_backup` DISABLE KEYS */;
INSERT INTO `t_shopping_member_backup` (`MEMBER_ID`, `MEMBER_PW`, `MEMBER_NAME`, `MEMBER_GENDER`, `TEL1`, `TEL2`, `TEL3`, `HP1`, `HP2`, `HP3`, `EMAIL1`, `EMAIL2`, `ZIPCODE`, `ROADADDRESS`, `JIBUNADDRESS`, `NAMUJIADDRESS`, `MEMBER_BIRTH_Y`, `MEMBER_BIRTH_M`, `MEMBER_BIRTH_D`, `MEMBER_BIRTH_GN`, `DELETE_DATE`) VALUES
	('11', 'passwd!7', '11222', NULL, NULL, '222', '222', '010', '2222', '2222', 'tdfdff', 'naver.com', '48060', '부산 해운대구 APEC로 17 (우동)', '부산 해운대구 우동 1514', '232323', '2000', '5', '10', NULL, '2023-01-04 16:53:12'),
	('qre', 'pwd', 'qwe', NULL, '02', 'qwe', 'qwe', '010', 'qwe', 'qwe', '수정', 'naver.com', '13524', 'qwe', 'e', 'e', '2000', '5', '10', NULL, '2023-01-05 16:08:52'),
	('sdf', '111111!q', 'qd', '102', '02', '1234', '1234', '010', '2', '2813', '2', 'naver.com', '13524', 'eqf', 'qef', 'efq', '2000', '5', '10', NULL, '2023-01-05 16:29:50'),
	('user2', 'qqqqqq1!', 'ddd', NULL, '02', '1342', '1234', '010', '2134', '2134', 'dzm2111', 'naver.com', '13524', '경기 이천시 아리역로 1 (창전동)', '경기 성남시 분당구 삼평동 653', '역', '2000', '5', '10', NULL, '2023-01-05 09:55:00'),
	('user33', 'pwd', 'dfas', NULL, '02', '1234', '1234', '010', '2222', '2222', '033', 'naver.com', '13524', '경기 성남시 분당구 대왕판교로606번길 45 (삼평동)', '경기 성남시 분당구 삼평동 653', '역', '2000', '5', '10', NULL, '2023-01-05 09:59:59');
/*!40000 ALTER TABLE `t_shopping_member_backup` ENABLE KEYS */;

-- 테이블 shoppingdb.t_shopping_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_shopping_order` (
  `ORDER_SEQ_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int(11) DEFAULT NULL,
  `MEMBER_ID` varchar(20) DEFAULT NULL,
  `GOODS_ID` int(11) DEFAULT NULL,
  `ORDERER_NAME` varchar(50) DEFAULT NULL,
  `GOODS_TITLE` varchar(100) DEFAULT NULL,
  `ORDER_GOODS_QTY` int(11) DEFAULT NULL,
  `GOODS_SALES_PRICE` int(11) DEFAULT NULL,
  `GOODS_FILENAME` varchar(60) DEFAULT NULL,
  `RECEIVER_NAME` varchar(50) DEFAULT NULL,
  `RECEIVER_HP1` varchar(20) DEFAULT NULL,
  `RECEIVER_HP2` varchar(20) DEFAULT NULL,
  `RECEIVER_HP3` varchar(20) DEFAULT NULL,
  `RECEIVER_TEL1` varchar(20) DEFAULT NULL,
  `RECEIVER_TEL2` varchar(20) DEFAULT NULL,
  `RECEIVER_TEL3` varchar(20) DEFAULT NULL,
  `DELIVERY_ADDRESS` varchar(500) DEFAULT NULL,
  `DELIVERY_METHOD` varchar(40) DEFAULT NULL,
  `DELIVERY_MESSAGE` varchar(300) DEFAULT NULL,
  `GIFT_WRAPPING` varchar(20) DEFAULT NULL,
  `PAY_METHOD` varchar(200) DEFAULT NULL,
  `CARD_COM_NAME` varchar(50) DEFAULT NULL,
  `CARD_PAY_MONTH` varchar(20) DEFAULT NULL,
  `PAY_ORDERER_HP_NUM` varchar(20) DEFAULT NULL,
  `DELIVERY_STATE` int(11) DEFAULT 7,
  `PAY_ORDER_TIME` date DEFAULT current_timestamp(),
  `ORDERER_HP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ORDER_SEQ_NUM`),
  KEY `FK_t_shopping_order_t_shopping_goods` (`GOODS_ID`),
  KEY `FK_t_shopping_order_t_shopping_member` (`MEMBER_ID`),
  CONSTRAINT `FK_t_shopping_order_t_shopping_goods` FOREIGN KEY (`GOODS_ID`) REFERENCES `t_shopping_goods` (`GOODS_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_t_shopping_order_t_shopping_member` FOREIGN KEY (`MEMBER_ID`) REFERENCES `t_shopping_member` (`MEMBER_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 shoppingdb.t_shopping_order:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_shopping_order` DISABLE KEYS */;
INSERT INTO `t_shopping_order` (`ORDER_SEQ_NUM`, `ORDER_ID`, `MEMBER_ID`, `GOODS_ID`, `ORDERER_NAME`, `GOODS_TITLE`, `ORDER_GOODS_QTY`, `GOODS_SALES_PRICE`, `GOODS_FILENAME`, `RECEIVER_NAME`, `RECEIVER_HP1`, `RECEIVER_HP2`, `RECEIVER_HP3`, `RECEIVER_TEL1`, `RECEIVER_TEL2`, `RECEIVER_TEL3`, `DELIVERY_ADDRESS`, `DELIVERY_METHOD`, `DELIVERY_MESSAGE`, `GIFT_WRAPPING`, `PAY_METHOD`, `CARD_COM_NAME`, `CARD_PAY_MONTH`, `PAY_ORDERER_HP_NUM`, `DELIVERY_STATE`, `PAY_ORDER_TIME`, `ORDERER_HP`) VALUES
	(88, 92, 'user3', 344, '이병승', '초보자를 위한 자바프로그래밍', 1, 30000, 'image1.jpg', '이병승', '010', '2222', '3333', '02', '1111', '2222', '우편번호:13547<br>도로명 주소:경기 성남시 분당구 고기로 25 (동원동)<br>[지번 주소:경기 성남시 분당구 동원동 79-1]<br>럭키빌딩 101호', '일반택배', NULL, 'no', '신용카드<Br>카드사:삼성<br>할부개월수:일시불', '삼성', '일시불', '해당없음', 10, '2018-10-23', '010-2222-3333'),
	(89, 93, 'user3', 354, '이병승', '모두의 딥러닝', 1, 21600, '모두의 딥러닝_메인.jpg', '이병승', '010', '2222', '3333', '02', '1111', '2222', '우편번호:13547<br>도로명 주소:경기 성남시 분당구 고기로 25 (동원동)<br>[지번 주소:경기 성남시 분당구 동원동 79-1]<br>럭키빌딩 101호', '일반택배', NULL, 'no', '신용카드<Br>카드사:삼성<br>할부개월수:일시불', '삼성', '일시불', '해당없음', 8, '2018-10-23', '010-2222-3333'),
	(90, 94, 'user3', 354, '이병승', '모두의 딥러닝', 1, 21600, '모두의 딥러닝_메인.jpg', '이병승', '010', '2222', '3333', '02', '1111', '2222', '우편번호:13547<br>도로명 주소:경기 성남시 분당구 고기로 25 (동원동)<br>[지번 주소:경기 성남시 분당구 동원동 79-1]<br>럭키빌딩 101호', '일반택배', NULL, 'no', '신용카드<Br>카드사:삼성<br>할부개월수:일시불', '삼성', '일시불', '해당없음', 10, '2018-10-27', '010-2222-3333');
/*!40000 ALTER TABLE `t_shopping_order` ENABLE KEYS */;

-- 테이블 shoppingdb.t_shopping_order_backup 구조 내보내기
CREATE TABLE IF NOT EXISTS `t_shopping_order_backup` (
  `ORDER_SEQ_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` int(11) DEFAULT NULL,
  `MEMBER_ID` varchar(20) DEFAULT NULL,
  `GOODS_ID` int(11) DEFAULT NULL,
  `ORDERER_NAME` varchar(50) DEFAULT NULL,
  `GOODS_TITLE` varchar(100) DEFAULT NULL,
  `ORDER_GOODS_QTY` int(11) DEFAULT NULL,
  `GOODS_SALES_PRICE` int(11) DEFAULT NULL,
  `GOODS_FILENAME` varchar(60) DEFAULT NULL,
  `RECEIVER_NAME` varchar(50) DEFAULT NULL,
  `RECEIVER_HP1` varchar(20) DEFAULT NULL,
  `RECEIVER_HP2` varchar(20) DEFAULT NULL,
  `RECEIVER_HP3` varchar(20) DEFAULT NULL,
  `RECEIVER_TEL1` varchar(20) DEFAULT NULL,
  `RECEIVER_TEL2` varchar(20) DEFAULT NULL,
  `RECEIVER_TEL3` varchar(20) DEFAULT NULL,
  `DELIVERY_ADDRESS` varchar(500) DEFAULT NULL,
  `DELIVERY_METHOD` varchar(40) DEFAULT NULL,
  `DELIVERY_MESSAGE` varchar(300) DEFAULT NULL,
  `GIFT_WRAPPING` varchar(20) DEFAULT NULL,
  `PAY_METHOD` varchar(200) DEFAULT NULL,
  `CARD_COM_NAME` varchar(50) DEFAULT NULL,
  `CARD_PAY_MONTH` varchar(20) DEFAULT NULL,
  `PAY_ORDERER_HP_NUM` varchar(20) DEFAULT NULL,
  `DELETE_DATE` date DEFAULT current_timestamp(),
  `ORDERER_HP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ORDER_SEQ_NUM`),
  KEY `FK_t_shopping_order_t_shopping_goods` (`GOODS_ID`),
  KEY `FK_t_shopping_order_t_shopping_member` (`MEMBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 shoppingdb.t_shopping_order_backup:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `t_shopping_order_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_shopping_order_backup` ENABLE KEYS */;

-- 트리거 shoppingdb.t_shopping_member_trigger 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_shopping_member_trigger` AFTER DELETE ON `t_shopping_member` FOR EACH ROW BEGIN
INSERT INTO t_shopping_member_backup(MEMBER_ID, MEMBER_PW, MEMBER_NAME , MEMBER_GENDER, TEL1, TEL2, TEL3, HP1, HP2, HP3, EMAIL1, EMAIL2
, ZIPCODE, ROADADDRESS, JIBUNADDRESS, NAMUJIADDRESS,  MEMBER_BIRTH_Y, MEMBER_BIRTH_M, MEMBER_BIRTH_D, MEMBER_BIRTH_GN, DELETE_DATE)
VALUES(OLD.MEMBER_ID, OLD.MEMBER_PW, OLD.MEMBER_NAME ,OLD.MEMBER_GENDER, OLD.TEL1, OLD.TEL2, OLD.TEL3, OLD.HP1, OLD.HP2, OLD.HP3, OLD.EMAIL1, OLD.EMAIL2
, OLD.ZIPCODE, OLD.ROADADDRESS, OLD.JIBUNADDRESS, OLD.NAMUJIADDRESS, OLD.MEMBER_BIRTH_Y, OLD.MEMBER_BIRTH_M, OLD.MEMBER_BIRTH_D, OLD.MEMBER_BIRTH_GN, now());

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 shoppingdb.t_shopping_order_trigger 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `t_shopping_order_trigger` AFTER DELETE ON `t_shopping_order` FOR EACH ROW BEGIN
INSERT INTO t_shopping_order_backup(ORDER_ID,MEMBER_ID,GOODS_ID,ORDERER_NAME,GOODS_TITLE
,ORDER_GOODS_QTY, GOODS_SALES_PRICE, GOODS_FILENAME, RECEIVER_NAME, RECEIVER_HP1,RECEIVER_HP2
,RECEIVER_HP3,RECEIVER_TEL1, RECEIVER_TEL2,RECEIVER_TEL3,DELIVERY_ADDRESS, DELIVERY_METHOD,DELIVERY_MESSAGE
,GIFT_WRAPPING,PAY_METHOD,CARD_COM_NAME, CARD_PAY_MONTH, PAY_ORDERER_HP_NUM
,DELETE_DATE,ORDERER_HP) 
VALUES(OLD.ORDER_ID,OLD.MEMBER_ID,OLD.GOODS_ID,OLD.ORDERER_NAME,OLD.GOODS_TITLE
,OLD.ORDER_GOODS_QTY, OLD.GOODS_SALES_PRICE, OLD.GOODS_FILENAME, OLD.RECEIVER_NAME, OLD.RECEIVER_HP1,OLD.RECEIVER_HP2
,OLD.RECEIVER_HP3,OLD.RECEIVER_TEL1, OLD.RECEIVER_TEL2,OLD.RECEIVER_TEL3,OLD.DELIVERY_ADDRESS, OLD.DELIVERY_METHOD,OLD.DELIVERY_MESSAGE
,OLD.GIFT_WRAPPING,OLD.PAY_METHOD,OLD.CARD_COM_NAME, OLD.CARD_PAY_MONTH, OLD.PAY_ORDERER_HP_NUM
,now(),OLD.ORDERER_HP);

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
