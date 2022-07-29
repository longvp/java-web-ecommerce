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
<title>SHOP</title>

<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>

</head>

<body>

<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>

<!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="/home">Home</a></li>
                            <li class="active">${category.name }</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Begin Li's Content Wraper Area -->
            <div class="content-wraper pt-60 pb-60 pt-sm-30 mt-5">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 order-1 order-lg-2">
                            <!-- Begin Li's Banner Area -->
                            <div class="single-banner shop-page-banner">
                                <a href="#">
                                    <img src="${base}/user/images/bg-banner/2.jpg" alt="Li's Static Banner">
                                </a>
                            </div>
                            <!-- Li's Banner Area End Here -->
                            <!-- shop-top-bar start -->
                            <div class="shop-top-bar mt-30">
                                <div class="shop-bar-inner">
                                    <div class="product-view-mode">
                                        <!-- shop-item-filter-list start -->
                                        <ul class="nav shop-item-filter-list" role="tablist">
                                            <li class="active" role="presentation"><a aria-selected="true" class="active show" data-toggle="tab" role="tab" aria-controls="grid-view" href="#grid-view"><i class="fa fa-th"></i></a></li>
                                            
                                        </ul>
                                        <!-- shop-item-filter-list end -->
                                    </div>  
                                </div>
                                <!-- product-select-box start -->
                                <!-- <div class="product-select-box">
                                    <div class="product-short">
                                        <p>Sắp xếp theo:</p>
                                        <select class="nice-select">
                                            <option value="trending">Mặc định</option>
                                            <option value="sales" id="az">Tên (A - Z)</option>
                                            <option value="sales">Tên (Z - A)</option>
                                            <option value="rating">Giá (Thấp &gt; Cao)</option>
                                            <option value="rating">Giá (Cao &gt; Thấp)</option>
                                        </select>
                                        <div class=""></div>
                                    </div>
                                </div> -->
                                <!-- product-select-box end -->
                            </div>
                            <!-- shop-top-bar end -->
                            <!-- shop-products-wrapper start -->
                            <div class="shop-products-wrapper">
                                <div class="tab-content">
                                    <div id="grid-view" class="tab-pane fade active show" role="tabpanel">
                                        <div class="product-area shop-product-area">
                                            <div class="row">
                                            	<c:forEach var="item" items="${products }">
	                                                <div class="col-lg-4 col-md-4 col-sm-6 mt-40">
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
				                                                    <h4 class="text-center"><a class="product_name" href="/detail/${item.seo}">${item.title }</a></h4>
				                                                    <div class="price-box text-center">
				                                                        <span class="new-price new-price-2">${item.priceVN }</span>
				                                                        
				                                                    </div>
				                                                </div>
				                                                <div class="add-actions">
				                                                    <ul class="add-actions-link d-flex justify-content-center">
				                                                        <li class="add-cart active"><a href="#">Thêm vào giỏ</a></li>
				                                                        <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter${item.id }"><i class="fa fa-eye"></i></a></li>
				                                                    </ul>
				                                                </div>
				                                            </div>
				                                        </div>
	                                                    <!-- single-product-wrap end -->
	                                                </div>                       
	                                                   <!-- Begin Quick View | Modal Area -->
											            <div class="modal fade modal-wrapper" id="exampleModalCenter${item.id }" >
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
											                                        	<!-- AVATAR -->
											                                            <div class="lg-image">
											                                                <img src="${base }/upload/${item.avatar}" alt="product image">
											                                            </div>
											                                            <!-- LIST PICTURES -->
											                                            <c:forEach var="productImage" items="${item.productImages }">
															                           		 <div class="lg-image">
																                                <img src="${base }/upload/${productImage.path}" alt="product image">
																                            </div>
															                           	</c:forEach> 
											                                            
											                                            
											                                        </div>
											                                        <div class="product-details-thumbs slider-thumbs-1">                                        
											                                            <!-- AVATAR -->
											                                            <div class="sm-image">
											                                                <img src="${base }/upload/${item.avatar}" alt="product image">
											                                            </div>
											                                            <!-- LIST PICTURES -->
											                                            <c:forEach var="productImage" items="${item.productImages }">
															                           		 <div class="sm-image">
																                                <img src="${base }/upload/${productImage.path}" alt="product image">
																                            </div>
															                           	</c:forEach> 										                                            
											                                        </div>
											                                    </div>
											                                    <!--// Product Details Left -->
											                                </div>	
											                                <div class="col-lg-7 col-md-6 col-sm-6">
											                                    <div class="product-details-view-content pt-60">
											                                        <div class="product-info">
											                                            <h2>${item.title }</h2>
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
											                                                <span class="new-price new-price-2">${item.priceVN }</span>
											                                            </div>
											                                            <div class="product-desc">
											                                                ${item.shortDescription }
											                                            </div>
											                                            <div class="single-add-to-cart">
											                                                <form action="#" class="cart-quantity">
											                                                    <div class="quantity">
											                                                        <label>Số lượng</label>
											                                                        <div class="cart-plus-minus">
											                                                            <input class="cart-plus-minus-box" class="quantity" value="1" type="text">
											                                                            <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
											                                                            <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
											                                                        </div>
											                                                    </div>
											                                                    <button class="add-to-cart" data-id="${item.id } type="submit">Thêm vào giỏ hàng</button>
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
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                   <!-- PAGING -->
                                    <div class="paginatoin-area">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 pt-xs-15">
                                               <!--  <p>Showing 1-12 of 13 item(s)</p> -->
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <ul class="pagination-box pt-xs-20 pb-xs-15">
                                                    <c:if test="${currentPage > 1 }">
                                                    	<li><a href="/shop/${category.seo}/page/${currentPage - 1}" class="Previous"><i class="fa fa-chevron-left"></i> Previous</a></li>                    
                                                    </c:if>
                                                    <c:forEach var="i" begin="1" end="${totalPage }">
													 	<li class="active"><a href="/shop/${category.seo}/page/${i}">${i }</a></li> 	
													 </c:forEach>  
													 <c:if test="${currentPage < totalPage}">
                                                    	<li><a href="/shop/${category.seo}/page/${currentPage + 1}" class="Next"> Next <i class="fa fa-chevron-right"></i></a></li>
                                                	 </c:if>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- PAGING END-->
                                </div>
                            </div>
                            <!-- shop-products-wrapper end -->
                        </div>
                        <div class="col-lg-3 order-2 order-lg-1">
                            <!--sidebar-categores-box start  -->
                            <div class="sidebar-categores-box mt-sm-30 mt-xs-30">
                                <div class="sidebar-title">
                                    <h2>Danh mục</h2>
                                </div>
                                <!-- category-sub-menu start -->
                                <div class="category-sub-menu">
                                    <ul>
                                    	<c:forEach var="item" items="${categories }">
                                    		<li><a href="/shop/${item.seo}/page/1">${item.name }</a></li>
                                    	</c:forEach>         
                                    </ul>
                                </div>
                                <!-- category-sub-menu end -->
                            </div>
                            <!--sidebar-categores-box end  -->
                            <!--sidebar-categores-box start  -->
                            <div class="sidebar-categores-box">
                                <div class="sidebar-title">
                                    <h2>Lọc sản phẩm</h2>
                                </div>
                                <!-- btn-clear-all start -->
                                <!-- <button class="btn-clear-all mb-sm-30 mb-xs-30">Clear all</button> -->
                                <!-- btn-clear-all end -->
                                <!-- filter-sub-area start -->
                                <!-- <div class="filter-sub-area">
                                    <h5 class="filter-sub-titel">Categories</h5>
                                    <div class="categori-checkbox">
                                        <form action="#">
                                            <ul>
                                                <li><input type="checkbox" name="product-categori"><a href="#">Prime Video (13)</a></li>
                                                <li><input type="checkbox" name="product-categori"><a href="#">Computers (12)</a></li>
                                                <li><input type="checkbox" name="product-categori"><a href="#">Electronics (11)</a></li>
                                            </ul>
                                        </form>
                                        <ul>
                                        	<li><a href="#">Prime Video (13)</a></li>
                                        	<li><a href="#">Computers (12)</a></li>
                                        	<li><a href="#">Electronics (11)</a></li>
                                        </ul>
                                    </div>
                                 </div> -->
                                <!-- filter-sub-area end -->
                                <!-- filter-sub-area start -->
                                <!-- <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                    <h5 class="filter-sub-titel">Thương hiệu</h5>
                                    <div class="categori-checkbox category-sub-menu">
                                       <ul>
                                        	<li><a href="#">Prime Video (13)</a></li>
                                        	<li><a href="#">Computers (12)</a></li>
                                        	<li><a href="#">Electronics (11)</a></li>
                                        </ul>
                                    </div>
                                 </div>  -->
                                <!-- filter-sub-area end -->
                                <!-- filter-sub-area start -->
                                <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                    <h5 class="filter-sub-titel">Sắp xếp theo:</h5>
                                    <div class="size-checkbox category-sub-menu">
                                       <ul>
                                        	<li><a href="/shop/${category.seo}/page/${currentPage}">Mặc định</a></li>
                                        	<li><a href="/shop/${category.seo}/page/${currentPage}?sortField=title&sortDir=asc">Tên (A - Z)</a></li>
                                        	<li><a href="/shop/${category.seo}/page/${currentPage}?sortField=title&sortDir=desc">Tên (Z - A)</a></li>
                                        	<li><a href="/shop/${category.seo}/page/${currentPage}?sortField=price&sortDir=asc">Giá (Thấp - Cao)</a></li>
                                        	<li><a href="/shop/${category.seo}/page/${currentPage}?sortField=price&sortDir=desc">Giá (Cao - Thấp)</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- filter-sub-area end -->
                                <!-- filter-sub-area start -->
                                <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                    <h5 class="filter-sub-titel">Giá</h5>
                                    <div class="color-categoriy category-sub-menu">
                                         <ul>
                                            <li><a href="/shop/${category.seo}/page/${currentPage}?typePrice=1">Dưới 5.000.000 đ</a></li>
                                            <li><a href="/shop/${category.seo}/page/${currentPage}?typePrice=2">5.000.000 đ - 10.000.000 đ</a></li>
                                            <li><a href="/shop/${category.seo}/page/${currentPage}?typePrice=3">10.000.000 đ - 20.000.000 đ</a></li>
                                            <li><a href="/shop/${category.seo}/page/${currentPage}?typePrice=4">20.000.000 đ - 30.000.000 đ</a></li>
                                            <li><a href="/shop/${category.seo}/page/${currentPage}?typePrice=5">Trên 30.000.000 đ</a></li>
                                         </ul>
                                    </div>
                                </div> 
                                <!-- filter-sub-area end -->
                                <!-- filter-sub-area start -->
                                <!-- <div class="filter-sub-area pt-sm-10 pb-sm-15 pb-xs-15">
                                    <h5 class="filter-sub-titel">Dimension</h5>
                                    <div class="categori-checkbox">
                                        <form action="#">
                                            <ul>
                                                <li><input type="checkbox" name="product-categori"><a href="#">40x60cm (6)</a></li>
                                                <li><input type="checkbox" name="product-categori"><a href="#">60x90cm (6)</a></li>
                                                <li><input type="checkbox" name="product-categori"><a href="#">80x120cm (6)</a></li>
                                            </ul>
                                        </form>
                                    </div>
                                 </div> -->
                                <!-- filter-sub-area end -->
                            </div>
                            <!--sidebar-categores-box end  -->
                            <!-- category-sub-menu start -->
                            <%-- <div class="sidebar-categores-box mb-sm-0 mb-xs-0">
                                <div class="sidebar-title">
                                    <h2>Sắp xếp theo</h2>
                                </div>
                                <div class="category-tags">
                                    <ul>
                                        <li><a href="/shop/${category.seo}/page/${currentPage}">Mặc định</a></li>
                                        <li><a href="/shop/${category.seo}/page/${currentPage}?sortField=title&sortDir=asc">Tên (A - Z)</a></li>
                                        <li><a href="/shop/${category.seo}/page/${currentPage}?sortField=title&sortDir=desc">Tên (Z - A)</a></li>
                                        <li><a href="/shop/${category.seo}/page/${currentPage}?sortField=price&sortDir=asc">Giá (Thấp - Cao)</a></li>
                                        <li><a href="/shop/${category.seo}/page/${currentPage}?sortField=price&sortDir=desc">Giá (Cao - Thấp)</a></li>
                                        <li><a href="# ">Accessories</a></li>
                                    </ul>
                                </div> --%>
                                <!-- category-sub-menu end -->
                            <!-- </div> -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content Wraper Area End Here -->

	<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
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
			var id = $(this).closest(".col-lg-4 ").find(".single-product-wrap").attr("data-id");
			addToCart(id, 1);
		}) 
		
		var quantity = $(".cart-plus-minus-box").val();
			
 		$(".cart-plus-minus-box").change(function(){
 			quantity = $(this).val();
 		})
 			
 		$(".inc").click(function(){
 			quantity = $(".cart-plus-minus-box").val();
 		})
 			
 		$(".dec").click(function(){
 			quantity = $(".cart-plus-minus-box").val();
 		})
 		
 		$(".add-to-cart").click(function(){
			var id = $(this).attr("data-id");
			var ID = parseInt(id);
			var conf = confirm("Thêm vào giỏ hàng ???");
			if(conf == true){
				addToCart(ID, quantity);				
			}
		}) 
		
		/* ----------------------------------------------------------------- */
		/* $("#az").click(function(){
			location.href= "/shop/${category.seo}/page/2";
		}) */
		
		
	})
	
	</script>
	
</body>
</html>