<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Mục</title>

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
                    			<h5>Danh Sách Danh Mục</h5>
                    		</div>
                    	</div>
                    	<div class="row ml-2 mb-3">
                    		<a class="btn btn-primary" href="/admin/add-category">
                    			<i class="fas fa-plus mr-2"></i>Thêm Mới
                    		</a>
                    	</div>
                    	<div class="row">
                    		<div class="col-md-12">
                    			<table class="table table-hover">
								    <thead>
								      <tr>
								        <th>ID</th>
								        <th>Tên</th>
								        <th>Mô Tả</th>
								        <th>Trạng Thái</th>
								        <th>Seo</th>
								        <th>Hành Động</th>
								      </tr>
								    </thead>
								    <tbody>
										 <c:forEach var="item" items="${categories }">
										 	<tr>
										        <td class="id">${item.id }</td>
										        <td>${item.name }</td>
										        <td>${item.description }</td>
										        <c:if test="${item.status == true}">
										        	<td class="text-success" style="font-weight: bold;">${item.status }</td>
										        </c:if>
										        <c:if test="${item.status == false}">
										        	<td class="text-danger" style="font-weight: bold;">${item.status }</td>
										        </c:if>
										        <td>${item.seo }</td>
										        <td>
										        	<a title="Edit" href="/admin/edit-category/${item.id}" class="btn btn-primary"><i class="fas fa-edit"></i></a>
										        	<a title="Delete" class="btn btn-danger btn-delete" href="#"><i class="fas fa-trash-alt"></i></a>
										        	<%-- /admin/delete-category/${item.id} --%>
										        </td>
									       </tr>
										 </c:forEach>
								    </tbody>
								  </table>
                    		</div>
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
	        		var ID = $(this).closest("tr").find(".id").text();
	        		var id = parseInt(ID);
	        		if(conf == true){
	        			window.location.href = "/admin/delete-category/" + id;
	        		}
	        	})
	        	
	        })
        </script>
</body>
</html>