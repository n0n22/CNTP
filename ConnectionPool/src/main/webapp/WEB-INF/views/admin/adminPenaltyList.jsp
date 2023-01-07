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

	
	.page-area {
		padding: 20px;
	}
	




</style>



</head>
<body>





    <jsp:include page="../common/menubar_nosearch.jsp" />
    <jsp:include page="adminMenubar.jsp" />

    <div class="report-outer">
    
        
        <div class="report-btn-area">
            <a href="reportList.ad" class="btn btn-secondary">신고글 목록</a>
            <a href="penaltyList.ad" class="btn btn-secondary">패널티 대상 목록</a>

            
        </div>
        <div class="report-table-area">

            <div class="container">
                <table class="table table-bordered table-hover" id="penaltyTable">
                    <thead>
                        <tr>
                            <th width="10%"><input type="checkbox" id="checkAll"></th>
                            <th width="15%">회원번호</th>
                            <th width="20%">아이디</th>
                            <th width="10%">누적신고</th>
                            <th width="15%">패널티 유형</th>
                            <th width="25%">최종신고처리일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>3</td>
                            <td>user02</td>
                            <td>10</td>
                            <td>탈퇴</td>
                            <td>2022-10-05</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>3</td>
                            <td>user02</td>
                            <td>10</td>
                            <td>탈퇴</td>
                            <td>2022-10-05</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>3</td>
                            <td>user02</td>
                            <td>10</td>
                            <td>탈퇴</td>
                            <td>2022-10-05</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>3</td>
                            <td>user02</td>
                            <td>10</td>
                            <td>탈퇴</td>
                            <td>2022-10-05</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>3</td>
                            <td>user02</td>
                            <td>10</td>
                            <td>탈퇴</td>
                            <td>2022-10-05</td>
                        </tr>
                    </tbody>
                </table>
                <a href="#" class="btn btn-danger">처리</a>
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
			
			
			// 전체 checkbox 클릭 시 체크 + 해제
			$('#penaltyTable thead').on('click', '#checkAll', function() {
				
				if($(this).prop('checked')) {
					$('#penaltyTable tbody input[type=checkbox]').each(function() {
						$(this).prop('checked', true);
					});
				}
				else {
					$('#penaltyTable tbody input[type=checkbox]').each(function() {
						$(this).prop('checked', false);
					});
				}
			});	
		
			// 일부 checkbox 클릭 시 전체 체크 해제
			$('#penaltyTable tbody').on('click', 'input[type=checkbox]', function() {
				if(!$(this).prop('checked')) {
					$('#checkAll').prop('checked', false);
				} 
				else {
					var checked = 0;
					$('#penaltyTable tbody input[type=checkbox]').each(function() {
						if(!$(this).prop('checked')) {
							checked++;
						}
					});
					if(checked == 0) {
						$('#checkAll').prop('checked', true);
					}
					
				}
				
			});
			
			
			
			
			
			
		});
	
	
	
	
	
	
	</script>







</body>
</html>