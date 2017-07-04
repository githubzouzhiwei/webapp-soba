/*
Navicat MySQL Data Transfer

Source Server         : 192.168.146.130
Source Server Version : 50718
Source Host           : 192.168.146.130:3306
Source Database       : search

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-06-05 17:55:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE t_article ADD COLUMN content_text text COLLATE utf8mb4_unicode_ci COMMENT '纯文本内容';
ALTER TABLE t_article ADD COLUMN status int(11) DEFAULT NULL COMMENT '状态 -1：删除 1：正常';
ALTER TABLE t_article ADD COLUMN create_at datetime DEFAULT NULL COMMENT '创建时间';
ALTER TABLE t_article ADD COLUMN update_at datetime DEFAULT NULL COMMENT '更新时间';

-- 修改内容子段类型
ALTER TABLE t_article MODIFY content longtext;
