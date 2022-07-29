<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>

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
                            <li><a href="index.html">Home</a></li>
                            <li class="active">About</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- about wrapper start -->
            <div class="about-us-wrapper pt-60 pb-40">
                <div class="container">
                    <div class="row">
                        <!-- About Text Start -->
                        <div class="col-lg-6 order-last order-lg-first">
                            <div class="about-text-wrap">
                                <h2><span>Provide Best</span>Product For You</h2>
                                <p>
                                	Chúng tôi là một công ty thương mại điện tử thời trang nhanh B2C quốc tế. 
                                	Công ty chủ yếu tập trung vào cung cấp các đồ dùng điện tử như: Điện thoại, Kỹ thuật số, Phụ kiện, Tai nghe, Laptop, Tablet ..... 
                                </p>
                                <p>
                                	Công ty chúng tôi chủ yếu nhắm vào Châu Âu, Châu Mỹ, Úc và Trung Đông cùng với các thị trường tiêu dùng khác. 
                                	Thương hiệu được thành lập vào tháng 10 năm 2008. 
                                </p>
                                <p>Hoạt động kinh doanh bao gồm hơn 220 quốc gia và khu vực trên toàn thế giới.</p>
                            </div>
                        </div>
                        <!-- About Text End -->
                        <!-- About Image Start -->
                        <div class="col-lg-5 col-md-10">
                            <div class="about-image-wrap">
                                <img class="img-full" src="${base }/user/images/about-us/13.jpg" alt="About Us" />
                            </div>
                        </div>
                        <!-- About Image End -->
                    </div>
                </div>
            </div>
            <!-- about wrapper end -->
            <!-- Begin Counterup Area -->
            
            <!-- Counterup Area End Here -->
            <!-- team area wrapper start -->
            <div class="team-area pt-60 pt-sm-44">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="li-section-title capitalize mb-25">
                                <h2><span>our team</span></h2>
                            </div>
                        </div>
                    </div> <!-- section title end -->
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="team-member mb-60 mb-sm-30 mb-xs-30">
                                <div class="team-thumb">
                                    <img src="${base }/user/images/team/1.png" alt="Our Team Member">
                                </div>
                                <div class="team-content text-center">
                                    <h3>Jonathan Scott</h3>
                                    <a href="#">scott@gmail.com</a>
                                    <div class="team-social">
                                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-instagram"></i></a>
                                        <a href="#"><i class="fab fa-google-plus-g"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- end single team member -->
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="team-member mb-60 mb-sm-30 mb-xs-30">
                                <div class="team-thumb">
                                    <img src="${base }/user/images/team/2.png" alt="Our Team Member">
                                </div>
                                <div class="team-content text-center">
                                    <h3>Oliver Bastin</h3>
                                    <a href="#">bastin@gmail.com</a>
                                    <div class="team-social">
                                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-instagram"></i></a>
                                        <a href="#"><i class="fab fa-google-plus-g"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- end single team member -->
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="team-member mb-30 mb-sm-60">
                                <div class="team-thumb">
                                    <img src="${base }/user/images/team/3.png" alt="Our Team Member">
                                </div>
                                <div class="team-content text-center">
                                    <h3>Erik Jonson</h3>
                                    <a href="#">jonson@gmail.com</a>
                                    <div class="team-social">
                                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-instagram"></i></a>
                                        <a href="#"><i class="fab fa-google-plus-g"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- end single team member -->
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="team-member mb-30 mb-sm-60 mb-xs-60">
                                <div class="team-thumb">
                                    <img src="${base }/user/images/team/4.png" alt="Our Team Member">
                                </div>
                                <div class="team-content text-center">
                                    <h3>Maria Mandy</h3>
                                    <a href="#">mandy@gmail.com</a>
                                    <div class="team-social">
                                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                        <a href="#"><i class="fab fa-instagram"></i></a>
                                        <a href="#"><i class="fab fa-google-plus-g"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- end single team member -->
                    </div>
                </div>
            </div>
            <!-- team area wrapper end -->

    <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>       
 	
 	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
 	
</body>
</html>