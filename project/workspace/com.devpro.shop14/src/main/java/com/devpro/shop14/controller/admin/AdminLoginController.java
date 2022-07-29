package com.devpro.shop14.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.controller.user.BaseController;

@Controller
public class AdminLoginController extends BaseController{
	
	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "login";
	}

}
