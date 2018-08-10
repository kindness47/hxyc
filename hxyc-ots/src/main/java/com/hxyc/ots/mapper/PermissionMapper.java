package com.hxyc.ots.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxyc.ots.model.Permission;

import java.util.List;

@DataSource(value="dataSourceOts")
public interface PermissionMapper {
    int deleteByPrimaryKey(String id);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);

    /**
     * 功能描述: 删除用户现有权限
     * @Auther: 于金谷
     * @Date create in 2018/7/30 14:32
     */
    int deleteByUserId(String userId);

    /**
     * 功能描述: 批量插入用户权限
     * @Auther: 于金谷
     * @Date create in 2018/7/30 14:32
     */
    void insertPermissionBatch(List<Permission> permissions);

    /**
     * 功能描述:获取用户权限
     * @Auther: 于金谷
     * @Date create in 2018/7/30 15:44
     */
    List<Permission> getPermissionsByUserId(String userId);
}