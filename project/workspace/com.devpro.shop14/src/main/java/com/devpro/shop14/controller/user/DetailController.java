package com.devpro.shop14.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.entity.Product;
import com.devpro.shop14.service.ProductService;

@Controller
public class DetailController extends BaseController{
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(path = "/detail/{productSeo}", method = RequestMethod.GET)
	public String Default(Model model, 
			@PathVariable("productSeo") String productSeo) {
		
		Product product = productService.findBySeo(productSeo);
		model.addAttribute("product", product);
		
		return "user/detail";
	}

}
