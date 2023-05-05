package com.bobo.service;

import com.bobo.pojo.BasicData;

import java.util.List;

/**
 * 角色信息
 */
public interface IBasicService {

    /**
     * 根据条件查询基础数据信息
     * @param data
     * @return
     */
    List<BasicData> query(BasicData data) throws Exception;

    BasicData queryById(Integer id) throws Exception;

    /**
     * 添加基础数据信息
     * @param data
     * @return
     */
    Integer addBasicData(BasicData data) throws Exception;

    /**
     * 更新基础数据
     * @param data
     * @return
     */
    Integer updateBasicData(BasicData data) throws Exception;

    /**
     * 查询出所有的大类数据
     * @return
     * @throws Exception
     */
    List<BasicData> queryAllParentData() throws  Exception;

    /**
     * 根据编号删除基础数据
     * @param id
     * @return
     */
    Integer deleteBasicData(Integer id) throws Exception;

    List<BasicData> queryByParentName(String parentName) throws Exception;
}
