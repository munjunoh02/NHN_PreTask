<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
		
		.commentPara{
			line-height:1;
		}
		
	</style>
	
	<script>
	
		function moveModify(index) {
			$(location).attr('href', "/modifyComment?index="+index);
		}
		
	</script>
</head>

<body>
	<h1>
		NHN_PreTask 문준오
	</h1>
	<hr>

	<form action="/" method="post">
		<div class="form-group">
			<label>Email address</label> <input type="email" id="email" name = "email"
				class="form-control" pattern="[0-9a-zA-Z][0-9a-zA-Z]*@[0-9a-zA-Z][0-9a-zA-Z]*.[a-zA-Z]{2,3}" placeholder="ex)nhn@nhnent.com" required>
		</div>
		<div class="form-group">
			<label>Password</label> <input type="password" id="password" name = "password"
				class="form-control" pattern="[0-9a-zA-Z]{6}[0-9a-zA-Z]*" placeholder="영문자 숫자 조합 6자리 이상" required>
		</div>
		<div class="form-group">
			<label>Context</label>
			<textarea class="form-control" id="content" rows="3" name = "content" required></textarea>
		</div>
		<div class="form-group">
			<button type = "submit" class="btn btn-default">등록</button>
		</div>
	</form>


	<hr>
	
	<div id="commentdiv">

		<c:forEach var="comment" items="${commentList}" begin="0" end="${fn:length(commentList)}" step = "1" varStatus="status">
		  	<p class = "commentPara">No : ${fn:length(commentList) - status.index}</p>
			<p class = "commentPara">email : ${comment.email} | date : ${comment.date}</p>
			<p class = "commentPara">content : ${comment.content}</p>
			<button class="btn btn-default" style = "font-size:13px;" onclick="moveModify('${fn:length(commentList) - status.index}')">수정</button>
			<br><br>
		</c:forEach>
		
	</div>
	
</body>
</html>