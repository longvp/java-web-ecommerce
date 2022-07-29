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
<title>Thêm Sản Phẩm</title>

<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/manager/layout/css.jsp"></jsp:include>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

</head>
<body class="sb-nav-fixed">
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/manager/layout/header.jsp"></jsp:include>
	<!-- HEADER END -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
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
							<h5>Add Product</h5>
						</div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<sf:form action="${base}/admin/add-product" method="post" modelAttribute="product" enctype="multipart/form-data">
								
								<sf:hidden path="id"/>
								
								<div class="form-group">
									<label for="">Cagtegory:</label>
									<sf:select path="categories.id" class="form-control" id="">
										<sf:options items="${categories}"  itemValue="id" itemLabel="name"/>
									</sf:select>
								</div>
								<div class="form-group">
									<label for="">Title:</label>
									<sf:input type="text" path="title" name=""
										class="form-control" placeholder="Title" required="required"
										id="" />
								</div>
								<div class="form-group">
									<label for="">Price:</label>
									<sf:input type="number" min="1" path="price" name=""
										class="form-control" autocomplete="off" placeholder="Price" required="required"
										id="" />
								</div>
								<div class="form-group">
									<label for="">Price Sale:</label>
									<sf:input type="number" min="0" autocomplete="off" path="priceSale" name=""
										class="form-control" placeholder="Price Sale"
										id="" />
								</div>
								<div class="form-group">
									<label for="">Specification:</label>
									<sf:textarea id="specification" type="text" path="specification" name=""
										class="form-control" placeholder="Specification" required="required"/>
								</div>
								<div class="form-group">
									<label for="">Short Description:</label>
									<sf:textarea id="short-description" type="text" path="shortDescription" name=""
										class="form-control" placeholder="Short Description" required="required"/>
								</div>
								<div class="form-group">
									<label for="">Detail Description:</label>
									<sf:textarea id="detail-description" type="text" path="detailDescription" name=""
										class="form-control" placeholder="Detail Description" required="required" />
								</div>
								<div class="form-group">
									<label>Is Hot</label>
									<sf:checkbox path="isHot" id=""/>
								</div>
								<div class="form-group">
									<label>Is New</label>
									<sf:checkbox path="isNew" id=""/>
								</div>
								<div class="form-group">
									<label>Is Buys</label>
									<sf:checkbox path="isBuys" id=""/>
								</div>
								<div class="form-group">
									<label for="">Product Avatar:</label> 
									<input type="file" name="productAvatar" class="form-control" />
								</div> 
								<div class="form-group">
									<label for="">Product Pictures:</label> 
									<input type="file" name="productPictures" multiple="multiple" class="form-control" />
								</div> 
								<button type="submit" class="btn btn-primary">Thêm</button>
							</sf:form>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/manager/layout/js.jsp"></jsp:include>

	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#specification").summernote();
			$('#detail-description').summernote();
			$("#short-description").summernote();
			
		})
	</script>
</body>
</html>