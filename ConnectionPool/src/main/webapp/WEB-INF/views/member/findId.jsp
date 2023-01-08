<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기 </title>
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
	a {
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
	.find-id {
		background-color: white;
		width: 450px;
        height: 450px;
		padding: 80px 50px;

		border-radius: 10px;
		box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
	}
	.find-id div{
		display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;

		margin: 2px;
    }
	.find-area h1{
		display: flex;
        /* flex-direction: column; */
        justify-content: center;
        align-items: center;
		margin-top: 60px;

		font-family: 'Pretendard-Regular';
		font-size: 27px;
	}
	.find-area > div{
		display: inline-block;
		/* margin: 30px; */
		padding: 50px;
	}
    .find-area input {
        height: 40px;
        width: 250px;
        padding: 10px;
        box-sizing: border-box;
        font-family: 'Pretendard-Regular';
		text-align: left;
		border-color: rgb(223, 223, 223);
        border-top: 0.5px;
        border-left: 0.5px;
        border-right: 0.5px;
        font-size: 13px;
    }
	.find-area button {
        background-color: RGB(28,154,206);
        color: white;
        height: 40px;
		width: 250px;
        border-radius: 7px;
        border: none;
		font-size: 17px;
		font-family: 'Pretendard-Regular';
    }
	.find-area button:hover {
		background-color: rgb(29, 172, 233);
        cursor: pointer;
	}
	.find-id-form > div {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        
		margin: 20px;
	}
	#main-text {
        /* margin: 50px; */
        font-size: 27px;
    }
	 
</style>
</head>
<body>
	<jsp:include page="../common/menubar_nosearch.jsp"/>

	<div class="outer">

		<div class="find-area">

			<div class="find-id">

				<form action="findId.me" class="find-id-form" method="post">
					<h1 id="main-text">아이디 찾기</h1>
					<div>
						<div><input type="text" name="findName" placeholder="이름을 입력해주세요"></div>
					</div>

					<div>
						<div><input type="text" name="findPhone" placeholder="핸드폰번호를 입력해주세요 - 포함"></div>
					</div>

					<div><button type="submit" id="fid-btn">아이디 찾기</button></div>
					
					<div>
						<div><a href="loginForm.me">로그인</a></div>
						<div></div>
						<div><a href="findPwdForm.me">비밀번호 찾기</a></div>
					</div>
				</form>
		
			</div>

		</div>

	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	
</body>
</html>