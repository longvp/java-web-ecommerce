package com.devpro.shop14.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entity.Category;

@Service
public class CategoryService extends BaseService<Category> {

	@Override
	protected Class<Category> clazz() {		
		return Category.class;
	}
	
	public Category findBySeo(String seo) {
		String sql = "select * from tbl_category where seo='" + seo + "'";
		List<Category> categories = this.executeNativeSql(sql);
		return categories.get(0);
	}
	
	public List<Category> findAllActive(){
		String sql = "select * from tbl_category where status = 1";
		return super.executeNativeSql(sql);
	}
	

}
