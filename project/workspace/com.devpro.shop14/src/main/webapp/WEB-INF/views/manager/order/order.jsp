<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đơn Hàng</title>

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
                    <div class="container p-5">
                    	<div class="row">
                    		<div class="col-md-12 text-center">
                    			<h5>Danh Sách Đơn Hàng</h5>
                    		</div>
                    	</div>
                    	<div class="row ml-2 mb-3">
                    		<!-- <a class="btn btn-primary" href="/admin/add-category">
                    			<i class="fas fa-plus mr-2"></i>Thêm Mới
                    		</a> -->
                    	</div>
                    	<div class="row">
                    		<div class="col-md-12">
                    			<table class="table table-hover">
								    <thead>
								      <tr>
								        <th>Mã đơn hàng</th>
										<th>Tên</th>									
										<th>Ngày order</th>
										<th>Status</th>
										<th>Tổng tiền</th>
								        <th>Hành Động</th>
								      </tr>
								    </thead>
								    <tbody>
										 <c:forEach var="item" items="${orders }">
										 	<tr>
										        <td class="id" data-id="${item.id }">${item.code }</td>
										        <td>${item.customerName }</td>								   									        
										        <td>${item.createdDate }</td>
										        <c:if test="${item.status == false }">
										        	<td style="color: red; font-weight: bold;">Chưa giao hàng</td>
										        </c:if> 
										        <c:if test="${item.status == true }">
										        	<td style="color: green; font-weight: bold;">Đã giao hàng</td>
										        </c:if>
										        <td>${item.total }</td>
										        <td>
										        	<a title="Xem" href="/admin/view-order/${item.id}" class="btn btn-primary"><i class="fas fa-eye"></i></a>
										        	<a title="Delete" class="btn btn-danger btn-delete" href="#"><i class="fas fa-trash-alt"></i></a>
										        	<%-- /admin/delete-category/${item.id} --%>
										        </td>
									       </tr>
										 </c:forEach>
								    </tbody>
								  </table>
                    		</div>
                    	</div>
                    	<div class="row mt-5">
                    		<div class="col-md-4"></div>
                    		<div class="col-md-4">
                    			<ul class="pagination">
									<%-- <c:forEach var="i" begin="1" end="${totalPage }">				 	
									 	<li class="page-item"><a class="page-link" href="/admin/product/?page=${i }">${i }</a></li>	
									 </c:forEach>  --%>
									 <c:if test="${currentPage > 1 }">
									 	<li class="page-item"><a class="page-link" href="/admin/order/page/${currentPage - 1}">Previous</a></li>
									 </c:if>
									 <c:forEach var="i" begin="1" end="${totalPage }">
									 	<li class="page-item"><a class="page-link" href="/admin/order/page/${i }">${i }</a></li>
									 </c:forEach>
									 <c:if test="${currentPage < totalPage }">
									 	<li class="page-item"><a class="page-link" href="/admin/order/page/${currentPage + 1}">Next</a></li>
									 </c:if> 
								  </ul>
								  
                    		</div>
                    		<div class="col-md-4"></div>
                    	</div>
                    </div>
                </main>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/manager/layout/js.jsp"></jsp:include>
        
        <script type="text/javascript">
	        $(document).ready(function(){
	        	
	        	$(".btn-delete").click(function(event){
	        		event.preventDefault();
	        		var conf = confirm("Bạn muốn xóa ???");
	        		var ID = $(this).closest("tr").find(".id").attr("data-id");
	        		var id = parseInt(ID);
	        		if(conf == true){
	        			window.location.href = "/admin/delete-order/" + id;
	        		}
	        	})
	        	
	        })
        </script>
</body>
</html>