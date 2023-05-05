package com.bobo.service.impl;

import com.bobo.mapper.RoleMapper;
import com.bobo.pojo.Role;
import com.bobo.pojo.RoleExample;
import com.bobo.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色管理
 */
@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private RoleMapper mapper;

    @Override
    public List<Role> query(Role role) throws Exception {
        RoleExample example = new RoleExample();
        return mapper.selectByExample(example);
    }

    @Override
    public Role queryById(Integer id) throws Exception {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer addRole(Role role) throws Exception {
        return mapper.insertSelective(role);
    }

    @Override
    public Integer updateRole(Role role) throws Exception {
        return mapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public Integer deleteRole(Integer id) throws Exception {
        return mapper.deleteByPrimaryKey(id);
    }
}
