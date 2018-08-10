package com.hxjc.hxyc.mapper;

import com.hxjc.core.utils.DataSource;
import com.hxjc.hxyc.model.Post;

@DataSource(value="dataSourceHxyc")
public interface PostMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKey(Post record);
}