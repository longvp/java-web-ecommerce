<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!-- directive SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>

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
                            <li><a href="${base }/home">Home</a></li>
                            <li class="active">Liên hệ</li>
                        </ul>
                    </div>
                   
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->     
            <!-- Begin Contact Main Page Area -->
            <div class="contact-main-page mt-60 mb-40 mb-md-40 mb-sm-40 mb-xs-40">
                <div class="container mb-60">
                    <!-- GOOGLE MAP -->
                    <div id="google-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14895.242065995491!2d105.76594681858592!3d21.040266403042903!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454c90abeff65%3A0x71a3921134bd13e4!2zTWFpIEThu4tjaCwgQ-G6p3UgR2nhuqV5LCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1631851466343!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 offset-lg-1 col-md-12 order-1 order-lg-2">
                            <div class="contact-page-side-content">
                                <h3 class="contact-page-title">Liên Hệ Với Chúng Tôi</h3>
                                <p class="contact-page-message mb-25">
                                	Là cửa hàng chuyên về các sản phẩm điện tử: Điện thoại, Kỹ thuật số, Phụ kiện, Tai nghe, Laptop, Tablet .....
                                </p>
                                <div class="single-contact-block">
                                    <h4><i class="fa fa-fax"></i> Địa chỉ</h4>
                                    <p>Hà Nội</p>
                                </div>
                                <div class="single-contact-block">
                                    <h4><i class="fa fa-phone"></i> Điện thoại</h4>
                                    <p>Mobile: (08) 123 456 789</p>
                                    <p>Hotline: 1009 678 456</p>
                                </div>
                                <div class="single-contact-block last-child">
                                    <h4><i class="fas fa-envelope"></i> Email</h4>
                                    <p>phamvietlong.pass@gmail.com</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 order-2 order-lg-1">
                            <div class="contact-form-content pt-sm-55 pt-xs-55">
                                <h3 class="contact-page-title">Hãy liên hệ với chúng tôi</h3>
                                <div class="contact-form">
                                	<!-- NORMAL -->
                                  	 <form action="${base }/save-contact" method="post">
                                  	 	<c:if test="${userLogined == null }">
	                                        <div class="form-group">
	                                            <label>Họ Tên<span class="required">*</span></label>
	                                            <input type="text" name="fullName" id="hoTen"  required />
	                                        </div>
	                                        <div class="form-group">
	                                            <label> Email <span class="required">*</span></label>
	                                            <input type="email" name="email" id="email" required />
	                                        </div>
                                        </c:if>
                                        <c:if test="${userLogined != null }">
                                        	<div class="form-group">
	                                            <label>Họ Tên<span class="required">*</span></label>
	                                            <input type="text" value="${userLogined.fullName}" name="fullName" id="hoTen"  required />
                                      	 	</div>
	                                        <div class="form-group">
	                                            <label> Email <span class="required">*</span></label>
	                                            <input type="email" value="${userLogined.email }" name="email" id="email" required />
	                                        </div>
                                        </c:if>
                                        <div class="form-group mb-30">
	                                           <label>Tin Nhắn</label>
	                                           <textarea id="tinNhan" name="message" required></textarea>
	                                    </div>
                                        <div class="form-group">
                                            <button type="submit" id="submit" class="li-btn-3" style="cursor: pointer;">Gửi</button>
                                        </div>
                                    </form>
                                   
                                  <%--  <c:if test="${userLogined != null }">
                                   <form action="${base }/save-contact" method="post">
                                        <div class="form-group">
                                            <label>Họ Tên<span class="required">*</span></label>
                                            <input type="text" value="${userLogined.fullName}" name="fullName" id="hoTen"  required />
                                        </div>
                                        <div class="form-group">
                                            <label> Email <span class="required">*</span></label>
                                            <input type="email" value="${userLogined.email }" name="email" id="email" required />
                                        </div>
                                        <div class="form-group mb-30">
                                            <label>Tin Nhắn</label>
                                            <textarea id="tinNhan" name="message" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" id="submit" class="li-btn-3" style="cursor: pointer;">Gửi</button>
                                        </div>
                                    </form>
                                    </c:if> --%>
                                    
                                    
                                    <!-- SPRING FORM -->
                                    <%-- <sf:form action="${base }/save-contact" method="post" modelAttribute="contact">
                                        <div class="form-group">
                                            <label>Họ Tên<span class="required">*</span></label>
                                            <sf:input type="text" path="hoTen" name="hoTen" id="hoTen"   />
                                        </div>
                                        <div class="form-group">
                                            <label> Email <span class="required">*</span></label>
                                            <sf:input type="email" path="email" name="email" id="email"  />
                                        </div>
                                        <div class="form-group mb-30">
                                            <label>Tin Nhắn</label>
                                            <sf:textarea id="tinNhan" path="tinNhan" name="tinNhan" ></sf:textarea>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" id="submit" class="li-btn-3" style="cursor: pointer;">Gửi</button>  
                                            <button type="button" id="ajax" class="li-btn-3" style="cursor: pointer;">Ajax</button>                         
                                        </div>
                                    </sf:form>  --%>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Contact Main Page Area End Here -->
     </div>
     
    <jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>       
 	
 	<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>
 	
 	<script type="text/javascript">
 	
 		$(document).ready(function(){
 			
 			function saveContact(){				
 				var data = {
 		 				hoTen: $("#hoTen").val(),
 		 				email: $("#email").val(),
 		 				tinNhan: $("#tinNhan").val()
 		 			};	
 				
 		 			$.ajax({
 		 				url: "/contact-ajax",
 		 				type: "POST",
 		 				contentType: "application/json",
 		 				data: JSON.stringify(data),
 		 				dataType: "json",
 		 				success: function(jsonResult){
 		 					alert(jsonResult.message);
 		 				},
 		 				error: function(jqXhr, textStatus, errorMessage){
 		 					
 		 				}
 		 			});	
 			}
 			
 			$("#ajax").click(function(){
 				saveContact();
 			}) 
 			
 		}) 
 	
 	</script>
 	
</body>
</html>