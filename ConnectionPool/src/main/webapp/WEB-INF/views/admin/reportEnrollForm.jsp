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
				작성자 : ${ report.memNickname }
				<br>
				글내용 : ${ report.content }
			</p>
		</div>
		
		<form action="insertReport.ad" method="post">

			<input type="hidden" value="${ report.memNo }" name="memNo" id="memNo">
			<input type="hidden" value="${ report.reportBoard }" name="reportBoard" id="reportBoard">
			<input type="hidden" value="${ report.boardNo }" name="boardNo" id="boardNo">
			
			<input type="hidden" value="${ loginMember.memNo }" name="reporter" id="reporter">

			<div class="reason-area">
				<input type="radio" name="reportReason" id="reason1" value="스팸/홍보"><label for="reason1">스팸/홍보</label><br>
				<input type="radio" name="reportReason" id="reason2" value="욕설/비방"><label for="reason2">욕설/비방</label><br>
				<input type="radio" name="reportReason" id="reason3" value="개인정보노출"><label for="reason3">개인정보노출</label><br>
			</div>
			<div class="button-area">
				<button type="submit" class="btn btn-danger">신고</button>
			</div>

		</form>



	</div>

	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert('알림', '${alertMsg}', function(){ alertify.success('확인 완료'); });
			window.close();	
		</script>
	</c:if>


    	


</body>
</html>