<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>

        * {
            box-sizing: border-box;
        }

        .admin-menubar-outer {
            width: 200px;
            height: 100%;
            position: fixed;
            
            padding : 20px;
            background-color : lightgray;
            
            
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
            
            border-radius : 5px;
        }
        
        
        .admin-menubar-outer a:hover {
        	cursor : pointer;
        	background-color : gray;
        }


	    .admin-outer {
            margin-left: 200px;
            width:80%;
            height: 100%;
            padding: 25px;
        }
	
	
		.admin-footer {
			margin: auto;
			text-align: center;			
		}
		
		.page-area {
			display: inline-block;	
		}



    </style>



</head>
<body>


    <div class="admin-menubar-outer">

        <div class="button-area">
            <a href="memberList.ad" class="admin-menu-button">회원관리</a>
            <a href="reportList.ad" class="admin-menu-button">신고관리</a>
            <a href="bannerList.ad" class="admin-menu-button">배너관리</a>
        </div>
        


    </div>






</body>
</html>