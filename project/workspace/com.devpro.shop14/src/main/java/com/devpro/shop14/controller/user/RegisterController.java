package com.devpro.shop14.controller.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.entity.Role;
import com.devpro.shop14.entity.User;
import com.devpro.shop14.service.RoleService;
import com.devpro.shop14.service.UserService;

@Controller
public class RegisterController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	public static final Pattern VALID_PHONE_NUMBER_REGEX = Pattern.compile("^\\d{10}$", Pattern.CASE_INSENSITIVE);
	
	public static boolean validateNumberPhone(String phoneNumber) {
		Matcher matcher = VALID_PHONE_NUMBER_REGEX.matcher(phoneNumber);
		return matcher.find();
	}
	
	@RequestMapping(path = "/register", method = RequestMethod.GET)
	public String Default(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "user/register";
	}
	
	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String register(Model model, @ModelAttribute("user") User user) {
		model.addAttribute("user", user);
		Role role = roleService.findByName("GUEST");
		List<User> users = userService.findAll();
		if(users != null) {
			int count = 0;
			for(int i = 0; i < users.size(); i++) {
				if(users.get(i).getUsername().equals(user.getUsername())) {
					count++;
					break;
				}
			}
			boolean checkNumberPhone = validateNumberPhone(user.getNumberPhone());
			String message = "";
			if(count == 1) {
				message = "Tên đăng nhập đã tồn tại.";
			} else if(checkNumberPhone == false) {
				message = "SĐT không hợp lệ.(Gồm 10 chữ số)";
			} else {
				user.addRoles(role);
				user.setCreatedDate(new Date(System.currentTimeMillis()));
				user.setStatus(true);
				user.setPassword(encodePassword(user.getPassword()));
				userService.saveOrUpdate(user);
				return "redirect:/login";
			}
			model.addAttribute("message", message);
			return "user/register";	
		} else {
			user.addRoles(role);
			user.setCreatedDate(new Date(System.currentTimeMillis()));
			user.setStatus(true);
			user.setPassword(encodePassword(user.getPassword()));
			userService.saveOrUpdate(user);
			return "redirect:/login";
		}
		
	}
	
	public String encodePassword(String password) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
		password = encoder.encode(password);
		return password;
	}

}
