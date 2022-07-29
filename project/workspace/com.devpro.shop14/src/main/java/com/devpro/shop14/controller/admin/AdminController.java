package com.devpro.shop14.controller.admin;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.entity.Category;
import com.devpro.shop14.entity.Product;
import com.devpro.shop14.entity.SaleOrder;
import com.devpro.shop14.service.CategoryService;
import com.devpro.shop14.service.ProductService;
import com.devpro.shop14.service.SaleOrderService;

@Controller
public class AdminController extends BaseController{
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	SaleOrderService saleOrderService;
	
	@RequestMapping(path = "/admin", method = RequestMethod.GET)
	public String Default(Model model) throws ParseException {
		
		List<Product> products = productService.findAll();
		model.addAttribute("sizeOfProduct", products.size());
		
		List<Category> categories = categoryService.findAll();
		model.addAttribute("sizeOfCategory", categories.size());
		
		List<SaleOrder> saleOrders = saleOrderService.findAll();
		model.addAttribute("sizeOfSaleOrder", saleOrders.size());
		
		BigDecimal tongDoanhThu = new BigDecimal(0);
		Locale locale = new Locale("vi", "VN");
		NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
		for(int i = 0; i < saleOrders.size(); i++) {
			if(saleOrders.get(i).getStatus() == true) {
				Number number = fmt.parse(saleOrders.get(i).getTotal());
				BigDecimal b = new BigDecimal(number.toString());
				tongDoanhThu = tongDoanhThu.add(b);
			}
		}
		String doanhThu = fmt.format(tongDoanhThu);
		model.addAttribute("doanhThu", doanhThu);
		
		int soDonHangHoanThanh = 0;
		for(int i = 0; i < saleOrders.size(); i++) {
			if(saleOrders.get(i).getStatus() == true) {
				soDonHangHoanThanh++;
			}
		}
		model.addAttribute("soDonHangHoanThanh", soDonHangHoanThanh);
		
		return "manager/admin-home";
	}

}
