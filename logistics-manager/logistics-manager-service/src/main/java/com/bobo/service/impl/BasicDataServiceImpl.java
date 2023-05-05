package com.bobo.service.impl;

import com.bobo.mapper.BasicDataMapper;
import com.bobo.pojo.BasicData;
import com.bobo.pojo.BasicDataExample;
import com.bobo.service.IBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BasicDataServiceImpl implements IBasicService {

    @Autowired
    private BasicDataMapper mapper;

    @Override
    public List<BasicData> query(BasicData data) throws Exception {
        BasicDataExample example = new BasicDataExample();
        BasicDataExample.Criteria criteria = example.createCriteria();
        if(data != null){
            if(data.getBaseName() != null && !"".equals(data.getBaseName())){
                criteria.andBaseNameEqualTo(data.getBaseName());
            }
            if(data.getParentId() != null && data.getParentId() > 0){
                criteria.andParentIdEqualTo(data.getParentId());
            }
        }
        return mapper.selectByExample(example);
    }

    @Override
    public BasicData queryById(Integer id) throws Exception {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer addBasicData(BasicData data) throws Exception {
        if(data.getParentId() != null && data.getParentId() == -1){
            // parentId==null 为大类
            data.setParentId(null);
        }
        return mapper.insertSelective(data);
    }

    @Override
    public Integer updateBasicData(BasicData data) throws Exception {
        if(data.getParentId()!= null && data.getParentId() == -1){
            // data = this.queryById(data.getBaseId());
            data.setParentId(null);
        }
        return mapper.updateByPrimaryKey(data);
    }

    @Override
    public List<BasicData> queryAllParentData() throws Exception {
        BasicDataExample example = new BasicDataExample();
        example.createCriteria().andParentIdIsNull();
        return mapper.selectByExample(example);
    }

    @Override
    public Integer deleteBasicData(Integer id) throws Exception {
        return mapper.deleteByPrimaryKey(id);
    }




    /**
     * 根据父类名称获取对应的 子类信息
     * @param parentName
     * @return
     */
    @Override
    public List<BasicData> queryByParentName(String parentName) throws Exception{
        // 根据名称找到数据
        BasicData data = new BasicData();
        data.setBaseName(parentName);
        // 常用区间 对应的 基础数据
        List<BasicData> datas = this.query(data);
        if(datas != null && datas.size() > 0){
            BasicData bd = datas.get(0);
            BasicData newBd = new BasicData();
            newBd.setParentId(bd.getBaseId());
            List<BasicData> list = this.query(newBd);
            return list;

        }
        return null;
    }
}
