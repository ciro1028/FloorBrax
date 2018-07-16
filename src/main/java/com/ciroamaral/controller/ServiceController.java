package com.ciroamaral.controller;

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

import com.ciroamaral.entity.Service;
import com.ciroamaral.service.ServiceService;

@Controller
@RequestMapping("/service")
public class ServiceController {

	@Autowired
	private ServiceService serviceService;
	
	@GetMapping("addService")
	public String addService(Model model) {
		Service service = new Service();
		model.addAttribute("service", service);
		
		return "service/addService";
	}
	
	@PostMapping("/saveService")
	public String saveService(@ModelAttribute("service") Service service) {
		String result = "";
		try {
			serviceService.saveService(service);
			result = "?added";
		} catch (Exception e) {
			e.printStackTrace();
			result = "?duplicate";
		}
		
		return "redirect:/service/addService" + result;
	}
	
	@GetMapping("searchService")
	public String searchService(@ModelAttribute("service") Service service, Model model) {
		
		List<Service> services = serviceService.getServices();
		model.addAttribute("services", services);
		return "service/searchService";
	}
	
	@GetMapping("viewService")
	public String viewService(Model model, @RequestParam("serviceId") String serviceName) {
		
		Service service = serviceService.getService(serviceName);
		model.addAttribute("service", service);
		
		return "service/addService";
	}
	
	@PostMapping("/getService")
	public String getService(@RequestParam("name") String name, RedirectAttributes redirect) {
		String result;
		
		try {
			redirect.addFlashAttribute("svc", serviceService.getService(name));
			result = "withResult";
		} catch (Exception e) {
			e.printStackTrace();
			result = "noResult";
		}
		
		return "redirect:/service/searchService?" + result + "&name=" + name;
	}
	
	@RequestMapping("/deleteService")
	public String deleteService(@RequestParam("serviceId") String id) {
		Service service = serviceService.getService(id);
		serviceService.deleteService(service);
		
		return "redirect:/service/addService?deleted";
	}

}
