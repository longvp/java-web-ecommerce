package com.devpro.shop14.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.dto.Constants;
import com.devpro.shop14.dto.ProductSearch;
import com.devpro.shop14.entity.Product;
import com.devpro.shop14.entity.ProductImages;

@Service
public class ProductService extends BaseService<Product> implements Constants {

	@Override
	protected Class<Product> clazz() {
		return Product.class;
	}
	
	public Product findBySeo(String seo) {
		String sql = "select * from tbl_products where seo='" + seo + "'";
		List<Product> products = this.executeNativeSql(sql);
		return products.get(0);
	}

	// FIND PRODUCT BY CATEGORYID
	public List<Product> findByCategoryId(int categoryId){
		String sql = "select * from tbl_products where category_id = " + categoryId;
		List<Product> products = this.executeNativeSql(sql);	
		return products;
	}
	 
	// old
	// SEARCH
	public List<Product> search(ProductSearch productSearch){		
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";
		// tim kiem san pham theo seachText
		if (!StringUtils.isEmpty(productSearch.getKeyword())) {
			sql += " and (p.title like '%" + productSearch.getKeyword() + "%'" + " or p.detail_description like '%"
					+ productSearch.getKeyword() + "%'" + " or p.short_description like '%"
					+ productSearch.getKeyword() + "%')";
		}		
		// chi lay san pham chua xoa
		sql += " and p.status=1 ";		
		return super.executeNativeSqlWithPaging(sql, productSearch.getPage());
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length == 0) {
			return true;
		}
		if (images.length == 1 && images[0].getOriginalFilename().isEmpty()) {
			return true;
		}
		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

//	------------------------------- ADD ----------------------------
	@Transactional
	public Product save(Product product, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws Exception {
		// CHECK productAvatar
		if (!isEmptyUploadFile(productAvatar)) {
			String pathFile = UPLOAD_FILE_ROOT + "product/avatar/" + productAvatar.getOriginalFilename();
			productAvatar.transferTo(new File(pathFile));
			product.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		}
		// CHECK productPictures
		if (!isEmptyUploadFile(productPictures)) {
			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File(UPLOAD_FILE_ROOT + "product/pictures/" + pic.getOriginalFilename()));
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				product.addProductImages(pi);
			}
		}

		return super.saveOrUpdate(product);
	}

//	------------------------------- EDIT -----------------------------------------

	@Transactional
	public Product edit(Product product, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {		
		Product productOnDb = super.getById(product.getId());		
		// CHECK productAvatar
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar cũ trong folder
			new File(UPLOAD_FILE_ROOT + productOnDb.getAvatar()).delete();
			
			// update avatar mới
			productAvatar.transferTo(new File(UPLOAD_FILE_ROOT + "product/avatar/" + productAvatar.getOriginalFilename()));
			product.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		}else {
			// sử dụng lại avatar cũ
			product.setAvatar(productOnDb.getAvatar());
		}
		// CHECK productPictures
		if (!isEmptyUploadFile(productPictures)) {
			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File(UPLOAD_FILE_ROOT + "product/pictures/" + pic.getOriginalFilename()));
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				product.addProductImages(pi);
			}
		}		
		return super.saveOrUpdate(product);
	}
	

}
