package com.devpro.shop14.dto;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

public class CartItem {
	private int productId;
	private String productSeo;
	private String productAvatar;
	private String productName;
	private int quanlity;
	private BigDecimal priceUnit;
	private String priceUnitVN;// CONVERT priceUnit -> priceUnitVN
	private String totalPriceUnitVN;
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	public String getProductSeo() {
		return productSeo;
	}

	public void setProductSeo(String productSeo) {
		this.productSeo = productSeo;
	}

	public String getProductAvatar() {
		return productAvatar;
	}

	public void setProductAvatar(String productAvatar) {
		this.productAvatar = productAvatar;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

	public String getPriceUnitVN() {
		Locale locale = new Locale("vi", "VN");
		NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
		priceUnitVN = fmt.format(priceUnit);
		return priceUnitVN;
	}

	public void setPriceUnitVN(String priceUnitVN) {
		this.priceUnitVN = priceUnitVN;
	}

	public String getTotalPriceUnitVN() {
		BigDecimal totalPrice = priceUnit.multiply(new BigDecimal(quanlity));
		Locale locale = new Locale("vi", "VN");
		NumberFormat fmt = NumberFormat.getCurrencyInstance(locale);
		totalPriceUnitVN = fmt.format(totalPrice);
		return totalPriceUnitVN;
	}

	public void setTotalPriceUnitVN(String totalPriceUnitVN) {
		this.totalPriceUnitVN = totalPriceUnitVN;
	}

	
	

}
