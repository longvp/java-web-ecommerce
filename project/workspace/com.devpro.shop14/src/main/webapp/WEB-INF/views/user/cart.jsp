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
<title>Giỏ Hàng</title>

<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>

</head>
<body>
	<div class="body-wrapper">
		<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>

 		<!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="/home">Home</a></li>
                            <li class="active">Giỏ hàng</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!--Shopping Cart Area Strat-->
            <div class="Shopping-cart-area pt-60 pb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                        	<c:if test="${cart == null }">
                                  <div class="text-center">
                                  	 <h5 style="margin-bottom: 50px;">Chưa Có Sản Phẩm Trong Giỏ Hàng</h5>
                                   	<a href="/home">Tiếp Tục Mua Hàng</a>
                                  </div>
                             </c:if>
                            <c:if test="${cart != null }"> 
                            <form action="#">
                                <div class="table-content table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="li-product-remove">Xóa</th>
                                                <th class="li-product-thumbnail">Hình ảnh</th>
                                                <th class="cart-product-name">Tên sản phẩm</th>
                                                <th class="li-product-price">Đơn giá</th>
                                                <th class="li-product-quantity">Số lượng</th>
                                                <th class="li-product-subtotal">Tổng giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            	<c:forEach var="item" items="${cart.cartItems }">
                                            	<tr>
	                                                <td class="li-product-remove"><a href="#" class="delete-cartItem" data-id="${item.productId }" title="Delete"><i class="far fa-trash-alt"></i></a></td>
	                                                <td class="li-product-thumbnail"><a href="#"><img src="${base }/upload/${item.productAvatar}" alt="Li's Product Image"></a></td>
	                                                <td class="li-product-name"><a href="#">${item.productName }</a></td>
	                                                <td class="li-product-price"><span class="amount">${item.priceUnitVN }</span></td>
	                                                <td class="quantity" data-id="${item.productId }">
	                                                    <div class="cart-plus-minus ">
	                                                        <input class="cart-plus-minus-box" min="1" value="${item.quanlity }" type="text">
	                                                        <div class="dec qtybutton" ><i class="fa fa-angle-down"></i></div>
	                                                        <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
	                                                    </div>
	                                                </td>
	                                                <td class="product-subtotal"><span class="amount">${item.totalPriceUnitVN }</span></td>
                                           	 	</tr>
                                            </c:forEach>

                                        </tbody>
                                        
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 ml-auto">
                                        <div class="cart-page-total">
                                            <h2>Tổng cộng:</h2>
                                            <ul>
                                                
                                                <li>Tổng cộng <span>${totalPriceAllProduct}</span></li>
                                            </ul>
                                            <a href="/thanhtoan">Thanh toán</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            </c:if> 
                        </div>
                    </div>
                </div>
            </div>
            <!--Shopping Cart Area End-->
         </div>
            
         <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>       
 	
 		<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
 		
 		<script type="text/javascript">
 		
 			$(document).ready(function(){
 				
 				function deleteCartItem(productId){
 					var data = {
 	 		 				productId: productId
 	 		 			};		 				
 	 		 			$.ajax({
 	 		 				url: "/cart/delete-cart-item/" + productId,
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
 				
 				$(".delete-cartItem").click(function(){
 					var id = $(this).attr("data-id");
 					var conf = confirm("Bạn muốn xóa ???")
 					if(conf == true){
 						deleteCartItem(id);
 					}
 				})
 				
 				/* ----------------------------------------------------*/
 				/* SET LẠI SỐ LƯỢNG CỦA CARTITEM */				
 				function setQuanlity(productId, quanlity){
 					var data = {
 	 		 				productId: productId,
 	 		 				quanlity: quanlity
 	 		 			};		 				
 	 		 			$.ajax({
 	 		 				url: "/cart/set-quanlity/" + productId + "/" + quanlity,
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
 				var quantity = $(".cart-plus-minus-box").val();
 				
	 			$(".cart-plus-minus-box").change(function(){
	 				quantity = $(this).val();
	 				var id = $(this).closest("tr").find(".quantity").attr("data-id");
	 				setQuanlity(id, quantity);
	 			})
	 			
	 			$(".inc").click(function(){
	 				quantity = $(this).closest("tr").find(".cart-plus-minus-box").val();
	 				var id = $(this).closest("tr").find(".quantity").attr("data-id");
	 				setQuanlity(id, quantity);
	 			})
	 			
	 			$(".dec").click(function(){
	 				quantity = $(this).closest("tr").find(".cart-plus-minus-box").val();
	 				var id = $(this).closest("tr").find(".quantity").attr("data-id");
	 				setQuanlity(id, quantity);
	 			})
 				
 			})	
 		</script>
	
</body>
</html>