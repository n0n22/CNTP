<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



    <style>

   
        div {
            box-sizing: border-box;
            border: solid 1px red;
        }


        .admin-outer {
            margin-left: 150px;
            width: 1000px;
            height: 100%;
        }


        .notice-title h2 {
            text-align: center;
        }

        .notice-table p {
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 30px;
            padding-right: 30px;
        }

        .notice-foot {
            padding: 15px;
            width: 100%;
            height: 80px;
        }

        .notice-foot div {
            display: inline-block;
        }
        
        .notice-foot .notice-file {
            width: 35%;
        }
        
        .notice-foot .notice-hidden {
            text-align: center;
            width: 28%;
        }

        .notice-foot .notice-list {
            width: 35%;
            text-align: right;
        }



    </style>


</head>
<body>




    <div class="admin-outer">

        <div class="notice-title">

            <h2>공지사항</h2>


        </div>
        <div>

            <div class="container">

                <table class="table">
                    <thead>
                        <tr>
                            <td colspan="2" align="right">글번호 15  |  조회수 10  |  작성일시 2022-05-03</td>
                        </tr>
                        <tr>
                            <th width="20%">제목</th>
                            <th width="80%">공지사항 1</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="3">
                                <img src="" alt="">
                                <p>
                                    되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운 열매를 맺어 우리 인생을 풍부하게 하는


                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="notice-foot">
            <div class="notice-file">
                첨부파일 : <a href="" download="">공지사항.jpg</a>
            </div>
            <div class="notice-hidden">
                <button class="btn btn-sm btn-danger">삭제</button>
                <button class="btn btn-sm btn-warning">수정</button>
            </div>
            <div class="notice-list">
                <button class="btn btn-sm btn-secondary">목록으로</button>
            </div>

        </div>
















    </div>










</body>
</html>