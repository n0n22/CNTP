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
                        <td width="30%">5</td>
                        <th width="20%">신고사유</th>
                        <td width="30%">욕설/비방</td>
                    </tr>
                    <tr>
                        <th>신고대상자</th>
                        <td>user01</td>
                        <th>신고자</th>
                        <td>user05</td>
                    </tr>
                    <tr>
                        <th>대상글번호</th>
                        <td>105</td>
                        <th>신고일</th>
                        <td>2022-01-03</td>
                    </tr>
                    <tr>
                        <th>대상 유형</th>
                        <td colspan="5" align="left">자유게시판 댓글</td>
                    </tr>
                    <tr>
                        <th>대상 내용</th>
                        <td colspan="5">
                            <p align="left">
                                ㅎㅎㅎㅎ흏ㅎㅎㅎㅎ
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <th>처리결과</th>
                        <td>신고확정</td>
                        <th>처리일자</th>
                        <td colspan="3">2022-03-05</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="result-btn-area">
            <a href="" class="btn btn-warning">신고철회</a>
            <a href="" class="btn btn-danger">신고확정</a>
        </div>



    </div>


	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>