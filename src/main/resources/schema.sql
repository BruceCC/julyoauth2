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

DROP TABLE IF EXISTS `oauth_client_token`;

CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` varchar(1024) DEFAULT NULL,
  `authentication_id` varchar(256) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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


DROP TABLE IF EXISTS `oauth_refresh_token`;

CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` varchar(1024) DEFAULT NULL,
  `authentication` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `oauth_code`;

CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL,
  `authentication` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `oauth_approvals`;

CREATE TABLE `oauth_approvals` (
  `userId` varchar(256) DEFAULT NULL,
  `clientId` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `clientdetails`;

-- customized oauth_client_details table
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


DROP TABLE IF EXISTS `july_sequence`;

CREATE TABLE `july_sequence` (
`seq_name`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '序列名称' ,
`min_val`  bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最小值' ,
`max_val`  bigint(20) UNSIGNED NOT NULL DEFAULT 9999999999999999999 COMMENT '最大值' ,
`current_val`  bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '当前值' ,
`increment_val`  int(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '增长间隔' ,
PRIMARY KEY (`seq_name`),
UNIQUE INDEX `seq_name` (`seq_name`) USING BTREE
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=DYNAMIC
;

DROP FUNCTION IF EXISTS `curr_seq_val`;

CREATE DEFINER = CURRENT_USER FUNCTION `curr_seq_val`(`v_seq_name` varchar(128))
 RETURNS varchar(2048)  CHARSET utf8
BEGIN
	DECLARE r_current_val BIGINT;
	DECLARE r_max_val BIGINT;
	set r_current_val=0;
	set r_max_val=0;
	SELECT t.current_val, t.max_val from july_sequence t where t.seq_name=v_seq_name
	into r_current_val, r_max_val;


	RETURN LPAD(r_current_val,LENGTH(r_max_val),'0');
END;

DROP FUNCTION IF EXISTS `next_seq_val`;

CREATE DEFINER = CURRENT_USER FUNCTION `next_seq_val`(`v_seq_name` varchar(128))
 RETURNS varchar(2048)  CHARSET utf8
BEGIN
	update july_sequence t set t.current_val = t.current_val + t.increment_val  where t.seq_name = v_seq_name;
	return curr_seq_val(v_seq_name);
END;

DROP TRIGGER IF EXISTS `july_seq_trigger`;

CREATE DEFINER=`leave`@`%` TRIGGER `july_seq_trigger` BEFORE INSERT ON `user_login_info`
FOR EACH ROW BEGIN
set NEW.current_val = next_seq_val('s2');
set NEW.current_val = next_seq_val('seq_test');
END;


CREATE TABLE `user_identity_info` (
`user_id`  varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID' ,
`mobile`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`username`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`email`  varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
`password`  varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`user_id`),
UNIQUE INDEX `user_id` (`user_id`) USING BTREE ,
UNIQUE INDEX `login_name` (`username`) USING BTREE ,
UNIQUE INDEX `login_mobile` (`mobile`) USING BTREE ,
UNIQUE INDEX `login_email` (`email`) USING BTREE
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
ROW_FORMAT=DYNAMIC
;
<<<<<<< HEAD


CREATE TABLE `user_identity_info` (
  `user_id` varchar(128) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(256) NOT NULL,
  `state` char(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `index_user_id` (`user_id`),
  UNIQUE KEY `index_mobile` (`mobile`),
  UNIQUE KEY `index_username` (`username`),
  KEY `index_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
=======
>>>>>>> e8670d100ec6d476ac2145921b03b6bfbcb1c54d
