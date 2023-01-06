<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
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
    .find-pwd-area{
        background-color: white;
		width: 450px;
        height: 350px;
		padding: 100px 50px;

		border-radius: 10px;
		box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
    }
    
    .find-pwd-area div{
        margin: 20px;
    }
    .find-pwd-area input {
        height: 40px;
        width: 250px;
        /* border-radius: 5px; */
        /* border-color: darkgray; */
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
        text-align: left;
		border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
        
        
    }
    #main-text {
        font-size: 27px;
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

            <form action="findPwdCert.me" method="post" class="find-pwd-form">
                <h1 id="main-text">비밀번호 찾기</h1>
                <div>
                    <div><input type="text" name="findId" placeholder="아이디를 입력해주세요"></div>
                </div>
                <div>
                    <div><input type="text" name="findPhone" placeholder="이메일을 입력해주세요"></div>
                </div>
                <div><button type="submit">본인인증</button></div>

                <div>
                    <div><a href="loginForm.me">로그인</a></div>
                    <div><a href="findId.me" id="find-pwd">아이디 찾기</a></div>
                </div>
            </form>
        </div>
    </div>


</body>
</html>