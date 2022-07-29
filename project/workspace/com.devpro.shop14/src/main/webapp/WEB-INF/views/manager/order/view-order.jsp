<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Order</title>

<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>

</head>
<body class="sb-nav-fixed">
        <!-- HEADER -->
        <jsp:include page="/WEB-INF/views/manager/layout/header.jsp"></jsp:include>
        <!-- HEADER END -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <!-- MENU -->
                    <jsp:include page="/WEB-INF/views/manager/layout/menu.jsp"></jsp:include>
                    <!-- MENU END -->
                </nav>
            </div>
            <div id="layoutSidenav_content">
            	
                <main>
                    <div class="container p-5" id="print_div">
                    	<div class="row">
                    		<div class="col-md-12 text-center">
                    			<h5>Đơn hàng <span style="color: red;">${saleOrder.code }</span></h5>
                    		</div>
                    	</div>
                    	<h5>Thông tin khách hàng</h5>
                    	<table class="table" style="width: 400px;">
								<tr style="width: 400px;">
									<th>Họ và tên:</th>
									<td>${saleOrder.customerName }</td>
								</tr>
								<tr style="width: 400px;">
									<th>SĐT:</th>
									<td>${saleOrder.customerPhone }</td>
								</tr>
								<tr style="width: 400px;">
									<th>Email:</th>
									<td>${saleOrder.customerEmail }</td>
								</tr>
								<tr style="width: 400px;">
									<th>Địa chỉ:</th>
									<td>${saleOrder.customerAddress }</td>
								</tr>
						</table>
						<!-- <div style="border-bottom: 5px dashed blue;"></div> -->
						<h5 class="mt-3">Sản phẩm đã mua</h5>
						<table class="table table-striped table-sm">
							<thead>
								<tr>
									<th>Tên sản phẩm</th>
									<th>Giá tiền</th>
									<th>Số lượng</th>
								</tr>
							</thead>
							<tbody style="border: 1px solid #b5b5b5">
								<c:forEach var="item" items="${saleOrderProducts }">
									<tr>
										<td>${item.product.title }</td>
										<td>${item.product.priceVN }</td>
										<td>${item.quality}</td>
										</tr>
									</c:forEach>
								</tbody>
						</table>
						<table style="float: right; width: 200px;">
								<tr>
									<th style="border-bottom: 1px solid red; padding-bottom: 10px;">Tổng:
									</th>
									<td
										style="font-weight:bold; color: red; border-bottom: 1px solid red; padding-bottom: 10px;">${saleOrder.total }</td>
								</tr>
						</table>					
                    </div>
                	<c:if test="${saleOrder.status == false }">
                		<button type="button" id="finish" data-id="${saleOrder.id }" class="btn btn-primary btn-sm" style="margin-left: 500px;">Hoàn thành</button>
                	</c:if>
                	<c:if test="${saleOrder.status == true }">
                		<button type="button" class="btn btn-danger btn-sm" style="margin-left: 500px;">Đã giao hàng</button>
                		 <button type="button" name="" class="btn btn-primary btn-sm"
						 onclick="printdiv('print_div')">Print</button>
                	</c:if>
                  	
                </main>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/manager/layout/js.jsp"></jsp:include>
     	
     	<script type="text/javascript">
     	
	     // PRINT
			function printdiv(printpage) {
				var headstr = "<html><head><title></title></head><body>";
				var footstr = "</body>";
				var newstr = document.all.item(printpage).innerHTML;
				var oldstr = document.body.innerHTML;
				document.body.innerHTML = headstr + newstr + footstr;
				window.print();
				document.body.innerHTML = oldstr;
				return false;
			}
     	
			$(document).ready(function(){
				
				$("#finish").click(function(){
					var conf = confirm("Bạn đã giao đơn hàng này ???"); 
					var ID = $(this).attr("data-id");
					var id = parseInt(ID);

					if(conf == true){
						location.href = "/admin/set-satusSaleOrder/" + id;
					} 
				})
				
			})
			
		</script>
     
</body>
</html>