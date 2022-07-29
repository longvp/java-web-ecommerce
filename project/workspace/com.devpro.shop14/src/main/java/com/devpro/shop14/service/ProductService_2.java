package com.devpro.shop14.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.devpro.shop14.entity.Product;
import com.devpro.shop14.repository.ProductRepsotitory;

@Service
public class ProductService_2 {
	
	private final int SIZE_OF_PAGE = 6;
	
	@Autowired
	ProductRepsotitory productRepository;
	
	public Page<Product> findAll(int pageNumber){
		Pageable pageable = PageRequest.of(pageNumber-1, SIZE_OF_PAGE);
		return productRepository.findAll(pageable);
	}
	
	public Page<Product> findAllByCategoryId(int categoryId, int pageNumber){
		Pageable pageable = PageRequest.of(pageNumber-1, SIZE_OF_PAGE);
		return productRepository.findAllByCategoryId(categoryId, pageable);
	}
	
	public Page<Product> findAllByCategoryId(int categoryId, int pageNumber, 
			String sortField, String sortDir){
		Sort sort = Sort.by(sortField);
		if(sortDir.equals("asc")) {
			sort = sort.ascending();
		}
		if(sortDir.equals("desc")) {
			sort = sort.descending();
		}
		Pageable pageable = PageRequest.of(pageNumber-1, SIZE_OF_PAGE, sort);
		return productRepository.findAllByCategoryId(categoryId, pageable);
	}
	
	public Page<Product> findAllByCategoryIdAndPrice(int categoryId, String typePrice, int pageNumber){
		Pageable pageable = PageRequest.of(pageNumber-1, SIZE_OF_PAGE);
		BigDecimal priceStart = null;
		BigDecimal priceEnd = null;
		if(typePrice.equals("1")) {
			priceStart = new BigDecimal(0);
			priceEnd = new BigDecimal(5000000);
		}
		if(typePrice.equals("2")) {
			priceStart = new BigDecimal(5000000);
			priceEnd = new BigDecimal(10000000);
		}
		if(typePrice.equals("3")) {
			priceStart = new BigDecimal(10000000);
			priceEnd = new BigDecimal(20000000);
		}
		if(typePrice.equals("4")) {
			priceStart = new BigDecimal(20000000);
			priceEnd = new BigDecimal(30000000);
		}
		if(typePrice.equals("5")) {
			priceStart = new BigDecimal(30000000);
			priceEnd = new BigDecimal(100000000);
		}
		return productRepository.findAllByCategoryIdAndPrice(categoryId, priceStart, priceEnd, pageable);
	}
	
	public List<Product> findAllBySearchTitle(String title){
		return productRepository.findAllByTitle(title);
	}

}
