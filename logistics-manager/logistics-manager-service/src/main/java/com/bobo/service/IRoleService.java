package com.bobo.service;

import com.bobo.pojo.Role;

import java.util.List;

/**
 * 角色信息
 */
public interface IRoleService {

    /**
     * 根据条件查询用户信息
     * @param role
     * @return
     */
    List<Role> query(Role role) throws Exception;

    Role queryById(Integer id) throws Exception;

    /**
     * 添加用户信息
     * @param role
     * @return
     */
    Integer addRole(Role role) throws Exception;

    /**
     * 更新用户信息
     * @param role
     * @return
     */
    Integer updateRole(Role role) throws Exception;


    /**
     * 根据编号删除用户信息
     * @param id
     * @return
     */
    Integer deleteRole(Integer id) throws Exception;
}
