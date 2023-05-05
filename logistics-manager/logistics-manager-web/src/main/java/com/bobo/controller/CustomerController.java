package com.bobo.controller;

import com.bobo.dto.CustomerDto;
import com.bobo.pojo.Customer;
import com.bobo.service.ICustomerService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private ICustomerService service;


    @RequiresRoles(value = {"业务员","操作员","管理员"},logical = Logical.OR)
    @RequestMapping("/query")
    public String query(Customer customer,Model model) throws Exception{
        List<CustomerDto> list = service.query(customer);
        model.addAttribute("list",list);
        return "customer/customer";
    }


    @RequestMapping("/customerDispatch")
    public String customerDispatch(Integer id, Model model) throws Exception{
        service.getUpdateInfo(id,model);
        return "customer/updateCustomer";
    }

    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(Customer customer) throws Exception{
        if(customer != null && customer.getCustomerId() != null){
            // 更新
            service.update(customer);
        }else{
            service.save(customer);
        }

        return "redirect:/customer/query";
    }


    @RequestMapping("/checkCustomer")
    @ResponseBody
    public String checkCustomer(Integer id){
        return service.checkCustomer(id);
    }

    @RequestMapping("/deleteById")
    public String deleteById(Integer id) throws Exception{
        service.deleteById(id);
        return "redirect:/customer/query";
    }
}
