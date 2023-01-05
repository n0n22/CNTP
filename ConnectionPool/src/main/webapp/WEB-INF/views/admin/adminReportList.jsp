<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>

<style>

	div {
		border: solid 1px red;
	}

	.report-outer {
		
		margin-left : 150px;
		height : 90%;

		padding: 20px;
		

	}

	.report-btn-area {
		padding: 15px;
	}


	.report-table-area {

		padding: 20px;

	}

	




</style>



</head>
<body>
	
	
	<jsp:include page="../common/menubar_nosearch.jsp" />
	<jsp:include page="adminMenubar.jsp" />

	<div class="report-outer">
	
		
		<div class="report-btn-area">
			<a href="#" class="btn btn-secondary">신고글 목록</a>
			<a href="#" class="btn btn-secondary">패널티 대상 목록</a>

			
		</div>
		<div class="report-table-area">

			<div class="container">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th width="5%">번호</th>
                            <th width="15%">신고대상자</th>
                            <th width="20%">유형</th>
                            <th width="20%">신고사유</th>
                            <th width="15%">신고자</th>
                            <th width="15%">신고일시</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>3</td>
                            <td>user02</td>
                            <td>자유게시판 댓글</td>
                            <td>욕설/비방</td>
                            <td>user05</td>
                            <td>2022-05-30</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>user02</td>
                            <td>자유게시판 댓글</td>
                            <td>욕설/비방</td>
                            <td>user05</td>
                            <td>2022-05-30</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>user02</td>
                            <td>자유게시판 댓글</td>
                            <td>욕설/비방</td>
                            <td>user05</td>
                            <td>2022-05-30</td>
                        </tr>
                    </tbody>
                </table>
            </div>



		</div>
	
	
	
	
	
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />


</body>
</html>