ALTER TABLE `t_settlement` ADD COLUMN `settlement_mode_id` VARCHAR(32) DEFAULT NULL COMMENT '结算模式对应的id' AFTER	`settlement_amount`;
ALTER TABLE `t_settlement` ADD COLUMN `supplier_settle_amount` DOUBLE DEFAULT NULL COMMENT '供方结算金额' AFTER `settlement_mode_id`;
ALTER TABLE `t_settlement` ADD COLUMN `balance_of_settlement` DOUBLE DEFAULT NULL COMMENT '结算后对应模式的余额' AFTER `supplier_settle_amount`;
