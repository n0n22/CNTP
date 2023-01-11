<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>

<style>


	.report-btn-area {
		padding: 15px;
	}


	.report-table-area {
		padding: 20px;
	}
	
	
	.page-area {
		padding: 20px;
	}
	
	
	

	
</style>



</head>
<body>
	
	
	<jsp:include page="../common/menubar_nosearch.jsp" />
	<jsp:include page="adminMenubar.jsp" />

	<div class="admin-outer">
	
		
		<div class="report-btn-area">
			<a href="reportList.ad" class="btn btn-secondary">신고글 목록</a>
			<a href="penaltyList.ad" class="btn btn-secondary">패널티 대상 목록</a>
		
		</div>
		<div>
	        <select name="result" class="form-control" id="result">
	            <option value="yet">처리전</option>
	            <option value="end">처리완료</option>
	        </select>
		</div>
		<div class="report-table-area">

			<div class="container">
                <table class="table table-bordered table-hover" id="reportTable">
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
                        <tr class="clickTr">
                            <td>3</td>
                            <td>user02</td>
                            <td>자유게시판 댓글</td>
                            <td>욕설/비방</td>
                            <td>user05</td>
                            <td>2022-05-30</td>
                        </tr>
                        <tr class="clickTr">
                            <td>3</td>
                            <td>user02</td>
                            <td>자유게시판 댓글</td>
                            <td>욕설/비방</td>
                            <td>user05</td>
                            <td>2022-05-30</td>
                        </tr>
                        <tr class="clickTr">
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
			<div class="page-area">
				<ul class="pagination justify-content-center">
	                <li class="page-item"><a class="page-link" href="javascript:void(0);">&lt;</a></li>
	                <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
	                <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
	                <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
	                <li class="page-item"><a class="page-link" href="javascript:void(0);">&gt;</a></li>
            	</ul>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	
		$(function() {
			
			$('#reportTable tbody .clickTr').click(function() {
				
				location.href = 'reportDetail.ad';
				
			});
			
			
			
			
			
			
			
			
			
			
		});
	
	
	
	
	
	
	</script>
	
	
	
	


</body>
</html>