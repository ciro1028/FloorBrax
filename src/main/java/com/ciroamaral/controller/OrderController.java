package com.ciroamaral.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ciroamaral.entity.Installer;
import com.ciroamaral.entity.Order;
import com.ciroamaral.entity.Service;
import com.ciroamaral.entity.Subdivision;
import com.ciroamaral.service.InstallerService;
import com.ciroamaral.service.OrderService;
import com.ciroamaral.service.ServiceService;
import com.ciroamaral.service.SubdivisionService;
import com.ciroamaral.service.UploadFileService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private UploadFileService uploadFileService;

	@Autowired
	private InstallerService installerService;

	@Autowired
	private SubdivisionService subdivisionService;

	@Autowired
	private ServiceService serviceService;

	@Autowired
	private OrderService orderService;

	@RequestMapping("/addOrder")
	public String addOrder(Model model) {

		Order order = new Order();
		List<Installer> installers = installerService.getInstallers();
		List<Subdivision> subdivisions = subdivisionService.getSubdivisions();
		List<Service> services = serviceService.getServices();

		model.addAttribute("order", order);
		model.addAttribute("installers", installers);
		model.addAttribute("subdivisions", subdivisions);
		model.addAttribute("services", services);
		return "order/addOrder";
	}

	// save order to database
	@RequestMapping(value = "/submitOrder", method = RequestMethod.POST)
	public String submitOrder(@ModelAttribute("order") Order order, @RequestParam("orderNum") String name,
			@RequestParam("file") MultipartFile file, @RequestParam("editOrder") boolean editOrder,
			RedirectAttributes redirect) {

		order.setPicture("https://s3.amazonaws.com/floorbrax/orders/" + order.getOrderNum() + ".jpg");

		int total = 0;
		int toPay = 0;
		
		// calculate order's total
		String services = order.getServices();
		
		try {
			order.setServices(services);
			String[] svcArray = services.split("%");

			

			int sqf = order.getSquareFootage();
			int sqfDitra = order.getSquareFootageDitra();
			int sqfHardwood = order.getSquareFootageHarwood();

			if (order.getServices() != "") {
				for (String svc : svcArray) {
					Service service = new Service();
					service = serviceService.getService(svc);
					switch (svc) {
					case "Tile Floor":
						toPay += service.getPricePerSqftPay() * sqf + service.getSqltDitraPay() * sqfDitra;
						total += service.getPricePerSqft() * sqf + service.getSqftDitra() * sqfDitra;
						break;
					case "Hardwood Floor":
						toPay += service.getPricePerSqftPay() * sqfHardwood;
						total += service.getPricePerSqft() * sqfHardwood;
						break;
					default:
						total += service.getPrice();
						toPay += service.getToPay();
						break;
					}
				}
			}
		} catch (Exception e) {
			
		}
		

		toPay += order.getExtraPrice();
		total += order.getExtraPrice();
		order.setToPay(toPay);
		order.setTotal(total);

		// format date
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDate localDate = LocalDate.now();
		order.setDateAdded(dtf.format(localDate));

		// save order
		orderService.saveOrder(order);

		List<Object> objects = getAll(order.getOrderNum());

		// redirect objects to ViewOrder
		redirect.addFlashAttribute("subs", subdivisionService.getSubdivisions());
		redirect.addFlashAttribute("installers", installerService.getInstallers());

		redirect.addFlashAttribute("order", objects.get(0));
		redirect.addFlashAttribute("installer", objects.get(1));
		redirect.addFlashAttribute("sub", objects.get(2));
		redirect.addFlashAttribute("services", objects.get(3));
		redirect.addFlashAttribute("svcArray", objects.get(4));

		String status = "updated";

		// upload original order on aws
		if (!editOrder) {
			uploadPic(name, file);
			status = "added";
		}

		return "redirect:/order/ViewOrder?orderNum=" + order.getOrderNum() + "&status=" + status;
	}
	
	// update order status
	@RequestMapping("/updateStatus")
	public String updateStatus(@RequestParam("orderNum") String orderNum, @RequestParam("url") String url) {
		Order order = orderService.getOrder(orderNum);
		
		String currentStatus = order.getStatus();
		if (currentStatus.equals("Complete")) {
			order.setStatus("Pending");
		} else {
			order.setStatus("Complete");
		}
		
		orderService.saveOrder(order);
		
		String redirect = "";
		if(url.equals("home")) {
			redirect = "home";
		} 
		
		return "redirect:/" + redirect;
	}

	// get all objects based on order num
	public ArrayList<Object> getAll(String orderNum) {

		ArrayList<Object> allObjects = new ArrayList<>();

		// get order clicked
		Order clickedOrder = orderService.getOrder(orderNum);
		allObjects.add(clickedOrder);

		// get name of installer based on order installerId
		String installerId = String.valueOf(clickedOrder.getInstallerId());
		Installer installer = installerService.getInstaller("id", installerId);
		allObjects.add(installer.getName());

		// get name of subdivision based on order subdivisionId
		String subId = String.valueOf(clickedOrder.getSubdivisionId());
		Subdivision sub = subdivisionService.getSubdivision("id", subId);
		allObjects.add(sub.getName());

		// get all services from current order
		String[] services = clickedOrder.getServices().split("%");
		allObjects.add(services);

		// get all services names
		List<Service> svcArray = serviceService.getServices();
		allObjects.add(svcArray);

		return allObjects;
	}

	@GetMapping("ViewOrder")
	public String addInstaller(@RequestParam("orderNum") String orderNum, @RequestParam("status") String status,
			Model model) {

		List<Object> objects = getAll(orderNum);

		model.addAttribute("order", objects.get(0));
		model.addAttribute("installer", objects.get(1));
		model.addAttribute("sub", objects.get(2));
		model.addAttribute("services", objects.get(3));
		model.addAttribute("svcArray", objects.get(4));

		model.addAttribute("subs", subdivisionService.getSubdivisions());
		model.addAttribute("installers", installerService.getInstallers());

		return "order/ViewOrder";
	}

	// go to order when "view" button is pressed
	@GetMapping("/goToOrder")
	public String goToOrder(@RequestParam("orderNum") String order, Model model) {

		List<Object> objects = getAll(order);

		model.addAttribute("order", objects.get(0));
		model.addAttribute("installer", objects.get(1));
		model.addAttribute("sub", objects.get(2));
		model.addAttribute("services", objects.get(3));
		model.addAttribute("svcArray", objects.get(4));

		model.addAttribute("subs", subdivisionService.getSubdivisions());
		model.addAttribute("installers", installerService.getInstallers());

		return "order/ViewOrder";
	}

	public void uploadPic(String name, MultipartFile file) {

		try {
			uploadFileService.uploadFile(name, file.getInputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("searchOrdersBy")
	public String searchOrdersBy() {
		
		return"order/searchOrdersBy";
	}
	
	@GetMapping("/getOrders")
	public String getOrders(@RequestParam("searchValue") String field, 
						    @RequestParam("reportrange") String dateRange, 
						    @RequestParam("valueToPass") String value,
						    RedirectAttributes redirect) {
		
		List<Order> orders = orderService.getOrders();
		System.out.println(">>>>>field " + field);
		System.out.println(">>>>>dateRange " + dateRange);
		System.out.println(">>>>>value " + value);
		String result = null;
		
		ArrayList<String> installersList = new ArrayList<>();
		ArrayList<String> subdivisionsList = new ArrayList<>();
		Installer installer = new Installer();
		Subdivision sub = new Subdivision();
		ArrayList<String> servicesList = new ArrayList<>();
		
		switch (field) {
			case "num":
				try {
					orders = orderService.searchOrders("orderNum", value);
					for(Order order : orders) {
						installer = installerService.getInstaller("id", order.getInstallerId());
						installersList.add(installer.getName());
						sub = subdivisionService.getSubdivision("id", order.getSubdivisionId());
						subdivisionsList.add(sub.getName());
						servicesList.add(order.getServices().replace("%", " / "));
					}
					result = "num";
				} catch (Exception e) {
					result = "noNum";
				}
				break;
			case "installer":
				installer = installerService.getInstaller("name", value);
				try {
					orders = orderService.searchOrders("installerId", installer.getId());
					for(Order order : orders) {
						installer = installerService.getInstaller("id", order.getInstallerId());
						installersList.add(installer.getName());
						sub = subdivisionService.getSubdivision("id", order.getSubdivisionId());
						subdivisionsList.add(sub.getName());
						servicesList.add(order.getServices().replace("%", " / "));
					}
					result = "installer";
				} catch (Exception e) {
					result = "noInstaller";
				}
				break;
			case "service":
				try {
					orders = orderService.getordersByService(value);
					for(Order order : orders) {
						installer = installerService.getInstaller("id", order.getInstallerId());
						installersList.add(installer.getName());
						sub = subdivisionService.getSubdivision("id", order.getSubdivisionId());
						subdivisionsList.add(sub.getName());
						servicesList.add(order.getServices().replace("%", " / "));
					}
					result = "service";
				} catch (Exception e) {
					result = "noService";
				}
				break;
			case "subdivision":
				sub = subdivisionService.getSubdivision("name", value);
				try {
					orders = orderService.searchOrders("subdivisionId", sub.getId());
					for(Order order : orders) {
						installer = installerService.getInstaller("id", order.getInstallerId());
						installersList.add(installer.getName());
						sub = subdivisionService.getSubdivision("id", order.getSubdivisionId());
						subdivisionsList.add(sub.getName());
						servicesList.add(order.getServices().replace("%", " / "));
					}
					result = "subdivision";
				} catch (Exception e) {
					result = "noSubdivision";
				}
				break;
			case "range":
				String[] dates = dateRange.split(" - ");
				String[] beginArray = dates[0].split("/");
				String begin = beginArray[2] + "-" + beginArray[0] + "-" + beginArray[1]; 
				
				String[] endArray = dates[1].split("/");
				String end = endArray[2] + "-" + endArray[0] + "-" + endArray[1];
				
				orders = orderService.getOrdersByDate(begin, end);
				for(Order order : orders) {
					installer = installerService.getInstaller("id", order.getInstallerId());
					installersList.add(installer.getName());
					sub = subdivisionService.getSubdivision("id", order.getSubdivisionId());
					subdivisionsList.add(sub.getName());
					servicesList.add(order.getServices().replace("%", " / "));
				}
				result = "range";
				break;
			default:
				break;
		}
		
		redirect.addFlashAttribute("subdivisionsList", subdivisionsList);
		redirect.addFlashAttribute("dateRange", dateRange);
		redirect.addFlashAttribute("installersList", installersList);
		redirect.addFlashAttribute("servicesList", servicesList);
		redirect.addFlashAttribute("orders", orders);
		
		return "redirect:/order/searchOrdersBy?result=" + result;
	}

}
