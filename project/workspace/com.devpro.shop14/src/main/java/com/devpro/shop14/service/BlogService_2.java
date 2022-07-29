package com.devpro.shop14.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.devpro.shop14.entity.Blog;
import com.devpro.shop14.repository.BlogRepository;

@Service
public class BlogService_2 {
	
	@Autowired
	BlogRepository blogRepository;
	
	public Page<Blog> findAll(int pageNumber){
		Pageable pageable = PageRequest.of(pageNumber-1, 2);
		return blogRepository.findAll(pageable);
	}

}
