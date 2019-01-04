DROP TABLE IF EXISTS `t_sys_module`;
CREATE TABLE `t_sys_module` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `module_code` varchar(2) DEFAULT NULL COMMENT '系统编码',
  `module_name` varchar(40) NOT NULL COMMENT '系统名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT '1' COMMENT '状态 1 有效 0 无效 默认有效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `create_by` varchar(40) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  `update_by` varchar(40) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `AK_Key_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='系统模块';

-- ----------------------------
-- Records of t_sys_module
-- ----------------------------
INSERT INTO `t_sys_module` VALUES ('5', '01', '订单跟踪', '1', '1', '2018-10-29 16:43:34', 'joyu', '2018-10-29 16:43:34', null);
INSERT INTO `t_sys_module` VALUES ('6', '02', '商城', '2', '1', '2018-10-29 16:43:58', 'joyu', '2018-10-29 16:43:58', null);
INSERT INTO `t_sys_module` VALUES ('7', '03', '流程管理', '3', '1', '2018-10-29 16:44:30', 'joyu', '2018-10-29 16:44:29', null);
INSERT INTO `t_sys_module` VALUES ('8', '04', '系统管理', '4', '1', '2018-10-29 16:44:44', 'joyu', '2018-10-31 09:31:03', 'joyu');
