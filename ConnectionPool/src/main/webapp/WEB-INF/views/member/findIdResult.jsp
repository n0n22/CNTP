<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<style>

    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }  
    body{
        font-family: 'Pretendard-Regular';
    }

    *>a {
        text-decoration: none;
        color: rgb(47, 54, 82);
    }
    .outer {
        background-color: rgb(244, 244, 244);
        /* height: 800px; */
        padding: 100px 0px;

        display: flex;
        justify-content: center;
        align-items: center;
    }
    .find-id-area{
        margin: auto;

        background-color: white;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);

        height: 570px;
        width: 450px;
        border-radius: 10px;
        padding: 80px 50px;

        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        font-family: 'Pretendard-Regular';
    }
    .find-id-area div{
        /* height: 70px; */
        /* border: 1px solid palevioletred; */
        margin: 20px;
    }
    #main-text {
        /* margin: 50px; */
        font-size: 27px;
    }
    #find-id {
        font-size: 25px;
        font-weight: bold;
        /* margin-bottom: 20px; */
    }
    .find-id-area button {
        background-color: RGB(28,154,206);
        color: white;
        width: 200px;
        height: 40px;
        border-radius: 7px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
    }
    .find-id-area button:hover {
        background-color: rgb(29, 172, 233);
        cursor: pointer;
    }

    
</style>
</head>
<body>
   
   	<jsp:include page="../common/menubar_nosearch.jsp"/>

    <div class="outer" align="center">
        
        <div class="find-id-area">

            <h1 id="main-text">아이디 찾기</h1>
            
            <c:choose>
            	<c:when test="${ empty findId }">
            		<!-- 조회된 결과 없을때-->
                	<div>조회된 아이디가 없습니다.</div>
                </c:when>
                <c:otherwise>
	            	<!-- 결과있을 때-->
	                <div>고객님의 정보와 일치하는 아이디입니다. </div>
	                <div id="find-id">${ findId.memId }</div>
                </c:otherwise>
			</c:choose>
            <div><button onclick="loginPage();">로그인하기</button></div>
            <div><a href="findPwdForm.me" id="find-pwd">비밀번호 찾기</a></div>

            <script>
                function loginPage() {
                    location.href = "loginForm.me";
                }
            </script>
        </div>
    </div>

	<jsp:include page="../common/footer.jsp"/>

</body>
</html>