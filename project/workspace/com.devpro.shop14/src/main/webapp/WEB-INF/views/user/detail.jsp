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
<title>Detail</title>

<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>


</head>
<body>
	
	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>
	
	 <!-- Begin Li's Breadcrumb Area -->
    <div class="breadcrumb-area mb-5">
        <div class="container">
            <div class="breadcrumb-content">
                <ul>
                    <li><a href="/home">Home</a></li>
                    <li class="active">Chi tiết</li>
                </ul>
            </div>
        </div>
    </div>
    
    <!-- Li's Breadcrumb Area End Here -->
    <!-- content-wraper start -->
    <div class="content-wraper">
        <div class="container">
            <div class="row single-product-area">
                <div class="col-lg-5 col-md-6">
                    <!-- Product Details Left -->
                    <div class="product-details-left">
                        <div class="product-details-images slider-navigation-1">                       	
                        	<!-- AVATAR -->
                            <div class="lg-image">
                                <img src="${base }/upload/${product.avatar}" alt="product image">
                            </div>
                        	<!-- LIST PICTURES -->
                           	<c:forEach var="item" items="${product.productImages }">
                           		 <div class="lg-image">
	                                <img src="${base }/upload/${item.path}" alt="product image">
	                            </div>
                           	</c:forEach>           
                        </div>
                        <div class="product-details-thumbs slider-thumbs-1 mt-2">
                        	<!-- AVATAR -->
                            <div class="sm-image"><img src="${base }/upload/${product.avatar}" alt="product image thumb"></div>
                            <!-- LIST PICTURES -->
                            <c:forEach var="item" items="${product.productImages }">
                            	<div class="sm-image"><img src="${base }/upload/${item.path}" alt="product image thumb"></div>
                            </c:forEach>
                           
                        </div>
                    </div>
                    <!--// Product Details Left -->
                </div>

                <div class="col-lg-7 col-md-6">
                    <div class="product-details-view-content pt-60">
                        <div class="product-info">
                            <h2>${product.title }</h2>
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
                                <span class="new-price new-price-2">${product.priceVN }</span>
                            </div>
                            <div class="product-desc">
                                ${product.shortDescription }
                            </div>
                            <div class="single-add-to-cart">
                                <div class="cart-quantity">
                                    <div class="quantity">
                                        <label>Số lượng</label>
                                        <div class="cart-plus-minus">
                                            <input class="cart-plus-minus-box" min="1" value="1" type="text">
                                            <div class="dec qtybutton" id="dec-quantity"><i class="fa fa-angle-down"></i></div>
                                            <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                        </div>
                                    </div>
                                    <button class="add-to-cart" data-id="${product.id }">Thêm vào giỏ hàng</button>
                                </div>
                            </div>
                            <div class="product-additional-info pt-25">

                                <div class="product-social-sharing pt-25">
                                    <ul>
                                        <li class="facebook"><a href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
                                        <li class="twitter"><a href="#"><i class="fa fa-twitter"></i>Twitter</a></li>
                                        <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i>Google
                                                +</a></li>
                                        <li class="instagram"><a href="#"><i class="fa fa-instagram"></i>Instagram</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="block-reassurance">
                                <ul>
                                    <li>
                                        <div class="reassurance-item">
                                            <div class="reassurance-icon">
                                                <i class="far fa-check-square"></i>
                                            </div>
                                            <p>Chính sách bảo mật</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="reassurance-item">
                                            <div class="reassurance-icon">
                                                <i class="fas fa-truck"></i>
                                            </div>
                                            <p>Chính sách giao hàng</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="reassurance-item">
                                            <div class="reassurance-icon">
                                                <i class="fas fa-exchange-alt"></i>
                                            </div>
                                            <p>Chính sách hoàn trả</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- content-wraper end -->
    <!-- Begin Product Area -->
    <div class="product-area pt-35">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="li-product-tab">
                        <ul class="nav li-product-menu">
                            <li><a class="active" data-toggle="tab" href="#description"><span>Thông Số Kỹ
                                        Thuật</span></a></li>
                            <li><a data-toggle="tab" href="#product-details"><span>Mô Tả Chi Tiết</span></a></li>
                            <li><a data-toggle="tab" href="#reviews"><span>Đánh Giá</span></a></li>
                        </ul>
                    </div>
                    <!-- Begin Li's Tab Menu Content Area -->
                </div>
            </div>
            <div class="tab-content">
                <div id="description" class="tab-pane active show" role="tabpanel">
                    <div class="product-description">
                        ${product.specification }
                    </div>
                </div>
                <div id="product-details" class="tab-pane" role="tabpanel">
                    <div class="product-details-manufacturer">
						${product.detailDescription }
                    </div>
                </div>
                <div id="reviews" class="tab-pane" role="tabpanel">
                    <div class="product-reviews">
                        <div class="product-details-comment-block">
                            <div class="comment-review">		
                                <div id="fb-root"></div>
								<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v12.0&appId=649350549306358&autoLogAppEvents=1" nonce="RZPOPqyP"></script>
                            	<div class="fb-comments" data-href="http://localhost:8080/blog" data-width="" data-numposts="5"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Product Area End Here -->
 
	 <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>       
 	
 	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
 	
 	<script type="text/javascript">
 	
 		$(document).ready(function(){
 			
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
	 					location.reload();
	 				},
	 				error: function(jqXhr, textStatus, errorMessage){
	 					
	 				}
	 			});	
			} 
		
			$(".add-to-cart").click(function(){
				var id = $(this).attr("data-id");
				var conf = confirm("Thêm vào giỏ hàng ???");
				if(conf == true){
					addToCart(id, quantity);				
				}
			}) 
 			
 		})
 	
 	</script>
	
</body>
</html>