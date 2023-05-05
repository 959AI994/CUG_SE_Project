package com.bobo.mapper;

import com.bobo.pojo.BasicData;
import com.bobo.pojo.BasicDataExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BasicDataMapper {
    int countByExample(BasicDataExample example);

    int deleteByExample(BasicDataExample example);

    int deleteByPrimaryKey(Integer baseId);

    int insert(BasicData record);

    int insertSelective(BasicData record);

    List<BasicData> selectByExample(BasicDataExample example);

    BasicData selectByPrimaryKey(Integer baseId);

    int updateByExampleSelective(@Param("record") BasicData record, @Param("example") BasicDataExample example);

    int updateByExample(@Param("record") BasicData record, @Param("example") BasicDataExample example);

    int updateByPrimaryKeySelective(BasicData record);

    int updateByPrimaryKey(BasicData record);
}