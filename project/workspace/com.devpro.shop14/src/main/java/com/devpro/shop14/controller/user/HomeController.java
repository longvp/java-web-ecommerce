package com.devpro.shop14.controller.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.entity.Category;
import com.devpro.shop14.entity.Product;
import com.devpro.shop14.service.CategoryService;
import com.devpro.shop14.service.ProductService;

@Controller
public class HomeController extends BaseController{
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(path = "/home", method = RequestMethod.GET)
	public String home(Model model){
		
		// ALL CATEGORY
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		// ALL PRODUCT
		List<Product> products = productService.findAll();
		model.addAttribute("products", products);
		
		return "user/home";
	}
	
	@RequestMapping(path = "/quick-view", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> quickView() {
		
		
		return null;
	}

}
