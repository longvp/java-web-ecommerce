package com.devpro.shop14.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devpro.shop14.entity.Product;

@Repository
public interface ProductRepsotitory extends JpaRepository<Product, Integer>{

	@Query(value="select * from tbl_products where category_id = ?1", nativeQuery = true)
	Page<Product> findAllByCategoryId(int categoryId, Pageable pageable);
	
	@Query(value = "select * from tbl_products where category_id = ?1 and price >= ?2 and price <= ?3", nativeQuery = true)
	Page<Product> findAllByCategoryIdAndPrice(int categoryId, BigDecimal priceStart, BigDecimal priceEnd, Pageable pageable);
	
	@Query(value="select * from tbl_products where title like %?1%", nativeQuery = true)
	List<Product> findAllByTitle(String title);
	
}
