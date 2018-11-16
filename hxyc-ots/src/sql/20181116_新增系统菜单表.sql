CREATE TABLE `t_sys_menu` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `menu_code` varchar(30) NOT NULL COMMENT '模板编码',
  `menu_name` varchar(40) NOT NULL COMMENT '模板名称',
  `parent_code` varchar(30) DEFAULT NULL COMMENT '父菜单',
  `url` varchar(40) DEFAULT NULL COMMENT '菜单URL',
  `level` varchar(8) DEFAULT '1' COMMENT '菜单级别 1 系统 2 菜单目录 3 菜单功能 4 菜单功能',
  `menu_class` varchar(20) DEFAULT NULL COMMENT '菜单样式',
  `function_type` varchar(11) DEFAULT NULL COMMENT '按钮功能 0 通用控制 1 按钮 2 图标按钮',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `title` varchar(40) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '状态 1 有效 0 无效 默认有效',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `create_by` varchar(30) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日期',
  `update_by` varchar(30) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `AK_Key_1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COMMENT='菜单表';