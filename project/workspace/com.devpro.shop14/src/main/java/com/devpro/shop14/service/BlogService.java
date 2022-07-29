package com.devpro.shop14.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.common.Util;
import com.devpro.shop14.dto.Constants;
import com.devpro.shop14.entity.Blog;

@Service
public class BlogService extends BaseService<Blog> implements Constants {

	@Override
	protected Class<Blog> clazz() {
		return Blog.class;
	}
	
	public Blog findBySeo(String seo) {
		String sql = "select * from tbl_blog where seo='" + seo + "'";
		List<Blog> blogs = this.executeNativeSql(sql);
		return blogs.get(0);
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

//	------------------------------- ADD ----------------------------
	@Transactional
	public Blog save(Blog blog, MultipartFile blogAvatar) throws Exception {
		// CHECK Avatar
		if (!isEmptyUploadFile(blogAvatar)) {
			String pathFile = UPLOAD_FILE_ROOT + "blog/avatar/" + blogAvatar.getOriginalFilename();
			blogAvatar.transferTo(new File(pathFile));
			blog.setAvatar("blog/avatar/" + blogAvatar.getOriginalFilename());
		}

		return super.saveOrUpdate(blog);
	}

//	------------------------------- EDIT -----------------------------------------

	@Transactional
	public Blog edit(Blog blog, MultipartFile blogAvatar)
			throws IllegalStateException, IOException {
		Blog blogOnDb = super.getById(blog.getId());
		// CHECK blogAvatar
		if (!isEmptyUploadFile(blogAvatar)) {
			// xóa avatar cũ trong folder
			new File(UPLOAD_FILE_ROOT + blogOnDb.getAvatar()).delete();

			// update avatar mới
			blogAvatar
					.transferTo(new File(UPLOAD_FILE_ROOT + "blog/avatar/" + blogAvatar.getOriginalFilename()));
			blog.setAvatar("blog/avatar/" + blogAvatar.getOriginalFilename());
		} else {
			// sử dụng lại avatar cũ
			blog.setAvatar(blogOnDb.getAvatar());
		}
		blog.setSeo(Util.createSeoLink(blog.getTitle()));
		return super.saveOrUpdate(blog);
	}

}
