package com.ciroamaral.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ciroamaral.entity.Installer;
import com.ciroamaral.entity.Order;
import com.ciroamaral.service.InstallerService;
import com.ciroamaral.service.OrderService;
import com.ciroamaral.service.SubdivisionService;

@Controller
@RequestMapping("/installer")
public class InstallerController {
	
	// inject installer service
	@Autowired
	private InstallerService installerService;
	
	@Autowired
	private SubdivisionService subdivisionService;
	
	@Autowired
	private OrderService orderService;

	@GetMapping("viewInstaller")
	public String viewInstaller(Model model, @RequestParam("installerId") String installerId) {
		
		Installer installer = installerService.getInstaller("id", installerId);
		model.addAttribute("installer", installer);
		
		return "installer/viewInstaller";
	}
	
	@PostMapping("/searchOrderByDate")
	public String getByDate(@RequestParam("installerId") String installerId, @RequestParam("reportrange") String date, RedirectAttributes redirect) {
		ArrayList<Object> listToRedirect = searchOrders(installerId, date);
		
		redirect.addFlashAttribute("orders", listToRedirect.get(0));
		redirect.addFlashAttribute("ordersNumList", listToRedirect.get(1));
		redirect.addFlashAttribute("rangeSelected", listToRedirect.get(2));
		redirect.addFlashAttribute("totalToPay", listToRedirect.get(3));
		redirect.addFlashAttribute("services", listToRedirect.get(4));
		redirect.addFlashAttribute("installers", listToRedirect.get(5));
		redirect.addFlashAttribute("subs", listToRedirect.get(6));
		
		
		return "redirect:/installer/viewInstaller?installerId=" + installerId;
	}
	
	// metho to serach orders by installer in date range
	public ArrayList<Object> searchOrders(String installerId, String dateRange){
		
		String[] dates = dateRange.split(" - ");
		String[] beginArray = dates[0].split("/");
		String begin = beginArray[2] + "-" + beginArray[0] + "-" + beginArray[1]; 
		
		String[] endArray = dates[1].split("/");
		String end = endArray[2] + "-" + endArray[0] + "-" + endArray[1];
		
		List<Order> orders = installerService.getOrdersByInstallerAndDate(installerId, begin, end);
		
		int totalToPay = 0;
		ArrayList<String> services = new ArrayList<>();
		ArrayList<String> installers = new ArrayList<>();
		ArrayList<String> subs = new ArrayList<>();
		String ordersNumList = "";
		
		for(Order order : orders) {
			
			totalToPay += order.getToPay();
			services.add(order.getServices().replace("%", " / "));
			installers.add(installerService.getInstaller("id", String.valueOf(order.getInstallerId())).getName());
			subs.add(subdivisionService.getSubdivision("id", String.valueOf(order.getSubdivisionId())).getName());
			ordersNumList += order.getOrderNum() + "%";
		}
		
		ArrayList<Object> listToRedirect = new ArrayList<Object>();
		listToRedirect.add(orders);
		listToRedirect.add(ordersNumList);
		listToRedirect.add(dateRange);
		listToRedirect.add(totalToPay);
		listToRedirect.add(services);
		listToRedirect.add(installers);
		listToRedirect.add(subs);
		
		return listToRedirect;
	}
	
	// update order status
		@RequestMapping("/updateStatusInstaller")
		public String updateStatus(@RequestParam("orderNum") String orderNum, 
								   @RequestParam("installerId") String installerId, 
								   @RequestParam("dates") String date,
								   RedirectAttributes redirect) {
			Order order = orderService.getOrder(orderNum);
			String currentStatus = order.getStatus();
			if (currentStatus.equals("Complete")) {
				order.setStatus("Pending");
			} else {
				order.setStatus("Complete");
			}
			
			orderService.saveOrder(order); 
			
			ArrayList<Object> listToRedirect = searchOrders(installerId, date);
			
			redirect.addFlashAttribute("orders", listToRedirect.get(0));
			redirect.addFlashAttribute("ordersNumList", listToRedirect.get(1));
			redirect.addFlashAttribute("rangeSelected", listToRedirect.get(2));
			redirect.addFlashAttribute("totalToPay", listToRedirect.get(3));
			redirect.addFlashAttribute("services", listToRedirect.get(4));
			redirect.addFlashAttribute("installers", listToRedirect.get(5));
			redirect.addFlashAttribute("subs", listToRedirect.get(6));
			
			return "redirect:/installer/viewInstaller?installerId=" + installerId;
		}
	
	
	@GetMapping("addInstaller")
	public String addInstaller(Model model) {
		Installer installer = new Installer();
		
		model.addAttribute("installer", installer);
		
		return "installer/addInstaller";
	}
	
	@GetMapping("addedInstaller")
	public String addedInstaller(Model model, @RequestParam("installerId") String installerId) {
		Installer installer = installerService.getInstaller("id", installerId);
		
		model.addAttribute("installer", installer);
		
		return "installer/addInstaller";
	}
	
	@GetMapping("searchInstaller")
	public String searchInstaller(@ModelAttribute("installer") Installer installer, RedirectAttributes redirect, Model model) {
		
		List<Installer> installers = installerService.getInstallers();
		model.addAttribute("installers", installers);
		return "installer/searchInstaller";
	}
	
	@PostMapping("/getInstaller")
	public String getInstaller(@RequestParam("name") String name, RedirectAttributes redirect) {
		String result;
		
		try {
			redirect.addFlashAttribute("inst", installerService.getInstaller("name", name));
			result = "withResult";
		} catch (Exception e) {
			result = "noResult";
		}
		
		return "redirect:/installer/searchInstaller?" + result + "&name=" + name;
	}
	
	@RequestMapping("/deleteInstaller")
	public String deleteInstaller(@RequestParam("installerId") String id) {
		
		Installer installer = installerService.getInstaller("id", id);
		installerService.deleteInstaller(installer);
		
		return "redirect:/installer/addInstaller?deleted";
	}
	
	@PostMapping("/saveInstaller")
	public String saveInstaller(@ModelAttribute("installer") Installer installer, RedirectAttributes redirect) {
		
		// save installer using service
		installerService.saveInstaller(installer);
		
		redirect.addFlashAttribute(installer);
		
		return "redirect:/installer/addedInstaller?added&installerId=" + installer.getId();
	}
	

}
