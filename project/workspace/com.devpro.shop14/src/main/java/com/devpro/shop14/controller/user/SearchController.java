package com.devpro.shop14.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devpro.shop14.entity.Product;
import com.devpro.shop14.service.ProductService_2;

@Controller
public class SearchController extends BaseController{
	
	@Autowired
	ProductService_2 productService_2;
	
	@RequestMapping(path = "/search", method = RequestMethod.GET)
	public String Default() {
		return "user/search";
	}
	
//	@RequestMapping(path = "/search/page/{pageNumber}", method = RequestMethod.POST)
//	public String search(Model model, HttpServletRequest request, 
//			@PathVariable("pageNumber") int currentPage) {
//		String keyword = request.getParameter("keyword");	
//		
//		Page<Product> pageProduct = 
//				productService_2.findAllByTitle(keyword, currentPage);		
//		List<Product> products = pageProduct.getContent(); 
//		
//		int totalPage = pageProduct.getTotalPages();
//		
//		model.addAttribute("currentPage", currentPage);
//		model.addAttribute("totalPage", totalPage);
//		model.addAttribute("products", products);
//		return "user/search";
//	}
	
//	@RequestMapping(path = "/search", method = RequestMethod.GET)
//	public String search(Model model, HttpServletRequest request, 
//			@RequestParam("keyword") String keyword) {
//		return searchByPage(model, request, keyword);
//	}
	
	@RequestMapping(path = "/search", method = RequestMethod.POST)
	public String searchByPage(Model model, HttpServletRequest request, 
			@RequestParam("keyword") String keyword) {
	
		List<Product> products = productService_2.findAllBySearchTitle(keyword);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("products", products);
		model.addAttribute("numberOfResult", products.size());
		
		return "user/search";
	}

}
