package com.devpro.shop14.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entity.SaleOrderProducts;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProducts> {
	
	public List<SaleOrderProducts> findBySaleOrderId(int saleOrderId){
		String sql = "select * from tbl_saleorder_products where saleorder_id = " + saleOrderId;
		return this.executeNativeSql(sql);
	}

	@Override
	protected Class<SaleOrderProducts> clazz() {
		return SaleOrderProducts.class;
	}

}
