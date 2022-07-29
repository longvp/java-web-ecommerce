package com.devpro.shop14.controller.admin;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.common.Util;
import com.devpro.shop14.dto.Cart;
import com.devpro.shop14.dto.CartItem;
import com.devpro.shop14.dto.ProductSearch;
import com.devpro.shop14.entity.Category;
import com.devpro.shop14.entity.Contact;
import com.devpro.shop14.entity.Product;
import com.devpro.shop14.entity.ProductImages;
import com.devpro.shop14.entity.SaleOrder;
import com.devpro.shop14.service.CategoryService;
import com.devpro.shop14.service.ContactService;
import com.devpro.shop14.service.ProductService;
import com.devpro.shop14.service.ProductService_2;

@Controller
public class AdminProductController extends BaseController {

	private final String UPLOAD_FILE_ROOT = "C:/Users/Admin/Desktop/project/workspace/com.devpro.shop14/upload/";

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	ContactService contactService;
	
	@Autowired
	CategoryService categoryService;

	@Autowired
	ProductService productService;
	
	@Autowired
	ProductService_2 productService_2;
	
	@RequestMapping(path = "admin/product/page/1", method = RequestMethod.GET)
	public String Default(Model model) {
		return listByPage(model, 1);
	}

	
	@RequestMapping(path = "admin/product/page/{pageNumber}", method = RequestMethod.GET)
	public String listByPage(Model model, @PathVariable("pageNumber") int currentPage) {

		Page<Product> pageProduct = productService_2.findAll(currentPage);
		List<Product> products = pageProduct.getContent();
		int totalPage = pageProduct.getTotalPages();
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("products", products);

		return "manager/product/product";
	}

	@RequestMapping(path = "admin/product", method = RequestMethod.GET)
	public String Default(Model model, HttpServletRequest request, HttpServletResponse response) {

		List<Product> products = productService.findAll();
		// model.addAttribute("products", products);

		String keyword = request.getParameter("keyword");

		ProductSearch productSearch = new ProductSearch();
		productSearch.setKeyword(keyword);

		int page = getCurrentPage(request);
		productSearch.setPage(page);
		model.addAttribute("products", productService.search(productSearch));

		int totalPage = (int) Math.ceil((double) products.size() / 2);
		model.addAttribute("totalPage", totalPage);

		return "manager/product/product";
	}

//	----------------------------- PAGING ----------------------------------
//	@RequestMapping(path = "admin/product/{page}", method = RequestMethod.GET)
//	public String paging(Model model, HttpServletRequest request, 
//			@PathVariable("page") int page) {
//		
//		ProductSearch productSearch = new ProductSearch();
//		productSearch.setPage(page-1);
//		model.addAttribute("products", productService.search(productSearch));
//		
//		return "admin/product/product";
//	}

// ------------------------- ADD ----------------------------------------
	@RequestMapping(path = "admin/add-product", method = RequestMethod.GET)
	public String DefaultAddProduct(Model model) {

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		Product product = new Product();
		model.addAttribute("product", product);

		return "manager/product/add-product";
	}

	@RequestMapping(path = "admin/add-product", method = RequestMethod.POST)
	public String addProduct(Model model, @ModelAttribute("product") Product product,
			@RequestParam("productAvatar") MultipartFile productAvatar,
			@RequestParam("productPictures") MultipartFile[] productPictures) throws Exception {

		if (product.getId() == null || product.getId() <= 0) {
			product.setCreatedDate(new Date(System.currentTimeMillis()));
			product.setSeo(Util.createSeoLink(product.getTitle()));
			productService.save(product, productAvatar, productPictures);
			
			List<Contact> contacts = contactService.findAll();
			for (Contact contact : contacts) {
				sendMail(product, contact);
			}
			
		} else {
			product.setUpdatedDate(new Date(System.currentTimeMillis()));
			product.setSeo(Util.createSeoLink(product.getTitle()));
			productService.edit(product, productAvatar, productPictures);
		}

		return "redirect:/admin/product/page/1";
	}

//	----------------------------- EDIT ------------------------------------
	@RequestMapping(path = "admin/edit-product/{productId}", method = RequestMethod.GET)
	public String editProduct(Model model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("productId") int productId) {

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		Product product = productService.getById(productId);
		model.addAttribute("product", product);

		return "manager/product/add-product";
	}

//	----------------------------- DELETE --------------------------------------
	@RequestMapping(path = "admin/delete-product/{productId}", method = RequestMethod.GET)
	public String deleteProduct(Model model, @PathVariable("productId") int productId) {

		Product product = productService.getById(productId);
		
//		DELETE FILE AVATAR
		File fileAvatar = new File(UPLOAD_FILE_ROOT + product.getAvatar());
		fileAvatar.delete();
		
//		DELETE LIST FILE PICTURES
		List<ProductImages> pictures = product.getProductImages();
		for (ProductImages p : pictures) {
			File filePicture = new File(UPLOAD_FILE_ROOT + p.getPath());
			filePicture.delete();
		}		
		
		productService.deleteById(productId);
		return "redirect:/admin/product/page/1";
	}
	
// ---------------------------- SEND MAIL --------------------------------------------
		public void sendMail(Product product, Contact contact) throws UnsupportedEncodingException, MessagingException {
			
			String subject = "Thông báo sản phẩm mới";
			String senderName = "Shop For You";
			String mailContent = "<p> Dear " + contact.getFullName() + "</p>";
			mailContent += "<h2> Chúng tôi đã cho ra mắt sản phẩm: " + product.getTitle() + "</h2>";
			mailContent += "<h2> Giá tiền: " + product.getPriceVN() + "</h2>";
				
			mailContent += "<p>Mong bạn sẽ quan tâm!</p>";
			mailContent += "<p>" + senderName + "</p>";

			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);
			helper.setFrom("shopfforyou@gmail.com", senderName);
			helper.setTo(contact.getEmail());
			helper.setSubject(subject);
			helper.setText(mailContent, true);

			mailSender.send(message);
		}

}
