<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
        /* height: 700px; */
        padding: 100px 0px;

        display: flex;
        justify-content: center;
        align-items: center;
    }

    #login-text{
        font-family: 'Pretendard-Regular';

    }
    .login-area{
        margin: auto;

        background-color: white;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);

        width: 450px;
        border-radius: 10px;
        padding: 40px 50px 30px;

        display: flex;
        flex-direction: column;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
    }
    .login-area div{
        height: 50px;
        /* border: 1px solid palevioletred; */
        /* align-items: center; */
    }
    .login-area .userInput {
        height: 40px;
        width: 250px;
        /* border-radius: 5px; */
        font-family: 'Pretendard-Regular';
        padding: 10px;
        box-sizing: border-box;
    }

    .login-area .userInput {
        border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
    }

    .login-area button {
        background-color: RGB(28,154,206);
        color: white;
        width: 250px;
        height: 40px;
        border-radius: 7px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
    }
    .login-area button:hover {
        background-color: rgb(29, 172, 233);
        cursor: pointer;
    }
    #link-area {
        font-size: 15px;
        margin-top: 20px;
        font-family: 'Pretendard-Regular';
    }
    #login-text {
        margin: 50px;
        font-size: 27px;
    }
    #loginError {
        height: 5px;
        font-size: 15px;
        color: red;
        margin-bottom: 10px;
    }
    
    .checkId{
        font-size: 11px;
        font-family: 'Pretendard-Regular';
        margin-right: 175px;
    }
</style>
</head>
<body>

    <div class="outer" align="center">
        
        <div class="login-area">
            <h1 id="login-text">로그인</h1>
            <form action="" method="post">
              
            
                <div><input class="userInput" type="text" name="userId" placeholder="아이디"></div>
                <div><input class="userInput" name="userPwd" placeholder="비밀번호"></div>
                <div class="checkId"><input type="checkbox">아이디 저장</div>
                
                <div><button type="submit">로그인</button></div>
            </form>
            <!-- 네이버 로그인도 추가 할 예정-->
            <div id="link-area">
                <span>
                    <a href="">ID /</a>
                    <a href="">PWD찾기</a>
                </span> |
                <span><a href="MemberEnrollForm.me">회원가입</a></span>
            </div>
        </div>
    </div>


</body>
</html>