<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고관리</title>


<style>
        
    div {
        box-sizing: border-box;
        border: solid 1px red;
    }


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
                        <th>회원번호</th>
                        <td>35</td>
                        <th>회원아이디</th>
                        <td>user01</td>
                    </tr>
                    <tr>
                        <th>누적신고</th>
                        <td>7</td>
                        <th>패널티 유형</th>
                        <td>정지</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th width="10%">신고번호</th>
                        <th width="20%">신고일</th>
                        <th width="30%">신고사유</th>
                        <th width="30%">신고처리일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>5</td>
                        <td>2022-08-07</td>
                        <td>욕설/비방</td>
                        <td>2022-09-09</td>
                    </tr>
                </tbody>
            </table>
        </div>


        <div class="result-btn-area">
            <a href="" class="btn btn-secondary">취소</a>
            <a href="" class="btn btn-danger">처리</a>


        </div>



    </div>


	
	<jsp:include page="../common/footer.jsp" />












	




</body>
</html>