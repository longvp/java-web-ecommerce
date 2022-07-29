package com.devpro.shop14.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.dto.Cart;
import com.devpro.shop14.dto.CartItem;
import com.devpro.shop14.entity.Category;
import com.devpro.shop14.entity.Product;
import com.devpro.shop14.entity.SaleOrder;
import com.devpro.shop14.entity.SaleOrderProducts;
import com.devpro.shop14.service.SaleOrderProductService;
import com.devpro.shop14.service.SaleOrderService;
import com.devpro.shop14.service.SaleOrderService_2;

@Controller
public class AdminOrderController extends BaseController{

	@Autowired
	SaleOrderService saleOrderService;

	@Autowired
	SaleOrderProductService saleOrderProductService;

	@Autowired
	SaleOrderService_2 saleOrderService_2;

	@RequestMapping(path = "admin/order/page/1", method = RequestMethod.GET)
	public String Default(Model model) {
		return listByPage(model, 1);
	}

	@RequestMapping(path = "admin/order/page/{pageNumber}", method = RequestMethod.GET)
	public String listByPage(Model model, @PathVariable("pageNumber") int currentPage) {

		Page<SaleOrder> pageSaleOrder = saleOrderService_2.findAll(currentPage);
		List<SaleOrder> orders = pageSaleOrder.getContent();
		int totalPage = pageSaleOrder.getTotalPages();

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("orders", orders);

		return "manager/order/order";
	}

//	----------------------------- View - Order ------------------------------------
	@RequestMapping(path = "admin/view-order/{saleOrderId}", method = RequestMethod.GET)
	public String editProduct(Model model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("saleOrderId") int saleOrderId) {

		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		model.addAttribute("saleOrder", saleOrder);

		List<SaleOrderProducts> saleOrderProducts = saleOrderProductService.findBySaleOrderId(saleOrderId);
		model.addAttribute("saleOrderProducts", saleOrderProducts);

		return "manager/order/view-order";
	}

// ------------------------ DELETE ORDER ---------------------------------
	@RequestMapping(path = "/admin/delete-order/{saleOrderId}", method = RequestMethod.GET)
	public String deleteSaleOrder(Model model, @PathVariable("saleOrderId") int saleOrderId) {
		saleOrderService.deleteById(saleOrderId);

		return "redirect:/admin/order/page/1";
	}

	// SET LẠI STATUS CỦA SALEORDER
	@RequestMapping(path = "/admin/set-satusSaleOrder/{saleOrderId}", method = RequestMethod.GET)
	public String setStatus(Model model, @PathVariable("saleOrderId") int saleOrderId) {
		
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		saleOrder.setStatus(true);
		saleOrderService.saveOrUpdate(saleOrder);

		return "redirect:/admin/view-order/" + saleOrderId;
	}

}
