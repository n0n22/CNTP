<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
	                    	<c:forEach var="report" items="${ list }">
		                    	<tr>

		                            <td class="notcheck"><input type="checkbox"></td>
		                            <td>${ report.memNo }</td>
		                            <td>${ report.memId }</td>
		                            <td>${ report.count }</td>
		                            <td>${ report.penalty }</td>
		                            <td>${ report.completionDate }</td>
		                        </tr>
	                    	</c:forEach>
	                    </tbody>
		            </table>

                <button class="btn btn-danger" onclick="openConfirm();" id="confirmBtn">처리</btton>
            </div>
			<div class="page-area">
				<ul class="pagination" align="center">
	               	<c:choose>
	                	<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link">&lt;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="penaltyList.ad?cpage=${ pi.currentPage - 1 }">&lt;</a></li>
	                    </c:otherwise>
	                </c:choose>
	                
	               
	                <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		                <c:choose>
		                	<c:when test="${ pi.currentPage eq p }">
		                   		<li class="page-item disabled"><a class="page-link" href="penaltyList.ad?cpage=${ p }">${ p }</a></li>
		                	</c:when>
		                	<c:otherwise>
		                		<li class="page-item"><a class="page-link" href="penaltyList.ad?cpage=${ p }">${ p }</a></li>
		                	</c:otherwise>
		                </c:choose>
	                </c:forEach>
	               
	                
					<c:choose>
	                	<c:when test="${ pi.currentPage eq pi.maxPage }">
		                    <li class="page-item disabled"><a class="page-link">&gt;</a></li>
	                    </c:when>
	                    <c:otherwise>
		                    <li class="page-item"><a class="page-link" href="penaltyList.ad?cpage=${ pi.currentPage + 1 }">&gt;</a></li>
	                    </c:otherwise>
	                </c:choose>
				</ul>
			</div>

        </div>

        
    </div>
    
    <form method="post" action="penaltyInsert.ad" id="penaltyForm">
    
    
    </form>
    
    
        
        
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
		
		
		function openConfirm() {
			var count = 0;
			var checked = [];
			$('#penaltyTable tbody input[type=checkbox]').each(function() {
				if($(this).is(':checked')) {
					count++;
					
					// console.log($(this).parent().nextAll().eq(3).text());
					
					var str = '<input type="hidden" value="' + $(this).parent().next().text() + '" name="memNo">';
					str += '<input type="hidden" value="' + $(this).parent().nextAll().eq(3).text() + '" name="penalty">';
					
					
					
					$('#penaltyForm').append(str);
					// $('#penaltyForm').append('<input type="text" value="' + $(this).parent().nextAll().eq(3).text() + '" name="penalty"')
					
            		// <input type="hidden" value="${ report.memNo }" name="memNo">
            		// <input type="hidden" value="${ report.penalty }" name="penalty">					
					
				}
				if(count > 0) { // 체크 한 상태라서 요청이 가야 함
		    		alertify.confirm('체크 했어?', function() {
					
		    			$('#penaltyForm').submit();
		    		
		   			}, function() {
		   				
		    			$('#penaltyForm').html('');
		   				
		   			});
				} 
				else { // 체크 안한 상태라서 요청이 가면 안됨
		    		alertify.confirm('체크 안함', function() {
		   			});
				}
				
			})
					
			
			
		};
	
	
	
	
	
	
	</script>







</body>
</html>