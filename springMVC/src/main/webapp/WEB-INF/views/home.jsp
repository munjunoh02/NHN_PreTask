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
	<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
	<title>NHN_PreTask</title>
	
	<style>
		.form-group{
			width:700px;
			margin:auto;
			margin-top:10px;
		}
		
		#commentdiv{
			width:700px;
			margin:auto;
			margin-top:10px;
		}
		
	</style>
	
	<script>
		$(document).ready(function() {
			/******************************/
			// 수정하기 & 현재 날짜
			// 수정할 때, DB비교
			/******************************/
			
			$("#sign").click(function() {
				// text값은 text(), form 입력값은 val()
				var email = $("#email").val();
				var password = $("#password").val();
				var content = $("#content").val();
				$("#commentdiv").append("<p> email주소 : "+email+"</p>");
				$("#commentdiv").append("<p> 비밀번호 : "+password+"</p>");
				$("#commentdiv").append("<p> 내용 : "+content+"</p>");
				$("#commentdiv").append("<button  class=\"btn btn-default\"> 수정  </button>");
				/***************/
				// DB넣기
				/***************/
				/*
				$.ajax({
					type : "POST",
					url : "/someController",
					data : {
						name : "John",
						location : "Boston"
					},
					success : function(html) {
						$("#results").append(html);
					}
				});
				*/ 
			});
		});
	</script>
	

</head>

<body>
	<h1>
		NHN_PreTask 문준오
	</h1>
	<hr>
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
		<button id = "sign" onclick="sign()" class="btn btn-default">등록</button>
	</div>
	<hr>
	<div id="commentdiv">

		<c:forEach var="book" items="${books}">
			<p>email : ${book.email}</p>
			<p>password : ${book.password}</p>
			<p>content : ${book.content}</p>
			<p>date : ${book.date}</p>
		</c:forEach>
		
	</div>
	
	<p>${serverTime}</p>
	
	
	
	
</body>
</html>