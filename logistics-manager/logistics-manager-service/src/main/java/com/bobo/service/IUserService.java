package com.bobo.service;

import com.bobo.dto.UserDto;
import com.bobo.pojo.Role;
import com.bobo.pojo.User;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * 用户信息
 */
public interface IUserService {

    /**
     * 根据条件查询用户信息
     * @param user
     * @return
     */
    List<User> query(User user) throws Exception;

    /**
     * 添加用户信息
     * @param user
     * @return
     */
    Integer addUser(User user) throws Exception;

    /**
     * 更新用户信息
     * @param user
     * @return
     */
    Integer updateUser(User user) throws Exception;


    /**
     * 根据编号删除用户信息
     * @param id
     * @return
     */
    Integer deleteUser(Integer id) throws Exception;

    Integer saveOrUpdate(UserDto dto) throws Exception;

    User queryById(Integer userId) throws  Exception;

    List<Integer> queryUserRoleIds(Integer userId);

    PageInfo<User> queryByPage(UserDto dto) throws Exception;

    User login(String userName);

    List<Role> queryUserHaveRole(User user) throws Exception;

    List<User> queryUserByRoleName(String roleName)throws Exception;
}
