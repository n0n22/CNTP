<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
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
        /* height: 800px; */
        padding: 100px 0px;

        display: flex;
        justify-content: center;
        align-items: center;
    }
    .find-pwd-area{
        margin: auto;

        background-color: white;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);

        width: 450px;
        height: 410px;
        border-radius: 10px;
        padding: 150px 50px 0px 50px;
  
    }
    .find-pwd-area div{
        margin: 40px;
    }
    #main-text {
        font-size: 27px;
    }
    #find-pwd {
        font-size: 25px;
        font-weight: bold;
        color: RGB(63,72,107);
    }
    .find-pwd-area button {
        background-color: RGB(28,154,206);
        color: white;
        width: 250px;
        height: 40px;
        border-radius: 7px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
    }
    .find-pwd-area button:hover {
        background-color: rgb(29, 172, 233);
        cursor: pointer;
    }

    
</style>
</head>
<body>

    <div class="outer" align="center">
        
        <div class="find-pwd-area">

            <h1 id="main-text">비밀번호 찾기</h1>
            <div>비밀번호 변경이 완료되었습니다. </div>

            <div><button onclick="loginPage();">로그인하기</button></div>

            <script>
                function loginPage() {
                    location.href = ""
                }
            </script>
     
        </div>
    </div>


</body>
</html>