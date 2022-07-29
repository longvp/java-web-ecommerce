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
<title>Blog</title>

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
                            <li class="active">Blog</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Begin Li's Main Blog Page Area -->
            <div class="li-main-blog-page pt-60 pb-55">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Blog Sidebar Area -->
                        <div class="col-lg-3 order-lg-1 order-2">
                            <div class="li-blog-sidebar-wrapper">
                                <div class="li-blog-sidebar">
                                    <div class="li-sidebar-search-form pt-xs-30 pt-sm-30">
                                        <form action="#">
                                            <input type="text" required class="li-search-field" placeholder="Tìm kiếm ...">
                                            <button type="submit" class="li-search-btn"><i class="fa fa-search"></i></button>
                                        </form>
                                    </div>
                                </div>
                                <div class="li-blog-sidebar pt-25">
                                    <h4 class="li-blog-sidebar-title">Danh mục</h4>
                                    <ul class="li-blog-archive">
                                        <c:forEach var="category" items="${categories }">
                                        	<li><a href="/shop/${category.seo}/page/1">${category.name }</a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="li-blog-sidebar">
                                    <h4 class="li-blog-sidebar-title">Bài viết gần đây</h4>
                                    <c:forEach var="item" items="${blogs }">
	                                    <div class="li-recent-post pb-30">
	                                        <div class="li-recent-post-thumb">
	                                            <a href="/blog-detail/${item.seo}">
	                                                <img class="img-full" src="${base}/upload/${item.avatar}" alt="Li's Product Image">
	                                            </a>
	                                        </div>
	                                        <div class="li-recent-post-des">
	                                            <span><a href="/blog-detail/${item.seo}">${item.title }</a></span>
	                                            <span class="li-post-date">${item.updatedDate }</span>
	                                        </div>
	                                    </div>
                                    </c:forEach>
                                   
                                </div>
                            </div>
                        </div>
                        <!-- Li's Blog Sidebar Area End Here -->
                        <!-- Begin Li's Main Content Area -->
                        <div class="col-lg-9 order-lg-2 order-1">
                            <div class="row li-main-content">
                            	<div class="col-lg-12">
                            		${blog.detailDescription }
                            	</div>
                            </div>
                        </div>
                        <!-- Li's Main Content Area End Here -->
                    </div>
                </div>
            </div>
            <!-- Li's Main Blog Page Area End Here -->

			<div id="fb-root"></div>
			<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v11.0" nonce="x00VPYUn"></script>
						
            <div class="fb-comments" data-href="http://localhost:8080/detail/${blog.seo }" data-width="5"></div>

<jsp:include page="/WEB-INF/views/user/layout/footer.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>

</body>
</html>