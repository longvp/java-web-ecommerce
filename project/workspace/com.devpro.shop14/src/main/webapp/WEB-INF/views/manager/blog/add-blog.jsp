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
<title>Thêm Blog</title>

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
                    			<h5>Add Blog</h5>
                    		</div>
                    	</div>
                    	<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<sf:form action="${base}/admin/add-blog" method="post" modelAttribute="blog" enctype="multipart/form-data">
								
								<sf:hidden path="id"/>
								
								<div class="form-group">
									<label for="">Title:</label>
									<sf:input type="text" path="title" name=""
										class="form-control" placeholder="Title" required="required"
										id="title" />
								</div>
								<div class="form-group">
									<label for="">Short Description:</label>
									<sf:textarea id="short-description" type="text" path="shortDescription"
										class="form-control" placeholder="Short Description" required="required"/>
								</div>
								<div class="form-group">
									<label for="">Detail Description:</label>
									<sf:textarea id="detail-description" type="text" path="detailDescription"
										class="form-control" placeholder="Detail Description" required="required" />
								</div>
								<div class="form-group">
									<label for="">Blog Avatar:</label> 
									<input type="file" name="blogAvatar" class="form-control" />
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
			
				$('#detail-description').summernote();
				$("#short-description").summernote();
			
			})
        </script>
</body>
</html>