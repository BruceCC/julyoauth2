/*
Navicat MySQL Data Transfer

Source Server         : demo
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : julyoauth

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-07-01 17:38:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for authority_info
-- ----------------------------
DROP TABLE IF EXISTS `authority_info`;
CREATE TABLE `authority_info` (
  `authority_id` varchar(6) NOT NULL DEFAULT '' COMMENT '权限ID',
  `authority_name` varchar(255) NOT NULL COMMENT '权限名称',
  `authority_desc` varchar(255) NOT NULL COMMENT '权限描述',
  PRIMARY KEY (`authority_id`),
  UNIQUE KEY `authority_id` (`authority_id`),
  UNIQUE KEY `authority_name` (`authority_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of authority_info
-- ----------------------------

-- ----------------------------
-- Table structure for clientdetails
-- ----------------------------
DROP TABLE IF EXISTS `clientdetails`;
CREATE TABLE `clientdetails` (
  `appId` varchar(256) NOT NULL,
  `resourceIds` varchar(256) DEFAULT NULL,
  `appSecret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `grantTypes` varchar(256) DEFAULT NULL,
  `redirectUrl` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additionalInformation` varchar(4096) DEFAULT NULL,
  `autoApproveScopes` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`appId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clientdetails
-- ----------------------------

-- ----------------------------
-- Table structure for july_sequence
-- ----------------------------
DROP TABLE IF EXISTS `july_sequence`;
CREATE TABLE `july_sequence` (
  `seq_name` varchar(128) NOT NULL COMMENT '序列名称',
  `min_val` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '最小值',
  `max_val` bigint(20) unsigned NOT NULL DEFAULT '9999999999999999999' COMMENT '最大值',
  `current_val` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '当前值',
  `increment_val` int(4) unsigned NOT NULL DEFAULT '1' COMMENT '增长间隔',
  PRIMARY KEY (`seq_name`),
  UNIQUE KEY `seq_name` (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sequence表';

-- ----------------------------
-- Records of july_sequence
-- ----------------------------
INSERT INTO `july_sequence` VALUES ('s2', '1', '9999', '10002', '1');
INSERT INTO `july_sequence` VALUES ('seq_test', '1', '9999999999999999999', '0', '1');
INSERT INTO `july_sequence` VALUES ('seq_user_id', '1', '999999999999', '1', '1');

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` varchar(1024) DEFAULT NULL,
  `authentication_id` varchar(256) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` varchar(1024) DEFAULT NULL,
  `refresh_token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals` (
  `userId` varchar(256) DEFAULT NULL,
  `clientId` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_approvals
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` varchar(1024) DEFAULT NULL,
  `authentication_id` varchar(256) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_client_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL,
  `authentication` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` varchar(1024) DEFAULT NULL,
  `authentication` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` varchar(6) NOT NULL COMMENT '角色ID',
  `role_name` varchar(255) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(255) NOT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id` (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of role_info
-- ----------------------------

-- ----------------------------
-- Table structure for user_identity_info
-- ----------------------------
DROP TABLE IF EXISTS `user_identity_info`;
CREATE TABLE `user_identity_info` (
  `user_id` varchar(12) NOT NULL COMMENT '用户ID',
  `mobile` varchar(11) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(256) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '0' COMMENT '0-激活\r\n1-锁定\r\n2-冻结\r\n3-注销',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `login_name` (`username`),
  UNIQUE KEY `login_mobile` (`mobile`),
  UNIQUE KEY `login_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户身份信息表';

-- ----------------------------
-- Records of user_identity_info
-- ----------------------------
INSERT INTO `user_identity_info` VALUES ('000000000001', '15623039901', 'zz', '1144575380@qq.com', '123456', '0');

-- ----------------------------
-- Table structure for user_role_rela
-- ----------------------------
DROP TABLE IF EXISTS `user_role_rela`;
CREATE TABLE `user_role_rela` (
  `user_id` varchar(12) NOT NULL COMMENT '用户ID',
  `role_id` varchar(6) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `user_role` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role_rela
-- ----------------------------

-- ----------------------------
-- Function structure for curr_seq_val
-- ----------------------------
DROP FUNCTION IF EXISTS `curr_seq_val`;
DELIMITER ;;
CREATE DEFINER=`leave`@`%` FUNCTION `curr_seq_val`(`v_seq_name` varchar(128)) RETURNS varchar(2048) CHARSET utf8
BEGIN
	DECLARE r_current_val BIGINT;
	DECLARE r_max_val BIGINT;
	set r_current_val=0;
	set r_max_val=0;
	SELECT t.current_val, t.max_val from july_sequence t where t.seq_name=v_seq_name
	into r_current_val, r_max_val;
	

	RETURN LPAD(r_current_val,LENGTH(r_max_val),'0');
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for next_seq_val
-- ----------------------------
DROP FUNCTION IF EXISTS `next_seq_val`;
DELIMITER ;;
CREATE DEFINER=`leave`@`%` FUNCTION `next_seq_val`(`v_seq_name` varchar(128)) RETURNS varchar(2048) CHARSET utf8
BEGIN
	update july_sequence t set t.current_val = t.current_val + t.increment_val  where t.seq_name = v_seq_name;
	return curr_seq_val(v_seq_name);
END
;;
DELIMITER ;
