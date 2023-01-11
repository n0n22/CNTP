<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>


        .member-header {
            text-align: center;
            padding-top: 15px;
        }

        .member-header>div {
            display: inline-block;
            width: 50%;
        }

        .member-search-area {
            width: 200px;
        }

		.page-area {
			padding: 15px;
		}
		
		.search-condition, .search-keyword {
			display: inline-block;
		}
		
		.select-order {
			width: 150px;
			padding: 10px;
		}

		.count-select {
			width: 100px;
		}


    </style>


</head>
<body>


    	
	<jsp:include page="../common/menubar_nosearch.jsp" />
    <jsp:include page="adminMenubar.jsp" />
	


    <div class="admin-outer">

        <form id="searchForm" method="get" action="memberList.ad">
            <div class="member-header">
                <div class="member-search-area">
                    <div class="search-condition">
                        <select name="condition" class="form-control" id="conditionSelect">
                            <option value="name">이름</option>
                            <option value="id">아이디</option>
                            <option value="nickname">닉네임</option>
                        </select>
                    </div>
                    <div class="search-keyword">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="검색어 입력" name="keyword" id="keywordInput">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button" onclick="keywordSearch();">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="">
    
                </div>
            </div>
           	<div class="order-area">
	            <div class="select-order">
	                <select name="order" id="orderSelect" class="form-control" align="right" onchange="keywordSearch();">
	                    <option value="memNo" class="asc">회원번호↑</option>
	                    <option value="memNo" class="desc" selected>회원번호↓</option>
	                    <option value="ingido" class="asc">인기도↑</option>
	                    <option value="ingido" class="desc">인기도↓</option>
	                    <option value="enrollDate" class="asc">가입일↑</option>
	                    <option value="enrollDate" class="desc">가입일↓</option>
	                </select>
	            </div>
	        </div>
	        <input type="hidden" value="" id="orderCondition" name="orderCondition">
	        <div class="count-area">
	        	<div class="count-select">
	                <select name="bl" id="countSelect" class="form-control" align="right" onchange="keywordSearch();">
	                    <option value="10" selected>10</option>
	                    <option value="15">15</option>
	                    <option value="30">30</option>
	                </select>
	            </div>
	        </div>
            
            <!-- 
			<input type="hidden" name="order" id="searchOrder" value="">
			<input type="hidden" name="orderCondition" id="searchOrderCondition" value="">
			<input type="hidden" name="bl" id="searchBoardLimit" value="">
			-->
        </form>
    
    
    	<!-- 
    	<form method="get" action="memberList.ad" id="orderForm">	
	        <div class="order-area">
	            <div class="select-order">
	                <select name="order" id="orderSelect" class="form-control" align="right" onchange="submitOrderForm();">
	                    <option value="memNo" class="asc">회원번호↑</option>
	                    <option value="memNo" class="desc" selected>회원번호↓</option>
	                    <option value="ingido" class="asc">인기도↑</option>
	                    <option value="ingido" class="desc">인기도↓</option>
	                    <option value="enrollDate" class="asc">가입일↑</option>
	                    <option value="enrollDate" class="desc">가입일↓</option>
	                </select>
	            </div>
	        </div>
	        <input type="hidden" value="" id="orderCondition" name="orderCondition">
	        <div class="count-area">
	        	<div class="count-select">
	                <select name="bl" id="countSelect" class="form-control" align="right" onchange="submitOrderForm();">
	                    <option value="10" selected>10</option>
	                    <option value="15">15</option>
	                    <option value="30">30</option>
	                </select>
	            </div>
	        </div>
        </form>
        -->
        
        <script>
        
        	$(function() {
        		
        		
        		// 정렬기준 선택
        		$('#orderSelect option').each(function() {
        			if($(this).val() == '${ order }' && $(this).is('.${ orderCondition }')) {
        				$(this).attr('selected', true);
        			}        			
        		});
        		
        		
        		// 한 페이지에 보여줄 수 선택
        		$('#countSelect option').each(function() {
        			if($(this).val() == '${ pi.boardLimit }') {
        				$(this).attr('selected', true);
        			}			
        		});
        		
        		
        		// 키워드 있을 시 입력
        		<c:if test="${ not empty keyword }">
        			$('#keywordInput').val('${ keyword }');
        		</c:if>        		
        		
        		
        		// 검색조건 있을 시 입력
        		$('#conditionSelect option').each(function() {
        			if($(this).val() == '${ condition }') {
        				$(this).attr('selected', true);
        			}
        			
        			
        		});
        	       		
        		
        		
        	});
        	
        	
