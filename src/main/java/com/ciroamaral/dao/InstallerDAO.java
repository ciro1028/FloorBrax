package com.ciroamaral.dao;

import java.util.List;

import com.ciroamaral.entity.Installer;
import com.ciroamaral.entity.Order;

public interface InstallerDAO {

	public List<Installer> getInstallers();
	public Installer getInstaller(String field, String value);
	public void saveInstaller(Installer installer);
	public void deleteInstaller(Installer installer);
	public List<Order> getOrdersByInstallerAndDate(String installerId, String start, String end);
}
