<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
    *>a {
        text-decoration: none;
        color: rgb(47, 54, 82);
    }
    .outer {
        background-color: rgb(244, 244, 244);
        height: 800px;
        /* padding: 100px 0px; */

        display: flex;
        justify-content: center;
        align-items: center;
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
        height: 70px;
        /* border: 1px solid palevioletred; */
        align-items: center;
    }
    .login-area input {
        height: 40px;
        width: 250px;
        /* border-radius: 5px; */
        font-family: 'Pretendard-Regular';
        font-size: 16px;
        padding: 10px;
        box-sizing: border-box;
    }
    .login-area button {
        background-color: rgb(28,154,206);
        color: white;
        width: 250px;
        height: 50px;
        border-radius: 10px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
    }
    .login-area button:hover {
        background-color: rgb(28,154,206);
        cursor: pointer;
    }
    #link-area {
        margin-top: 20px;
    }
    #login-text {
        margin: 50px;
        font-size: 27px;
    }
    #loginError {
        height: 5px;
        font-size: 15px;
        color: red;
        margin-bottom: 20px;
    }
    
</style>
</head>
<body>
    
    <jsp:include page="../common/footer.jsp"/>

    <div class="outer" align="center">
        
        <div class="login-area">
            <h1 id="login-text">로그인</h1>
            <form action="" method="post">
                <!-- 
                <table align="center">
                <tr><td><input type="text" name="userId" placeholder="아이디"></td></tr>
                <tr><td><input type="password" name="userPwd" placeholder="비밀번호"></td></tr>
                <tr><td><button type="submit">로그인</button></td></tr>
                </table> 
                -->
            
                <div><input type="text" name="userId" placeholder="아이디"></div>
                <div><input type="password" name="userPwd" placeholder="비밀번호"></div>
                
                    
               
                    <label id="loginError">아이디 또는 비밀번호를 입력해주세요.</label>
                
                <div><button type="submit">로그인</button></div>
            </form>

            <div id="link-area">
                <span><a href="">ID/PWD찾기</a></span> |
                <span><a href="">회원가입</a></span>
            </div>
        </div>
    </div>

	<jsp:include page="../common/footer.jsp"/>
  

</body>
</html>