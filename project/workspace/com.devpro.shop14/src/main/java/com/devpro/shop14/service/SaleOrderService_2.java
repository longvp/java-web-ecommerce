package com.devpro.shop14.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.devpro.shop14.entity.SaleOrder;
import com.devpro.shop14.repository.SaleOrderRepository;

@Service
public class SaleOrderService_2 {
	
	@Autowired
	SaleOrderRepository saleOrderRepo;
	
	public Page<SaleOrder> findAll(int pageNumber){
		Pageable pageable = PageRequest.of(pageNumber-1, 5);
		return saleOrderRepo.findAll(pageable);
	}

}
