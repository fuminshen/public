package com.fumin.role.demo.service;

import com.fumin.role.demo.bean.Client;

public interface ClientService extends BaseService<Client> {

	public void clearInspection(Integer companyId);
	
	public void clearDistribute(Integer companyId);
	public int getClientCountForOneAdmin(Integer companyId);
	public void setDistributeAsc(Integer companyId);
	public void setDistributeRand(Integer companyId);
	public void setDistributeManual(Integer companyId,Integer userId,Object clientId);
	
	public void clearCheckedState();
}
