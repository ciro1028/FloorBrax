package com.ciroamaral.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ciroamaral.dao.InstallerDAO;
import com.ciroamaral.entity.Installer;
import com.ciroamaral.entity.Order;

@Service
public class InstallerServiceImpl implements InstallerService {

	// inject serviceDAO
	@Autowired
	private InstallerDAO installerDAO;
	

	@Override
	@Transactional
	public void saveInstaller(Installer installer) {
		
		installerDAO.saveInstaller(installer);
	}

	@Override
	@Transactional
	public List<Installer> getInstallers() {
		
		return installerDAO.getInstallers();
	}

	@Override
	@Transactional
	public Installer getInstaller(String field, String value) {

		return installerDAO.getInstaller(field, value);
	}

	@Override
	@Transactional
	public void deleteInstaller(Installer installer) {
		installerDAO.deleteInstaller(installer);
	}

	@Override
	@Transactional
	public List<Order> getOrdersByInstallerAndDate(String installerId, String start, String end) {
		
		return installerDAO.getOrdersByInstallerAndDate(installerId, start, end);
	}


}
