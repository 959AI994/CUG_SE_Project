package com.bobo.service.impl;

import com.bobo.common.Constant;
import com.bobo.dto.CustomerDto;
import com.bobo.dto.OrderDto;
import com.bobo.mapper.OrderDetailMapper;
import com.bobo.mapper.OrderMapper;
import com.bobo.pojo.BasicData;
import com.bobo.pojo.OrderDetail;
import com.bobo.pojo.User;
import com.bobo.service.IBasicService;
import com.bobo.service.ICustomerService;
import com.bobo.service.IOrderService;
import com.bobo.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private OrderMapper mapper;

    @Autowired
    private ICustomerService customerService;

    @Autowired
    private IUserService userService;

    @Autowired
    private IBasicService basicService;

    @Autowired
    private OrderDetailMapper detailMapper;

    /**
     * 进入添加订单页面前 我们需要准备的数据
     * 1.查询出所有的业务员
     * 2.查询出所有的客户
     * 3.查询基础数据
     *       付款方式
     *       货运方式
     *       取件方式
     *       常用区间(国家/城市)
     *       单位
     * @param model
     */
    @Override
    public void queryAddRequirdData(Model model) throws Exception {
        // 1.查询所有的客户
        List<CustomerDto> customers = customerService.query(null);
        // 2.查询出所有的业务员
        List<User> users = userService.queryUserByRoleName(Constant.ROLE_SALEMAN);
        // 3.查询基础数据
        // 3.1 付款方式
        List<BasicData> payments = basicService.queryByParentName(Constant.BASIC_PAYMENT_TYPE);
        // 3.2 货运方式
        List<BasicData> freights = basicService.queryByParentName(Constant.BASIC_FREIGHT_TYPE);
        // 3.3 取件方式
        List<BasicData> fetchs = basicService.queryByParentName(Constant.BASIC_FETCH_TYPE);
        // 3.4 国家/城市
        List<BasicData> countrys = basicService.queryByParentName(Constant.BASIC_COMMON_INTERVAL);
        // 3.5 单位
        List<BasicData> units = basicService.queryByParentName(Constant.BASIC_UNIT);

        model.addAttribute("customers",customers);
        model.addAttribute("users",users);
        model.addAttribute("payments",payments);
        model.addAttribute("freights",freights);
        model.addAttribute("fetchs",fetchs);
        model.addAttribute("countrys",countrys);
        model.addAttribute("units",units);
    }

    @Override
    public void saveOrder(OrderDto dto) {
        // 保存主表数据
        mapper.insertSelective(dto);
        // 保存详情数据
        List<OrderDetail> orderDetails = dto.getOrderDetails();
        if(orderDetails != null && orderDetails.size() > 0){
            for (OrderDetail orderDetail : orderDetails) {
                orderDetail.setOrderId(dto.getOrderId());
                detailMapper.insertSelective(orderDetail);
            }
        }
    }
}
