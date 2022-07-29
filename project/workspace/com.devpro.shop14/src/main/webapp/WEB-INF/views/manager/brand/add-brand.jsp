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
<title>Thêm Thương Hiệu</title>

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
                    			<h5>Add Brand</h5>
                    		</div>
                    	</div>
                    	<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<sf:form action="${base}/admin/add-brand" method="post" modelAttribute="brand" enctype="multipart/form-data">
								
								<sf:hidden path="id"/>
								
								<div class="form-group">
									<label for="">Name:</label>
									<sf:input type="text" path="name" name=""
										class="form-control" placeholder="Title" required="required"
										id="" />
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
        
        <script type="text/javascript">
	        $(document).ready(function(){
	        	
	        	
	        	
	        })
        </script>
</body>
</html>