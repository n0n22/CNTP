<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    *>a{
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
        margin: auto;

        background-color: white;
        box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);

        width: 450px;
        height: 450px;
        border-radius: 10px;
        padding: 100px 50px 0px 50px;
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
        font-size:13px;
    }
    #main-text {
        /* margin: 50px; */
        font-size: 27px;
        margin-bottom: 30px;
    }
    #find-id {
        font-size: 25px;
        font-weight: bold;
        color: RGB(63,72,107);
        /* margin-bottom: 20px; */
    }
    .find-pwd-area button {
        background-color: #9b9b9b;
        color: white;
        width: 250px;
        height: 40px;
        border-radius: 7px;
        border: none;
        font-size: 17px;
        font-family: 'Pretendard-Regular';
        margin-bottom: 20px;
    }
    .find-pwd-area button:hover {
        cursor: pointer;
    }
    .checkResult {
        height: 5px;
        font-size: 13px;
        margin-left: 10px;
        color: rgb(47, 54, 82);
     }

    
</style>
</head>
<body>
    
	<jsp:include page="../common/menubar_nosearch.jsp"/>
	
    <div class="outer" align="center">
        
        <div class="find-pwd-area">

            <form action="pwdChange.me" method="post" class="find-pwd-form">
                
                
                		<!-- 로그인이 되어있지않은 상태   -->
                		<!-- 로그인이 되어있을때 -->
                <c:choose>
                	<c:when test="${ empty loginMember }">
		                <input type="hidden" name="memId" value="${ member.memId }"> <!-- **unique제약조건 걸려있음 식별값 -->
                	</c:when>
                	<c:otherwise>
		                <input type="hidden" name="memId" value="${ loginMember.memId }"> <!-- **unique제약조건 걸려있음 식별값 -->
                	</c:otherwise>
                </c:choose>
                
                
                
                <h1 id="main-text">비밀번호 재설정</h1>
                <div>
                    <div><input type="password" name="memPwd" id="memPwd" placeholder="8~15자 (영문/숫자/특수문자)" required></div>
                    <label class="checkResult" id="pwdCheck">&nbsp;</label>
                </div>
                <div>
                    <div><input type="password" id="memPwd2" placeholder="비밀번호를 한번 더 입력해주세요"></div>
                    <label class="checkResult"  id="pwdCheck2">&nbsp;</label>
                </div>
                <div><button disabled type="submit" id="pass-btn">비밀번호 재설정</button></div>
              
               	<div></div>
            </form>
        </div>
    </div>

   	<jsp:include page="../common/footer.jsp"/>
   	
   	<script>
	    // 비밀번호 유효성 검사
	    $('#memPwd').focusout(function(){
	        var regExp = /^[a-zA-Z\d!@#$%^]{8,15}$/;
	        var $checkPwd = $('#memPwd').val();
	
	        if($checkPwd=="") {
	            $('#pwdCheck').html('필수 입력사항입니다.');
	        } else if(!regExp.test($checkPwd)) {
	            $('#pwdCheck').html('8~15자의 영문 대 소문자, 숫자, 특수문자로 입력해주세요.');
	        } else {
	            $('#pwdCheck').html('');
	        }
	    });

    	// 비밀번호 일치 검사
    	$('#memPwd2').focusout(function(){
        var $checkPwd = $('#memPwd').val();
        var $checkPwd2 = $('#memPwd2').val();

        // 비밀번호 수정시에만 체크
        if($checkPwd != '') {
            $('#memPwd2').attr('disabled', false);

            if($checkPwd2=="") {
                $('#pwdCheck2').html('필수 입력사항입니다.');
                $('#pwdCheck2').css('color','rgb(47, 54, 82)');
                
            } else if(!($checkPwd2==$checkPwd)) {
                $('#pass-btn').attr('disabled', true);
                $('#pass-btn').css('background-color', '#9b9b9b');
                $('#pwdCheck2').html('비밀번호가 일치하지 않습니다.');
                $('#pwdCheck2').css('color','red');
                
            } else {
            	$('#pwdCheck2').css('color','rgb(47, 54, 82)');
                $('#pwdCheck2').html('비밀번호가 일치합니다');
                $('#pass-btn').css('background-color', 'rgb(29, 172, 233)');
            	$('#pass-btn').attr('disabled', false);
            }
        } 
    });
    	
    	
   	</script>
</body>
</html>