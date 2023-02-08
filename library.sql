CREATE DATABASE library;
USE library;

SET NAMES utf8;
START TRANSACTION;
CREATE TABLE `admin` ( `admin_id` BIGINT NOT NULL PRIMARY KEY, `password` VARCHAR ( 15 ) NOT NULL, `username` VARCHAR ( 15 ) DEFAULT NULL ) ENGINE = INNODB DEFAULT CHARSET = utf8;
INSERT INTO `admin`
VALUES
	( 123456, '123456', 'admin' );
CREATE TABLE `book_info` (
	`book_id` BIGINT NOT NULL PRIMARY KEY,
	`name` VARCHAR ( 20 ) NOT NULL,
	`author` VARCHAR ( 15 ) NOT NULL,
	`publish` VARCHAR ( 20 ) NOT NULL,
	`ISBN` VARCHAR ( 15 ) NOT NULL,
	`introduction` text,
	`language` VARCHAR ( 4 ) NOT NULL,
	`price` DECIMAL ( 10, 2 ) NOT NULL,
	`pub_date` date NOT NULL,
	`class_id` INT DEFAULT NULL,
	`number` INT DEFAULT NULL 
) ENGINE = INNODB DEFAULT CHARSET = utf8;
ALTER TABLE `book_info` MODIFY `book_id` BIGINT NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 1;
INSERT INTO `book_info`
VALUES
	( 1, '経営学入門「上」', '榊原 清則', '日経文庫', '9784532112820', '概要：default', '日本語', '860', '2013-04-15', 7, 10 ),
	( 2, 'マクルーハンの光景　メディア論がみえる', '宮澤 淳一', 'みすず書房', '9784622083283', '概要：default', '日本語', '1600', '2008-02-18', 2, 31 ),
	( 3, '現代文化論', '吉見 俊哉', '有斐閣アルマ', '9784641220768', '概要：default', '日本語', '2000', '2018-11-05', 2, 16 ),
	( 4, 'ライブカルチャーの教科書　音楽から読み解く現代社会', '宮入恭平', '青弓社', '9784787274229', '概要：default', '日本語', '2000', '2019-07-29', 5, 15 );
CREATE TABLE `class_info` ( `class_id` INT NOT NULL PRIMARY KEY, `class_name` VARCHAR ( 15 ) NOT NULL ) ENGINE = INNODB DEFAULT CHARSET = utf8;
INSERT INTO `class_info`
VALUES
	( 1, '数学' ),
	( 2, '社会科学' ),
	( 3, '大気科学' ),
	( 4, '政治法律' ),
	( 5, '音楽' ),
	( 6, '芸術' ),
	( 7, '経営学' ),
	( 8, '言語' ),
	( 9, '文学' ),
	( 10, '歴史' ),
	( 11, '自然科学' ),
	( 12, '物理' ),
	( 13, '化学' ),
	( 14, '地球科学' ),
	( 15, '生物科学' ),
	( 16, '医学' ),
	( 17, '農学' ),
	( 18, '工業' ),
	( 19, '交通運輸' ),
	( 20, '航空' ),
	( 21, '環境科学' ),
	( 22, '総合' ),
	( 23, '小説' );
CREATE TABLE `lend_list` (
	`ser_num` BIGINT NOT NULL PRIMARY KEY,
	`book_id` BIGINT NOT NULL,
	`reader_id` BIGINT NOT NULL,
	`lend_date` date DEFAULT NULL,
	`back_date` date DEFAULT NULL 
) ENGINE = INNODB DEFAULT CHARSET = utf8;
ALTER TABLE `lend_list` MODIFY `ser_num` BIGINT NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 1;
INSERT INTO `lend_list`
VALUES
	( 1, 1, 10000, '2020-03-15', '2020-06-16' ),
	( 2, 2, 10001, '2020-06-10', '2020-09-02' ),
	( 3, 3, 10002, '2020-06-12', '2020-09-02' ),
	( 4, 4, 10000, '2020-03-15', '2020-09-03' ),
	( 5, 5, 10002, '2020-06-15', NULL ),
	( 6, 6, 10000, '2020-06-15', NULL ),
	( 7, 1, 10001, '2020-09-02', '2020-09-02' );
CREATE TABLE `reader_info` (
	`reader_id` BIGINT NOT NULL PRIMARY KEY,
	`name` VARCHAR ( 10 ) NOT NULL,
	`sex` VARCHAR ( 2 ) NOT NULL,
	`birth` date NOT NULL,
	`address` VARCHAR ( 50 ) NOT NULL,
	`phone` VARCHAR ( 15 ) NOT NULL 
) ENGINE = INNODB DEFAULT CHARSET = utf8;
ALTER TABLE `reader_info` MODIFY `reader_id` BIGINT NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 10000;
INSERT INTO `reader_info` ( NAME, sex, birth, address, phone )
VALUES
	( '花子', '女', '1995-06-10', '東京都', '12345678900' ),
	( '太郎', '男', '1996-02-01', '神奈川県', '12345678909' ),
	( '三郎', '男', '1996-05-03', '埼玉県', '15369874123' );
CREATE TABLE `reader_card` ( `reader_id` BIGINT NOT NULL PRIMARY KEY, `username` VARCHAR ( 15 ) NOT NULL, `password` VARCHAR ( 15 ) NOT NULL ) ENGINE = INNODB DEFAULT CHARSET = utf8;
INSERT INTO `reader_card`
VALUES
	( 10000, '花子', '123456' ),
	( 10001, '太郎', '123456' ),
	( 10002, '三郎', '123456' );
COMMIT;