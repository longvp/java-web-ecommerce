package com.devpro.shop14.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entity.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}
	
	@Transactional
	public SaleOrder saveOrUpdate(SaleOrder s) {
		return super.saveOrUpdate(s);
	}

}
