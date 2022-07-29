package com.devpro.shop14.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.entity.Blog;
import com.devpro.shop14.entity.Category;
import com.devpro.shop14.service.BlogService;
import com.devpro.shop14.service.BlogService_2;
import com.devpro.shop14.service.CategoryService;

@Controller
public class BlogController extends BaseController {

	@Autowired
	CategoryService categoryService;

	@Autowired
	BlogService blogService;

	@Autowired
	BlogService_2 blogService_2;
	
	@RequestMapping(path = "/blog/page/1", method = RequestMethod.GET)
	public String Default(Model model) {
		return listByPage(model, 1);
	}

	@RequestMapping(path = "/blog/page/{pageNumber}", method = RequestMethod.GET)
	public String listByPage(Model model, @PathVariable("pageNumber") int currentPage) {

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		Page<Blog> pageBlog = blogService_2.findAll(currentPage);
		List<Blog> blogs = pageBlog.getContent();
		int totalPage = pageBlog.getTotalPages();

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("blogs", blogs);
		return "user/blog";
	}

	@RequestMapping(path = "/blog-detail/{blogSeo}", method = RequestMethod.GET)
	public String blogDetail(Model model, @PathVariable("blogSeo") String blogSeo) {

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		List<Blog> blogs = blogService.findAll();
		model.addAttribute("blogs", blogs);

		Blog blog = blogService.findBySeo(blogSeo);
		model.addAttribute("blog", blog);

		return "user/blog-detail";
	}

}
