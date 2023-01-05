<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

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

        .notice-search {
            display: inline-block;
            width: 29%;
            height: 50px;
        }

        .notice-navi-middle {
            width: 39%;
            display: inline-block;
        }

        .notice-navi-cate {
            width: 29%;
            display: inline-block;
            padding: 10px;
        }

        .notice-navi-cate a {
            margin: 5px;
        }

        .notice-table {
            padding: 15px;
        }

        .notice-table table {
            text-align: center;
        }

        .notice-table .title {
            text-align: left;
        }

        .notice-hidden {
            width: 100%;
            height: 70px;
        }

        .notice-hidden {
            text-align: right;
            padding: 20px;
        }

    </style>




</head>
<body>




	<div class="admin-outer">   
        <div class="notice-title">

            <h2>공지사항</h2>


        </div>
        <div class="notice-navi">
            <div class="notice-navi-cate">
                <a href="#">전체</a> |
                <a href="#">공지</a> |
                <a href="#">이벤트</a> |
                <a href="#">대회정보</a>
            </div>
            <div class="notice-navi-middle">

            </div>
            <div class="notice-search">
                <form action="#">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Search">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">검색</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="notice-table">
            <div class="container">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th width="10%">번호</th>
                            <th width="15%">카테고리</th>
                            <th width="45%" class="title">제목</th>
                            <th width="20%">작성일</th>
                            <th width="10%">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>3</td>
                            <td>공지</td>
                            <td class="title">공지사항 테스트</td>
                            <td>2021-05-03</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>이벤트</td>
                            <td class="title">공지사항 2</td>
                            <td>2021-05-03</td>
                            <td>10</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>대회공지</td>
                            <td class="title">공지사항 1</td>
                            <td>2021-05-03</td>
                            <td>10</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>

        <div class="notice-hidden">
            <a href="#" class="btn btn-sm btn-primary">글작성</a>


        </div>

        <div class="notice-foot">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="javascript:void(0);">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">&gt;</a></li>
            </ul>
        </div>
        




    </div>







</body>
</html>