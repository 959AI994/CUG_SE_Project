package com.bobo.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 认证管理的控制器
 */
@Controller
public class LoginController {

    @RequestMapping("/login.do")
    public String login(Model model, HttpServletRequest request ){
        Object ex = request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        if(ex != null){
            System.out.println(ex.toString()+" ************** ");
        }
        if(UnknownAccountException.class.getName().equals(ex)){
            System.out.println("-----账号错误-----");
            model.addAttribute("msg","账号错误");
        }else if(IncorrectCredentialsException.class.getName().equals(ex)){
            System.out.println("-----密码错误-----");
            model.addAttribute("msg","密码错误");
        }else{
            System.out.println("-----其他错误-----");
            model.addAttribute("msg","其他错误");
        }

        return "login";

    }

    @RequestMapping("/logout.do")
    public String logout(){
        SecurityUtils.getSubject().logout();
        return "login";
    }
}
