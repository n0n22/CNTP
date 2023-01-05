<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.myPointInfo{
		background-color: antiquewhite;
		border-radius: 5px;
		width: 600px;
		padding-top: 5px;
		padding-bottom: 5px;
	}
</style>
</head>
<body>
	<div class="outer" align="center">
		<h3 align="left">뱃지 구매</h3>
		<hr>
		<br>
		<p>뱃지로 우리 팀의 정체성을 표현해보세요</p>
		<br>

		<div class="myPointInfo">
			<p>현재 내 포인트 : </p>
			<p>소요 포인트 : </p>
		</div>
		<p>
			* 뱃지 구매 시 100P가 차감되며 취소 및 환불이 불가합니다<br>
			* 팀 삭제 및 소멸 시 뱃지 사용 권한 또한 삭제되며 복구 불가합니다.
		</p>
		
		<br>
		
		<div align="center">
	        <input type="checkbox"> 위 내용을 숙지하고 동의합니다. <br><br>
	        <a href="#">취소하기</a> <button>구매하기</button>
	    </div>
	    
	</div>
</body>
</html>