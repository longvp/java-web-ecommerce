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
<title>Hóa Đơn</title>

<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>

<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>

</head>
<body>

<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>

   <div class="breadcrumb-area">
        <div class="container">
            <div class="breadcrumb-content">
                <ul>
                    <li><a href="Home.html">Home</a></li>
                    <li class="active">Thanh toán</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Li's Breadcrumb Area End Here -->
    <!--Checkout Area Strat-->
    
 
    <div class="checkout-area pt-60 pb-30">
        <div class="container">
        	<c:if test="${userLogined == null }">
		    	<div class="row mt-5">
		    		<div class="col-md-12 text-center">
		    			<a href="/login"><h5>Hãy Đăng Nhập Để Tiếp Tục !</h5></a>
		    		</div>
		    	</div>
		    </c:if>
        	<c:if test="${userLogined != null }">
            <form method="post" action="/thanhtoan">
                <div class="row mt-5">
                    <div class="col-lg-6 col-12">

                        <div class="checkbox-form">
                            <h3>Thông tin người mua</h3>
                            <div class="row">

                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>Họ Tên <span class="required">*</span></label>
                                        <input type="text" value="${userLogined.fullName }" name="customerName" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>Địa Chỉ <span class="required">*</span></label>
                                        <input type="text" value="${userLogined.address }" name="customerAddress" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list">
                                        <label>Email <span class="required">*</span></label>
                                        <input value="${userLogined.email }" name="customerEmail" type="email" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list">
                                        <label>Số điện thoại<span class="required">*</span></label>
                                        <input type="text" value="${userLogined.numberPhone }" name="customerPhone" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-12">
                        <div class="your-order">
                            <h3>Đơn hàng của bạn</h3>
                            <div class="your-order-table table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="cart-product-name">Sản phẩm</th>
                                            <th class="cart-product-total">Tổng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <c:forEach var="item" items="${cart.cartItems }">
	                                       	<tr class="cart_item">
	                                            <td class="cart-product-name"> ${item.productName }<strong
	                                                    class="product-quantity"> × ${item.quanlity }</strong></td>
	                                            <td class="cart-product-total"><span class="amount">${item.totalPriceUnitVN }</span></td>
	                                        </tr>
                                       </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr class="order-total">
                                            <th>Tổng đơn hàng</th>
                                            <c:if test="${cart == null }">
                                               		 <td><strong><span class="amount">0 đ</span></strong></td>
                                               	</c:if>
                                               	<c:if test="${cart != null }">
                                               		 <td><strong><span class="amount">${totalPriceAllProduct}</span></strong></td>
                                               	</c:if>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="payment-method">
                                <div class="payment-accordion">
                                    <div class="order-button-payment">
                                        <input value="Đặt hàng" type="submit">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </c:if>
        </div>
    </div>
    
    <!--Checkout Area End-->
            
            <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
            
            <jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
	
</body>
</html>