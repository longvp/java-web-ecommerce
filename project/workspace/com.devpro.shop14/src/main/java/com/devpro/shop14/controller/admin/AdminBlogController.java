package com.devpro.shop14.controller.admin;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.common.Util;
import com.devpro.shop14.entity.Blog;
import com.devpro.shop14.service.BlogService;
import com.github.slugify.Slugify;

@Controller
public class AdminBlogController extends BaseController{

	@Autowired
	BlogService blogService;

	@RequestMapping(path = "/admin/blog", method = RequestMethod.GET)
	public String Default(Model model) {
		List<Blog> blogs = blogService.findAll();
		model.addAttribute("blogs", blogs);
		
		return "manager/blog/blog";
	}

	// ------------------------ ADD BLOG ---------------------------------
	@RequestMapping(path = "/admin/add-blog", method = RequestMethod.GET)
	public String DefaultAddBrand(Model model) {

		Blog blog = new Blog();
		model.addAttribute("blog", blog);

		return "manager/blog/add-blog";
	}

	@RequestMapping(path = "/admin/add-blog", method = RequestMethod.POST)
	public String AddBrand(Model model, @ModelAttribute("blog") Blog blog,
			@RequestParam("blogAvatar") MultipartFile blogAvatar) throws Exception {
		if (blog.getId() == null || blog.getId() <= 0) {
			blog.setSeo(Util.createSeoLink(blog.getTitle()));
			blog.setStatus(true);
			blog.setCreatedDate(new Date(System.currentTimeMillis()));
			blogService.save(blog, blogAvatar);
		} else {
			blog.setSeo(Util.createSeoLink(blog.getTitle()));
			blog.setUpdatedDate(new Date(System.currentTimeMillis()));
			blogService.edit(blog, blogAvatar);
		}
		return "redirect:/admin/blog";
	}

	// ------------------------ EDIT BLOG ---------------------------------
	@RequestMapping(path = "/admin/edit-blog/{blogSeo}", method = RequestMethod.GET)
	public String editBrand(Model model, @PathVariable("blogSeo") String blogSeo) {

		//Blog blog = blogService.getById(blogId);
		Blog blog = blogService.findBySeo(blogSeo);
		model.addAttribute("blog", blog);

		return "manager/blog/add-blog";
	}

	// ------------------------ DELETE BLOG ---------------------------------
	@RequestMapping(path = "/admin/delete-blog/{blogId}", method = RequestMethod.GET)
	public String deleteBrand(Model model, @PathVariable("blogId") int blogId) {
		
		blogService.deleteById(blogId);

		return "redirect:/admin/blog";
	}

}
