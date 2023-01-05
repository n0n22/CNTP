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

        * {
            box-sizing: border-box;
        }

        div {
            border: 1px red solid;
        }

        .admin-menubar-outer {
            width: 150px;
            height: 100%;
            position: fixed;
        }

        .admin-menubar-outer a {
            text-decoration: none;
            color: black;
            font-size: 18px;
            font-weight: 900;
            padding-top: 10px;

            text-align: justify;
            display: block;
            width: 100%;
            height: 50px;

            margin-top: 15px;
            margin-bottom: 15px;
            margin-left: auto;
            margin-right: auto;

            padding: 10px;

            position: relative;
        }




    </style>



</head>
<body>


    <div class="admin-menubar-outer">

        <div class="button-area">
            <a href="#" class="admin-menu-button">회원관리</a>
            <a href="#" class="admin-menu-button">신고관리</a>
            <a href="#" class="admin-menu-button">배너관리</a>

        </div>
        


    </div>






</body>
</html>