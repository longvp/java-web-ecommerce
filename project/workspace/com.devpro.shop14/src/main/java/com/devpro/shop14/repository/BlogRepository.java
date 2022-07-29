package com.devpro.shop14.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devpro.shop14.entity.Blog;

@Repository
public interface BlogRepository extends JpaRepository<Blog, Integer>{

}
