DROP TABLE IF EXISTS `t_sys_logs`;
CREATE TABLE `t_sys_logs` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_name` varchar(60) DEFAULT NULL COMMENT '登录用户名',
  `login_account` varchar(60) DEFAULT NULL COMMENT '登录账号',
  `ip` varchar(60) DEFAULT NULL COMMENT '登录Mac地址',
  `login_mac` varchar(60) DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `logout_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(2) DEFAULT '1' COMMENT '记录状态 0 无效 1 有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
