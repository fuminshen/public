package com.fumin.distribution.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fumin.distribution.vo.Contract;
import com.fumin.distribution.vo.ContractImage;

@Service
@Transactional
public class ContractServiceImpl extends ServiceImpl<Contract> {

	@SuppressWarnings("unchecked")
	@Override
	public boolean delete(Contract vo) {
		ContractImageServiceImpl ctiSer = (ContractImageServiceImpl) getService(ContractImageServiceImpl.class);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("contractId", vo.getId());
		List<Map<String, Object>> ctis = (List<Map<String, Object>>) ctiSer.getByEntity(data);
		for(Map<String, Object> cti:ctis) {
			ContractImage ctivo = new ContractImage();
			ctivo.setId( Long.valueOf(cti.get("id").toString()));
			ctivo.setPath(cti.get("path").toString());
			ctiSer.delete(ctivo );
		}
		return super.delete(vo);
	}
}
