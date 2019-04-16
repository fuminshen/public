package com.fumin.distribution.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fumin.distribution.service.ClientService;
import com.fumin.distribution.vo.Client;

@Service
@Transactional
public class ClientServiceImpl extends ServiceImpl<Client> implements ClientService {

}
