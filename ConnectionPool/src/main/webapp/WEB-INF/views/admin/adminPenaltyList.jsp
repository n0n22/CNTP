<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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
                            <th width="10%"><input type="checkbox"></th>
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
                    </tbody>
                </table>
                <a href="#" class="btn btn-danger">처리</a>
            </div>


        </div>



    
    
    
        
        
    </div>
        
        
    <jsp:include page="../common/footer.jsp" />
    




</body>
</html>