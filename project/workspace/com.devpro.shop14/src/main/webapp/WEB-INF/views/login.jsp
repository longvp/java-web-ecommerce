<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Nhập</title>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>   

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
                            <li class="active">Đăng nhập</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Begin Login Content Area -->
            <div class="page-section mb-60 mt-20">
                <div class="container">
                    <div class="row mt-5">
                        <div class="col-lg-3"></div>
                        <div class="col-sm-12 col-md-12 col-lg-6 col-xs-12">
                            <form method="post" action="/perform_login" >
                            	<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<c:if test="${not empty param.login_error}">
									<div class="alert alert-danger" role="alert">Login attempt
										was not successful, try again.</div>
								</c:if>
                                <div class="login-form">
                                    <h4 class="login-title">Đăng nhập</h4>
                                    <div class="row">
                                        <div class="col-md-12 col-12 mb-20">
                                            <label>Username *</label>
                                            <input class="mb-0" name="username" id="userName" type="text" placeholder="Username" required="required"/>
                                        </div>
                                        <div class="col-12 mb-5">
                                            <label>Password *</label>
                                            <input class="mb-0" name="password" id="password" type="password" placeholder="Password" required="required"/>
                                        </div>
                                      	<!-- <div class="col-md-8">
                                            <div class="check-box d-inline-block ml-0 ml-md-2 mt-10">
                                                <input type="checkbox" id="remember_me">
                                                <label for="remember_me">Remember me</label>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mt-10 mb-20 text-left text-md-right">
                                            <a href="#"> Forgotten pasward?</a>
                                        </div>   -->         
                                        <div class="col-md-8">
                                            <button type="submit" class="register-button mt-0" style="cursor: pointer;">Đăng nhập</button>
                                        </div>
                                        <div class="col-md-4 mt-10 mb-20 text-left text-md-right">
                                            <a href="/register">Đăng Ký</a>
                                        </div> 
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-lg-3"></div>
                    </div>
                </div>
            </div>

		<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>

		<!-- <script type="text/javascript">
			
			$(document).ready(function(){
				
				function solve(){
					var data = {
							userName: $("#userName").val(),
							password: $("#password").val(),
					};
					
					$.ajax({
						url: "/sign-in-ajax",
						type: "POST",
						contentType: "application/json",
						data: JSON.stringify(data),
						dataType: "json",
						success: function(jsonResult){
							alert(jsonResult.oj.email);
						},
						error: function(jqXhr, textStatus, errorMessage){
			 					
			 			}
					});
				}
				
				$(".register-button").click(function(){
					solve();
				})
				
			})
		
		</script> -->

</body>
</html>