package com.devpro.shop14.controller.admin;

import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.entity.Category;
import com.devpro.shop14.entity.Product;
import com.devpro.shop14.entity.Role;
import com.devpro.shop14.entity.User;
import com.devpro.shop14.service.RoleService;
import com.devpro.shop14.service.UserService;

@Controller
public class AdminUserController extends BaseController {

	@Autowired
	UserService userService;

	@Autowired
	RoleService roleService;
	
	public static final Pattern VALID_PHONE_NUMBER_REGEX = Pattern.compile("^\\d{10}$", Pattern.CASE_INSENSITIVE);
	
	public static boolean validateNumberPhone(String phoneNumber) {
		Matcher matcher = VALID_PHONE_NUMBER_REGEX.matcher(phoneNumber);
		return matcher.find();
	}

	@RequestMapping(path = "/admin/user", method = RequestMethod.GET)
	public String Default(Model model) {
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		
		return "manager/user/user";
	}

// ------------------------ ADD USER ---------------------------------
	@RequestMapping(path = "/admin/add-user", method = RequestMethod.GET)
	public String DefaultAddUser(Model model) {
		
		List<Role> role = roleService.findAll();
		model.addAttribute("role", role);

		User user = new User();
		model.addAttribute("user", user);

		return "manager/user/add-user";
	}

	@RequestMapping(path = "/admin/add-user", method = RequestMethod.POST)
	public String AddUser(Model model, @ModelAttribute("user") User user) {
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
//			if(count == 1) {
//				message = "Tên đăng nhập đã tồn tại.";
//			} else 
			if(checkNumberPhone == false) {
				message = "SĐT không hợp lệ.(Gồm 10 chữ số)";
			} else {
				user.addRoles(role);
				user.setCreatedDate(new Date(System.currentTimeMillis()));
				user.setStatus(true);
				user.setPassword(encodePassword(user.getPassword()));
				userService.saveOrUpdate(user);
				return "redirect:/admin/user";
			}
			model.addAttribute("message", message);
			return "manager/user/add-user";	
		} else {
			user.addRoles(role);
			user.setCreatedDate(new Date(System.currentTimeMillis()));
			user.setStatus(true);
			user.setPassword(encodePassword(user.getPassword()));
			userService.saveOrUpdate(user);
			return "redirect:/admin/user";
		}
	}
	
	public String encodePassword(String password) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(4);
		password = encoder.encode(password);
		return password;
	}
	
//	----------------------------- EDIT ------------------------------------
	@RequestMapping(path = "admin/edit-user/{userId}", method = RequestMethod.GET)
	public String editProduct(Model model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("userId") int userId) {

		User user = userService.getById(userId);
		model.addAttribute("user", user);

		return "manager/user/add-user";
	}

// ------------------------ DELETE USER ---------------------------------
	@RequestMapping(path = "/admin/delete-user/{userId}", method = RequestMethod.GET)
	public String deleteCategory(Model model, @PathVariable("userId") int userId) {
		User user = userService.getById(userId);
		Role role = roleService.findByName("GUEST");
		user.deleteRole(role);
		userService.deleteById(userId);

		return "redirect:/admin/user";
	}

}
