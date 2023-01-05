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

    
        .notice-enroll {
            padding: 20px;
        }

        .notice-enroll .editor {
            width: 700px;
            height: 300px;
            padding: 10px;
            resize: none;
        }

        input[type=text] {
            width: 700px;
            padding: 10px;
        }


    </style>



</head>
<body>





    <div class="admin-outer">

        <div class="notice-title">

            <h2>공지사항 작성</h2>


        </div>
        <div class="notice-enroll">
            <div class="container">
                <table class="table">
                    <tbody>
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <select name="" id="">
                                    <option value="">공지</option>
                                    <option value="">이벤트</option>
                                    <option value="">대회정보</option>
                                </select>
                            
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea class="editor" name="" id=""></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td><input type="file"></td>
                        </tr>


                    </tbody>


                  
                </table>
              </div>
        </div>


    </div>

	



</body>
</html>