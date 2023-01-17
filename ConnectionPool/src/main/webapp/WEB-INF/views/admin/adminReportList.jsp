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
	
	.report-status {
		width: 150px;
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
		<div class="report-status">
	        <select name="result" class="form-control" id="result" onchange="changeStatus();">
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
                            <th width="10%">신고대상자</th>
                            <th width="20%">유형</th>
                            <th width="20%">신고사유</th>
                            <th width="10%">신고자</th>
                            <th width="15%">신고일시</th>
                            <th width="15%">처리일시</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="report" items="${ list }">
	                        <tr class="clickTr">
	                            <td>${ report.reportNo }</td>
	                            <td>${ report.memId }</td>
	                            <td>${ report.reportBoard }</td>
	                            <td>${ report.reportReason }</td>
	                            <td>${ report.reporterId }</td>
	                            <td>${ report.reportDate }</td>
	                            <td>${ report.completionDate }</td>
	                        </tr>
                    	</c:forEach>
                    	<c:if test="${ empty list }">
                    		<tr>
                    			<td colspan="7" align="center">신고 내역이 없습니다.</td>
                    		</tr>
                    	</c:if>
                    </tbody>
                </table>
            </div>
            
            
			<div class="admin-footer">
				<div class="page-area">
					<ul class="pagination" align="center">
		               	<c:choose>
		                	<c:when test="${ pi.currentPage eq 1 }">
		                    	<li class="page-item disabled"><a class="page-link">&lt;</a></li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item"><a class="page-link" href="reportList.ad?result=${ result }&cpage=${ pi.currentPage - 1 }">&lt;</a></li>
		                    </c:otherwise>
		                </c:choose>
		                
		               
		                <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			                <c:choose>
			                	<c:when test="${ pi.currentPage eq p }">
			                   		<li class="page-item disabled"><a class="page-link" href="reportList.ad?result=${ result }&cpage=${ p }">${ p }</a></li>
			                	</c:when>
			                	<c:otherwise>
			                		<li class="page-item"><a class="page-link" href="reportList.ad?result=${ result }&cpage=${ p }">${ p }</a></li>
			                	</c:otherwise>
			                </c:choose>
		                </c:forEach>
		               
		                
						<c:choose>
		                	<c:when test="${ pi.currentPage eq pi.maxPage }">
			                    <li class="page-item disabled"><a class="page-link">&gt;</a></li>
		                    </c:when>
		                    <c:otherwise>
			                    <li class="page-item"><a class="page-link" href="reportList.ad?result=${ result }&cpage=${ pi.currentPage + 1 }">&gt;</a></li>
		                    </c:otherwise>
		                </c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
	
		$(function() {
			
			// tr 클릭 시 신고 상세보기
			$('#reportTable tbody .clickTr').click(function() {
				
				location.href = 'reportDetail.ad?rno=' + $(this).children().eq(0).text();
				//console.log($(this).children().eq(0).text());
				
			});			
			
			// 처리전/처리완료 선택
			$('#result option[value=${result}]').attr('selected', true)

			
		});
	
	
	
		function changeStatus() {
			
			location.href = 'reportList.ad?result=' + $('#result option:selected').val();
			
		};
	
	
	
	</script>

	
	
	


</body>
</html>