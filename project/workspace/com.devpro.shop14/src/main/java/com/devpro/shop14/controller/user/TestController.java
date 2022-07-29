package com.devpro.shop14.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.dto.DonHang;

@Controller
public class TestController {
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@RequestMapping(path = "/send", method = RequestMethod.GET)
	public String Default(Model model) {
		
		DonHang donHang = new DonHang();
		model.addAttribute("donHang", donHang);
		
		return "user/test";
	}
	
	@RequestMapping(path = "/send", method = RequestMethod.POST)
	public String send(Model model, @ModelAttribute("donHang") DonHang donHang) {
		
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setTo(donHang.getEmail());
		msg.setSubject("ĐƠN HÀNG CỦA BẠN");
		msg.setText("HI !!! OK KO " + donHang.getNoiDung());
		javaMailSender.send(msg);
		
		System.out.println(donHang.getEmail());
		model.addAttribute("donHang", donHang);
		
		return "user/test";
	}
	
//	@RequestMapping(path = "/test", method = RequestMethod.POST)
//	public String test(Model model, @ModelAttribute("donHang") DonHang donHang, 
//						@RequestParam("inputFiles") MultipartFile[] inputFiles) {
//		if(inputFiles.length > 0) {
//			for (MultipartFile inputFile : inputFiles) {
//				try {
//					inputFile.transferTo(new File("C:\\Users\\Admin\\Desktop\\project\\workspace\\com.devpro.shop14\\src\\main\\resources\\user\\images\\product\\"+ inputFile.getOriginalFilename()));
//				} catch (IllegalStateException | IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//		return "user/test";
//	}
	
//	@RequestMapping(path = "/test-ajax", method = RequestMethod.POST)
//	public ResponseEntity<Map<String, Object>> test(@RequestBody DonHang donHang ){
//		
//		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("oj", donHang);
//		
//		return ResponseEntity.ok(jsonResult);
//	}

}
