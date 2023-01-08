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
		
		.order-select {
			width: 150px;
			padding: 10px;
		}



    </style>


</head>
<body>


    	
	<jsp:include page="../common/menubar_nosearch.jsp" />
    <jsp:include page="adminMenubar.jsp" />
	


    <div class="admin-outer">
        <div class="member-header">
            <div class="member-search-area">
                <form>
                	<div class="search-condition">
	                    <select name="searchCondition" class="custom-select">
	                        <option value="name">이름</option>
	                        <option value="id">아이디</option>
	                        <option value="nickname">닉네임</option>
	                    </select>
                    </div>
                    <div class="search-keyword">
	                    <div class="input-group mb-3">
	                        <input type="text" class="form-control" placeholder="Search">
	                        <div class="input-group-append">
	                            <button class="btn btn-primary" type="submit">검색</button>
	                        </div>
	                    </div>
                    </div>
                </form>
            </div>
            <div>

            </div>
            <div class="order-area">
                <div class="order-select" align="right">
                    <select name="" id="" class="custom-select">
                        <option>이름↑</option>
                        <option>이름↓</option>
                        <option>패널티↑</option>
                        <option>패널티↓</option>
                        <option>인기도↑</option>
                        <option>인기도↓</option>
                    </select>
                </div>
            </div>
        </div>
		<div class="member-table-area">
            
			<div class="container">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th width="5%">번호</th>
                            <th width="15%">아이디</th>
                            <th width="20%">이름</th>
                            <th width="20%">닉네임</th>
                            <th width="15%">인기도</th>
                            <th width="15%">패널티</th>
                            <th width="15%">탈퇴</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>3</td>
                            <td>user02</td>
                            <td>홍길동</td>
                            <td>안녕</td>
                            <td>-10</td>
                            <td>8</td>
                            <td><a href="" class="btn btn-sm btn-secondary">탈퇴</a></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>user02</td>
                            <td>홍길동</td>
                            <td>안녕</td>
                            <td>-10</td>
                            <td>8</td>
                            <td><a href="" class="btn btn-sm btn-secondary">탈퇴</a></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>user02</td>
                            <td>홍길동</td>
                            <td>안녕</td>
                            <td>-10</td>
                            <td>8</td>
                            <td><a href="" class="btn btn-sm btn-secondary">탈퇴</a></td>
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


	    <button class="btn btn-sm btn-danger" onclick="openReportForm();">신고</button>

    </div>
    

    

    	
	<jsp:include page="../common/footer.jsp" />



	<script>
		
		function openReportForm() {
							
			window.open('http://localhost:8484/cntp/reportForm', '신고', 'width=300, height=500, resizable=no, location=yes, menubar=yes, scrollbar=yes');
			
		};
		
	
		
	
	
	
	
	</script>



</body>
</html>