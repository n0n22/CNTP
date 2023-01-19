<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
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


    .outer {
        background-color: rgb(244, 244, 244);
        height: 650px;
        /* padding: 100px 0px; */

        display: flex;
        justify-content: center;
        align-items: center;
    }
    .result-area{
        margin: auto;
        width: 770px;
        padding: 80px;
        background-color: white;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        font-size: 20px;
    }
    .result-area div{
        height: 70px;
        /* border: 1px solid palevioletred; */
        align-items: center;
    }
    .result-area button {
        background-color: RGB(28,154,206);
        color: white;
        width: 150px;
        margin: 10px;
        height: 40px;
        border-radius: 7px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
    }
    .result-area button:hover {
        background-color: rgb(29, 172, 233);
        cursor: pointer;
    }
    #result-text {
        font-size: 55px;
        color: rgb(28,154,206);
    }
    #result-content {
        margin-bottom: 50px;
        margin-top: 60px;
    }
    
</style>
</head>
<body>

	<jsp:include page="../common/menubar_nosearch.jsp"/>

    <div class="outer" align="center">
        
        <div class="result-area">
            <h1 id="result-text" style="height: 80px;">환영합니다</h1>
            <div id="result-content">"어쩌고 저쩌고 어쩌고 저쩌고"</div>
            <button onclick="loginPage();">로그인</button><button onclick="mainPage();">메인으로</button>
        </div>
    </div>

    <script>
        function loginPage() {
            location.href="loginForm.me";
        };

        function mainPage() {
            location.href="/cntp";
        }
    </script>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>