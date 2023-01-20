<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고관리</title>


    <style>
        
        .admin-outer {
            margin-left: 150px;
            height: 100%;
            padding: 10px;
        }

        .admin-outer .container {

            padding: 20px;
        }

        .result-btn-area {
            text-align: center;
        }

        .result-btn-area>a {
            margin: 10px;
        }

        .admin-outer table {
            text-align: center;
        }



    </style>




</head>
<body>
	
	<jsp:include page="../common/menubar_nosearch.jsp" />
    <jsp:include page="adminMenubar.jsp" />

    <div class="admin-outer">
        <div class="container">
    
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <th width="20%">번호</th>
                        <td width="30%">${ report.reportNo }</td>
                        <th width="20%">신고사유</th>
                        <td width="30%">${ report.reportReason }</td>
                    </tr>
                    <tr>
                        <th>신고대상자</th>
                        <td>${ report.memId }</td>
                        <th>신고자</th>
                        <td>${ report.reporterId }</td>
                    </tr>
                    <tr>
                        <th>대상글번호</th>
                        <td>${ report.boardNo }</td>
                        <th>신고일</th>
                        <td>${ report.reportDate }</td>
                    </tr>
                    <tr>
                        <th>대상 유형</th>
                        <td colspan="5" align="left">${ report.reportBoard }
                        	<c:choose>
                        		<c:when test="${ report.reportBoard eq 'board' }">
                        			자유게시판
                        		</c:when>
                        		<c:when test="${ report.reportBoard eq 'boardReply' }">
                        			자유게시판 댓글
                        		</c:when>
                        	</c:choose>
                        
                        </td>
                    </tr>
                    <tr>
                        <th height="200">대상 내용</th>
                        <td colspan="5">
                            <p align="left">
								${ report.content }
                            </p>
                        </td>
                    </tr>
                    
                    <tr>
                        <th>처리결과</th>
                        <td>${ report.reportResult }</td>
                        <th>처리일자</th>
                        <td colspan="3">${ report.completionDate }</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="result-btn-area">
			<c:if test="${ empty report.reportResult }">
		            <button type="button" class="btn btn-warning" onclick="invalidFormSubmit();">신고무효</button>
		            <button type="button" class="btn btn-danger" onclick="confirmFormSubmit();">신고확정</button>
			</c:if>
			<button type="button" class="btn btn-secondary" onclick="history.back();">목록으로</button>
        </div>

		<form method="post" action="" id="submitForm">
			<input type="hidden" value="${ report.reportNo }" name="reportNo" >
			<input type="hidden" value="${ report.boardNo }" name="boardNo" >		
		</form>
			
		<script>
		
		
			// 신고 무효
			function invalidFormSubmit() {
				$('#submitForm').attr('action', 'reportInvalid.ad');
				$('#submitForm').submit();
			}
			
			// 신고 확정
			function confirmFormSubmit() {
				$('#submitForm').attr('action', 'reportConfirm.ad');
				$('#submitForm').submit();
			}
		
		
		
		</script>



    </div>


	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>