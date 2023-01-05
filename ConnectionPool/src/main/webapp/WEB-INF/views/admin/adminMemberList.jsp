<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>

        .member-list-area {
            margin-left: 150px;
        }


        .member-header {
            text-align: center;
        }

        .member-header>div {
            display: inline-block;
            width: 20%;
        }

        .member-search-area {
            width: 200px;
        }




    </style>


</head>
<body>


    	
	<jsp:include page="../common/menubar_nosearch.jsp" />
    <jsp:include page="adminMenubar.jsp" />
	


    <div class="member-list-area">
        <div class="member-header">
            <div class="member-search-area">
                <form>
                    <select name="" id="">
                        <option value="">이름</option>
                        <option value="">아이디</option>
                        <option value="">닉네임</option>
                    </select>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Search">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">검색</button>
                        </div>
                    </div>
                </form>
            </div>
            <div>

            </div>
            <div class="order-area">
                <div class="order-select" align="right">
                    <select name="" id="">
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


        </div>



    </div>

    

    	
	<jsp:include page="../common/footer.jsp" />


</body>
</html>