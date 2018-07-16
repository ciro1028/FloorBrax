package com.ciroamaral.dao;

import java.util.List;

import com.ciroamaral.entity.Service;

public interface ServiceDAO {

	public List<Service> getServices();
	public Service getService(String value);
	public void saveService(Service service);
	public void deleteService(Service service);
}
