<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>

</head>
		
<body>

	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>

	 <!-- Begin Slider With Category Menu Area -->
            <div class="slider-with-banner mt-4">
                <div class="container">
                    <div class="row">
                        <!-- Begin Category Menu Area -->
                        <div class="col-lg-3">
                            <!--Category Menu Start-->
                            <div class="category-menu">
                                <div class="category-heading">
                                    <h2 class="categories-toggle">
                                        <span>Danh mục</span>
                                    </h2>
                                </div>
                                <div id="cate-toggle" class="category-menu-list">
                                    <ul> 
                                       <c:forEach var="item" items="${categories }">
                                        	<li><a href="/shop/${item.seo}/page/1">${item.name }</a></li>
                                       		
                                       </c:forEach>
                                       
                                        <!-- <li class="rx-parent">
                                            <a class="rx-default">More Categories</a>
                                            <a class="rx-show">Less Categories</a>
                                        </li> -->
                                    </ul>
                                </div>
                            </div>
                            <!--Category Menu End-->
                        </div>
                        <!-- Category Menu Area End Here -->
                        <!-- Begin Slider Area -->
                        <div class="col-lg-9">
                            <div class="slider-area pt-sm-30 pt-xs-30">
                                <div class="slider-active owl-carousel">
                                    <!-- Begin Single Slide Area -->
                                    <div class="single-slide align-center-left animation-style-02 bg-4" 
                                    style="background-image: url(user/images/slider/10.jpg);">
                                        <!-- <div class="slider-progress"></div> -->
                                        <div class="slider-content">
                                            <h5>Sale Offer <span>-20% Off</span> This Week</h5>
                                            <h2>Chamcham Galaxy S9 | S9+</h2>
                                            <h3>Starting at <span>$589.00</span></h3>
                                            <div class="default-btn slide-btn">
                                                <a class="links" href="shop-left-sidebar.html">Shopping Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Slide Area End Here -->
                                    <!-- Begin Single Slide Area -->
                                    <div class="single-slide align-center-left animation-style-01 bg-5" 
                                    style="background-image: url(user/images/slider/2.jpg);">
                                        <!-- <div class="slider-progress"></div> -->
                                        <div class="slider-content">
                                            <h5>Sale Offer <span>Black Friday</span> This Week</h5>
                                            <h2>Work Desk Surface Studio 2018</h2>
                                            <h3>Starting at <span>$1599.00</span></h3>
                                            <div class="default-btn slide-btn">
                                                <a class="links" href="shop-left-sidebar.html">Shopping Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Slide Area End Here -->
                                    <!-- Begin Single Slide Area -->
                                    <div class="single-slide align-center-left animation-style-02 bg-6" 
                                    style="background-image: url(user/images/slider/6.jpg);">
                                        <!-- <div class="slider-progress"></div> -->
                                        <div class="slider-content">
                                            <h5>Sale Offer <span>-10% Off</span> This Week</h5>
                                            <h2>Phantom 4 Pro+ Obsidian</h2>
                                            <h3>Starting at <span>$809.00</span></h3>
                                            <div class="default-btn slide-btn">
                                                <a class="links" href="shop-left-sidebar.html">Shopping Now</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Slide Area End Here -->
                                </div>
                            </div>
                        </div>
                        <!-- Slider Area End Here -->
                    </div>
                </div>
            </div>
            <!-- Slider With Category Menu Area End Here -->

            <!-- Begin Product Area -->
            <div class="product-area pt-60 pb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="li-product-tab">
                                <ul class="nav li-product-menu">
                                   <li><a class="active" data-toggle="tab" href="#li-new-product"><span>Sản Phẩm Mới</span></a></li>
                                   <li><a data-toggle="tab" href="#li-bestseller-product"><span>Sản Phẩm Mua Nhiều</span></a></li>
                                   <li><a data-toggle="tab" href="#li-featured-product"><span>Sản Phẩm Nổi Bật</span></a></li>
                                </ul>               
                            </div>
                            <!-- Begin Li's Tab Menu Content Area -->
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="li-new-product" class="tab-pane active show" role="tabpanel">
                            <div class="row">
                                <div class="product-active owl-carousel">
                                   <c:forEach var="item" items="${products }">
                                   <c:if test="${item.isNew == true }">
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap" data-id="${item.id }">
                                            <div class="product-image">
                                                <a href="/detail/${item.seo}">
                                                    <img src="${base }/upload/${item.avatar}" alt="Li's Product Image">
                                                </a>
                                                <c:choose>
                                                	<c:when test="${item.isNew == true }">
                                                		<span class="sticker">New</span>
                                                	</c:when>
                                                	<c:when test="${item.isHot == true }">
                                                		<span class="sticker-hot">Hot</span>
                                                	</c:when>
                                                </c:choose>
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">
                                                        <h5 class="manufacturer">
                                                            <a href="#">${item.categories.name }</a>
                                                        </h5>
                                                        <div class="rating-box">
                                                            <ul class="rating">
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <h4><a class="product_name text-center" href="/detail/${item.seo}">${item.title }</a></h4>
                                                    <div class="price-box text-center">
                                                        <span class="new-price new-price-2">${item.priceVN }</span>
                                                        <!-- <span class="old-price">$77.22</span>
                                                        <span class="discount-percentage">-7%</span> -->
                                                    </div>
                                                </div>
                                                <div class="add-actions">
                                                    <ul class="add-actions-link d-flex justify-content-center">
                                                        <li class="add-cart active"><a href="#">Thêm vào giỏ</a></li>
                                                        <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>  
                                    </c:if>              
									</c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="li-bestseller-product" class="tab-pane" role="tabpanel">
                            <div class="row">
                                <div class="product-active owl-carousel">
                                   <c:forEach var="item" items="${products }">
                                   <c:if test="${item.isBuys == true }">
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap" data-id="${item.id }">
                                            <div class="product-image">
                                                <a href="/detail/${item.seo}">
                                                    <img src="${base }/upload/${item.avatar}" alt="Li's Product Image">
                                                </a>
                                                <c:choose>
                                                	<c:when test="${item.isNew == true }">
                                                		<span class="sticker">New</span>
                                                	</c:when>
                                                	<c:when test="${item.isHot == true }">
                                                		<span class="sticker-hot">Hot</span>
                                                	</c:when>
                                                </c:choose>
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">
                                                        <h5 class="manufacturer">
                                                            <a href="#">${item.categories.name }</a>
                                                        </h5>
                                                        <div class="rating-box">
                                                            <ul class="rating">
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <h4><a class="product_name text-center" href="/detail/${item.seo}">${item.title }</a></h4>
                                                    <div class="price-box text-center">
                                                        <span class="new-price new-price-2">${item.priceVN }</span>
                                                        <!-- <span class="old-price">$77.22</span>
                                                        <span class="discount-percentage">-7%</span> -->
                                                    </div>
                                                </div>
                                                <div class="add-actions">
                                                    <ul class="add-actions-link d-flex justify-content-center">
                                                        <li class="add-cart active"><a href="#">Thêm vào giỏ</a></li>
                                                        <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>  
                                    </c:if>              
									</c:forEach>
                                </div>
                            </div>
                        </div>
                        <div id="li-featured-product" class="tab-pane" role="tabpanel">
                            <div class="row">
                                <div class="product-active owl-carousel">
                                   <c:forEach var="item" items="${products }">
                                   <c:if test="${item.isHot == true }">
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap" data-id="${item.id }">
                                            <div class="product-image">
                                                <a href="/detail/${item.seo}">
                                                    <img src="${base }/upload/${item.avatar}" alt="Li's Product Image">
                                                </a>
                                                <c:choose>
                                                	<c:when test="${item.isNew == true }">
                                                		<span class="sticker">New</span>
                                                	</c:when>
                                                	<c:when test="${item.isHot == true }">
                                                		<span class="sticker-hot">Hot</span>
                                                	</c:when>
                                                </c:choose>
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">
                                                        <h5 class="manufacturer">
                                                            <a href="#">${item.categories.name }</a>
                                                        </h5>
                                                        <div class="rating-box">
                                                            <ul class="rating">
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <h4><a class="product_name text-center" href="/detail/${item.seo}">${item.title }</a></h4>
                                                    <div class="price-box text-center">
                                                        <span class="new-price new-price-2">${item.priceVN }</span>
                                                        <!-- <span class="old-price">$77.22</span>
                                                        <span class="discount-percentage">-7%</span> -->
                                                    </div>
                                                </div>
                                                <div class="add-actions">
                                                    <ul class="add-actions-link d-flex justify-content-center">
                                                        <li class="add-cart active"><a href="#">Thêm vào giỏ</a></li>
                                                        <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>  
                                    </c:if>              
									</c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Product Area End Here -->
            <!-- Begin Li's Static Banner Area -->
            <div class="li-static-banner">
                <div class="container">
                    <div class="row">
                        <!-- Begin Single Banner Area -->
                        <div class="col-lg-4 col-md-4 text-center">
                            <div class="single-banner">
                                <a href="#">
                                    <img src="${base }/user/images/banner/1_1.jpg" alt="Li's Static Banner">
                                </a>
                            </div>
                        </div>
                        <!-- Single Banner Area End Here -->
                        <!-- Begin Single Banner Area -->
                        <div class="col-lg-4 col-md-4 text-center pt-xs-30">
                            <div class="single-banner">
                                <a href="#">
                                    <img src="${base }/user/images/banner/1_2.jpg" alt="Li's Static Banner">
                                </a>
                            </div>
                        </div>
                        <!-- Single Banner Area End Here -->
                        <!-- Begin Single Banner Area -->
                        <div class="col-lg-4 col-md-4 text-center pt-xs-30">
                            <div class="single-banner">
                                <a href="#">
                                    <img src="${base }/user/images/banner/1_5.jpg" alt="Li's Static Banner">
                                </a>
                            </div>
                        </div>
                        <!-- Single Banner Area End Here -->
                    </div>
                </div>
            </div>
            <!-- Li's Static Banner Area End Here -->
            <!-- Begin Li's Laptop Product Area -->
         	<c:forEach var="category" items="${categories }">
            <section class="product-area li-laptop-product pt-60 pb-45">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area -->
                        <div class="col-lg-12">
                            <div class="li-section-title">
                                <h2>
                                    <span>${category.name }</span>
                                </h2>
                                <ul class="li-sub-category-list">
                                    <li class="active"><a href="/shop/${category.seo}/page/1">Xem Thêm</a></li>
                                </ul>
                            </div>
                            <div class="row">
                                <div class="product-active owl-carousel">
                                <c:forEach var="item" items="${products }">  
                                	<c:if test="${item.categories.id == category.id }">                           	
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap" data-id="${item.id }">
                                            <div class="product-image">
                                                <a href="/detail/${item.seo}">
                                                    <img src="${base }/upload/${item.avatar}" alt="Li's Product Image">
                                                </a>
                                                <c:choose>
                                                	<c:when test="${item.isNew == true }">
                                                		<span class="sticker">New</span>
                                                	</c:when>
                                                	<c:when test="${item.isHot == true }">
                                                		<span class="sticker-hot">Hot</span>
                                                	</c:when>
                                                </c:choose>
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">
                                                        <h5 class="manufacturer">
                                                            <a href="#">${item.categories.name }</a>
                                                        </h5>
                                                        <div class="rating-box">
                                                            <ul class="rating">
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                                <li><i class="far fa-star"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <h4><a class="product_name text-center" href="/detail/${item.seo}">${item.title }</a></h4>
                                                    <div class="price-box text-center">
                                                        <span class="new-price new-price-2">${item.priceVN }</span>
                                                        <!-- <span class="old-price">$77.22</span>
                                                        <span class="discount-percentage">-7%</span> -->
                                                    </div>
                                                </div>
                                                <div class="add-actions">
                                                    <ul class="add-actions-link d-flex justify-content-center">
                                                        <li class="add-cart active"><a href="#">Thêm vào giỏ</a></li>
                                                        <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>
                                    </c:if>
                        		</c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- Li's Section Area End Here -->
                    </div>
                </div>
            </section>
         	</c:forEach>
            <!-- Li's Laptop Product Area End Here -->
            <!-- BODY END -->
            
            <!-- FOOTER -->
            <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
            
            <!-- Begin Quick View | Modal Area -->
            <div class="modal fade modal-wrapper" id="exampleModalCenter" >
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <div class="modal-inner-area row">
                                <div class="col-lg-5 col-md-6 col-sm-6">
                                   <!-- Product Details Left -->
                                    <div class="product-details-left">
                                        <div class="product-details-images slider-navigation-1">
                                            <div class="lg-image">
                                                <img src="${base }/user/images/product/Iphone 7 Plus 256 GB Black.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="${base }/user/images/product/Laptop Dell Inspiron N5458-70069879.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="${base }/user/images/product/Tivi Led LG 43LH590T.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="${base }/user/images/product/TIVI LED LG UA24J4100-24 SIÊU PHẨM.jpg" alt="product image">
                                            </div>
                                            <div class="lg-image">
                                                <img src="${base }/user/images/product/TIVI LED Samsung UA43KU6000.jpg" alt="product image">
                                            </div>
                                            
                                        </div>
                                        <div class="product-details-thumbs slider-thumbs-1">                                        
                                            <div class="sm-image"><img src="${base }/user/images/product/Iphone 7 Plus 256 GB Black.jpg" alt="product image thumb"></div>
                                            <div class="sm-image"><img src="${base }/user/images/product/Laptop Dell Inspiron N5458-70069879.jpg" alt="product image thumb"></div>
                                            <div class="sm-image"><img src="${base }/user/images/product/Tivi Led LG 43LH590T.jpg" alt="product image thumb"></div>
                                            <div class="sm-image"><img src="${base }/user/images/product/TIVI LED LG UA24J4100-24 SIÊU PHẨM.jpg" alt="product image thumb"></div>
                                            <div class="sm-image"><img src="${base }/user/images/product/TIVI LED Samsung UA43KU6000.jpg" alt="product image thumb"></div>
                                            
                                        </div>
                                    </div>
                                    <!--// Product Details Left -->
                                </div>

                                <div class="col-lg-7 col-md-6 col-sm-6">
                                    <div class="product-details-view-content pt-60">
                                        <div class="product-info">
                                            <h2>Tên sản phẩm</h2>
                                            <span class="product-details-ref">Trạng thái: còn hàng</span>
                                            <div class="rating-box pt-20">
                                                <ul class="rating rating-with-review-item">
                                                    <li><i class="far fa-star"></i></li>
                                                    <li><i class="far fa-star"></i></li>
                                                    <li><i class="far fa-star"></i></li>
                                                    <li><i class="far fa-star"></i></li>
                                                    <li><i class="far fa-star"></i></li>
                                                    
                                        
                                                </ul>
                                            </div>
                                            <div class="price-box pt-20">
                                                <span class="new-price new-price-2">100.000</span>
                                            </div>
                                            <div class="product-desc">
                                                <p>
                                                    <span> Mô tả ngắn
                                                    </span>
                                                </p>
                                            </div>
                                            <div class="single-add-to-cart">
                                                <form action="#" class="cart-quantity">
                                                    <div class="quantity">
                                                        <label>Số lượng</label>
                                                        <div class="cart-plus-minus">
                                                            <input class="cart-plus-minus-box" value="1" type="text">
                                                            <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                                            <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                                        </div>
                                                    </div>
                                                    <button class="add-to-cart" type="submit">Thêm vào giỏ hàng</button>
                                                </form>
                                            </div>
                                            <div class="product-additional-info pt-25">
                                                <div class="product-social-sharing pt-25">
                                                    <ul>
                                                        <li class="facebook"><a href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
                                                        <li class="twitter"><a href="#"><i class="fa fa-twitter"></i>Twitter</a></li>
                                                        <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i>Google +</a></li>
                                                        <li class="instagram"><a href="#"><i class="fa fa-instagram"></i>Instagram</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   
            <!-- Quick View | Modal Area End Here -->
	
	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			
			function addToCart(productId, quanlity){				
 					var data = {
 		 				productId: productId,
 		 				quanlity: quanlity
 		 			};	
 				
 		 			$.ajax({
 		 				url: "/cart/add",
 		 				type: "POST",
 		 				contentType: "application/json",
 		 				data: JSON.stringify(data),
 		 				dataType: "json",
 		 				success: function(jsonResult){
 		 					var totalItems = jsonResult.totalItems;
 		 					$("#totalCartItem").html(totalItems);
 		 				},
 		 				error: function(jqXhr, textStatus, errorMessage){
 		 					
 		 				}
 		 			});	
 			} 
			
			
			$(".add-cart").click(function(){
				var id = $(this).closest(".col-lg-12").find(".single-product-wrap").attr("data-id");
				addToCart(id, 1);
			}) 
			
			
			/* $(".quick-view-btn").click(function(){
				var id = $(this).closest(".col-lg-12").find(".single-product-wrap").attr("data-id");
				alert(id);
			}) */
			
		})
	
	</script>
        
</body>
</html>