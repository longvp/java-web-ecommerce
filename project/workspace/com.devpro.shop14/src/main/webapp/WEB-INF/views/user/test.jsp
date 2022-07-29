<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>

<jsp:include page="/WEB-INF/views/common/variable.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/user/layout/css.jsp"></jsp:include>

</head>
<body style="padding: 20px 100px;">

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<sf:form action="${base}/send" method="post" modelAttribute="donHang" enctype="multipart/form-data">
				 	<div class="form-group">
					  	<label for="">Hãy chọn vấn đề bên dưới nhé:</label>
					  	<sf:select path="vanDe" class="form-control" id="vanDe">
						    <sf:options value="Bảo hành"/>
						    <sf:option value="Bảo hiểm"></sf:option>
						    <sf:option value="Bookcare"></sf:option>
						    <sf:option value="Chat với nhà bán"></sf:option>
					  	</sf:select> 
					</div> 
				  	<div class="form-group">
					    <label for="email">Địa chỉ email của bạn:</label>
					    <sf:input type="email" path="email" name="email" class="form-control" placeholder="Nhập địa chỉ email" id="email" />
				  	</div>
				  	<div class="form-group">
					    <label for="">Số điện thoại:</label>
					    <sf:input type="text" path="soDienThoai" name="soDienThoai" class="form-control" placeholder="Nhập số điện thoại" id="soDienThoai"/>
				  	</div>
				  	<div class="form-group">
					    <label for="">Mã đơn hàng:</label>
					    <sf:input type="text" path="maDonHang" name="maDonHang" class="form-control" placeholder="Nhập mã đơn hàng" id="maDonHang"/>
				  	</div>
				  	<div class="form-group">
					    <label for="">Tiêu đề:</label>
					    <sf:input type="text" path="tieuDe" name="tieuDe" class="form-control" placeholder="Nhập tiêu đề" id="tieuDe" />
				  	</div>
				  	<div class="form-group">
					    <label for="">Nội dung:</label>
					    <sf:input type="text" path="noiDung" name="noiDung" class="form-control" placeholder="Nhập nội dung" id="noiDung" />
				  	</div>
				  	<!-- <div class="form-group">
					    <label for="">Hình ảnh:</label>
					    <input type="file" name="inputFiles" multiple="multiple" class="form-control" />
				  	</div> -->
				  	<button type="submit" class="btn btn-primary">Gửi</button>
				  	<button type="button" id="ajax" class="btn btn-primary">ajax</button>
				</sf:form>
			</div>
			<div class="col-md-6 text-center">
				<h3>Thông tin spring form</h3>
				${donHang.vanDe } <br>
				${donHang.email } <br>
				${donHang.soDienThoai } <br>
				${donHang.maDonHang } <br>
				${donHang.tieuDe } <br>
				${donHang.noiDung } <br>
			</div>
		</div>
	</div>
	

<jsp:include page="/WEB-INF/views/user/layout/js.jsp"></jsp:include>

<script type="text/javascript">
		
		$(document).ready(function(){
			
			function test(){				
				var data = {
						vanDe: $("#vanDe").val(),
						email: $("#email").val(),
						soDienThoai: $("#soDienThoai").val(),
						maDonHang: $("#maDonHang").val(),
						tieuDe: $("#tieuDe").val(),
						noiDung: $("#noiDung").val()
				};
				
				$.ajax({
					url: "/test-ajax",
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
			
			$("#ajax").click(function(){
				test();
			})
			
		})
	
</script>

</body>
</html>