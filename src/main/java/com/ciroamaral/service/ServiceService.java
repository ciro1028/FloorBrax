package com.ciroamaral.service;

import java.util.List;

import com.ciroamaral.entity.Service;

public interface ServiceService {

	public List<Service> getServices();
	public Service getService(String value);
	public void saveService(Service service);
	public void deleteService(Service service);
}
