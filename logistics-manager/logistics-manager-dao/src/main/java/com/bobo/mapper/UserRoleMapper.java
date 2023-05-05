package com.bobo.mapper;

import com.bobo.pojo.UserRoleExample;
import com.bobo.pojo.UserRoleKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserRoleMapper {
    int countByExample(UserRoleExample example);

    int deleteByExample(UserRoleExample example);

    int deleteByPrimaryKey(UserRoleKey key);

    int insert(UserRoleKey record);

    int insertSelective(UserRoleKey record);

    List<UserRoleKey> selectByExample(UserRoleExample example);

    int updateByExampleSelective(@Param("record") UserRoleKey record, @Param("example") UserRoleExample example);

    int updateByExample(@Param("record") UserRoleKey record, @Param("example") UserRoleExample example);
}