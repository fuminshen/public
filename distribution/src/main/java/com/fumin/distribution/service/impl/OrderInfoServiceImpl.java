package com.fumin.distribution.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fumin.distribution.vo.OrderInfo;

@Service
@Transactional
public class OrderInfoServiceImpl extends ServiceImpl<OrderInfo> implements com.fumin.distribution.service.Service<OrderInfo> {
}
