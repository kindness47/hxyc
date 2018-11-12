#新增专项人员4个字段
ALTER TABLE `t_project`
ADD COLUMN `project_assistant`  varchar(100) NULL COMMENT '项目专员' AFTER `interest_rate`,
ADD COLUMN `operate_assistant`  varchar(100) NULL COMMENT '运营专员' AFTER `project_assistant`,
ADD COLUMN `settlement_assistant`  varchar(100) NULL COMMENT '结算专员' AFTER `operate_assistant`,
ADD COLUMN `finance_assistant`  varchar(100) NULL COMMENT '财务专员' AFTER `settlement_assistant`;