/*        	
        	// 정렬기준에 변화가 생기면 form태그 눌리게 하기
        	function submitOrderForm() {
        		
        		var value1 = $('#orderSelect option:selected'); // 선택된 정렬기준이
        		var test1 = value1.is('.desc'); // 내림차순을 포함하는가

        		if(test1) { // 내림차순
        			$('#orderCondition').val('desc');
        		}
        		else { // 오름차순
        			$('#orderCondition').val('asc');
        		}
				
        		// console.log($('#orderCondition').val());
        			
        		$('#orderForm').submit();		        		
        	};
        	
        	
        
*/        
        	
        	function keywordSearch() {
				
        		// 정렬 대상 컬럼 넣기
        		// $('#searchOrder').val($('#orderSelect option:selected').val());
        		
        		// 정렬 기준 넣기
        		var test2 = $('#orderSelect option:selected').is('.desc'); // 선택된 정렬기준이 내림차순을 포함하는가

        		if(test2) { // 내림차순
        			$('#searchOrderCondition').val('desc');
        		}
        		else { // 오름차순
        			$('#searchOrderCondition').val('asc');
        		}
        		
        		// 화면에 몇 개 보여줄 건지 넣기
        		// console.log($('#countSelect option:selected').val());
        		// $('#searchBoardLimit').val($('#countSelect option:selected').val());
        		// console.log($('#searchBoardLimit').val());
        		// 폼태그 실행
        		
        		$('#searchForm').submit();	
        		        		
        	};
        
			
        
        
        </script>
        

		<div class="member-table-area">
            
			<div class="container">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th width="10%">번호</th>
                            <th width="15%">아이디</th>
                            <th width="15%">이름</th>
                            <th width="15%">닉네임</th>
                            <th width="15%">인기도</th>
                            <th width="20%">가입일</th>
                            <th width="10%">탈퇴</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="m" items="${ list }">
	                    	<tr>
	                            <td>${ m.memNo }</td>
	                            <td>${ m.memId }</td>
	                            <td>${ m.memName }</td>
	                            <td>${ m.nickName }</td>
	                            <td>${ m.ingido }</td>
	                            <td>${ m.enrollDate }</td>
	                            <td><a href="" class="btn btn-sm btn-secondary">탈퇴</a></td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
			<div class="page-area">
	        	<ul class="pagination" align="center">
	               	<c:choose>
	                	<c:when test="${pi.currentPage eq 1}">
	                    	<li class="page-item disabled"><a class="page-link">&lt;</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="memberList.ad?order=${order}&orderCondition=${orderCondition}&bl=${pi.boardLimit}&cpage=${pi.currentPage - 1}&keyword=${keyword}&condition=${condition}">&lt;</a></li>
	                    </c:otherwise>
	                </c:choose>
	                
	               
	                <c:forEach begin="${pi.startPage}" end="${pi.endPage}" var="p">
		                <c:choose>
		                	<c:when test="${pi.currentPage eq p}">
		                   		<li class="page-item disabled"><a class="page-link">${ p }</a></li>
		                	</c:when>
		                	<c:otherwise>
		                		<li class="page-item"><a class="page-link" href="memberList.ad?order=${order}&orderCondition=${orderCondition}&bl=${pi.boardLimit}&cpage=${p}&keyword=${keyword}&condition=${condition}">${p}</a></li>
		                	</c:otherwise>
		                </c:choose>
	                </c:forEach>
	               
	                
					<c:choose>
	                	<c:when test="${pi.currentPage eq pi.maxPage}">
		                    <li class="page-item disabled"><a class="page-link">&gt;</a></li>
	                    </c:when>
	                    <c:otherwise>
		                    <li class="page-item"><a class="page-link" href="memberList.ad?order=${order}&orderCondition=${orderCondition}&bl=${pi.boardLimit}&cpage=${pi.currentPage + 1}&keyword=${keyword}&condition=${condition}">&gt;</a></li>
	                    </c:otherwise>
	                </c:choose>
				</ul>			
			</div>


        </div>

		<form id="reportvalue">
			<input type="hidden" value="hello" name="test">
		</form>

	    <button class="btn btn-sm btn-danger" onclick="openReportForm();">신고</button>

    </div>
    

    

    	
	<jsp:include page="../common/footer.jsp" />



	<script>
		
		function openReportForm() {
							
			window.open('', '신고', 'width=300, height=500, resizable=no, location=yes, menubar=yes, scrollbar=yes');
			
			reportvalue.action = 'reportForm';
			reportvalue.target = '신고';
			reportvalue.method = 'post';
			reportvalue.submit();
				
		};
		
	
		
	
	
	
	
	</script>



</body>
</html>