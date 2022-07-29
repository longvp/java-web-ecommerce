package com.devpro.shop14.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.shop14.entity.Category;
import com.devpro.shop14.entity.User;
import com.devpro.shop14.service.CategoryService;

public abstract class BaseController {
	
	@Autowired
	CategoryService categoryService;
	
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page")) - 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@ModelAttribute("categories")
	public List<Category> findAllCategory() {
		List<Category> categories = categoryService.findAll();
		return categories;
	}
	
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}
	
	@ModelAttribute("userLogined")
	public User getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (User) userLogined;
		
		return null;
	}
	
//	@ModelAttribute("totalPriceAllProduct")
//	public String totalPriceAllProduct() {
//		return null;
//	}
	
}
