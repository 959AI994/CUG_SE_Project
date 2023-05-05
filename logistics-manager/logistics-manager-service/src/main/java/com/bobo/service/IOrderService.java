package com.bobo.service;

import com.bobo.dto.OrderDto;
import org.springframework.ui.Model;

public interface IOrderService {

    public void queryAddRequirdData(Model model) throws Exception;

    public void saveOrder(OrderDto dto);


}
