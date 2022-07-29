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
<title>Đăng Ký</title>

<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>

</head>


<body>

	<jsp:include page="/WEB-INF/views/user/layout/header.jsp"></jsp:include>

   <!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="${base }/home">Home</a></li>
                            <li class="active">Đăng ký</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Begin Login Content Area -->
            <div class="page-section mb-60 mt-20">
                <div class="container">
                    <div class="row mt-5">
                        <div class="col-lg-2"></div>
                        <div class="col-sm-12 col-md-12 col-lg-8 col-xs-12">
                            <sf:form method="post" action="/register" modelAttribute="user">
                                <div class="login-form">
                                    <h4 class="login-title">Đăng ký</h4>
                                    <div class="row">
                                    	<div class="col-md-6 mb-20">
                                            <label>Tên đăng nhập *</label>
                                            <sf:input class="mb-0" path="userName" type="text" placeholder="Tên đăng nhập" required="required"/>
                                        </div>
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>Họ tên *</label>
                                            <sf:input class="mb-0" path="fullName" type="text" placeholder="Họ tên" required="required"/>
                                        </div>
                                        <div class="col-md-6 mb-20">
                                            <label>Email *</label>
                                            <sf:input class="mb-0" path="email" type="email" placeholder="Email Address" required="required"/>
                                        </div>
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>Số điện thoại *</label>
                                            <sf:input class="mb-0" path="numberPhone" type="text" placeholder="Số điện thoại" required="required"/>
                                        </div>
                                        <div class="col-md-6 mb-5">
                                            <label>Password *</label>
                                            <sf:input class="mb-0" path="password" type="password" placeholder="Password" required="required"/>
                                        </div>
                                        <div class="col-md-6 col-12 mb-5">
                                            <label>Địa chỉ *</label>
                                            <sf:input class="mb-0" path="address" type="text" placeholder="Địa chỉ" required="required"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                    	<div class="col-md-12 text-center">
                                    		<div class="col-12">
                                            <button type="submit" class="register-button mt-0" style="cursor: pointer;">Đăng ký</button>
                                        </div>
                                    		<h5 style="color: red;">${message }</h5>
                                    	</div>
                                    </div>
                                </div>
                            </sf:form>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </div>
            </div>

<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>

</body>
</html>