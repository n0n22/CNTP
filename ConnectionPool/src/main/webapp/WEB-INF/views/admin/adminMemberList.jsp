<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="//cdn.sheetjs.com/xlsx-latest/package/dist/xlsx.full.min.js"></script>

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
        			$('#orderCondition').val('desc');
        		}
        		else { // 오름차순
        			$('#orderCondition').val('asc');
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
                <table class="table table-bordered table-hover" id="memberTable">
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

        
        <div>
        
        	<button type="button" class="btn btn-outline-success" onclick="excelDownloadByHtml();">현재 목록 exel로</button>
        	<button type="button" class="btn btn-success" onclick="allMemberList();">전체 목록 exel로</button>
        
        </div>    

		<script>
		

			function setFileName() {
				
				let dt = new Date();
				let month = dt.getMonth() + 1;
				if(month < 10) {month = "0" + month;}
				let day = dt.getDate();
				if(day < 10) {day = "0" + day;}
				let hours = dt.getHours();
				if(hours < 10) {hours = "0" + hours;}
				let minutes =  dt.getMinutes();
				if(minutes < 10) {minutes = "0" + minutes;}
				let seconds = dt.getSeconds();
				if(seconds < 10) {seconds = "0" + seconds;}
				
				let date = dt.getFullYear() + month + day + '_' + hours + minutes + seconds;
				let fileName = 'cntp_' + date + '.xlsx';
											
				return fileName;
			}
		
		
			function excelDownloadByHtml() {
	
				// 파일명 설정
				let fileName = setFileName();
				
				// 시트 설정을 전달하면서 엑셀 파일 생성
				let wb = XLSX.utils.table_to_book(document.getElementById('memberTable'), {sheet: '회원 목록', raw: true});
				
			    // 엑셀 다운로드
				XLSX.writeFile(wb, fileName);
			};
		
			
			function excelDownloadByJson(result) {

				// 파일명 설정
			    let fileName = setFileName();
				
				// 엑셀 파일 생성
			    const book = XLSX.utils.book_new();
				
			    // sheet 생성 - json_to_sheet 방식
			    const worksheetByJson = XLSX.utils.json_to_sheet(result);
				
			    // 엑셀 파일에 sheet set(엑셀파일, 시트데이터, 시트명)
			    XLSX.utils.book_append_sheet(book, worksheetByJson, '회원 전체 목록');  
			    				
			    // 엑셀 다운로드
			    XLSX.writeFile(book, fileName);
			};
			
			
			function allMemberList() {
				
				$.ajax({
					
					url : 'allMemberList.ad',
					success : function(result) {
						console.log(result);
						excelDownloadByJson(result);
					},
					error : function() {
						// console.log('ajax 통신 실패');						
					}
					
					
					
				});							
				
				
				
				
			}
			
		

		
		</script>




	    <button class="btn btn-sm btn-danger" onclick="openReportForm();">신고</button>

    </div>
    
      


	<form id="reportvalue">
		<input type="hidden" value="" name="memNo" id="memNo">
		<input type="hidden" value="" name="memNickname" id="memNickname">
		<input type="hidden" value="" name="content" id="content">
		<input type="hidden" value="" name="reportBoard" id="reportBoard">
		<input type="hidden" value="" name="boardNo" id="boardNo">
	</form>

    
    

    	
	<jsp:include page="../common/footer.jsp" />



	<script>
		
		function openReportForm() {
							
			window.open('', '신고', 'width=300,height=500,resizable=no,location=yes,menubar=yes,scrollbar=no');
			
			$('#memNo').val(4);
			$('#memNickname').val('닉네임3');
			$('#content').val('바보야');
			$('#reportBoard').val('board');
			$('#boardNo').val(3);
			
			
			reportvalue.action = 'reportForm';
			reportvalue.target = '신고';
			reportvalue.method = 'post';
			reportvalue.submit();
				
		};
		
	
		
	
	
	
	
	</script>



</body>
</html>