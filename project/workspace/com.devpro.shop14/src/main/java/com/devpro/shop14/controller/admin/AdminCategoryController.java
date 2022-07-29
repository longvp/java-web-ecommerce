package com.devpro.shop14.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.common.Util;
import com.devpro.shop14.entity.Category;
import com.devpro.shop14.service.CategoryService;

@Controller
public class AdminCategoryController extends BaseController{
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(path = "/admin/category", method = RequestMethod.GET)
	public String Default(Model model) {
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		return "manager/category/category";
	}
	
	
// ------------------------ ADD CATEGORY ---------------------------------	
	@RequestMapping(path = "/admin/add-category", method = RequestMethod.GET)
	public String DefaultAddCategory(Model model) {
		
		Category category = new Category();
		model.addAttribute("category", category);
		
		return "manager/category/add-category";
	}
	
	@RequestMapping(path = "/admin/add-category", method = RequestMethod.POST)
	public String AddCategory(Model model, 
			@ModelAttribute("category") Category category) {
		
		category.setSeo(Util.createSeoLink(category.getName()));
		category.setStatus(true);
		categoryService.saveOrUpdate(category);
		
		return "redirect:/admin/category";
	}
	
// ------------------------ EDIT CATEGORY ---------------------------------	
	@RequestMapping(path = "/admin/edit-category/{categoryId}", method = RequestMethod.GET)
	public String editCategory(Model model, 
					@PathVariable("categoryId") int categoryId) {
		
		Category category = categoryService.getById(categoryId);
		model.addAttribute("category", category);
		
		return "manager/category/add-category";
	}
	
// ------------------------ DELETE CATEGORY ---------------------------------	
	@RequestMapping(path = "/admin/delete-category/{categoryId}", method = RequestMethod.GET)
	public String deleteCategory(Model model, 
					@PathVariable("categoryId") int categoryId) {
		categoryService.deleteById(categoryId);
		
		return "redirect:/admin/category";
	}
	
	
}
