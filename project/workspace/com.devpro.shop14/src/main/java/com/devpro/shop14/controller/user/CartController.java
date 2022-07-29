package com.devpro.shop14.controller.user;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.dto.Cart;
import com.devpro.shop14.dto.CartItem;
import com.devpro.shop14.entity.Product;
import com.devpro.shop14.entity.SaleOrder;
import com.devpro.shop14.entity.SaleOrderProducts;
import com.devpro.shop14.service.ProductService;
import com.devpro.shop14.service.SaleOrderService;

@Controller
public class CartController extends BaseController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	ProductService productService;

	@Autowired
	SaleOrderService saleOrderService;

//	THANH TOÁN
	@RequestMapping(path = "/thanhtoan", method = RequestMethod.GET)
	public String thanhToanDefault() {
		return "user/thanhtoan";
	}

//	VIEW CART
	@RequestMapping(path = "/view-cart", method = RequestMethod.GET)
	public String viewCart() {
		return "user/cart";
	}

	@RequestMapping(path = "/thanhtoan", method = RequestMethod.POST)
	public String thanhToan(Model model, HttpServletRequest request, HttpServletResponse response) {
		String customerName = request.getParameter("customerName");
		String customerEmail = request.getParameter("customerEmail");
		String customerAddress = request.getParameter("customerAddress");
		String customerPhone = request.getParameter("customerPhone");

		// TẠO HÓA ĐƠN
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCustomerName(customerName);
		saleOrder.setCustomerEmail(customerEmail);
		saleOrder.setCustomerAddress(customerAddress);
		saleOrder.setCustomerPhone(customerPhone);
		saleOrder.setCode("ORDER-" + System.currentTimeMillis());
		saleOrder.setSeo("ORDER-" + System.currentTimeMillis());
		saleOrder.setCreatedDate(new Date(System.currentTimeMillis()));
		saleOrder.setStatus(false);
		// kết hợp các sản phẩm trong giỏ hàng vào hóa đơn
		HttpSession session = request.getSession();
		String totalPriceAllProduct = (String) session.getAttribute("totalPriceAllProduct");
		saleOrder.setTotal(totalPriceAllProduct);

		Cart cart = (Cart) session.getAttribute("cart");
		for (CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuanlity());
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}

		// LƯU VÀO CƠ SỞ DỮ LIỆU
		saleOrderService.saveOrUpdate(saleOrder);

		// SEND MAIL
		try {
			sendMail(saleOrder, cart);
		} catch (UnsupportedEncodingException | MessagingException e) {
			e.printStackTrace();
		}

		session.setAttribute("cart", null);

		return "redirect:/home";
	}

