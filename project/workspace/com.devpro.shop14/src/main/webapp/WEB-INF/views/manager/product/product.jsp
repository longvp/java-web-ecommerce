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
<title>Sản Phẩm</title>

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
                    			<h5>Danh Sách Sản Phẩm</h5>
                    		</div>
                    	</div>
                    	<div class="row ml-2 mb-3">
                    		<a class="btn btn-primary" href="/admin/add-product">
                    			<i class="fas fa-plus mr-2"></i>Thêm Mới
                    		</a>
                    	</div>
                    	<div class="row">
                    		<div class="col-md-12">
                    		<form action="/admin/product" method="get">
                    		
                    		<div class="input-group">
			                    <input class="form-control" type="text" name="keyword" placeholder="Search for..." />
			                    <div class="input-group-append">
			                        <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i></button>
			                    </div>
			                </div>
                    		
                    			<table class="table table-hover text-center">
								    <thead>
								      <tr>
								      	<th>ID</th>
								        <th>Title</th>
								        <th>Image</th>
								        <th>Price</th>
								        <!-- <th>Price Sale</th> -->
								        <th>Type</th>
								        <th>Hành Động</th>
								      </tr>
								    </thead>
								    <tbody>
								    	<c:forEach var="item" items="${products }">
									    	<tr>
									    		<td>${item.id }</td>
										        <td class="title" data-id="${item.id }" style="font-weight: bold; color: brown;">${item.title }</td>
										        <td>
										        	<img alt="" width="100px" src="${base }/upload/${item.avatar}">
										        </td>
										        <td style="font-weight: bold; color: red;">${item.priceVN }</td>
										        <%-- <td>${item.priceSale }</td> --%>
										        <c:choose>
										        	<c:when test="${item.isHot == true}">
										        		<td style="font-weight: bold; color: orange;">Hot</td>
										        	</c:when>
										        	<c:when test="${item.isNew == true }">
										        		<td style="font-weight: bold; color: blue;">New</td>
										        	</c:when>
										        	<c:otherwise>
										        		<td style="font-weight: bold; color: green;">Normal</td>
										        	</c:otherwise>
										        </c:choose>
										        <td>
												   	<a class="btn btn-primary" title="Edit" href="/admin/edit-product/${item.id }"><i class="fas fa-edit"></i></a>
												   	<a class="btn btn-danger btn-delete" title="Delete" href="#"><i class="fas fa-trash-alt"></i></a>
												</td>
									       </tr>
								    	</c:forEach>
								    </tbody>
								  </table>
							</form>
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
									 	<li class="page-item"><a class="page-link" href="/admin/product/page/${currentPage - 1}">Previous</a></li>
									 </c:if>
									 <c:forEach var="i" begin="1" end="${totalPage }">
									 	<li class="page-item"><a class="page-link" href="/admin/product/page/${i }">${i }</a></li>
									 </c:forEach>
									 <c:if test="${currentPage < totalPage }">
									 	<li class="page-item"><a class="page-link" href="/admin/product/page/${currentPage + 1}">Next</a></li>
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
	        	
	        	// PAGING
	        	/* $(".page-item").click(function(){
	        		var i = $(this).find(".page-link").text();
	        		var page = parseInt(i);
	        		window.location.href = "/admin/product?page=" + page;
	        	}) */
	        	
	        	$(".btn-delete").click(function(event){
	        		event.preventDefault();
	        		var conf = confirm("Bạn muốn xóa ???");
	        		var ID = $(this).closest("tr").find(".title").attr("data-id");
	        		var id = parseInt(ID);
	        		if(conf == true){
	        			window.location.href = "/admin/delete-product/" + id;
	        		}
	        	})
	        	
	        })
        </script>
</body>
</html>