<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>

		.report-outer {
			width: 300px;
			height: 500px;
			padding: 20px;
		}



    </style>


</head>
<body>


	<div class="report-outer">
		<div class="report-header">
			<h3>신고하기</h3>			
		</div>
		<div class="target-area">
			<p>
				작성자 : ${ test }
				<br>
				글내용 : ㅎㅎㅎㅎ
			</p>
		</div>
		
		<form action="" method="post">
			<div class="reason-area">
				<input type="radio" name="reason" id="reason1"><label for="reason1">스팸/홍보</label><br>
				<input type="radio" name="reason" id="reason2"><label for="reason2">욕설/비방</label><br>
				<input type="radio" name="reason" id="reason3"><label for="reason3">개인정보노출</label><br>
			</div>
			<div class="button-area">
				<button type="submit" class="btn btn-danger">신고</button>
			</div>

		</form>



	</div>








    	


</body>
</html>