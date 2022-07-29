package com.devpro.shop14.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.dto.ProductSearch;
import com.devpro.shop14.entity.Category;
import com.devpro.shop14.entity.Product;
import com.devpro.shop14.service.CategoryService;
import com.devpro.shop14.service.ProductService;
import com.devpro.shop14.service.ProductService_2;

@Controller
public class ShopController extends BaseController {
	
	@Autowired
	ProductService_2 productService_2;
	
	@Autowired
	CategoryService categoryService;
	
//	@RequestMapping(path = "/shop/category/{categoryId}/page/1", method = RequestMethod.GET)
//	public String Default(Model model, @PathVariable("categoryId") int categoryId) {
//		return listByPage(model, categoryId, 1);
//	}
//	
//	@RequestMapping(path = "/shop/category/{categoryId}/page/{pageNumber}", method = RequestMethod.GET)
//	public String listByPage(Model model, @PathVariable("categoryId") int categoryId,
//						@PathVariable("pageNumber") int currentPage) {
//		
//		Category category = categoryService.getById(categoryId);
//		model.addAttribute("category", category);
//				
//		Page<Product> pageProduct = productService_2.findAllByCategoryId(categoryId, currentPage);		
//		List<Product> products = pageProduct.getContent(); 
//		int totalPage = pageProduct.getTotalPages();
//		 
//		model.addAttribute("currentPage", currentPage);
//		model.addAttribute("totalPage", totalPage);
//		model.addAttribute("products", products);
//		return "user/shop";
//	}
	
	@RequestMapping(path = "/shop/{categorySeo}/page/1", method = RequestMethod.GET)
	public String Default(Model model, HttpServletRequest request, 
			@PathVariable("categorySeo") String categorySeo) {
		return listByPage(model, request, categorySeo, 1);
	}
	
	@RequestMapping(path = "/shop/{categorySeo}/page/{pageNumber}", method = RequestMethod.GET)
	public String listByPage(Model model, HttpServletRequest request, 
			@PathVariable("categorySeo") String categorySeo,
						@PathVariable("pageNumber") int currentPage) {
		
		Category category = categoryService.findBySeo(categorySeo);
		int categoryId = category.getId();
		model.addAttribute("category", category);
		
		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
				
		Page<Product> pageProduct = 
				productService_2.findAllByCategoryId(categoryId, currentPage);		
		List<Product> products = pageProduct.getContent(); 
		int totalPage = pageProduct.getTotalPages();
		
		String sortField = request.getParameter("sortField");
		String sortDir = request.getParameter("sortDir");
		if(sortField != null && sortDir != null) {
			pageProduct = 
					productService_2.findAllByCategoryId(categoryId, currentPage, sortField, sortDir);					
			products = pageProduct.getContent(); 
		}
		
		String typePrice = request.getParameter("typePrice");
		if(typePrice != null) {
			pageProduct = 
					productService_2.findAllByCategoryIdAndPrice(categoryId, typePrice, currentPage);					
			products = pageProduct.getContent(); 
		}
		 
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("products", products);
		
		return "user/shop";
	}
	
//	@RequestMapping(path = "/shop/{categorySeo}/page/1", method = RequestMethod.GET)
//	public String sortDefault(Model model, @PathVariable("categorySeo") String categorySeo) {
//		return sortListByPage(model, categorySeo, 1, "price", "asc");
//	}
//	
//	@RequestMapping(path = "/shop/{categorySeo}/page/{pageNumber}", method = RequestMethod.GET)
//	public String sortListByPage(Model model, @PathVariable("categorySeo") String categorySeo,
//						@PathVariable("pageNumber") int currentPage, 
//						@Param("sortField") String sortField, 
//						@Param("sortDir") String sortDir) {
//		
//		Category category = categoryService.findBySeo(categorySeo);
//		int categoryId = category.getId();
//		model.addAttribute("category", category);
//				
//		Page<Product> pageProduct = 
//				productService_2.findAllByCategoryId(categoryId, currentPage, sortField, sortDir);		
//		List<Product> products = pageProduct.getContent(); 
//		int totalPage = pageProduct.getTotalPages();
//		 
//		model.addAttribute("currentPage", currentPage);
//		model.addAttribute("totalPage", totalPage);
//		model.addAttribute("products", products);
//		model.addAttribute("sortField", sortField);
//		model.addAttribute("sortDir", sortDir);
//		
//		return "user/shop";
//	}


}
