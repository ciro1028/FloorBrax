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

import com.ciroamaral.entity.Subdivision;
import com.ciroamaral.service.SubdivisionService;

@Controller
@RequestMapping("/subdivision")
public class SubdivisionController {

	@Autowired
	private SubdivisionService subdivisionService;
	
	@GetMapping("addSubdivision")
	public String addSubdivision(Model model) {
		
		Subdivision subdivision = new Subdivision();
		model.addAttribute(subdivision);
		return "subdivision/addSubdivision";
	}
	
	@PostMapping("/saveSubdivision")
	public String saveSubdivision(@ModelAttribute("subdivision") Subdivision subdivision) {
		String result;
		
		try {
			subdivisionService.saveSubdivision(subdivision);
			result = "?added";
		} catch (Exception e) {
			e.printStackTrace();
			result = "?duplicate";
		}
				
		return "redirect:/subdivision/addSubdivision" + result;
	}
	
	@GetMapping("searchSubdivision")
	public String searchSubdivision(@ModelAttribute("subdivision") Subdivision subdivision, Model model) {
		List<Subdivision> subdivisions = subdivisionService.getSubdivisions();

		model.addAttribute("subdivisions", subdivisions);
		return "subdivision/searchSubdivision";
	}
	
	@GetMapping("viewSubdivision")
	public String viewSubdivision(Model model, @RequestParam("subdivisionId") String subdivisionId) {
		
		Subdivision subdivision = subdivisionService.getSubdivision("id", subdivisionId);
		model.addAttribute(subdivision);
		
		return "subdivision/addSubdivision";
	}
	
	@RequestMapping("/deleteSubdivision")
	public String deleteSubdivision(@RequestParam("subdivisionId") String id) {
		Subdivision subdivision = subdivisionService.getSubdivision("id", id);
		subdivisionService.deleteSubdivision(subdivision);
		
		return "redirect:/subdivision/addSubdivision?deleted";
	}

	@PostMapping("/getSubdivision")
	public String getSubdivision(@RequestParam("name") String name, RedirectAttributes redirect) {
		String result;

		try {
			Subdivision subdivision = subdivisionService.getSubdivision("name", name);
			redirect.addFlashAttribute("sub", subdivision);
			result = "withResult";
		} catch (Exception e) {
			e.printStackTrace();
			result = "noResult";
		}
		
		return "redirect:/subdivision/searchSubdivision?" + result + "&name=" + name;
	}
}
