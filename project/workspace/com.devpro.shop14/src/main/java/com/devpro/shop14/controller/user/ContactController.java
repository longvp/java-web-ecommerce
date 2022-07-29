package com.devpro.shop14.controller.user;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.dto.Cart;
import com.devpro.shop14.dto.CartItem;
import com.devpro.shop14.dto.SimpleContact;
import com.devpro.shop14.entity.Category;
import com.devpro.shop14.entity.Contact;
import com.devpro.shop14.entity.SaleOrder;
import com.devpro.shop14.service.CategoryService;
import com.devpro.shop14.service.ContactService;

@Controller
public class ContactController extends BaseController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	CategoryService categoryService;

	@Autowired
	ContactService contactService;

	@RequestMapping(path = "/contact", method = RequestMethod.GET)
	public String Default(Model model) {
//		SimpleContact contact = new SimpleContact();
//		contact.setHoTen("long");
//		contact.setEmail("mail@gmail.com");
//		contact.setTinNhan("ok luon");
//		model.addAttribute("contact", contact);
//	
		return "user/contact";
	}

//	@RequestMapping(path = "/save-contact", method = RequestMethod.POST)
//	public String contact(Model model, HttpServletRequest request, 
//						HttpServletResponse response,
//						@ModelAttribute("contact") SimpleContact contact) {
//
//		String hoTen = request.getParameter("hoTen");
//		String email = request.getParameter("email");
//		String tinNhan = request.getParameter("tinNhan");
//		
//		String hoTenSpringForm = contact.getHoTen();
//		
//		System.out.println(hoTenSpringForm + "-" + hoTen + "-" + email + "-" + tinNhan);
//		
//		model.addAttribute("contact", new SimpleContact());
//		return "user/contact";
//	}

	@RequestMapping(path = "/save-contact", method = RequestMethod.POST)
	public String saveContact(Model model, HttpServletRequest request, HttpServletResponse response) {
		Contact contact = new Contact();
		contact.setFullName(request.getParameter("fullName"));
		contact.setEmail(request.getParameter("email"));
		contact.setMessage(request.getParameter("message"));
		contactService.saveOrUpdate(contact);
		try {
			sendMail(contact);
		} catch (UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();
		}
		return "redirect:/home";
	}

// ---------------------------- SEND MAIL --------------------------------------------
	public void sendMail(Contact contact) throws UnsupportedEncodingException, MessagingException {
		String subject = "Liên hệ";
		String senderName = "Shop For You";
		String mailContent = "<p> Dear " + contact.getFullName() + "</p>";
		
		mailContent += "<p>Cảm ơn bạn đã liên hệ. Bạn sẽ nhận được nhiều thông tin từ chúng tôi.</p>";
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

	// AJAX
	@RequestMapping(value = "/contact-ajax", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactAjax(Model model, HttpServletRequest request,
			HttpServletResponse response, @RequestBody SimpleContact contact) {

		Map<String, Object> jsonResult = new HashMap<String, Object>();

//		200 <-> thanh cong
//		500 <-> khong thanh cong

		jsonResult.put("code", 200);
		jsonResult.put("message", "Save thanh cong Json " + contact.getEmail());

		return ResponseEntity.ok(jsonResult);
	}

}
