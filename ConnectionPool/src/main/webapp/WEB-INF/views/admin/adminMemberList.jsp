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

        <form id="searchForm" method="get" action="memberSearch.ad">
            <div class="member-header">
                <div class="member-search-area">
                    <div class="search-condition">
                        <select name="condition" class="form-control">
                            <option value="mem_name">이름</option>
                            <option value="mem_id">아이디</option>
                            <option value="nickname">닉네임</option>
                        </select>
                    </div>
                    <div class="search-keyword">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="검색어 입력" name="keyword">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="">
    
                </div>
            </div>
        </form>
    
    
    
    	<form method="get" action="memberList.ad" id="orderForm">	
	        <div class="order-area">
	            <div class="select-order">
	                <select name="order" id="orderSelect" class="form-control" align="right">
	                    <option value="mem_name desc">회원번호↑</option>
	                    <option value="mem_name asc">회원번호↓</option>
	                    <option value="ingido desc">인기도↑</option>
	                    <option value="ingido asc">인기도↓</option>
	                    <option value="enroll_date desc">가입일↑</option>
	                    <option value="enroll_date asc">가입일↓</option>
	                </select>
	            </div>
	        </div>
	        
	        <div class="count-area">
	        	<div class="count-select">
	                <select name="bl" id="countSelect" class="form-control" align="right">
	                    <option value="10">10</option>
	                    <option value="15">15</option>
	                    <option value="30">30</option>
	                </select>
	            </div>
	        </div>
        </form>
        
        <script>
        
        	$(function() {
        		
        		
        		// 정렬기준 선택
        		$('#orderSelect option').each(function() {
        			if($(this).val() == '${ order }') {
        				$(this).attr('selected', true);
        			}        			
        		});
        		
        		
        		// 한 페이지에 보여줄 수 선택
        		$('#countSelect option').each(function() {
        			if($(this).val() == '${ pi.boardLimit }') {
        				$(this).attr('selected', true);
        			}			
        		});
        		
        		
        		
        	});
        
        
			
        
        
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

	            <ul class="pagination justify-content-center">
	                <li class="page-item"><a class="page-link" href="javascript:void(0);">&lt;</a></li>
	                <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
	                <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
	                <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
	                <li class="page-item"><a class="page-link" href="javascript:void(0);">&gt;</a></li>
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