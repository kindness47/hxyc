
ALTER TABLE `t_project`
ADD COLUMN `is_completion` TINYINT(4) DEFAULT '0' COMMENT '是否竣工' AFTER `update_time`;