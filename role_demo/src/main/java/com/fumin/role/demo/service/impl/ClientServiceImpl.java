package com.fumin.role.demo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fumin.role.demo.bean.Admin;
import com.fumin.role.demo.bean.Client;
import com.fumin.role.demo.mapper.ClientMapper;
import com.fumin.role.demo.service.AdminService;
import com.fumin.role.demo.service.ClientService;
import com.fumin.role.demo.util.FmException;

@Service
public class ClientServiceImpl extends BaseServiceImpl<Client> implements ClientService {
	
	@Autowired
	protected ClientMapper mapper;

	@Override
	public void clearInspection(Integer companyId) {
		mapper.clearInspection(companyId);
	}
	
	@Override
	public int getClientCountForOneAdmin(Integer companyId) {
		return mapper.selectClientCountForOneAdmin(companyId);
	}

	@Override
	public void clearDistribute(Integer companyId) {
		mapper.setDistributeClear(companyId);
	}
	
	public void setDistributeAsc(Integer companyId) {
		int oneCount = mapper.selectClientCountForOneAdmin(companyId);
		AdminService adminService = getService(AdminService.class);
		Admin admin = new Admin();
		admin.setRole(3);
		if(companyId!=null && companyId>0) {
			admin.setCompanyId(companyId);
		}
		List<Admin> admins = adminService.getByEntity(admin);
		
		int count=0;
		for(Admin ad:admins) {
			mapper.updateDistributeForAsc(companyId, ad.getId(), count * oneCount, oneCount);
			count++;
		}
	}
	
	public void setDistributeRand(Integer companyId) {
		int oneCount = mapper.selectClientCountForOneAdmin(companyId);
		AdminService adminService = getService(AdminService.class);
		Admin admin = new Admin();
		admin.setRole(3);
		if(companyId!=null && companyId>0) {
			admin.setCompanyId(companyId);
		}
		List<Admin> admins = adminService.getByEntity(admin);
		mapper.setDistributeClear(companyId);
		
		for(Admin ad:admins) {
			mapper.updateDistributeForRand(companyId, ad.getId(), oneCount);
		}
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void setDistributeManual(Integer companyId,Integer userId,Object clientId) {
		if(clientId==null) {
			throw new FmException("没有设置任何客户");
		}
		List ids=null;
		if(clientId instanceof List) {
			ids = (List) clientId;
		}else if (clientId.getClass().isArray()) {
			Object[] os = (Object[]) clientId;
			ids = new ArrayList<>();
			for(Object o:os) {
				ids.add(o);
			}
		}else {
			throw new FmException("没有设置任何客户");
		}
		mapper.updateDistributeForManual(companyId, userId, ids);
	}

}
