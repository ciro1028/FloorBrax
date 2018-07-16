package com.ciroamaral.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ciroamaral.entity.Installer;
import com.ciroamaral.entity.Order;
import com.ciroamaral.entity.Subdivision;
import com.ciroamaral.service.InstallerService;
import com.ciroamaral.service.OrderService;
import com.ciroamaral.service.SubdivisionService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	// inject orderService
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private InstallerService installerService;
	
	@Autowired
	private SubdivisionService subdivisionService;
	
	@RequestMapping({"/", "/home"})
	public String showHome(Model model) {
		
		// get orders list from dao
		List<Order> orders = orderService.getTodaysOrders();
		
		// get installers names and put them into an arraylist
		ArrayList<String> installersList = new ArrayList<>();
		// get subdivisions names and put them into an arraylist
		ArrayList<String> subdivisionsList = new ArrayList<>();
		
		ArrayList<String> servicesList = new ArrayList<>();

		// list to be used in javascript
		String ordersNumList = "";
		
		for(Order order : orders) {
			
			Installer installer = new Installer();
			installer = installerService.getInstaller("id", String.valueOf(order.getInstallerId()));	
			installersList.add(installer.getName());
			
			Subdivision sub = new Subdivision();
			sub = subdivisionService.getSubdivision("id", String.valueOf(order.getSubdivisionId()));
			subdivisionsList.add(sub.getName());
			
			// get string of service id's from each order and turn it into an array
			// get the name of each service based on each id
			servicesList.add(order.getServices().replace("%", " / "));

			ordersNumList += order.getOrderNum() + "%";
		}
		
		// send orders to the model
		model.addAttribute("orders", orders);
		model.addAttribute("ordersNumList", ordersNumList);

		// send list of installers names to the model
		model.addAttribute("installersList", installersList);

		// send list of subdivisions names to the model
		model.addAttribute("subdivisionsList", subdivisionsList);
		
		// send list of services names to the model
		model.addAttribute("servicesList", servicesList);

		return "home";
	}
	
	
	
	
}