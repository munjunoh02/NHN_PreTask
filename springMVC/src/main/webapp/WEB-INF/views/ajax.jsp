<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko ">
<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<title>NHN_PreTask</title>
	
	<style>
		.form-group{
			width:700px;
			margin:auto;
			margin-top:10px;
		}
		
		.comment{
			width:700px;
			margin:auto;
			margin-top:10px;
		}
	</style>
	
	<script>
		$(document).ready(function() {
			$("#submit").click(function() {
				var query = {
					email : $("#email").val(),
					password : $("#password").val(),
					content : $("#content").val()
				};
				$.ajax({
					type : "POST",
					url : "home.jsp",
					data : query,
					success : function(data) {
						$("#result").html(data);
					}
				});
			});
	
		});
	</script>
	

</head>

<body>
	<h1>
		AJAX NHN_PreTask 문준오
	</h1>
	<hr>
	<form role="form" action ="./ajax.jsp">
		<div class="form-group">
			<label>Email address</label>
			<input type="email" id = "email" class="form-control" placeholder="Email Address">
		</div>
		
		<div class="form-group">
			<label>Password</label>
			<input type="password" id = "password" class="form-control" placeholder="Password">
		</div>
		
		<div class="form-group">
			<label>Context</label>
			<textarea class="form-control" id = "content" rows="3"></textarea>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-default">등록</button>
		</div>
	</form>
	<hr>
	
	
	
</body>
</html>