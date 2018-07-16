package com.ciroamaral.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ciroamaral.dao.ServiceDAO;


@Service
public class ServiceServiceImpl implements ServiceService {

	@Autowired
	private ServiceDAO serviceDAO;

	@Override
	@Transactional
	public List<com.ciroamaral.entity.Service> getServices() {
		
		return serviceDAO.getServices();
	}

	@Override
	@Transactional
	public com.ciroamaral.entity.Service getService(String value) {
		
		return serviceDAO.getService(value);
	}

	@Override
	@Transactional
	public void saveService(com.ciroamaral.entity.Service service) {
		serviceDAO.saveService(service);
		
	}

	@Override
	@Transactional
	public void deleteService(com.ciroamaral.entity.Service service) {
		serviceDAO.deleteService(service);
		
	}
	


}