// ---------------------------- SEND MAIL --------------------------------------------
	public void sendMail(SaleOrder saleOrder, Cart cart) throws UnsupportedEncodingException, MessagingException {
		String subject = "Thông báo xác nhận đơn hàng";
		String senderName = "Shop For You";
		String mailContent = "<p> Dear " + saleOrder.getCustomerName() + "</p>";
		mailContent += "<h2> Thông tin đơn hàng " + saleOrder.getCode() + "</h2>";

		mailContent += "<table>";
		mailContent += "<tr>";
		mailContent += "<th>Tên sản phẩm</th>";
		mailContent += "<th>Số lượng</th>";
		mailContent += "<th>Giá</th>";
		mailContent += "</tr>";
		for (CartItem cartItem : cart.getCartItems()) {
			mailContent += "<tr>";
			mailContent += "<td>" + cartItem.getProductName() + "</td>";
			mailContent += "<td>" + cartItem.getQuanlity() + "</td>";
			mailContent += "<td>" + cartItem.getPriceUnitVN() + "</td>";
			mailContent += "</tr>";
		}
		mailContent += "</table>";
		mailContent += "<h4> Tổng Cộng:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ saleOrder.getTotal() + "</h4>";
		mailContent += "<p>-------------------------------------------------------------</p>";
		mailContent += "<h2> Thông tin khách hàng </h2>";
		mailContent += "<p> Tên Khách Hàng: " + saleOrder.getCustomerName() + "</p>";
		mailContent += "<p> Số điện thoại liên lạc: " + saleOrder.getCustomerPhone() + "</p>";
		mailContent += "<p> Địa chỉ: " + saleOrder.getCustomerAddress() + "</p>";
		mailContent += "<p>Cám ơn bạn đã mua hàng!</p>";
		mailContent += "<p>" + senderName + "</p>";

		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setFrom("shopfforyou@gmail.com", senderName);
		helper.setTo(saleOrder.getCustomerEmail());
		helper.setSubject(subject);
		helper.setText(mailContent, true);

		mailSender.send(message);
	}

	// DÙNG ĐỂ THÊM SẢN PHẨM VÀO GIỎ HÀNG - AJAX
	@RequestMapping(path = "/cart/add", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(Model model, HttpServletRequest request,
			HttpServletResponse response, @RequestBody CartItem newItem) {
		HttpSession session = request.getSession();
		// LAY THONG TIN GIO HANG
		Cart cart = new Cart();
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		// LAY DANH SACH SAN PHAM CO TRONG GIO HANG
		List<CartItem> cartItems = cart.getCartItems();
		// KIEM TRA NEU CO TRONG GIO HANG THI TANG SO LUONG LEN
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == newItem.getProductId()) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() + newItem.getQuanlity());
			}
		}
		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			Product productInDb = productService.getById(newItem.getProductId());
			newItem.setProductName(productInDb.getTitle());
			newItem.setPriceUnit(productInDb.getPrice());
			newItem.setProductSeo(productInDb.getSeo());
			newItem.setProductAvatar(productInDb.getAvatar());
			cart.getCartItems().add(newItem);
		}
		// trả kết quả
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", totalItems(request));

		session.setAttribute("totalItems", totalItems(request));
		session.setAttribute("totalPriceAllProduct", totalPriceAllProduct(request));

		return ResponseEntity.ok(jsonResult);
	}

	private int totalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			// total += item.getQuanlity();
			total++;
		}
		return total;
	}

	private String totalPriceAllProduct(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		Locale locale = new Locale("vi", "VN");
		NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
		String totalPriceUnitVN = "";

		if (httpSession.getAttribute("cart") == null) {
			totalPriceUnitVN = fmt.format(0);
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();
		BigDecimal sum = new BigDecimal(0);
		for (int i = 0; i < cartItems.size(); i++) {
			BigDecimal totalPriceUnit = cartItems.get(i).getPriceUnit()
					.multiply(new BigDecimal(cartItems.get(i).getQuanlity()));
			sum = sum.add(totalPriceUnit);
		}

		totalPriceUnitVN = fmt.format(sum);

		return totalPriceUnitVN;
	}

// ----------------------------- DELETE CARTITEM ----------------------------
	@RequestMapping(path = "/cart/delete-cart-item/{productId}", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteCartItem(Model model, HttpServletRequest request,
			@RequestBody CartItem cartItem, @PathVariable("productId") int productId) {
		HttpSession session = request.getSession();
		// LAY THONG TIN GIO HANG
		Cart cart = new Cart();
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// LAY DANH SACH SAN PHAM CO TRONG GIO HANG
		List<CartItem> cartItems = cart.getCartItems();

		for (int i = 0; i < cartItems.size(); i++) {
			if (cartItems.get(i).getProductId() == productId) {
				cartItems.remove(i);
			}
		}

		if (cartItems.size() == 0) {
			session.setAttribute("cart", null);
		}

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", totalItems(request));

		session.setAttribute("totalItems", totalItems(request));
		session.setAttribute("totalPriceAllProduct", totalPriceAllProduct(request));

		return ResponseEntity.ok(jsonResult);
	}

	// SET LẠI SỐ LƯỢNG CỦA CARTITEM TRONG VIEW-CART.JSP
	@RequestMapping(path = "/cart/set-quanlity/{productId}/{quanlity}", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> setCartItem(Model model, HttpServletRequest request,
			@RequestBody CartItem cartItem, @PathVariable("productId") int productId,
			@PathVariable("quanlity") int quanlity) {
		HttpSession session = request.getSession();
		// LAY THONG TIN GIO HANG
		Cart cart = new Cart();
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// LAY DANH SACH SAN PHAM CO TRONG GIO HANG
		List<CartItem> cartItems = cart.getCartItems();

		for (int i = 0; i < cartItems.size(); i++) {
			if (cartItems.get(i).getProductId() == productId) {
				cartItems.get(i).setQuanlity(quanlity);
			}
		}

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");

		session.setAttribute("totalPriceAllProduct", totalPriceAllProduct(request));

		return ResponseEntity.ok(jsonResult);
	}

}
