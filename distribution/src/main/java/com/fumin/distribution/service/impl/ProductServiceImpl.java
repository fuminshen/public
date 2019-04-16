package com.fumin.distribution.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fumin.distribution.service.ProductService;
import com.fumin.distribution.vo.Product;

@Service
@Transactional
public class ProductServiceImpl extends ServiceImpl<Product> implements ProductService {

}
