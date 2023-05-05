package com.bobo.controller;

import com.bobo.pojo.BasicData;
import com.bobo.service.IBasicService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 基础数据
 */
@Controller
@RequestMapping("/basic")
public class BasicController {

    @Autowired
    private IBasicService service;

    @RequestMapping("/query")
    public String query(BasicData data, Model model) throws Exception{
        List<BasicData> list = service.query(data);
        model.addAttribute("list",list);
        return "basic/basic";
    }

    /**
     * 跳转到表单页面
     * @param id
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/baseDispatch")
    public String baseDispatch(Integer id, Model model) throws Exception{
        if(id != null){
            // 是更新操作 更加编号查询出对应的基础数据
            BasicData basicData = service.queryById(id);
            model.addAttribute("basicData",basicData);
        }

        // 查询出所有的大类数据
        List<BasicData> parents = service.queryAllParentData();
        model.addAttribute("parents",parents);

        return "basic/updateBasic";
    }

    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(BasicData data)throws Exception{

        if(data.getBaseId() != null && data.getBaseId() > 0){
            // 说明是更新操作
            service.updateBasicData(data);
        }else{
            service.addBasicData(data);
        }

        return "redirect:/basic/query";
    }
}
