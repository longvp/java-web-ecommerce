<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%> 
    
<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>

<!-- HEADER -->
            <header>
                <!-- Begin Header Top Area -->
                <div class="header-top">
                    <div class="container">
                        <div class="row">
                            <!-- Begin Header Top Left Area -->
                            <div class="col-lg-3 col-md-4">
                                <div class="header-top-left">
                                    <ul class="phone-wrap">
                                        <li><span>Điện thoại:</span><a href="#">(+84) 0123 456 789</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Header Top Left Area End Here -->
                            <!-- Begin Header Top Right Area -->
                            <div class="col-lg-9 col-md-8">
                                <div class="header-top-right">
                                    <ul class="ht-menu">
                                        <!-- Begin Setting Area -->
                                        <c:if test="${userLogined == null }">
	                                        <li>
	                                            <div class="ht-setting-trigger"><span><i class="fas fa-user"></i></span></div>
	                                            <div class="setting ht-setting">
	                                                <ul class="ht-setting-list">
	                                                    <li><a href="/login">Đăng Nhập</a></li>
	                                                    <li><a href="/register">Đăng Ký</a></li>
	                                                </ul>
	                                            </div>
	                                        </li>
	                                     </c:if>
	                                     <c:if test="${userLogined != null }">
	                                        <li>
	                                            <div class="ht-setting-trigger"><span>${userLogined.userName }<i class="fas fa-user"></i></span></div>
	                                            <div class="setting ht-setting">
	                                                <ul class="ht-setting-list">
	                                                    <li><a href="/logout">Đăng Xuất</a></li>
	                                                </ul>
	                                            </div>
	                                        </li>
	                                     </c:if>
                                        <!-- Setting Area End Here -->
                                    </ul>
                                </div>
                            </div>
                            <!-- Header Top Right Area End Here -->
                        </div>
                    </div>
                </div>
                <!-- Header Top Area End Here -->
                <!-- Begin Header Middle Area -->
                <div class="header-middle pl-sm-0 pr-sm-0 pl-xs-0 pr-xs-0">
                    <div class="container">
                        <div class="row">
                            <!-- Begin Header Logo Area -->
                            <div class="col-lg-3">
                                <div class="logo pb-sm-30 pb-xs-30">
                                    <a href="/home">
                                        <img src="${base}/user/images/menu/logo/1.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <!-- Header Logo Area End Here -->
                            <!-- Begin Header Middle Right Area -->
                            <div class="col-lg-9 pl-0 ml-sm-15 ml-xs-15">
                                <!-- Begin Header Middle Searchbox Area -->
                                <form method="post" action="/search" class="hm-searchbox">
                                    <input type="text" name="keyword" placeholder="Bạn tìm kiếm gì ...">
                                    <button class="li-btn" type="submit"><i class="fa fa-search"></i></button>
                                </form>
                                <!-- Header Middle Searchbox Area End Here -->
                                <!-- Begin Header Middle Right Area -->
                                <div class="header-middle-right">
                                    <ul class="hm-menu">
                                        <!-- Begin Header Mini Cart Area -->
                                        <li class="hm-minicart">
                                            <div class="hm-minicart-trigger">
                                                <span class="item-icon"></span>
                                               	<c:if test="${cart == null }">
                                               		 <span class="item-text">0 đ
                                                    	<span id="totalCartItem" class="cart-item-count">0</span>
                                                	</span>
                                               	</c:if>
                                               	<c:if test="${cart != null }">
                                               		 <span class="item-text">${totalPriceAllProduct }
	                                                    <span id="totalCartItem" class="cart-item-count">${totalItems }</span>
	                                                </span>
                                               	</c:if>
                                            </div>
                                            <span></span>
                                            <div class="minicart">
                                            	<c:if test="${cart == null }">
                                            		Chưa Có Sản Phẩm Trong Giỏ Hàng !
                                            	</c:if>
                                            	<c:if test="${cart != null }">
	                                                <ul class="minicart-product-list">
	                                                	<c:forEach var="item" items="${cart.cartItems }">
		                                                    <li>
		                                                        <a href="/detail/${item.productSeo }" class="minicart-product-image">
		                                                            <img src="${base }/upload/${item.productAvatar}" alt="cart products">
		                                                        </a>
		                                                        <div class="minicart-product-details">
		                                                            <h6><a href="/detail/${item.productSeo }">${item.productName }</a></h6>
		                                                            <span>${item.priceUnitVN } x ${item.quanlity }</span>
		                                                        </div>
		                                                        
		                                                    </li>
	                                                    </c:forEach>
	                                                </ul>
                                                
	                                                <p class="minicart-total">TỔNG CỘNG: <span>${totalPriceAllProduct }</span></p>
	                                                <div class="minicart-button">
	                                                    <a href="/view-cart" class="li-button li-button-fullwidth li-button-dark">
	                                                        <span>Giỏ hàng</span>
	                                                    </a>
	                                                    <!-- <a href="./ThanhToan.html" class="li-button li-button-fullwidth">
	                                                        <span>Thanh toán</span>
	                                                    </a> -->
	                                                </div>
                                                </c:if>
                                            </div>
                                        </li>
                                        <!-- Header Mini Cart Area End Here -->
                                    </ul>
                                </div>
                                <!-- Header Middle Right Area End Here -->
                            </div>
                            <!-- Header Middle Right Area End Here -->
                        </div>
                    </div>
                </div>
                <!-- Header Middle Area End Here -->
                <!-- Begin Header Bottom Area -->
                <div class="header-bottom mb-0 header-sticky d-none d-lg-block d-xl-block">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- Begin Header Bottom Menu Area -->
                                <div class="hb-menu">
                                    <nav>
                                        <ul>
                                           
                                            <li><a href="${base }/home">Home</a></li>
                                            <li class="dropdown-holder"><a href="#">Shop</a>
                                                <ul class="hb-dropdown">
                                                	<c:forEach var="category" items="${categories }">
                                                    	<li><a href="/shop/${category.seo}/page/1">${category.name }</a></li>                                
                                               		</c:forEach>
                                                </ul>
                                            </li>
                                            <li><a href="${base }/blog/page/1">Blog</a></li>
                                            <li><a href="/about">Về chúng tôi</a></li>
                                            <li><a href="${base }/contact">Liên hệ</a></li>
                                        </ul>
                                    </nav>
                                </div>
                                <!-- Header Bottom Menu Area End Here -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Header Bottom Area End Here -->
                <!-- Begin Mobile Menu Area -->
                <div class="mobile-menu-area d-lg-none d-xl-none col-12">
                    <div class="container"> 
                        <div class="row">
                            <div class="mobile-menu">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Mobile Menu Area End Here -->
            </header>
            <!-- HEADER END-->
            