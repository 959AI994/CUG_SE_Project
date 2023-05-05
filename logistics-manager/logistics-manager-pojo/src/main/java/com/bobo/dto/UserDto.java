package com.bobo.dto;

import com.bobo.pojo.User;

import java.util.List;

/**
 * DTO 数据传输对象
 * 用户
 */
public class UserDto  extends BasePage{

    public User user;

    public List<Integer> roleIds;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Integer> getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(List<Integer> roleIds) {
        this.roleIds = roleIds;
    }
}
